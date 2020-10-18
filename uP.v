`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/14/2020 
// Design Name: 
// Module Name: uP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  uP = Microprocessor
//
// Dependencies: CU, DU
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uP (
	input [15:0] instruction,
	input [7:0] dataIN,
	input rst,
	input clk,
	
	output [13:0] testCtrlSg,
	output [7:0] addressMD,
	output [7:0] dataOUT,
	output [7:0] addressMI,
	output wMD,
	output co,
	output ov,
	output coMI,
	output z
	);
	
	wire [4:0] tmpOpALU;
	wire [1:0] tmpSelAddrMi;
	wire [1:0] tmpSelB;
	wire tmpWr;
	wire tmpSelD;
	wire tmpSelAw;
	wire tmpZ;
	wire tmpWMD;
	
	
	DU DUUnit(
		.instruction(instruction[11:0]),
		.dataIN(dataIN),
		.opALU(tmpOpALU),
		.selB(tmpSelB),
		.selAddrMI(tmpSelAddrMi),
		.rst(rst),
		.clk(clk),
		.selAw(tmpSelAw),
		.selD(tmpSelD),
		.wR(tmpWr),
		
		.addressMI(addressMI),
		.addressMD(addressMD),
		.dataOUT(dataOUT),
		.co(co),
		.ov(ov),
		.z(tmpZ),
		.coMI(coMI)
	);
	
	CU CUUnit(
		.opcode(instruction[15:12]),
		.operationALU(instruction[2:0]),
		.z(tmpZ),
		
		.opALU(tmpOpALU),
		.selB(tmpSelB),
		.selAddrMI(tmpSelAddrMi),
		.selAw(tmpSelAw),
		.selD(tmpSelD),
		.wR(tmpWr),
		.wMD(tmpWMD)
	);
	
	assign z = tmpZ;
	assign wMD = tmpWMD;
	assign testCtrlSg = {tmpSelAw, tmpSelD, tmpWr, tmpSelB, tmpOpALU, tmpSelAddrMi, tmpZ, tmpWMD}; 
	
	endmodule
