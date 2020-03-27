
integer no = 10;
module mod_number();
integer no = 25;
task print();
$display("you've got 1 ",$unit::no,"!");
$display ("i've got 1 ",no,"!");
$display ("i've got 2 ",$root.mod_number.no,"!");
endtask :print

initial 
begin
print();
end
endmodule 