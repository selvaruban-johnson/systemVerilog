module full_add_3ha
(input a,b,c,
output logic sum,cout);
wire w1,w2,w3;
	ha_bh h1(.a,.b,.sum(w1),.cout(w2));
	ha_bh h2 (.a(w1),.b(c),.sum,.cout(w3));
	ha_bh h3 (.a(w2),.b(w3),.sum(cout));
endmodule
