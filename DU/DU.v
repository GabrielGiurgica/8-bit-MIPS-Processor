`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/10/2020 
// Design Name: 
// Module Name: DU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  DU = Data Unit
//
// Dependencies: ACB, EB
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DU (
	input [11:0] instruction,
	input [7:0] dataIN,
	input [4:0] opALU,
	input [1:0] selB,
	input [1:0] selAddrMI,
	input rst,
	input clk,
	input selAw,
	input selD,
	input wR,
	
 	output [7:0] addressMI,
	output [7:0] addressMD,
	output [7:0] dataOUT,
	output co,
	output ov,
	output z,
	output coMI
	);
	
	wire [7:0] tmpLabel;

	
	EB BEUnit(
		.rst(rst),
		.clk(clk),
		.dataInReg(dataIN),
		.instruction(instruction),
		.selAw(selAw),
		.selD(selD),
		.wR(wR),
		.selB(selB),
		.opALU(opALU),
		.CO(co),
		.OV(ov),
		.Z(z),
		.label(tmpLabel),
		.outALU(addressMD),
		.dataOutReg(dataOUT)
	);
	
	ACB BCAUnit(
		.rst(rst),
		.clk(clk),
		.label(tmpLabel),
		.addressJ(instruction[7:0]),
		.selAddr(selAddrMI),
		.cout(coMI),
		.outAddr(addressMI)	
	);
	
endmodule
