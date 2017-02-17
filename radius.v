`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:43 11/27/2016 
// Design Name: 
// Module Name:    radius 
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
module radius(
    input clk,
    input increase,
    input decrease,
    output reg [4:0] radius = 0
    );
	 
	 parameter MAX_RADIUS = 10;
	 
	 always @(posedge clk) begin
		if(increase && !decrease && radius < MAX_RADIUS) begin
			radius <= radius + 4'd1;
		end
		else if(decrease && !increase && radius > 0) begin
			radius <= radius - 4'd1;
		end
	 end


endmodule
