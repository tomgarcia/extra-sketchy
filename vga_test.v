`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:04:42 11/29/2016
// Design Name:   vga
// Module Name:   /home/thomas/extra_sketchy/vga_test.v
// Project Name:  extra_sketchy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_test;

	// Inputs
	reg clk;
	reg divided_clk;
	reg [2399:0] image;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	vga uut (
		.clk(clk), 
		.divided_clk(divided_clk), 
		.image(image), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);
	reg [32:0] i;
	initial begin
		// Initialize Inputs
		clk = 0;
		divided_clk = 0;
		image = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Makes it easy to see if cells are being duplicated properly
		for(i = 0; i < 300; i = i + 1) begin
			image[i*8+:8] = i;
		end
		repeat(800*521) begin
			#1 divided_clk = 1;
			#1 clk = 1;
			#1 clk = 0;
			#1 divided_clk = 0;
		end
        
		// Add stimulus here

	end
      
endmodule

