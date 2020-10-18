`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/03/2020  
// Design Name: 
// Module Name: MUXD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUXD (
	input [7:0] input0,
	input [7:0] input1,
	input sel,
	output reg [7:0]  dout
	);
	
	always @ (sel or input0 or input1) begin
		case(sel)
			1'b0: dout <= input0;
			1'b1: dout <= input1;
		endcase
	end
endmodule