`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 17:35:24
// Design Name: 
// Module Name: clock
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


module clock(
    input clk,
    input resetn,
    output [15:0] data
);
reg [32:0] counter;
reg clk_10ms;

wire clk_100ms;
wire clk_1000ms;
wire clk_10000ms;

always @ (posedge clk, negedge resetn) begin
    if(!resetn) begin
        counter <= 0;
        clk_10ms <= 0;
    end
    else begin
        
        if (counter < 33'd124999)
            counter <= counter + 33'd1;
        else begin 
            counter <= 33'd0;
            clk_10ms <= ~clk_10ms;
        end        
    end
end

ten u1(.ten_clk(clk_10ms), .reset(resetn), .ten(data[3:0]), .one_clk(clk_100ms));
ten u2(.ten_clk(clk_100ms), .reset(resetn), .ten(data[7:4]), .one_clk(clk_1000ms));
ten u3(.ten_clk(clk_1000ms), .reset(resetn), .ten(data[11:8]), .one_clk(clk_10000ms));
ten u4(.ten_clk(clk_10000ms), .reset(resetn), .ten(data[15:12]), .one_clk());

endmodule
