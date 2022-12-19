`timescale 1ns / 1ps
//Engineer: Conrad Prisby


//each button plays a note 
module button_control(
    input CLK,
    input [4:0] BTNS,
    output reg [3:0] button,
    output reg [28:0] frequency
    );
    
    
    always @ (posedge CLK) begin
        
        if (BTNS[1]==0 || BTNS[2]==0 || BTNS[3]==0 || BTNS[4]==0)
            begin
                frequency<=0;
            end
        
        case (BTNS[2])
        0:  begin 
           end
        1: begin 
            frequency<=191112; //c
           end
        endcase
        
        case (BTNS[1])
        0:  begin 
           end
        1:  begin 
            frequency<=170262; //d
           end
        endcase
        
        case (BTNS[3])
        0:  begin 
           end
        1: begin 
            frequency<=127551; //g
           end
        endcase
        
        case (BTNS[4])
        0:  begin 
           end
        1: begin 
            frequency<=151686; //e
           end
        endcase                        
       
    end    
endmodule
