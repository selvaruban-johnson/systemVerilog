`define SECOND;
module lab_9_9 ();
initial begin
`ifdef FIRST
$display("First code is compiled");
`else
`ifdef SECOND
$display("Second code is compiled");
`else
$display("Default code is compiled");
`endif
`endif
end
endmodule 