/*3. Declare enumerated type variable and assign it a value from Monday to Sunday. Display
first, last values also print total elements of the enumerated type variable. */

module lab_9_3();

enum{monday,tuesday,wednesday,thursday,friday,saturday,sunday}days;
initial
begin
$display("%s",days.first());

$display("%s",days.last());

		$display("total_elements=%d",days.num());

//forever
//while (days != days.last)
//begin
	//if(days==days.last)
	//begin
	//	$display("total_elements=%d",days.num());
//		break;
	//end
//end
end
endmodule 