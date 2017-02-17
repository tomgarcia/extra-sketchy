`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:53 11/27/2016 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
    input clk,
    input debounce_clk,
    input increase_button,
    input decrease_button,
    input [7:0] sw,
    output increase,
    output decrease,
    output [7:0] color
    );
	 
	 button inc(clk, debounce_clk, increase_button, increase);
	 button dec(clk, debounce_clk, decrease_button, decrease);
	 
	 genvar i;
	 generate
	 for(i = 0; i < 8; i = i + 1) begin : switch_instantiation
		switch s(clk, debounce_clk, sw[i], color[7-i]);
	 end
	 endgenerate


endmodule
