`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:45:20 11/27/2016
// Design Name:   image
// Module Name:   /home/thomas/extra_sketchy/image_test.v
// Project Name:  extra_sketchy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: image
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module image_test;

	// Inputs
	reg clk;
	reg draw;
	reg [3:0] draw_image;
	wire [3:0] image;

	// Instantiate the Unit Under Test (UUT)
	image #(4) uut (
		.clk(clk), 
		.draw(draw), 
		.draw_image(draw_image), 
		.image(image)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		draw = 0;
		draw_image = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Holding memory
		draw_image = 4'd1;
		repeat(10) begin
			#10 clk = 1;
			#10 clk = 0;
		end
		// Draw
		draw = 1;
		#10 clk = 1;
		#10 clk = 0;
		draw = 0;
		// Hold
		repeat(10) begin
			#10 clk = 1;
			#10 clk = 0;
		end
	end
      
endmodule

