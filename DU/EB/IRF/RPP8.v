`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/26/2020 
// Design Name: 
// Module Name: RPP8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Register with 8-bit parallel input and output 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RPP8(
	input ld,
	input clk,
	input rst,
	input [7:0] d,
	output reg [7:0] q
	);
	
	always @ (posedge rst or posedge clk) begin
		if(rst) begin
			q <= 8'b0;
		end
		else if(ld) begin
			q <= d;
		end
	end
endmodule