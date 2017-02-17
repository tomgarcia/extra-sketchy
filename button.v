`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:24 11/27/2016 
// Design Name: 
// Module Name:    button 
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
module button(
    input clk,
    input debounce_clk,
    input button,
    output reg pressed = 0
    );
	 
	reg [1:0] step = 2'b0;
	always @(posedge clk) begin
		if (debounce_clk) begin
			step <= {button, step[1]};
		end
		pressed <= step[1] & ~step[0] & debounce_clk;
	end


endmodule
