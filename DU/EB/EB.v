`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/03/2020  
// Design Name: 
// Module Name: EB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: MUXAW, MUXB, MUXD, EXT, IRF, ALU
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EB (
	input [11:0] instruction,
	input [7:0] dataInReg,
	input [4:0] opALU,
	input [1:0] selB,
	input selAw,
	input selD,
	input wR,
	input clk,
	input rst,
	
	output [7:0] outALU,
	output [7:0] dataOutReg,
	output [7:0] label,
	output CO,
	output OV,
	output Z
	);

	wire [7:0] tmpD;
	wire [7:0] tmpA;
	wire [7:0] tmpQb;
	wire [7:0] tmpB;
	wire [7:0] tmpExtU;
	wire [7:0] tmpExtS;
	wire [7:0] tmpUal;
	wire [2:0] tmpAw;
		
		
	MUXAW MUXAWUnit(
		.input0(instruction[8:6]),
		.input1(instruction[5:3]),
		.sel(selAw),
		.dout(tmpAw)
	);
	
		MUXD MUXDUnit(
		.input0(dataInReg),
		.input1(tmpUal),
		.sel(selD),
		.dout(tmpD)
	);
	
	IRF IRFUnit(
		.aRA(instruction[11:9]),
		.aRB(instruction[8:6]),
		.aRW(tmpAw),
		.d(tmpD),
		.we(wR),
		.clk(clk),
		.rst(rst),
		.qA(tmpA),
		.qB(tmpQb)
	);
	
	EXT EXTUnit(
		.din(instruction[5:0]),
		.doutU(tmpExtU),
		.doutS(tmpExtS)
	);
	
	MUXB MUXBUnit(
		.input0(8'b0),
		.input1(tmpQb),
		.input2(tmpExtU),
		.input3(tmpExtS),
		.sel(selB),
		.dout(tmpB)
	);
	
	ALU ALUUnit(
		.A(tmpA),
		.B(tmpB),
		.opALU(opALU),
		.CO(CO),
		.OV(OV),
		.Z(Z),
		.F(tmpUal)
	);
	
	assign dataOutReg = tmpQb;
	assign label = tmpExtU;
	assign outALU = tmpUal;
	
endmodule