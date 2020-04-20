`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 02:25:33 PM
// Design Name: 
// Module Name: RISC
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


module RISC(
    input [3:0] opcode,
    input [3:0] operand_1,
    input [7:0] operand_2,
    input rst,
    input clk,
    input cin,
    output [15:0] alu_op,
    output cb
    );

    wire rw,cs,wb;
    wire [3:0]address,alu_operation;
    wire [15:0]data_out;
    wire [7:0]alu_opr2;
    wire [15:0]alu_opr1,data_in;
    wire [15:0] sn_ext;
    
    assign sn_ext = {{8{alu_opr2[7]}},alu_opr2};

    instruction_decodr i1(.clk(clk),.rst(rst),.opcode(opcode),.operand_1(operand_1),.operand_2(operand_2),.data_out(data_out),.rw(rw),.cs(cs),
    .address(address),.alu_operation(alu_operation),.alu_opr1(alu_opr1),.alu_opr2(alu_opr2),.wb(wb));
    
    mux m1 (.alu_op(alu_op),.data_out(data_out),.we(wb),.data_in(data_in));
    
    ram_16x16 r1 (.rst(rst),.clk(clk),.rw(rw),.cs(cs),.address(address),.data_in(data_in),.data_out(data_out));
    
    alv v1 (.alu_operand_1(alu_opr1),
    .alu_operand_2(sn_ext),.alu_operation(alu_operation),.cin(cin),.clk(clk),.rst(rst),.alu_op(alu_op),.cb(cb));    
endmodule
