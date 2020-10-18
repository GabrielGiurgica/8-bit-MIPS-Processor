`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/09/2020 
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  PC = Program Counter
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC (
	input clk,
	input rst,
	input [7:0] d,
	
	output reg [7:0] q
	);
	
	always @ (posedge rst or posedge clk) begin
		if(rst) begin
			q <= 8'b0;
		end
		else begin
			q <= d;
		end
	end
	
endmodule
