class env_scoreboard;
env_packet pkt1,pkt2;

mailbox #(env_packet)mon_sb1;
mailbox #(env_packet)mon_sb2;

function new(mailbox #(env_packet)mon_sb1,mailbox #(env_packet)mon_sb2);
this.mon_sb1=mon_sb1;
this.mon_sb2 = mon_sb2;
endfunction

task run;
mon_sb1.get(pkt1);
mon_sb2.get(pkt2);
assert (pkt1.d_out==pkt2.d_out)
begin
	$display("design is okay");
end
else
	$display("design is not okay");
endtask

endclass