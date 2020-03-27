module security_system(input main_sw,logic [5:0]s1,output logic alarm,lights,call_to_pol,video_camera);
always_comb
begin
	if(!main_sw)
	begin
		if(s1>=1)
		begin
			alarm = 1'b0;
			lights = 1'b0;
			call_to_pol = 1'b1;
			video_camera = 1'b1;
		end
	end
	else
	begin
		alarm = 1'b1;
		lights = 1'b1;
		call_to_pol = 1'b0;
		video_camera = 1'b0;
	end
end
endmodule 