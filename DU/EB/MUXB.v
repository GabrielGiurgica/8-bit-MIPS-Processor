`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/03/2020  
// Design Name: 
// Module Name: MUXB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUXB (
	input [7:0] input0,
	input [7:0] input1,
	input [7:0] input2,
	input [7:0] input3,
	input [1:0] sel,
	output reg [7:0]  dout
	);
	
	always @ (sel or input0 or input1 or input2 or input3) begin
		case(sel)
			2'b00: dout <= input0;
			2'b01: dout <= input1;
			2'b10: dout <= input2;
			2'b11: dout <= input3;
		endcase
	end
endmodule