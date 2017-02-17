`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:27 11/27/2016 
// Design Name: 
// Module Name:    image 
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
module image(
	 // Inputs
    clk,
    draw,
    draw_image,
	 // Output
	 image
    );
	 
	 `include "screen_definitions.v"
	 parameter WIDTH = SCREEN_SIZE*8;
	 
	 input clk;
	 input draw;
	 input [WIDTH-1:0] draw_image;
    output reg [WIDTH-1:0] image = 0;
	 
	 always @(posedge clk) begin
		if(draw) begin
			image <= draw_image;
		end
	 end


endmodule
