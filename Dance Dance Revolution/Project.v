`timescale 1ns / 1ps
//Top module 
//Sources: https://www.true-piano-lessons.com/mary-had-a-little-lamb.html
//Engineers: Shawn Merrick Miller, Conrad Prisby, Kyle Fox

module Project(
    input CLK,
    input [15:0] SW,
    input [4:0] BTNS,
    output VGA_HS,
    output VGA_VS,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output LED16_B, output LED16_R, output LED16_G,
    output LED17_B, output LED17_R, output LED17_G,
    output AUD_PWM,
    output AUD_SD,
    output [7:0] AN, CA,
    output reg [15:0] LED
    );
    
    
    //Variables
    wire [28:0] speed;
    wire [28:0] frequency;
    wire [31:0] score;
    wire [31:0] VALUE;
    
    GameCtrl(.CLK(CLK), .BTNS(BTNS),.AN(AN),.CA(CA), .score(VALUE), .counter(ball_y),
            .SW(SW),.LED16_R(LED16_R),.LED17_R(LED17_R),.LED16_G(LED16_G),.LED17_G(LED17_G));
            //Module to control point system
    

    
    button_control (.CLK(CLK),.BTNS(BTNS),.frequency(frequency)); //Module for playing notes
    s_CLK(.CLK(CLK),.frequency(frequency), .SCLK(AUD_PWM)); //Module for getting sound
    
    //GUI variables
    wire vidon;
    wire [9:0] hc,vc;
    wire [13:0] ball_x,ball_y;
    reg [1:0] count;

always @(posedge CLK)
  begin
      count<=count+1; //shower counter on the LEDs for testing
      LED[13:0]<=ball_y;
  end
  
mover m (.clk(CLK),.reset(BTNS[0]),.x_speed(SW[15:8]),.y_speed(SW[7:0]),.hc(hc),
        .vc(vc), .ball_x(ball_x),.ball_y(ball_y));  //GUI module to move gui
        
ball2 b(.clk(CLK),.BTNS(BTNS),
        .vidon(vidon),.hc(hc),.vc(vc),.ball_x(ball_x),
        .ball_y(ball_y),.red(VGA_R), .green(VGA_G), .blue(VGA_B)); //GUI module for display entites
        
vga_640_480 v6x4(.clk(count[1]), .clr(BTNS[0]), .hsync(VGA_HS), .vsync(VGA_VS), 
        .hc(hc), .vc(vc), .vidon(vidon));  //Refresh rate for gui
    
    

endmodule
