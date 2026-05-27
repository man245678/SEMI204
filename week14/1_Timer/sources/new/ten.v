`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 17:35:24
// Design Name: 
// Module Name: ten
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

module ten(
    input ten_clk,
    input reset,
    output reg[3:0] ten,
    output reg one_clk
);

always @(posedge ten_clk or negedge reset) begin
    if (!reset) begin
        ten <= 0;
        one_clk <= 0;
    end else begin
        if (ten < 9) begin
            ten <= ten + 1;
            one_clk <= 0;
        end else begin
            ten <= 0;
            one_clk <= 1;
        end
    end
end


endmodule

