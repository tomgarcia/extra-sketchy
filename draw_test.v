`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:20 11/28/2016
// Design Name:   draw
// Module Name:   /home/thomas/extra_sketchy/draw_test.v
// Project Name:  extra_sketchy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: draw
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module draw_test;

localparam WIDTH = 10;
localparam HEIGHT = 10;
localparam SIZE = WIDTH*HEIGHT;

	// Inputs
	reg [SIZE*8-1:0] image;
	reg [4:0] x;
	reg [4:0] y;
	reg [4:0] radius;
	reg [7:0] color;

	// Outputs
	wire [SIZE*8-1:0] output_image;

	// Instantiate the Unit Under Test (UUT)
	draw #(WIDTH, HEIGHT) uut (
		.image(image), 
		.x(x), 
		.y(y), 
		.radius(radius), 
		.color(color), 
		.output_image(output_image)
	);

	integer i;
	integer j;
	initial begin
		// Initialize Inputs
		image = 0;
		// Makes sure we're covering the image with the square, not just creating a new image
		image[0+:8] = 8'd12;
		x = 4;
		y = 4;
		radius = 2;
		color = 8'd255;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Testing drawing a circle
		for(i = 0; i < HEIGHT; i = i + 1) begin
			for(j = 0; j < WIDTH; j = j + 1) begin
				$write("%d ", output_image[(i*WIDTH+j)*8+:8]);
			end
			$write("\n");
		end
		$write("\n");
		// Testing change color
		color = 8'd128;
		#10;
		for(i = 0; i < HEIGHT; i = i + 1) begin
			for(j = 0; j < WIDTH; j = j + 1) begin
				$write("%d ", output_image[(i*WIDTH+j)*8+:8]);
			end
			$write("\n");
		end
		$write("\n");
		// Testing change of radius
		radius = 0;
		#10;
		for(i = 0; i < HEIGHT; i = i + 1) begin
			for(j = 0; j < WIDTH; j = j + 1) begin
				$write("%d ", output_image[(i*WIDTH+j)*8+:8]);
			end
			$write("\n");
		end
		$write("\n");

	end
      
endmodule

