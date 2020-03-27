module fifo_assertions (clk,rst_n,rd_n,wr_n,over_flow,under_flow );
input logic rst_n,clk,rd_n,wr_n;
input logic under_flow,over_flow;

//RESET

sequence reset_seq;
((!under_flow) && (!over_flow));
endsequence


property reset_prty;
@(posedge clk) (!rst_n) |-> !under_flow ##0 !over_flow;
endproperty

sequence overflow_seq;
((!under_flow) && (!rd_n && wr_n)) ;
endsequence

property overflow_prty;
@(posedge clk) overflow_seq[*16] |=> over_flow;
endproperty

sequence underflow_seq;
(!over_flow && !wr_n && rd_n);
endsequence

property underflow_prty;
@(posedge clk) underflow_seq[*16] |=> under_flow;
endproperty
RESET:assert property (reset_prty);
FIFO_UNDERFLOW:assert property (underflow_prty);
FIFO_OVERFLOW:assert property (overflow_prty);
endmodule