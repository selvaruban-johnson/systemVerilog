module cutter (input logic s1,s2,ms1,ms2,output logic r);
assign r = ((ms1&ms2)&(s1|s2));
endmodule 