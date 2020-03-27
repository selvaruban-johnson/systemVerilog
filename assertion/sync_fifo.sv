module sync_fifo(input clk,rst,rd_en,wt_en,[7:0]datain,output reg full,empty,output reg [7:0]dataout);
reg [2:0]wt_ptr,rd_ptr;
reg [7:0] mem [7:0];

always @ (posedge clk)
begin
    if(rst)
    begin
        wt_ptr <= 0;
        rd_ptr <= 0;
        empty <= 1;
        full <= 0;
    end
    else
    begin
        if({wt_en,rd_en}==2'b10)
        begin
            if(~full)
            begin
                mem[wt_ptr]<= datain;
                wt_ptr <= wt_ptr + 1;
                empty = 0;
            if (wt_ptr==rd_ptr)
                full = 1;
        end
        end
        
        
        else if ({wt_en,rd_en}==2'b01)
        begin
            if (~empty)
            begin
                    dataout <= mem[rd_ptr];
                    rd_ptr <= rd_ptr+1; 
                    full = 0;
                 if(rd_ptr==wt_ptr)
                empty = 1;
            end
         end
         
         
          else if ({wt_en,rd_en}==2'b11&& (empty ==1))
            dataout<=datain;
            
            
        else if ({wt_en,rd_en}==2'b11)
        begin
            dataout<= mem[rd_ptr];
            rd_ptr<=rd_ptr+1;
            mem[wt_ptr]<=datain;
            wt_ptr<=wt_ptr+1;
        end
    end
end
endmodule