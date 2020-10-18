`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/25/2020 
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: It's a implementation for the Arithmetic Logic Unit on 8 bits
//
// Dependencies: ALU1b, MUX2_1b
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
	input [7:0] A,
	input [7:0] B,
	input [4:0] opALU,
	
	output Z,
	output [7:0] F,
	output CO,
	output OV
	);
	
	wire [7:0] tmpC;
	wire [7:0] tmpF;
	wire sgnMsb;
	wire tmpOV;
	wire tmpSetS;
	wire tmpSetU;
	wire tmpSet;
	
	ALU1b BaseUnit_0 (
		.a(A[0]),
		.b(B[0]),
		.set(tmpSet),
		.inva(opALU[3]),
		.invb(opALU[2]),
		.ci(opALU[2]),
		.selOp(opALU[1:0]),
		.f(tmpF[0]),
		.sgn(),
		.co(tmpC[0])
	);

	// BaseUnit_[1:6]
	generate 
		genvar i;
		for (i=1; i<=6; i=i+1) begin: UAL1bInstances
			ALU1b BaseUnit_ (
				.a(A[i]),
				.b(B[i]),
				.set(1'b0),
				.inva(opALU[3]),
				.invb(opALU[2]),
				.ci(tmpC[i-1]),
				.selOp(opALU[1:0]),
				.f(tmpF[i]),
				.sgn(),
				.co(tmpC[i])
			);		
		end
	endgenerate
	
	ALU1b BaseUnit_7 (
		.a(A[7]),
		.b(B[7]),
		.set(1'b0),
		.inva(opALU[3]),
		.invb(opALU[2]),
		.ci(tmpC[6]),
		.selOp(opALU[1:0]),
		.f(tmpF[7]),
		.sgn(sgnMsb),
		.co(tmpC[7])
	);	
	
	MUX2_1b Mux2Unit (
			.di0(tmpSetS),
			.di1(tmpSetU),
			.sel(opALU[4]),
			.dout(tmpSet)
	);
	
	assign Z = ~|tmpF;
	assign F = tmpF;
	assign CO = tmpC[7];
	assign tmpOV = tmpC[7] ^ tmpC[6];
	assign OV = tmpOV;
	assign tmpSetS = tmpOV ^ sgnMsb;
	assign tmpSetU = ~tmpC[7];
	
endmodule