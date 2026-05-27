`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 20:42:56
// Design Name: 
// Module Name: tb_Expr3
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


module tb_Expr1();

reg clock_in;
reg reset;
wire [7:0] SEG_out;
wire [3:0] SEG_com;

top top(clock_in, reset, SEG_out, SEG_com);


initial begin
    clock_in = 1'b0 ;
    reset = 1'b0;
#150
reset = 1'b1;
end

always #20 begin
clock_in <= ~clock_in;
end

endmodule

