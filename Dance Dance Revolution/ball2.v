`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:33 11/06/2012 
// Design Name: 
// Module Name:    vga_stripes 
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
module ball2(
	input clk,
	input [4:0] BTNS,
    input vidon,
    input [9:0] hc,
    input [9:0] vc,
    input [13:0] ball_x,
    input [13:0] ball_y,
    output reg  [3:0] red,
	output reg  [3:0] green,
	output reg  [3:0] blue
    );
parameter ball_xsize=20;
parameter ball_ysize=20;

wire [13:0] ball2_x, ball2_y, 
           ball3_x, ball3_y, 
           ball4_x, ball4_y,
           ball5_x, ball5_y, 
           ball6_x, ball6_y,
           ball7_x, ball7_y, 
           ball8_x, ball8_y,
           ball9_x, ball9_y, 
           ball10_x, ball10_y,
           ball11_x, ball11_y, 
           ball12_x, ball12_y,
           ball13_x, ball13_y,
           ball14_x, ball14_y,
           ball15_x, ball15_y, 
           ball16_x, ball16_y,
           ball17_x, ball17_y,
           ball18_x, ball18_y,
           ball19_x, ball19_y, 
           ball20_x, ball20_y,
           ball21_x, ball21_y,
           ball22_x, ball22_y,
           ball23_x, ball23_y,
           ball24_x, ball24_y,
           ball25_x, ball25_y, 
           ball26_x, ball26_y;

//Assign X Position for all Notes
//       ______________________
//Arrow: |  <-  DOWN  UP  ->  |
//Pixel: |  300 400  500  600 |
//Notes: |   C   E    D    G  |
//       ______________________
//Each ball corresponds to it's note in the song order
//Song Order: E D C D E E E [Rest]
//            D D D E G G [Rest] [Rest]
//            E D C D E E E [Rest]
//            E D D E D C [Rest] [Rest]
//Each note is indexed off the first note
//The first note is an E
//Each of the following notes will follow the position of the first
assign ball2_x = ball_x + 100;
assign ball3_x = ball_x - 100;
assign ball4_x = ball_x + 100;
assign ball5_x = ball_x + 0;
assign ball6_x = ball_x + 0;
assign ball7_x = ball_x + 0;
//Rest
assign ball8_x = ball_x + 100;
assign ball9_x = ball_x + 100;
assign ball10_x = ball_x + 100;
assign ball11_x = ball_x + 0;
assign ball12_x = ball_x + 200;
assign ball13_x = ball_x + 200;
//Rest
//Rest
assign ball14_x = ball_x + 0;
assign ball15_x = ball_x + 100;
assign ball16_x = ball_x - 100;
assign ball17_x = ball_x + 100;
assign ball18_x = ball_x + 0;
assign ball19_x = ball_x + 0;
assign ball20_x = ball_x + 0;
//Rest
assign ball21_x = ball_x + 0;
assign ball22_x = ball_x + 100;
assign ball23_x = ball_x + 100;
assign ball24_x = ball_x + 0;
assign ball25_x = ball_x + 100;
assign ball26_x = ball_x - 100;
//Rest
//Rest

assign ball2_y = ball_y - 50;
assign ball3_y = ball_y - 100;
assign ball4_y = ball_y - 150;
assign ball5_y = ball_y - 200;
assign ball6_y = ball_y - 250;
assign ball7_y = ball_y - 300;
//Rest
assign ball8_y = ball_y - 400;
assign ball9_y = ball_y - 450;
assign ball10_y = ball_y - 500;
assign ball11_y = ball_y - 550;
assign ball12_y = ball_y - 600;
assign ball13_y = ball_y - 650;
//Rest
//Rest
assign ball14_y = ball_y - 800;
assign ball15_y = ball_y - 850;
assign ball16_y = ball_y - 900;
assign ball17_y = ball_y - 950;
assign ball18_y = ball_y - 1000;
assign ball19_y = ball_y - 1050;
assign ball20_y = ball_y - 1100;
//Rest
assign ball21_y = ball_y - 1200;
assign ball22_y = ball_y - 1250;
assign ball23_y = ball_y - 1300;
assign ball24_y = ball_y - 1350;
assign ball25_y = ball_y - 1400;
assign ball26_y = ball_y - 1450;
//Rest
//Rest


always @(posedge clk)
	begin		     
		if (vidon==1)
			begin			
    			if ((hc>ball_x)&&(vc>ball_y)&&(hc<ball_x+ball_xsize)&&(vc<ball_y+ball_ysize)) 
                    begin
                     red<=15;
                     green<=15;
                     blue<=0;
                    end
                else if ((hc>ball2_x)&&(vc>ball2_y)&&(hc<ball2_x+ball_xsize)&&(vc<ball2_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=15;
                     blue<=15;
                    end
                else if ((hc>ball3_x)&&(vc>ball3_y)&&(hc<ball3_x+ball_xsize)&&(vc<ball3_y+ball_ysize)) 
                    begin
                     red<=15;
                     green<=0;
                     blue<=0;
                    end
                else if ((hc>ball4_x)&&(vc>ball4_y)&&(hc<ball4_x+ball_xsize)&&(vc<ball4_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball5_x)&&(vc>ball5_y)&&(hc<ball5_x+ball_xsize)&&(vc<ball5_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball6_x)&&(vc>ball6_y)&&(hc<ball6_x+ball_xsize)&&(vc<ball6_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball7_x)&&(vc>ball7_y)&&(hc<ball7_x+ball_xsize)&&(vc<ball7_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball8_x)&&(vc>ball8_y)&&(hc<ball8_x+ball_xsize)&&(vc<ball8_y+ball_ysize)) 
                    begin
                     red<=15;
                     green<=15;
                     blue<=0;
                    end
                else if ((hc>ball9_x)&&(vc>ball9_y)&&(hc<ball9_x+ball_xsize)&&(vc<ball9_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball10_x)&&(vc>ball10_y)&&(hc<ball10_x+ball_xsize)&&(vc<ball10_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball11_x)&&(vc>ball11_y)&&(hc<ball11_x+ball_xsize)&&(vc<ball11_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball12_x)&&(vc>ball12_y)&&(hc<ball12_x+ball_xsize)&&(vc<ball12_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball13_x)&&(vc>ball13_y)&&(hc<ball13_x+ball_xsize)&&(vc<ball13_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball14_x)&&(vc>ball14_y)&&(hc<ball14_x+ball_xsize)&&(vc<ball14_y+ball_ysize)) 
                    begin
                     red<=15;
                     green<=15;
                     blue<=0;
                    end
                else if ((hc>ball15_x)&&(vc>ball15_y)&&(hc<ball15_x+ball_xsize)&&(vc<ball15_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball16_x)&&(vc>ball16_y)&&(hc<ball16_x+ball_xsize)&&(vc<ball16_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball17_x)&&(vc>ball17_y)&&(hc<ball17_x+ball_xsize)&&(vc<ball17_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball18_x)&&(vc>ball18_y)&&(hc<ball18_x+ball_xsize)&&(vc<ball18_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball19_x)&&(vc>ball19_y)&&(hc<ball19_x+ball_xsize)&&(vc<ball19_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball20_x)&&(vc>ball20_y)&&(hc<ball20_x+ball_xsize)&&(vc<ball20_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball21_x)&&(vc>ball21_y)&&(hc<ball21_x+ball_xsize)&&(vc<ball21_y+ball_ysize)) 
                    begin
                     red<=15;
                     green<=15;
                     blue<=0;
                    end
                else if ((hc>ball22_x)&&(vc>ball22_y)&&(hc<ball22_x+ball_xsize)&&(vc<ball22_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball23_x)&&(vc>ball23_y)&&(hc<ball23_x+ball_xsize)&&(vc<ball23_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball24_x)&&(vc>ball24_y)&&(hc<ball24_x+ball_xsize)&&(vc<ball24_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball25_x)&&(vc>ball25_y)&&(hc<ball25_x+ball_xsize)&&(vc<ball25_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                else if ((hc>ball26_x)&&(vc>ball26_y)&&(hc<ball26_x+ball_xsize)&&(vc<ball26_y+ball_ysize)) 
                    begin
                     red<=0;
                     green<=0;
                     blue<=15;
                    end
                //The display of the score boxes
                else if ((hc>300)&&(vc>400)&&(hc<(300+ball_xsize))&&(vc<(400+ball_ysize+10))) 
                    begin
                     red<=(15*BTNS[2]);
                     green<=15-(15*BTNS[2]);
                     blue<=0;
                    end
                else if ((hc>400)&&(vc>400)&&(hc<(400+ball_xsize))&&(vc<(400+ball_ysize+10))) 
                    begin
                     red<=(15*BTNS[4]);
                     green<=15-(15*BTNS[4]);
                     blue<=0;
                    end
                else if ((hc>500)&&(vc>400)&&(hc<(500+ball_xsize))&&(vc<(400+ball_ysize+10))) 
                    begin
                     red<=(15*BTNS[1]);
                     green<=15-(15*BTNS[1]);
                     blue<=0;
                    end
                else if ((hc>600)&&(vc>400)&&(hc<(600+ball_xsize))&&(vc<(400+ball_ysize+10)))
                    begin
                     red<=(15*BTNS[3]);
                     green<=15-(15*BTNS[3]);
                     blue<=0;
                    end
                else if ((hc>200)&& (hc<250))
                    begin
                     red<=0;
                     green<=15;
                     blue<=15;
                    end
                else if ((hc>650)&& (hc<700))
                    begin
                     red<=0;
                     green<=15;
                     blue<=15;
                    end
                else
                    begin
                     red<=0;
                     green<=0;
                     blue<=0;
                    end
			end
			else
			   begin
                 red<=0;
                 green<=0;
                 blue<=0;
               end
   end
endmodule
