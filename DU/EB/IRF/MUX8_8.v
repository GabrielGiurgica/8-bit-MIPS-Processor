`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/26/2020 
// Design Name: 
// Module Name: MUX8_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX8_8(
	input [7:0] di0,
	input [7:0] di1,
	input [7:0] di2,
	input [7:0] di3,
	input [7:0] di4,
	input [7:0] di5,
	input [7:0] di6,
	input [7:0] di7,
	input [2:0] sel,
	output reg [7:0] dout
	);
	
	always @ (di0 or di1 or di2 or di3 or di4 or di5 or di6 or di7 or sel) begin
		case(sel)
			3'b000: dout <= di0;
			3'b001: dout <= di1;
			3'b010: dout <= di2;
			3'b011: dout <= di3;
			3'b100: dout <= di4;
			3'b101: dout <= di5;
			3'b110: dout <= di6;
			3'b111: dout <= di7;
			default: dout <= 8'bx;
		endcase
	end
endmodule