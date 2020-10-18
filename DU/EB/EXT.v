`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/03/2020  
// Design Name: 
// Module Name: EXT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EXT (
	input [5:0] din,
	output reg [7:0]  doutU,
	output reg [7:0]  doutS
	);
	
	always @ (din) begin
		doutU <= {2'b0,din};
		doutS <= {{2{din[5]}},din};
	end
endmodule