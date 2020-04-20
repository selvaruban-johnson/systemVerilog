`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 01:02:09 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input [15:0] alu_op,
    input [15:0] data_out,
    input we,
    output reg [15:0] data_in
    );
    always @(alu_op,data_out,we)
    begin
        if(we)
        begin
            data_in = alu_op;
        end
        else
        begin
            data_in = data_out;
        end
    end
endmodule
