`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Faculty of Electronics, Telecommunications and Information Technology of Iasi
// Engineer: Gabriel Giurgica
// 
// Create Date: 05/12/2020 
// Design Name: 
// Module Name: CU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  CU = Control Unit
//
// Dependencies: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CU (
	input [3:0] opcode,
	input [2:0] operationALU,
	input z,
	
	output reg[4:0] opALU,
	output reg [1:0] selB,
	output reg [1:0] selAddrMI,
	output reg selAw,
	output reg selD,
	output reg wR,
	output reg wMD
	);
	
	always @ (opcode or operationALU or z) begin
		case (opcode)
			// Instructions in R format
			4'b0000: begin
				case (operationALU)
					3'b001: begin 					// AND
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b00000;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b010: begin 					// OR
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b00001;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b011: begin 					// NOR
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b01100;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b100: begin 					// ADD
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b00010;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b101: begin 					// SUB
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b00110;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b110: begin 					// SLT
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b00111;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					3'b111: begin 					// SLTU
						selAw = 1'b1;
						selD = 1'b1;
						wR = 1'b1;
						selB = 2'b01;
						opALU = 5'b10111;
						selAddrMI = 2'b01;
						wMD = 1'b0;
					end
					default: begin
						selAw = 1'bx;
						selD = 1'bx;
						wR = 1'bx;
						selB = 2'bxx;
						opALU = 5'bxxxxx;
						selAddrMI = 2'bxx;
						wMD = 1'bx;
					end
				endcase
			end


			// Instructions in I format
			4'b0001: begin 					// ANDI
				selAw = 1'b0;
				selD = 1'b1;
				wR = 1'b1;
				selB = 2'b10;
				opALU = 5'b00000;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			4'b0010: begin 					// ORI
					selAw = 1'b0;
					selD = 1'b1;
					wR = 1'b1;
					selB = 2'b10;
					opALU = 5'b00001;
					selAddrMI = 2'b01;
					wMD = 1'b0;
				end
			4'b0011: begin 					// ADDI
				selAw = 1'b0;
				selD = 1'b1;
				wR = 1'b1;
				selB = 2'b11;
				opALU = 5'b00010;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			4'b0100: begin 					// ADDUI
				selAw = 1'b0;
				selD = 1'b1;
				wR = 1'b1;
				selB = 2'b10;
				opALU = 5'b00010;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			4'b0101: begin 					// SLTI
				selAw = 1'b0;
				selD = 1'b1;
				wR = 1'b1;
				selB = 2'b11;
				opALU = 5'b00111;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			4'b0110: begin 					// SLTUI
				selAw = 1'b0;
				selD = 1'b1;
				wR = 1'b1;
				selB = 2'b10;
				opALU = 5'b10111;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			
			4'b0111: begin 					// LW
				selAw = 1'b0;
				selD = 1'b0;
				wR = 1'b1;
				selB = 2'b10;
				opALU = 5'b00010;
				selAddrMI = 2'b01;
				wMD = 1'b0;
			end
			4'b1000: begin 					// SW
				selAw = 1'b0;
				selD = 1'b0;
				wR = 1'b0;
				selB = 2'b10;
				opALU = 5'b00010;
				selAddrMI = 2'b01;
				wMD = 1'b1;
			end
				
			4'b1001: begin 					// BEQ 
				case (z)
					1'b0: begin  // (false)
						selAw = 1'b0;
						selD = 1'b0;
						wR = 1'b0;
						selB = 2'b01;
						opALU = 5'b00110;
						selAddrMI = 2'b01; 
						wMD = 1'b0;
					end
					1'b1: begin  // (true)
						selAw = 1'b0;
						selD = 1'b0;
						wR = 1'b0;
						selB = 2'b01;
						opALU = 5'b00110;
						selAddrMI = 2'b10; 
						wMD = 1'b0;
					end
					default: begin  
						selAw = 1'bx;
						selD = 1'bx;
						wR = 1'bx;
						selB = 2'bxx;
						opALU = 5'bxxxxx;
						selAddrMI = 2'bxx;
						wMD = 1'bx;
					end
				endcase
			end

			
			// Instructions in J format
			4'b1010: begin 					// J
				selAw = 1'b0;
				selD = 1'b0;
				wR = 1'b0;
				selB = 2'b00;
				opALU = 5'b00000;
				selAddrMI = 2'b11;
				wMD = 1'b0;
			end
			
			
			default: begin
				selAw = 1'bx;
				selD = 1'bx;
				wR = 1'bx;
				selB = 2'bxx;
				opALU = 5'bxxxxx;
				selAddrMI = 2'bxx;
				wMD = 1'bx;
			end
		endcase
	end
endmodule
