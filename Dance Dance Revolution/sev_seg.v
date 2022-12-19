`timescale 1ns / 1ps

module sev_seg(
    input [3:0] VALUE,        // from decoder
    output [7:0] AN,        // anodes
    output reg [6:0] CA    // cathodes
    );

	assign AN = 8'b11111110;   // only using far right digit

    // segment patterns based on decoder value
	always @(VALUE) begin
		case (VALUE)       //gfedcba  <-- segment order
			4'h0 : CA = 7'b1000000;   // 0
			4'h1 : CA = 7'b1111001;   // 1
			4'h2 : CA = 7'b0100100;   // 2
			4'h3 : CA = 7'b0110000;   // 3
			4'h4 : CA = 7'b0011001;   // 4
			4'h5 : CA = 7'b0010010;   // 5
			4'h6 : CA = 7'b0000010;   // 6
			4'h7 : CA = 7'b1111000;   // 7
			4'h8 : CA = 7'b0000000;   // 8
			4'h9 : CA = 7'b0010000;   // 9
			4'hA : CA = 7'b0001000;   // A
			4'hB : CA = 7'b0000011;   // B
			4'hC : CA = 7'b1000110;   // C
			4'hD : CA = 7'b0100001;   // D
			4'hE : CA = 7'b0000110;   // E
			4'hF : CA = 7'b0001110;   // F	
		endcase
	end
endmodule
