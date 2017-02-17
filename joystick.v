`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:59 11/29/2016 
// Design Name: 
// Module Name:    joystick 
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
module joystick(
    input clk,
	 input valid,
	 input [39:0] data,
    output reg [4:0] x = 0,
    output reg [4:0] y = 0,
    output reg button
    );
	 
	 parameter MAX_X = 16'd65535;
	 parameter MAX_Y = 16'd65535;
	 parameter SCREEN_WIDTH = MAX_X;
	 parameter SCREEN_HEIGHT = MAX_Y;
	 parameter SCALING_FACTOR = 0;
	 
	 reg [9:0] x_reading;
	 reg [9:0] y_reading;
	 reg [2:0] buttons;
	 reg [9:0] v_x;
	 reg [9:0] v_y;
	 reg x_sign;
	 reg y_sign;
	 reg [17:0] internal_x = 0;
	 reg [17:0] internal_y = 0;
	 
	 always @* begin
		x_reading = {data[31-:8], data[39-:8]}[9:0];
		y_reading = {data[15-:8], data[23-:8]}[9:0];
		buttons = data[2:0];
		// divide 100 to handle any noise around 0, and to slow down
		// velocities are between -5 and 5
		v_x = (x_reading >= 10'd512) ? (x_reading - 10'd512) / 10'd128 : (10'd511 - x_reading) / 10'd128;
		v_y = (y_reading >= 10'd512) ? (y_reading - 10'd512) / 10'd128 : (10'd511 - y_reading) / 10'd128;
		x_sign = x_reading < 10'd512;
		y_sign = y_reading < 10'd512;
	 end
	 
	 always @(posedge clk) begin
		if(valid) begin
			button <= buttons[1];
			if(x_sign) begin
				internal_x <= (internal_x >= v_x) ? internal_x - v_x : 11'd0;
			end
			else begin
				internal_x <= (internal_x <= MAX_X - v_x - 4*SCALING_FACTOR) ? internal_x + v_x : MAX_X;
			end
			if(!y_sign) begin
				internal_y <= (internal_y >= v_y) ? internal_y - v_y : 11'd0;
			end
			else begin
				internal_y <= (internal_y <= MAX_Y - v_y - 4*SCALING_FACTOR) ? internal_y + v_y : MAX_Y;
			end
		end
		// Timing constraints force us to pipeline this operation
		else begin
			x <= internal_x / (MAX_X / SCREEN_WIDTH);
			y <= internal_y / (MAX_X / SCREEN_HEIGHT);
		end
	 end

endmodule
