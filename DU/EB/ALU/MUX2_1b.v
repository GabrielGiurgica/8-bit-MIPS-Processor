`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/25/2020 
// Design Name: 
// Module Name: MUX2_1b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX2_1b(
	input di0,
	input di1,
	input sel,
	output reg dout
	);
	
	always @ (di0 or di1 or sel) begin
		case(sel)
		1'b0: dout <= di0;
		1'b1: dout <= di1;
		endcase
	end
endmodule