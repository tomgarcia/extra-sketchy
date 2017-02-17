`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:14 11/30/2016 
// Design Name: 
// Module Name:    spi 
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
module spi(
    input clk,
    input divided_clk,
    input miso,
    output reg ss = 1,
    output reg mosi = 1,
    output reg sck,
	 output reg valid = 0,
	 output reg [39:0] data
    );
	 
	 localparam IDLE = 3'd0;
	 localparam START = 3'd1;
	 localparam BYTE = 3'd2;
	 localparam STOP = 3'd3;
	 localparam END = 3'd4;
	 
	 reg [2:0] state = IDLE;
	 reg [2:0] byte_counter = 0;
	 reg [4:0] counter = 0;
	 
	 always @(posedge clk) begin
		if(divided_clk) begin
			case(state)
				IDLE: begin
					ss <= 0;
					sck <= 0;
					state <= START;
				end
				START: begin
					if(counter == 5'd30) begin
						state <= BYTE;
						counter <= 0;
					end
					else begin
						counter <= counter + 5'd1;
					end
				end
				BYTE: begin
					if(sck) begin
						sck <= 0;
						data <= {data[38:0], miso};
						if(counter == 5'd7) begin
							counter <= 0;
							state <= STOP;
						end
						else begin
							counter <= counter + 5'd1;
						end
					end
					else begin
						sck <= 1;
					end
				end
				STOP: begin
					if(counter == 5'd20) begin
						counter <= 0;
						if(byte_counter == 3'd4) begin
							state <= END;
							byte_counter <= 0;
							valid <= 1;
						end
						else begin
							byte_counter <= byte_counter + 3'd1;
							state <= BYTE;
						end
					end
					else begin
						counter <= counter + 5'd1;
					end
				end
				END: begin
					ss <= 1;
					state <= IDLE;
					valid <= 0;
				end
				// should never happen
				default: begin
				end
			endcase
		end
	 end


endmodule
