interface intf(input clk);
 
 bit we;
 bit [7:0] data_in;
 bit [2:0] address;
 bit [7:0] data_out;

P1:assert property (@(posedge clk) we |-> $stable(data_out));
//p2:assert property (@(posedge clk)data_out);
endinterface
