`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/26/2020 
// Design Name: 
// Module Name: DMUX8_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DMUX8_8(
	input di,
	input [2:0] sel,
	output reg [7:0] dout
	);
	
	always @ (di or sel) begin
		case(sel)
		3'b000: dout <= {7'b0,di};
		3'b001: dout <= {6'b0,di,1'b0};
		3'b010: dout <= {5'b0,di,2'b0};
		3'b011: dout <= {4'b0,di,3'b00};
		3'b100: dout <= {3'b0,di,4'b0};
		3'b101: dout <= {2'b0,di,5'b0};
		3'b110: dout <= {1'b0,di,6'b0};
		3'b111: dout <=	{di,7'b0};
		endcase
	end
endmodule