`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 04/23/2020 
// Design Name: 
// Module Name: MUX4_1b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX4_1b(
	input di0,
  input di1,
  input di2,
  input di3,
  input [1:0] sel,
  output reg dout
  );
    
	always @ (di0 or di1 or di2 or di3 or sel) begin
		case (sel)
			2'b00 : dout <= di0;
			2'b01 : dout <= di1;
			2'b10 : dout <= di2;
			2'b11 : dout <= di3;
			default: dout <= 1'bx;
		endcase
	end
endmodule
