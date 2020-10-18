`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/09/2020 
// Design Name: 
// Module Name: ACB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  ACB = Address Calculation Block
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ACB (
	input [7:0] addressJ,
	input [7:0] label,
	input [1:0] selAddr,
	input clk,
	input rst,
	
	output [7:0] outAddr,
	output cout
	);
	
	wire [7:0] tmpPC;
	wire [7:0] tmpAddrInc;
	wire [7:0] tmpAddrBr;
	wire [7:0] tmpAddr;
	wire tmpCoAddrInc;
	wire tmpCoAddrBr;

	
	HADD8b ADDINCUnit(
		.a(tmpPC),
		.b(8'b0000_0001),
		.s(tmpAddrInc),
		.cout(tmpCoAddrInc)
	);
	
	HADD8b ADDBRUnit(
		.a(tmpPC),
		.b(label),
		.s(tmpAddrBr),
		.cout(tmpCoAddrBr)
	);
		
	MUXADDR MUXADDRUnit(
		.input0(8'b0),
		.input1(tmpAddrInc),
		.input2(tmpAddrBr),
		.input3(addressJ),
		.sel(selAddr),
		.dout(tmpAddr)
	);
	
	PC PCUnit(
		.clk(clk),
		.rst(rst),
		.d(tmpAddr),
		.q(tmpPC)
	);
	
	assign cout = tmpCoAddrInc | tmpCoAddrBr;
	assign outAddr = tmpPC;
	
endmodule
