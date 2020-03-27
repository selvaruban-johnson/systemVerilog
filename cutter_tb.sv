module cutter_tb();
logic s1,s2,ms1,ms2,r;
cutter s (.*);
initial
begin
	$monitor("{s2,s1,ms1,ms2}=%b r = %b",{s2,s1,ms1,ms2},r);
	repeat(4)
	#10 {s2,s1,ms1,ms2} = $urandom_range(3);
	repeat(4)
	#10 {s2,s1,ms1,ms2} = $urandom_range(4,7);
	repeat(4)
	#10 {s2,s1,ms1,ms2} = $urandom_range(8,11);
	repeat(4)
	#10 {s2,s1,ms1,ms2} = $urandom_range(12,15);
end
endmodule 