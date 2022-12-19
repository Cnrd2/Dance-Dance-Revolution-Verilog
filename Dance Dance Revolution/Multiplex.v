`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Kyle Fox
// 
// Create Date: 09/14/2022 01:06:42 PM
// Design Name: 
// Module Name: Multiplex
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Multiplex(
    input CLK,
    input [31:0] disp_value,
    output reg [7:0] AN,
    output reg [7:0] CA
    );
    
	reg [3:0] Value;						//The same as number, renamed for the parent file		-4bits
    reg [31:0] counter;						//Counter for the multiplex signal						-32bits
    //reg [31:0] disp_value=32'b10000111011001010100001100100001;		//The whole value sent to the display					-32bits
    
	always @(posedge CLK)
		begin
		counter <= counter + 1;			
			case(counter[16:14])
		      0: begin AN <= 8'b11111110; Value <= disp_value[3:0]; end
		      1: begin AN <= 8'b11111101; Value <= disp_value[7:4]; end
		      2: begin AN <= 8'b11111011; Value <= disp_value[11:8]; end
		      3: begin AN <= 8'b11110111; Value <= disp_value[15:12]; end
		      4: begin AN <= 8'b11101111; Value <= disp_value[19:16]; end
		      5: begin AN <= 8'b11011111; Value <= disp_value[23:20]; end
		      6: begin AN <= 8'b10111111; Value <= disp_value[27:24]; end
		      7: begin AN <= 8'b01111111; Value <= disp_value[31:28]; end
		      default: begin AN <= 8'b11111110; Value <= 4'b1111; end
		    endcase
            case(Value)
                 0: CA <= 8'b11000000;
                 1: CA <= 8'b11111001;
                 2: CA <= 8'b10100100;
                 3: CA <= 8'b10110000;
                 4: CA <= 8'b10011001;
                 5: CA <= 8'b10010010;
                 6: CA <= 8'b10000010;
                 7: CA <= 8'b11011000;
                 8: CA <= 8'b10000000;
                 9: CA <= 8'b10010000;
                 10: CA <= 8'b10001000;
                 11: CA <= 8'b10000011;
                 12: CA <= 8'b10100111;
                 13: CA <= 8'b10100001;
                 14: CA <= 8'b10000110;
                 15: CA <= 8'b10001110;
                 default: CA <= 8'b11001010;
            endcase
		end
endmodule

