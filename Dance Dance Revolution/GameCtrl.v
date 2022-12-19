`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kyle Fox, Conrad Prisby
// 
// Create Date: 12/05/2022 10:03:58 AM
// Design Name: 
// Module Name: GameCtrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Controls the point system of the game
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GameCtrl(
    input CLK,
    input [4:0] BTNS,
    input [9:0] hc,vc,
    input [15:0] SW,
    input [13:0] SecCLK,
    input [13:0] counter,
    output wire LED16_R, output wire LED16_G,
    output wire LED17_R, output wire LED17_G,
    output reg [7:0] score = 0,
    output [7:0] AN, CA
    );
    
    //Variables
    reg reset;
    wire [31:0] VALUE;
    wire [15:0] outScore;
    
    //Button Debouncing
    reg old_btn1, old_btn2, old_btn3, old_btn4;
    reg bcount1, bcount2, bcount3, bcount4;
    
    //high score variable
    reg [15:0] highScore;
    
    assign VALUE = {highScore, outScore}; //display score and high score on seven seg

   
    wire [7:0] ANTEMP;
    assign AN [7:0] = ANTEMP[7:0] | 'b00000000;
    //Seven segment display module 
    Multiplex   Display     (.CLK(CLK), .disp_value(VALUE), .AN(ANTEMP), .CA(CA));
    //Convert hex to binary for score
    BtoBCD      BinaryTable (.CLK(CLK), .inScore(score), .outScore(outScore));
    
    //flags for scoring lock out and led 
    reg flag1=0;
    reg flag2=0;
    reg flag3=0;
    reg flag4=0;
    
    //Led lights up when points are scored
    assign LED16_G = (flag4) || (flag2) || (flag3) || (flag1);
    assign LED17_G = (flag4) || (flag2) || (flag3) || (flag1);
    
    always @(posedge CLK)
    begin
        //display high score
        if (outScore > highScore && counter > 1850) begin
            highScore <= outScore;
        end
        //button debouncing
        old_btn1 <= BTNS[1];        //Up
        if((old_btn1 == 0) && (BTNS[1] == 1)) bcount1 <= bcount1 + 1;
        else bcount1 = 0;
        
        old_btn3 <= BTNS[3];        //Right
        if((old_btn3 == 0) && (BTNS[3] == 1)) bcount3 <= bcount3 + 1;
        else bcount3 = 0;
        
        old_btn4 <= BTNS[4];        //Down
        if((old_btn4 == 0) && (BTNS[4] == 1)) bcount4 <= bcount4 + 1;
        else bcount4 = 0;
        
        old_btn2 <= BTNS[2];        //Left
        if((old_btn2 == 0) && (BTNS[2] == 1)) bcount2 <= bcount2 + 1;
        else bcount2 = 0;
    end

    
    always @(posedge CLK)
    begin
        //Flag if statements to stop user from spamming button for extra points 
        //Also lights LED and turns it off
        if (counter==430 || counter == 630 || counter == 660 || counter == 730 || counter == 930 ||
            counter == 980 || counter == 1230 || counter == 1430 || counter == 1480 || counter == 1530 
            || counter  == 1630 || counter == 1780) begin //flag 4 for led and point 
                flag4 <= 0;
                flag3<=0;
                flag2<=0;
                flag1<=0;
            end
        if (counter == 480 || counter == 580 || counter == 830 || counter == 880 ||
            counter == 1280 || counter == 1380 || counter == 1680 || counter == 1730
            || counter ==1830) begin //flag 1 for led and point
                flag4 <= 0;
                flag3<=0;
                flag2<=0;
                flag1<=0;
            end
            
        if (counter == 530 || counter ==1330 || counter ==1880) begin // flag 2 for led and point
                flag4 <= 0;
                flag3<=0;
                flag2<=0;
                flag1<=0;
        end
        
        if (counter == 1030 || counter == 1080) begin
                flag4 <= 0;
                flag3<=0;
                flag2<=0;
                flag1<=0;
        end
        
        //Point system boundaries based on the location of the notes
        //cant score points if the game is paused
        if (SW[15:0] == 0) 
            score = score;
        else if      (counter > 0 && counter <= 0)
            score = 0;
//1 --------------------------------------------------------------- E//              
        else if (counter > 380 && counter <= 420 && bcount4 && flag4 == 0) begin //370 - 400 
            score = score + 2;
            flag4 = 1;
            end
        else if (counter > 420 && counter <= 430 && bcount4 && flag4 == 0) begin//400 - 430
            score = score + 5;
                flag4 = 1;
                end
//2 --------------------------------------------------------------- D//      
        else if (counter > 420 && counter <= 450 && bcount1 && flag1 == 0) begin//420 - 450
            score = score + 2;
            flag1 <=1;
            end          
        else if (counter > 460 && counter <= 480 && bcount1 && flag1 == 0) begin//450 - 480
            score = score + 5;
            flag1 <=1;
            end            
//3 --------------------------------------------------------------- C//
        else if (counter > 470 && counter <= 500 && bcount2 && flag2 == 0) begin //470 - 500
            score = score + 2;
            flag2<=1;
            end     
        else if (counter > 500 && counter <= 530 && bcount2  && flag2 == 0) begin//500 - 530
            score = score + 5;
            flag2<=1;
            end     
//4 --------------------------------------------------------------- D//
        else if (counter > 520 && counter <= 550 && bcount1 && flag1 == 0) begin//520 - 550
            score = score + 2;
            flag1 <=1;
            end     
        else if (counter > 550 && counter <= 580 && bcount1 && flag1 == 0) begin//550 - 580
            score = score + 5;
            flag1 <=1;
            end     
//5 --------------------------------------------------------------- E//
        else if (counter > 570 && counter <= 600 && bcount4 && flag4 == 0) begin//570 - 600
            score = score + 2;
            flag4 <= 1;
            end     
        else if (counter > 600 && counter <= 630 && bcount4 && flag4 == 0) begin//600 - 630
            score = score + 5;
            flag4 <= 1;
            end     
//6 --------------------------------------------------------------- E//
        else if (counter > 620 && counter <= 640 && bcount4 && flag4 == 0) begin //620 - 650
            score = score + 2;
            flag4 <= 1;
            end     
        else if (counter > 650 && counter <= 680 && bcount4 && flag4 == 0) begin//650 - 680
            score = score + 5;
            flag4 <= 1;
            end     
//7 --------------------------------------------------------------- E//
        else if (counter > 670 && counter <= 700 && bcount4 && flag4 == 0) begin//670 - 700
            score = score + 2; 
            flag4<=1;
            end     
        else if (counter > 700 && counter <= 730 && bcount4 && flag4 == 0) begin//700 - 730
            score = score + 5;
            flag4 <= 1;
            end     
//8 --------------------------------------------------------------- R//
        else if (counter > 770 && counter <= 800 && bcount1 && flag1 == 0) begin
            score = score + 2;
            flag1 <=1;
            end     
        else if (counter > 800 && counter <= 830 && bcount1 && flag1 == 0) begin
            score = score + 5;
            flag1 <=1;
            end     
//10--------------------------------------------------------------- D//
        else if (counter > 820 && counter <= 850 && bcount1 && flag1 == 0) begin //820 - 850
            score = score + 2;
            flag1 <=1;
            end     
        else if (counter > 850 && counter <= 880 && bcount1 && flag1 == 0) begin//850 - 880
            score = score + 5;
            flag1 <=1;
            end     
//11--------------------------------------------------------------- D//
        else if (counter > 870 && counter <= 900 && bcount4 && flag4 == 0) begin
            score = score + 2;
            flag4<=1;
            end     
        else if (counter > 900 && counter <= 930 && bcount4 && flag4 == 0) begin
            score = score + 5;
            flag4<=1;
            end     
//12--------------------------------------------------------------- E//
        else if (counter > 920 && counter <= 950 && bcount4 && flag4 == 0) begin //920 - 950
            score = score + 2;
            flag4<=1;
            end     
        else if (counter > 950 && counter <= 980 && bcount4 && flag4 == 0) begin//950 - 980
            score = score + 5;
            flag4<=1;
            end     
//13--------------------------------------------------------------- G//
        else if (counter > 970 && counter <= 1000 && bcount3 && flag3 == 0) begin
            score = score + 2;
            flag3<= 1;
            end     
        else if (counter > 1000 && counter <= 1030 && bcount3 && flag3 == 0) begin
            score = score + 5;
            flag3<=1;
            end     
//14--------------------------------------------------------------- G//
        else if (counter > 1020 && counter <= 1050 && bcount3  && flag3 == 0) begin//1020 - 1050
            score = score + 2;
            flag3<=1;
            end     
        else if (counter > 1050 && counter <= 1080 && bcount3  && flag3 == 0) begin //1050 - 1080
            score = score + 5;
            flag3<=1;
            end     
//15--------------------------------------------------------------- R//

//17--------------------------------------------------------------- E//
        else if (counter > 1170 && counter <= 1200 && bcount4 && flag4 == 0) begin
            score = score + 2;
            flag4<=1;
            end     
        else if (counter > 1200 && counter <= 1230 && bcount4 && flag4 == 0) begin
            score = score + 5;
            flag4<=1;
            end     
//18--------------------------------------------------------------- D//
        else if (counter > 1220 && counter <= 1250 && bcount1 && flag1 == 0) begin//1220 - 1250
            score = score + 2;
            flag1 <=1;
            end
        else if (counter > 1250 && counter <= 1280 && bcount1 && flag1 == 0) begin //1250 - 1280
            score = score + 5;
            flag1 <=1;
            end
//19--------------------------------------------------------------- C//
        else if (counter > 1270 && counter <= 1300 && bcount2  && flag2 == 0)begin
            score = score + 2;
            flag2 <= 1;
            end
        else if (counter > 1300 && counter <= 1330 && bcount2  && flag2 == 0)begin
            score = score + 5;
            flag2 <= 1;
            end
//20--------------------------------------------------------------- D//
        else if (counter > 1320 && counter <= 1350 && bcount1 && flag1 == 0) begin//1320 - 1350
            score = score + 2;
            flag1 <=1;
            end
        else if (counter > 1350 && counter <= 1380 && bcount1 && flag1 == 0) begin//1350 - 1380
            score = score + 5;
            flag1 <=1;
            end
//21--------------------------------------------------------------- E//
        else if (counter > 1370 && counter <= 1400 && bcount4 && flag4 == 0) begin
            score = score + 2;
            flag4<=1;
            end
        else if (counter > 1400 && counter <= 1430 && bcount4&& flag4 == 0) begin
            score = score + 5;
            flag4<=1;
            end
//22--------------------------------------------------------------- E//
        else if (counter > 1420 && counter <= 1450 && bcount4 && flag4 == 0) begin //1420 - 1450
            score = score + 2;
            flag4<=1;
            end
        else if (counter > 1450 && counter <= 1480 && bcount4 && flag4 == 0) begin //1450 - 1480
            score = score + 5;
            flag4<=1;
            end
//23--------------------------------------------------------------- E//
        else if (counter > 1470 && counter <= 1500 && bcount4 && flag4 == 0) begin
            score = score + 2;
            flag4<=1;
            end
        else if (counter > 1500 && counter <= 1530 && bcount4 && flag4 == 0) begin
            score = score + 5;
            flag4<=1;
            end
//24--------------------------------------------------------------- R//
        /*else if (counter > 1520 && counter <= 1550 && bcount4) //1520 - 1550
            score = score + 2;
        else if (counter > 1550 && counter <= 1580 && bcount4) //1550 - 1580
            score = score + 5;*/
//25--------------------------------------------------------------- E//            
        else if (counter > 1570 && counter <= 1600 && bcount4 && flag4 == 0) begin
            score = score + 2;
            flag4<=1;
            end
        else if (counter > 1600 && counter <= 1630 && bcount4 && flag4 == 0) begin
            score = score + 5;
            flag4<=1;
            end
//26--------------------------------------------------------------- D//
        else if (counter > 1620 && counter <= 1650 && bcount1 && flag1 == 0) begin//1620 - 1650
            score = score + 2;
            flag1 <=1;
            end
        else if (counter > 1650 && counter <= 1680 && bcount1 && flag1 == 0) begin//1650 - 1680
            score = score + 5;
            flag1 <=1;
            end
//27--------------------------------------------------------------- D//
        else if (counter > 1670 && counter <= 1700 && bcount1 && flag1 == 0) begin
            score = score + 2;
            flag1 <=1;
            end
        else if (counter > 1700 && counter <= 1730 && bcount1 && flag1 == 0) begin
            score = score + 5;
            flag1 <=1;
            end
//28--------------------------------------------------------------- E//
        else if (counter > 1720 && counter <= 1750 && bcount4 && flag4 == 0) begin//1720 - 1750
            score = score + 2;
            flag4<=1;
            end
        else if (counter > 1750 && counter <= 1780 && bcount4 && flag4 == 0) begin//1750 - 1780
            score = score + 5;
            flag4<=1;
            end
//29--------------------------------------------------------------- D//
        else if (counter > 1770 && counter <= 1800 && bcount1 && flag1 == 0) begin
            score = score + 2;
            flag1 <=1;
            end
        else if (counter > 1800 && counter <= 1830 && bcount1 && flag1 == 0) begin
            score = score + 5;
            flag1 <=1;
            end
//30--------------------------------------------------------------- C//
        else if (counter > 1820 && counter <= 1850 && bcount2  && flag2 == 0) begin//1820 - 1850
            score = score + 2;
            flag2<=1;
            end
        else if (counter > 1840 && counter <= 1880 && bcount2  && flag2 == 0) begin //1850 - 1880
            score = score + 5;
            flag2 <= 1;
            end

        else if (bcount1==1 || bcount2==1 || bcount3==1 || bcount4==1)begin               
                score = score - 4;
                end
                
        //reset game if center button is pressed
        if (BTNS[0] == 1) begin
            score <= 0;
        end
        if (BTNS[0] == 0 ) begin
            score<= score;
        end
            
        if (score > 140)
            score <= 0;
            
    end
endmodule
