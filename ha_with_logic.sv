module ha 
(input a,b,
output logic sum , cout);

assign sum = a^b;
assign cout = a&b;
endmodule 