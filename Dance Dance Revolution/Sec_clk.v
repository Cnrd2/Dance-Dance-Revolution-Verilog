`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Shawn Merrick Miller
// 
// Create Date: 10/19/2022 01:42:42 PM
// Design Name: 
// Module Name: SCLK
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

//Module that displays the refres rate and speed of the game
module SCLK(
    input CLK,
    input reset,
    input [7:0] y_speed,
    input [9:0] hc,
    input [9:0] vc,
    output SCLK
    );
    
    reg [31:0] count=0;
    assign SCLK =(count==7);
   reg first_time=1; 
    
    always @(posedge CLK)
    begin
            
            
          if ((hc==0)&(vc==0)) // once per frame
            begin
            if (first_time==1)
                begin
                    count=200;
                    first_time<=0;
                end
            else if (reset==1)
                begin
                    first_time<=1;
                end
            else
                begin
                    count<=count+1;
                    if (count==7)
                    begin
                        count<=count+y_speed; //We only want the ball to fall for dance dance revolution
                    end    
                end
         end  
    end
endmodule
