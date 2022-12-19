
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13:06:35 11/21/2010
// Design Name:
// Module Name: vga_640_480
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module vga_640_480(
input wire clk,
input wire clr,
output reg hsync,
output reg vsync,
output reg [9:0] hc,
output reg [9:0] vc,
output reg vidon
);

parameter hpixels = 10'b1100100000;
//Value of pixels ina horizontal line =800
parameter vlines = 10'b1000001001;
//Value of horizontal lines in the display = 521
parameter hbp = 10'b0010010000;
//horizontal back portch =144 (128+16)
parameter hfp = 10'b1100010000;
//horizontal front porch= 784 (128+16+640
parameter vbp = 10'b0000011111;
//vertical back porch =31 (2+29)
parameter vfp = 10'b0111111111;
//vertical front porch = 511 (2+29+480)
reg vsenable; //enable for the vertical counter

//counter for the horizontal sync signal
always @(posedge clk or posedge clr)
begin
if(clr==1)
hc<=0;
else
begin
if (hc == hpixels - 1)
begin // The counter has reached the end of pixel count
hc <= 0;
vsenable <= 1;
//Enable the vertical counter to increment
end
else
begin
hc <= hc + 1 ; //Increment the horizontal counter
vsenable <= 0; //Leave the vsenable off
end
end
end
//Generate hsync pulse
//horizontal sync pulse is low when hc is 0 - 127
always @(*)
begin
if (hc<128)
hsync = 0;
else
hsync = 1;
end

//Counter for the vertical sync signal
always @ (posedge clk or posedge clr)
begin
if (clr==1)
vc <= 0;
else
if (vsenable == 1)
begin
if (vc== vlines-1)
//reset when the number of lines is reached
vc <= 0;
else
vc <= vc+1; //Increment the vertical counter
end
end
//Generate vsync pulse
//Vertical sync pulse is low when hc is 0 or 1

always @(*)
begin
if (vc<2)
vsync = 0;
else
vsync = 1;
end

//Enable video out when whithin the porches

always @(*)
begin
if ((hc < hfp) && (hc > hbp) && (vc < vfp) && (vc > vbp))
vidon = 1;
else
vidon = 0;
end

endmodule

