`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:55 11/07/2016 
// Design Name: 
// Module Name:    switch 
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
module switch(
    input clk,
    input debounce_clk,
    input switch,
    output reg state
    );
	 
	 initial state = 0;
	 
	reg [1:0] step = 2'b0;
	always @(posedge clk) begin
		if(debounce_clk) begin
			step <= {switch, step[1]};
		end
		if(step[1] && !step[0] && debounce_clk) begin
			state <= 1;
		end
		else if(!step[1] && step[0] && debounce_clk) begin
			state <= 0;
		end
	end

endmodule
