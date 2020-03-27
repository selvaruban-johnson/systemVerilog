module security_tb();
logic [5:0]s1;
logic main_sw;
logic alarm,lights,call_to_pol,video_camera;
security_system s (.*);
initial 
begin
	$monitor ("{main_sw,s1}=%b ,alarm =%b lights =%b call_to_pol = %b video_camera = %b",{main_sw,s1},alarm,lights,call_to_pol,video_camera);
	for(int i=0;i<128;i++)
	begin
		#10 {main_sw,s1} = i;
	end
/*	repeat(16)
	#10 {main_sw,s1}=$urandom_range (15);
	repeat(16)
	#10 {main_sw,s1}=$urandom_range (16,31);
	repeat(16)
	#10 {main_sw,s1}=$urandom_range (32,47);
	repeat(16)
	#10 {main_sw,s1}=$urandom_range (48,63); */
end
endmodule 