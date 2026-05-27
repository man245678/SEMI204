`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 17:35:24
// Design Name: 
// Module Name: top
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


module top(
    input clk_in,
    input resetn,
    output [7:0] seg_out,
    output [3:0] segcom
);

wire [15:0] data;
clock clock_u(.clk(clk_in), .resetn(resetn), .data(data));
seven_seg seven_seg_u(.clk_in(clk_in), .resetn(resetn), .data(data), .seg_out(seg_out), .com_out(segcom));

endmodule

