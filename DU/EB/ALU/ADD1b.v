`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/23/2020 
// Design Name: 
// Module Name: ADD1b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: It's a implementation for a Full Adder on  1 bit
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ADD1b(
	input a,
	input b,
	input ci,
	output s,
	output co
	);
 	   
	assign {co, s} = a + b + ci;

endmodule