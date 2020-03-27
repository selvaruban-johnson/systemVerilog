class packet;
  int a;
  int b;
   
  function void display();
    $display("\tValue of a = %0d",a);
    $display("\tValue of b = %0d",b);
  endfunction
endclass
 
 
module assoc_array;
  //declaration of array\u2019s
  packet array_1[*];
 
  packet pkt;
   
  initial begin
     
    pkt = new();
    pkt.a = 8;
    pkt.b = 3;
    array_1[3] = pkt;
     
    pkt = new();
    pkt.a = 0;
    pkt.b = 6;
    array_1[7] = pkt;
     
    pkt = new();
    pkt.a = 2;
    pkt.b = 1;
    array_1[9] = pkt;
 
    $display("-======= sort =======-");
    $display("Before:");
    foreach(array_1[i]) begin //{
      $display("array_1[%0d]:",i);
      array_1[i].display();
    end //}
     
    array_1.sort with (item.a);
     
    $display("\nAfter:");
    foreach(array_1[i]) begin //{
      $display("array_1[%0d]:",i);
      array_1[i].display();
    end //}
    $display("-=======================-");       
  end
   
endmodule
