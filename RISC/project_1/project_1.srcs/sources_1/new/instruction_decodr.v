`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 11:33:19 AM
// Design Name: 
// Module Name: instruction_decodr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_decodr(
    input clk,
    input rst,
    input [3:0] opcode,
    input [3:0] operand_1,
    input [7:0] operand_2,
    input [15:0] data_out,
    output reg rw,
    output reg cs,
    output reg [3:0] address,
    output reg [3:0] alu_operation,
    output reg [15:0] alu_opr1,
    output reg [7:0] alu_opr2,
    output reg wb
    );
   reg [2:0]state,next;
   
   parameter INIT = 3'b000,FETCH = 3'b001,DECODE = 3'b010,EXECUTE = 3'b011,LOAD = 3'b100;
   
   always @(posedge clk,posedge rst)
   begin
        if(rst)
            state <= INIT;
        else
            state <= next;
   end
   
   always @(rst,state,opcode,operand_1,operand_2,data_out)
   begin
        case(state)
        
        INIT : if(rst)
                next = INIT;
               else
                next = FETCH;
        FETCH : begin
                alu_operation = opcode;
                address = operand_1;
                alu_opr2 = operand_2;
                rw = 1'b1;
                cs = 1'b1;
                wb = 1'b0;
                next = DECODE;
                end
            
        DECODE : begin
                 alu_opr1 = data_out;
                 rw = 1'b0;
                 cs = 1'b0;
                 wb = 1'b0;
                 next = EXECUTE;
                 end
        EXECUTE : begin
                  alu_opr1 = data_out;
                  cs = 1'b1;
                  wb = 1'b1;
                  rw = 1'b0;
                  next = LOAD;
                  end
        LOAD : begin
               cs = 1'b0;
               wb = 1'b0;
               rw = 1'b0;
               next = FETCH;     
               end
         endcase       
   end
   
endmodule
