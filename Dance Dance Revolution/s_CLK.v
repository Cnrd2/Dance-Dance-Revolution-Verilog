`timescale 1ns / 1ps
//Engineer: Conrad Prisby

//Module changes frequency based on the button pressed to play a note
module s_CLK(
    input CLK,
    input [28:0] frequency,
    output reg SCLK = 0
    );
    
    reg [28:0] count = 0;
    
    always@(posedge CLK) begin
        if(count<frequency) begin
            count<=count+1;
            end
        else begin
            count<=0;
            SCLK<=!SCLK;
            end      
    end
endmodule

