`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 17:35:24
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input clk_in,
    input resetn,
    input [15:0] data,
    output reg [7:0] seg_out,
    output reg [3:0] com_out
);
reg [14:0] cnt;
reg [1:0] com_cnt;
wire [7:0] seg0;
wire [7:0] seg1;
wire [7:0] seg2;
wire [7:0] seg3;

hex2seg hex2seg_0(.hex(data[15:12]), .seg_data(seg0));
hex2seg hex2seg_1(.hex(data[11:8]), .seg_data(seg1));
hex2seg hex2seg_2(.hex(data[7:4]), .seg_data(seg2));
hex2seg hex2seg_3(.hex(data[3:0]), .seg_data(seg3));

always @ (posedge clk_in, negedge resetn) begin
    if(!resetn) begin
        cnt <= 15'd0;
        com_cnt <= 2'd0;
    end
    else begin
        if(cnt < 16384)
            cnt <= cnt + 1;
        else begin
            cnt <= 0;
            com_cnt <= com_cnt + 1;
        end
    end
end

always @ (*) begin
    case(com_cnt)
        2'd0 : begin
            seg_out <= seg0;
            com_out <= ~4'b0001; end
        2'd1 : begin
            seg_out <= seg1;
            com_out <= ~4'b0010; end
        2'd2 : begin
            seg_out <= seg2;
            com_out <= ~4'b0100; end
        2'd3 : begin
            seg_out <= seg3;
            com_out <= ~4'b1000; end
        default : begin
            seg_out <= 8'b11111100;
            com_out <= ~4'b0000; end
    endcase
end

endmodule




