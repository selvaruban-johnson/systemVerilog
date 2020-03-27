module ha_st 
(input a,b,
output logic sum , cout);
xor x1 (sum, a,b);
and a1 (cout,a,b);
endmodule 