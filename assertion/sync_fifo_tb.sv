module sync_fifo_tb();
logic clk,rst,rd_en,wt_en;
logic full,empty,
logic  [7:0]dataout,datain;
sync_fifo(.*);
always #5 clk = ~clk;
initial
begin
clk=0;
wr_en = 1'b1;
rd_en = 1'b0;
rst = 1'b1;
#10 rst = 1'b0;
data_in = 8'b110110;

# 100 rd_en = 1'b1;
	wr_en = 1'b0;
#100 rd = 