`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:56 11/27/2016
// Design Name:   radius
// Module Name:   /home/thomas/extra_sketchy/radius_test.v
// Project Name:  extra_sketchy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: radius
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module radius_test;

	// Inputs
	reg clk;
	reg increase;
	reg decrease;

	// Outputs
	wire [4:0] radius;

	// Instantiate the Unit Under Test (UUT)
	radius #(10) uut (
		.clk(clk), 
		.increase(increase), 
		.decrease(decrease), 
		.radius(radius)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		increase = 0;
		decrease = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Test incrementing, with saturation
		increase = 1;
		repeat(20) begin
			#10 clk = 1;
			#10 clk = 0;
		end
		
		// Test decrementing, with saturation
		increase = 0;
		decrease = 1;
		repeat(20) begin
			#10 clk = 1;
			#10 clk = 0;
		end
		
		// When both are set, radius should remain constant
		decrease = 0;
		increase = 1;
		#10 clk = 1;
		#10 clk = 0;
		decrease = 1;
		repeat(20) begin
			#10 clk = 1;
			#10 clk = 0;
		end

	end
      
endmodule

