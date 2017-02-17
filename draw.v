`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:31 11/27/2016 
// Design Name: 
// Module Name:    draw 
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
module draw(
		image,
		x,
		y,
		radius,
		color,
		output_image
    );
	 
	 
	 parameter WIDTH = 40;
	 parameter HEIGHT = 30;
	 
    input [WIDTH*HEIGHT*8-1:0] image;
    input [4:0] x;
    input [4:0] y;
    input [4:0] radius;
	 input [7:0] color;
    output reg [WIDTH*HEIGHT*8-1:0] output_image;
	 
	 reg [4:0] i;
	 reg [4:0] j;
	 reg [4:0] x_dist;
	 reg [4:0] y_dist;
	 always @* begin
		for(i = 0; i < HEIGHT; i = i + 1) begin
			for(j = 0; j < WIDTH; j = j + 1) begin
				x_dist = (x > j) ? x - j : j - x;
				y_dist = (y > i) ? y - i : i - y;
				// square
				if(x_dist <= radius && y_dist <= radius) begin
					output_image[(i*WIDTH+j)*8+:8] = color;
				end
				else begin
					output_image[(i*WIDTH+j)*8+:8] = image[(i*WIDTH+j)*8+:8];
				end
			end
		end
	 end

endmodule
