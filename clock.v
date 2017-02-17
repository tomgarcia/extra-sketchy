`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:52 11/01/2016 
// Design Name: 
// Module Name:    clock 
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


module clock(
    input clk,
    output reg divided_clk
    );
	 parameter DIVIDER = 0;
	 reg [31:0] counter = 32'b0;
	 
	always @(posedge clk) begin
		if(counter + 32'b1 == DIVIDER) begin
			counter <= 32'b0;
			divided_clk <= 1;
		end
		else begin
			counter <= counter + 32'b1;
			divided_clk <= 0;
		end
	end

endmodule
