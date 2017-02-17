`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:17:07 11/27/2016
// Design Name:   debouncer
// Module Name:   /home/thomas/extra_sketchy/debouncer_test.v
// Project Name:  extra_sketchy
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_test;

	// Inputs
	reg clk;
	reg debounce_clk;
	reg increase_button;
	reg decrease_button;
	reg [7:0] sw;

	// Outputs
	wire increase;
	wire decrease;
	wire [7:0] color;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.debounce_clk(debounce_clk), 
		.increase_button(increase_button), 
		.decrease_button(decrease_button), 
		.sw(sw), 
		.increase(increase), 
		.decrease(decrease), 
		.color(color)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		debounce_clk = 0;
		increase_button = 0;
		decrease_button = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Debounce buttons
		// debounced buttons should only be high for one clock tick
		// color should stay FF until changed
		increase_button = 1;
		decrease_button = 1;
		sw = 8'hFF;
		repeat(10) begin
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 1;
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 0;
		end
		increase_button = 0;
		decrease_button = 0;
		sw = 8'h0F;
		// Should see new color value
		repeat(2) begin
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 1;
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 0;
		end
		// One more press of each button, and new color
		increase_button = 1;
		decrease_button = 1;
		sw = 8'h01;
		repeat(10) begin
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 1;
			#10 clk = 1;
			#10 clk = 0;
			#10 debounce_clk = 0;
		end
	end
      
endmodule

