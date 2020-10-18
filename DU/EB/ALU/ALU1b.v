`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/23/2020 
// Design Name: 
// Module Name: ALU1b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: It's a implementation for the Arithmetic Logic Unit on 1 bit
//
// Dependencies: ADD1b, MUX4_1b
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU1b(
	input a,
	input b,
	input set,
	input inva,
	input invb,
	input ci,
	input [1:0] selOp,
	output f,
	output sgn,
	output co
	);
	
	wire tmpA, tmpB, tmpAndNor, tmpOr, tmpAddSub;
	
	assign tmpA = a ^ inva;
	assign tmpB = b ^ invb;
	assign tmpAndNor = tmpA & tmpB;
	assign tmpOr = tmpA | tmpB;
	assign sgn = tmpAddSub;
	
	ADD1b ADD1b_unit(
		.a(tmpA),
		.b(tmpB),
		.ci(ci),
		.s(tmpAddSub),
		.co(co)
		);
		
	MUX4_1b MUX4_1b_unit(
		.di0(tmpAndNor),
		.di1(tmpOr),
		.di2(tmpAddSub),
		.di3(set),
		.sel(selOp),
		.dout(f)
		);
		
endmodule