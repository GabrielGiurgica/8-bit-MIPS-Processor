`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/09/2020 
// Design Name: 
// Module Name: HADD8b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  HADD8b = Half Adder on 8 bits
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HADD8b (
	input [7:0] a,
	input [7:0] b,
	output [7:0] s,
	output cout
	);
	
	assign {cout, s} = a + b;
	
endmodule