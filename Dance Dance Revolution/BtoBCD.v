`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kyle Fox
//  
// Create Date: 12/09/2022 10:42:27 PM
// Design Name: 
// Module Name: BtoBCD
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


module BtoBCD(
    input CLK, [15:0] inScore,
    output reg [15:0] outScore
    );
    //hard coded module to just convert the hex to binary
    always @(posedge CLK)
    begin
        case(inScore)
            0: outScore <= 16'h0000;
            1: outScore <= 16'h0001;
            2: outScore <= 16'h0002;
            3: outScore <= 16'h0003;
            4: outScore <= 16'h0004;
            5: outScore <= 16'h0005;
            6: outScore <= 16'h0006;
            7: outScore <= 16'h0007;
            8: outScore <= 16'h0008;
            9: outScore <= 16'h0009;
            10: outScore <= 16'h0010;
            11: outScore <= 16'h0011;
            12: outScore <= 16'h0012;
            13: outScore <= 16'h0013;
            14: outScore <= 16'h0014;
            15: outScore <= 16'h0015;
            16: outScore <= 16'h0016;
            17: outScore <= 16'h0017;
            18: outScore <= 16'h0018;
            19: outScore <= 16'h0019;
            20: outScore <= 16'h0020;
            21: outScore <= 16'h0021;
            22: outScore <= 16'h0022;
            23: outScore <= 16'h0023;
            24: outScore <= 16'h0024;
            25: outScore <= 16'h0025;
            26: outScore <= 16'h0026;
            27: outScore <= 16'h0027;
            28: outScore <= 16'h0028;
            29: outScore <= 16'h0029;
            30: outScore <= 16'h0030;
            31: outScore <= 16'h0031;
            32: outScore <= 16'h0032;
            33: outScore <= 16'h0033;
            34: outScore <= 16'h0034;
            35: outScore <= 16'h0035;
            36: outScore <= 16'h0036;
            37: outScore <= 16'h0037;
            38: outScore <= 16'h0038;
            39: outScore <= 16'h0039;
            40: outScore <= 16'h0040;
            41: outScore <= 16'h0041;
            42: outScore <= 16'h0042;
            43: outScore <= 16'h0043;
            44: outScore <= 16'h0044;
            45: outScore <= 16'h0045;
            46: outScore <= 16'h0046;
            47: outScore <= 16'h0047;
            48: outScore <= 16'h0048;
            49: outScore <= 16'h0049;
            50: outScore <= 16'h0050;
            51: outScore <= 16'h0051;
            52: outScore <= 16'h0052;
            53: outScore <= 16'h0053;
            54: outScore <= 16'h0054;
            55: outScore <= 16'h0055;
            56: outScore <= 16'h0056;
            57: outScore <= 16'h0057;
            58: outScore <= 16'h0058;
            59: outScore <= 16'h0059;
            60: outScore <= 16'h0060;
            61: outScore <= 16'h0061;
            62: outScore <= 16'h0062;
            63: outScore <= 16'h0063;
            64: outScore <= 16'h0064;
            65: outScore <= 16'h0065;
            66: outScore <= 16'h0066;
            67: outScore <= 16'h0067;
            68: outScore <= 16'h0068;
            69: outScore <= 16'h0069;
            70: outScore <= 16'h0070;
            71: outScore <= 16'h0071;
            72: outScore <= 16'h0072;
            73: outScore <= 16'h0073;
            74: outScore <= 16'h0074;
            75: outScore <= 16'h0075;
            76: outScore <= 16'h0076;
            77: outScore <= 16'h0077;
            78: outScore <= 16'h0078;
            79: outScore <= 16'h0079;
            80: outScore <= 16'h0080;
            81: outScore <= 16'h0081;
            82: outScore <= 16'h0082;
            83: outScore <= 16'h0083;
            84: outScore <= 16'h0084;
            85: outScore <= 16'h0085;
            86: outScore <= 16'h0086;
            87: outScore <= 16'h0087;
            88: outScore <= 16'h0088;
            89: outScore <= 16'h0089;
            90: outScore <= 16'h0090;
            91: outScore <= 16'h0091;
            92: outScore <= 16'h0092;
            93: outScore <= 16'h0093;
            94: outScore <= 16'h0094;
            95: outScore <= 16'h0095;
            96: outScore <= 16'h0096;
            97: outScore <= 16'h0097;
            98: outScore <= 16'h0098;
            99: outScore <= 16'h0099;
            100: outScore <= 16'h0100;
            101: outScore <= 16'h0101;
            102: outScore <= 16'h0102;
            103: outScore <= 16'h0103;
            104: outScore <= 16'h0104;
            105: outScore <= 16'h0105;
            106: outScore <= 16'h0106;
            107: outScore <= 16'h0107;
            108: outScore <= 16'h0108;
            109: outScore <= 16'h0109;
            110: outScore <= 16'h0110;
            111: outScore <= 16'h0111;
            112: outScore <= 16'h0112;
            113: outScore <= 16'h0113;
            114: outScore <= 16'h0114;
            115: outScore <= 16'h0115;
            116: outScore <= 16'h0116;
            117: outScore <= 16'h0117;
            118: outScore <= 16'h0118;
            119: outScore <= 16'h0119;
            120: outScore <= 16'h0120;
            121: outScore <= 16'h0121;
            122: outScore <= 16'h0122;
            123: outScore <= 16'h0123;
            124: outScore <= 16'h0124;
            125: outScore <= 16'h0125;
            126: outScore <= 16'h0126;
            127: outScore <= 16'h0127;
            128: outScore <= 16'h0128;
            129: outScore <= 16'h0129;
            130: outScore <= 16'h0130;
            131: outScore <= 16'h0131;
            132: outScore <= 16'h0132;
            133: outScore <= 16'h0133;
            134: outScore <= 16'h0134;
            135: outScore <= 16'h0135;
            136: outScore <= 16'h0136;
            137: outScore <= 16'h0137;
            138: outScore <= 16'h0138;
            139: outScore <= 16'h0139;
            140: outScore <= 16'h0140;
            default: outScore <= 16'h0000;
        endcase
    end
endmodule 
