module mem_sram (Data, Q, Clock, WE, Address);
parameter width = 8;
parameter depth = 8;
parameter addr = 3;
input Clock, WE;
input [addr-1:0] Address;
input [width-1:0] Data;
output [width-1:0] Q;
wire [width-1:0] Q;
reg [width-1:0] mem_data [depth-1:0];
always @(posedge Clock)
if(WE)
	mem_data[Address] <= #1 Data;
	assign Q = mem_data[Address];

write_when_posedge : assert property @(posedge clk) 
endmodule
