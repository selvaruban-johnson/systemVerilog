program set_membership;
class frame_t;
rand bit [7:0] src_port;
rand bit [7:0] des_port;
constraint c {src_port inside {
[8'h0:8'hA],8'h14,8'h18 };
!(des_port inside { [8'h4:8'hFF] }); }
function void pre_randomize();
begin $display ("pre src port :
%0x",src_port);
$display ("pre des port : %0x",des_port);
end
endfunction
function void post_randomize();
begin $display ("src port :
%0x",src_port);
$display ("des port : %0x",des_port);
end
endfunction
endclass
initial
begin
frame_t frame = new();
integer i, j = 0;
for (j=0;j < 8; j++) begin
$display("----------------");
$display ("Randomize Value");
$display("----------------");
i = frame. randomize();
end
$display("----------------"); end
endprogram