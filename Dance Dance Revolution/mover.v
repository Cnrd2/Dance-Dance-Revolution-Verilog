`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 10:02:03 AM
// Design Name: 
// Module Name: mover
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


module mover(
    input clk,
    input reset,
    input [7:0] x_speed,
    input [7:0] y_speed,
    input [9:0] hc,
    input [9:0] vc,
    output reg [13:0] ball_x,
    output reg [13:0] ball_y,
    output reg [2:0] count = 0
    );
    
   reg first_time=1; 
//   reg [2:0] count=0; 
    always@(posedge clk)
     begin
        if ((hc==0)&(vc==0)) // once per frame
            begin
            if (first_time==1)
                begin
                    ball_x=400;
                    ball_y=200;
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
                        ball_x<=ball_x+x_speed;
                        ball_y<=ball_y+y_speed; //We only want the ball to fall for dance dance revolution
                    end    
                end
         end                  
     end
endmodule
