`timescale 1ns / 1ps

module streamer#( 
		parameter integer DATA_WIDTH	= 64  ,
		parameter integer ADDR_WIDTH	= 10  ,

		parameter integer NUMWORDS_64	= 64  ,
		parameter integer NUMWORDS_128	= 128 ,
		parameter integer NUMWORDS_192	= 192 ,
		parameter integer NUMWORDS_576	= 576 ,
		parameter integer NUMWORDS_1024	= 1024
    )
    ( 
        input  wire [31:0]                 Command0, 
        output wire [31:0]                 Status0, 
 
        // PORTS FOR DATA OUT
		input  wire                        dout_ACLK,
		input  wire                        dout_ARESETN,
		output wire                        dout_TVALID,
		output wire [ DATA_WIDTH-1    : 0] dout_TDATA,
		output wire [(DATA_WIDTH/8)-1 : 0] dout_TKEEP,
		output wire                        dout_TLAST,
		input  wire                        dout_TREADY,

        // PORTS FOR DATA IN
        input  wire                        din_ACLK,
		input  wire                        din_ARESETN,
		output wire                        din_TREADY,
		input  wire [ DATA_WIDTH-1    : 0] din_TDATA,
		input  wire [(DATA_WIDTH/8)-1 : 0] din_TKEEP,
		input  wire                        din_TLAST,
		input  wire                        din_TVALID,

        output wire [ ADDR_WIDTH-1    : 0] poly_bram_address,
        output wire [ DATA_WIDTH-1    : 0] poly_bram_din,
        output wire                        poly_bram_we,
        input  wire [ DATA_WIDTH-1    : 0] poly_bram_dout
        
    );
    
    assign dout_TKEEP = 8'hFF;

    reg done_write;
    reg done_read;

    wire wrActive; // if 1 then write is active
    wire rdActive; // if 1 then read  is active

    ////////////////////////////////////////////
    //
    // Receive data from PC and write to BRAM

    typedef enum 
    {  
            s_din_wait_command,
            s_din_wait_data   ,
            s_din_read_data   ,
            s_din_wait_release
    }       
    s_din_states_t;
    
    s_din_states_t  s_din_state;
    s_din_states_t  s_din_next_state;


    // Implement Write-Address Counter
    reg [31:0] wAddrCounter;

    always@(posedge din_ACLK) 
	begin
        if(!din_ARESETN) 
            wAddrCounter <= 0;
        else if (s_din_state == s_din_wait_command & (  Command0[7:0] == 8'h1 || 
                                                        Command0[7:0] == 8'h3 || 
                                                        Command0[7:0] == 8'h5 || 
                                                        Command0[7:0] == 8'h7 || 
                                                        Command0[7:0] == 8'h9 ))
            wAddrCounter <= {8'h0, Command0[31:8]};
        else if ((s_din_state == s_din_read_data) && din_TVALID)
            wAddrCounter <= wAddrCounter + 1;
    end

    assign poly_bram_din = din_TDATA;
    assign poly_bram_we  = (s_din_state == s_din_read_data) && din_TVALID;
    assign din_TREADY    = (s_din_state == s_din_read_data);

    assign wrActive      = (s_din_state != s_din_wait_command);

    always@(*) 
	begin
        case (s_din_state)
            s_din_wait_command: begin
                if (Command0[7:0] == 32'h1 || 
                    Command0[7:0] == 32'h3 ||  
                    Command0[7:0] == 32'h5 ||  
                    Command0[7:0] == 32'h7 ||  
                    Command0[7:0] == 32'h9  )   s_din_next_state <= s_din_wait_data;
                else                            s_din_next_state <= s_din_wait_command;
            end

            s_din_wait_data: begin
                if (din_TVALID)         s_din_next_state <= s_din_read_data;
                else                    s_din_next_state <= s_din_wait_data;
            end

            s_din_read_data: begin
                if (din_TLAST)          s_din_next_state <= s_din_wait_release;
                else if(din_TVALID)     s_din_next_state <= s_din_read_data;
                else                    s_din_next_state <= s_din_wait_data;
            end

            s_din_wait_release: begin
                if (Command0 == 32'h0)  s_din_next_state <= s_din_wait_command;
                else                    s_din_next_state <= s_din_wait_release;
            end
        endcase        
    end

    always@(posedge din_ACLK) 
	begin
        if (!din_ARESETN)   begin
            s_din_state <= s_din_wait_command;
            done_write <= 1'b1;
        end    
        else begin                
            s_din_state <= s_din_next_state;

            if  (s_din_state == s_din_wait_command && ( Command0[7:0] == 32'h1 || 
                                                        Command0[7:0] == 32'h3 || 
                                                        Command0[7:0] == 32'h5 || 
                                                        Command0[7:0] == 32'h7 || 
                                                        Command0[7:0] == 32'h9 ))
                done_write <= 1'b0;
            else if (s_din_state == s_din_read_data && din_TLAST) 
                done_write <= 1'b1;
        end
    end
    
    ////////////////////////////////////////////
    //
    // Read data from BRAM and send to PC
    
    typedef enum
    {  
            s_dout_wait_command,
            s_dout_wait_ready  ,
            s_dout_write_data  ,
            s_dout_wait_release
    }       
    s_dout_states_t;
    
    s_dout_states_t  s_dout_state;
    s_dout_states_t  s_dout_next_state;

    // Implement Read-Address Counter
    wire [31:0] rAddress_next;
    reg  [31:0] rAddress;
    reg  [31:0] word_couter;
    
    always@(posedge dout_ACLK) 
	begin
        if(!dout_ARESETN) begin
            rAddress    <= 32'b0;
            word_couter <= 32'b0;
        end
        else if (s_dout_state == s_dout_wait_command && (   Command0[7:0] == 32'h2 || 
                                                            Command0[7:0] == 32'h4 || 
                                                            Command0[7:0] == 32'h6 || 
                                                            Command0[7:0] == 32'h8 || 
                                                            Command0[7:0] == 32'hA )) begin
            rAddress    <= {8'h0, Command0[31:8]};
            word_couter <= 32'b0;
        end
        else if (s_dout_state != s_dout_wait_command) begin
            rAddress    <= rAddress_next;  
            word_couter <= (dout_TREADY && dout_TVALID) ? word_couter+1 : word_couter ;
        end
    end

    assign rAddress_next  = (dout_TREADY && dout_TVALID) ?  rAddress + 1 : rAddress ;

//    assign dout_TSTRB  = {(DATA_WIDTH/8){1'b1}};
    assign dout_TDATA  = poly_bram_dout;
    
    
    assign dout_TLAST  = dout_TVALID && ((Command0[7:0] == 32'h2 && word_couter == NUMWORDS_64  -1) ||
                                         (Command0[7:0] == 32'h4 && word_couter == NUMWORDS_128 -1) ||
                                         (Command0[7:0] == 32'h6 && word_couter == NUMWORDS_192 -1) ||
                                         (Command0[7:0] == 32'h8 && word_couter == NUMWORDS_576 -1) ||
                                         (Command0[7:0] == 32'hA && word_couter == NUMWORDS_1024-1) );
    assign dout_TVALID = (s_dout_state == s_dout_write_data);

    assign rdActive    = (s_dout_state != s_dout_wait_command);

    always@(*) 
	begin
        case (s_dout_state)
            s_dout_wait_command: begin
                if (Command0[7:0] == 32'h2 || 
                    Command0[7:0] == 32'h4 || 
                    Command0[7:0] == 32'h6 || 
                    Command0[7:0] == 32'h8 || 
                    Command0[7:0] == 32'hA )    s_dout_next_state <= s_dout_wait_ready;                        
                else                            s_dout_next_state <= s_dout_wait_command;
            end

            s_dout_wait_ready: begin                    
                if (dout_TREADY)        s_dout_next_state <= s_dout_write_data;
                else                    s_dout_next_state <= s_dout_wait_ready;                    
            end

            s_dout_write_data: begin
                if (!dout_TREADY)                                                       s_dout_next_state <= s_dout_wait_ready;
                else if ( (Command0[7:0] == 32'h2 && word_couter == NUMWORDS_64  -1) ||
                          (Command0[7:0] == 32'h4 && word_couter == NUMWORDS_128 -1) ||
                          (Command0[7:0] == 32'h6 && word_couter == NUMWORDS_192 -1) ||
                          (Command0[7:0] == 32'h8 && word_couter == NUMWORDS_576 -1) ||
                          (Command0[7:0] == 32'hA && word_couter == NUMWORDS_1024-1) )  s_dout_next_state <= s_dout_wait_release;
                else                                                                    s_dout_next_state <= s_dout_write_data;
            end
 
            s_dout_wait_release: begin

                if (Command0 == 32'h0)    s_dout_next_state <= s_dout_wait_command;
                else                      s_dout_next_state <= s_dout_wait_release;
            end
        endcase
    end 

    assign poly_bram_address = (wrActive) ? wAddrCounter[ADDR_WIDTH-1:0] : 
                                            rAddress_next[ADDR_WIDTH-1:0];

    always@(posedge dout_ACLK) 
	begin
        if (!dout_ARESETN) begin
            s_dout_state <= s_dout_wait_command;
            done_read     <= 1'b1;
        end
        else begin

            s_dout_state <= s_dout_next_state;

            if      (s_dout_state == s_dout_wait_command && ( Command0[7:0] == 32'h2 ||
                                                              Command0[7:0] == 32'h4 ||
                                                              Command0[7:0] == 32'h6 ||
                                                              Command0[7:0] == 32'h8 ||
                                                              Command0[7:0] == 32'hA )
                    )
                done_read     <= 1'b0; 
            else if (s_dout_state == s_dout_write_data   && ((Command0[7:0] == 32'h2 && word_couter == NUMWORDS_64  -1) ||
                                                             (Command0[7:0] == 32'h4 && word_couter == NUMWORDS_128 -1) ||
                                                             (Command0[7:0] == 32'h6 && word_couter == NUMWORDS_192 -1) ||
                                                             (Command0[7:0] == 32'h8 && word_couter == NUMWORDS_576 -1) ||
                                                             (Command0[7:0] == 32'hA && word_couter == NUMWORDS_1024-1) )
                    )
                done_read     <= 1'b1;

        end
    end

    // assign Status0 = {word_couter[29:15], done_read, word_couter[14:0], done_write};
    assign Status0          = {15'b0, done_read, 15'b0, done_write};

endmodule
