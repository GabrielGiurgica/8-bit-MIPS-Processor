`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/26/2020 
// Design Name: 
// Module Name: IRF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: It's a implementation for the Internal Registry Files Unit with 8 storage units.
//
// Dependencies: DMUX8_8, MUX8_8, RPP8
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IRF(
	input we,
	input clk,
	input rst,
	input [7:0] d,
	input [2:0] aRW,
	input [2:0] aRA,
	input [2:0] aRB,
	output [7:0] qA,
	output [7:0] qB
	);
	
	wire [7:0] tmpLd;
	wire [7:0] tmpD[7:0];
	
	DMUX8_8 Dmux8Unit (
		.sel(aRW),
		.di(we),
		.dout(tmpLd)
	);
	
	// we instantiate 8 storage units
	generate
		genvar i;
		for (i=0; i<=7; i=i+1) begin: RPP8Instances
			RPP8 BaseUnit_ (
				.ld(tmpLd[i]),
				.clk(clk),
				.rst(rst),
				.d(d),
				.q(tmpD[i])
			);
		end
	endgenerate
	
	MUX8_8 Mux8Unit_A (
		.sel(aRA),
		.di7(tmpD[7]),
		.di6(tmpD[6]),
		.di5(tmpD[5]),
		.di4(tmpD[4]),
		.di3(tmpD[3]),
		.di2(tmpD[2]),
		.di1(tmpD[1]),
		.di0(tmpD[0]),
		.dout(qA)
	);
	
	MUX8_8 Mux8Unit_B (
		.sel(aRB),
		.di7(tmpD[7]),
		.di6(tmpD[6]),
		.di5(tmpD[5]),
		.di4(tmpD[4]),
		.di3(tmpD[3]),
		.di2(tmpD[2]),
		.di1(tmpD[1]),
		.di0(tmpD[0]),
		.dout(qB)
	);
	
endmodule