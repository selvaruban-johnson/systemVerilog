module test_enum ();
//enum {janaki=-56,praveen,mani,wilson,ram} students;
enum {janaki,praveen,mani,wilson,ram} students;
initial
begin
	students = students.first();
	//forever
	while (students!=students.last)
	begin
		$display("%s ,%d",students.name,students);
		//while (students.next == students.last)
		//begin
		//end
		students = students.next;
		 continue;
	end
	while (students == students.last)
	begin
		$display("%s ,%d",students.name,students);
		break;
	end
end
endmodule 