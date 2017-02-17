`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:47 11/22/2016 
// Design Name: 
// Module Name:    extra_sketchy 
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
module extra_sketchy(
    input clk,
	 input [7:0] sw,
	 input btnL,
	 input btnR,
	 input MISO,
	 output SS,
	 output MOSI,
	 output SCK,
	 //output [1:0] Led,
	 output Hsync,
	 output Vsync,
	 output [2:0] vgaRed,
	 output [2:0] vgaGreen,
	 output [1:0] vgaBlue
    );
	 
	 `include "screen_definitions.v"
	 
	 wire [39:0] data;
	 wire [4:0] x;
	 wire [4:0] y;
	 wire debounce_clk;
	 wire pixel_clk;
	 wire spi_clk;
	 wire increase;
	 wire decrease;
	 wire [7:0] color;
	 wire [4:0] radius;
	 wire [SCREEN_SIZE*8-1:0] screen;
	 wire left_button;
	 
	 wire [SCREEN_SIZE*8-1:0] draw_image;
	
	// Clock Dividers
	clock #(32'd166667) divider(clk, debounce_clk);
	clock #(32'd4) vga_divider(clk, pixel_clk);
	clock #(32'd50) spi_divider(clk, spi_clk);
	
	// Peripherals
	debouncer debounce(clk, debounce_clk, btnL, btnR, sw, increase, decrease, color); 
	spi spi_controller(clk, spi_clk, MISO, SS, MOSI, SCK, valid, data);
	joystick #(18'd262143, 18'd262143, SCREEN_WIDTH, SCREEN_HEIGHT, SCALING_FACTOR) jstk(clk, valid, data, x, y, left_button);
	vga vga_controller(clk, pixel_clk, draw_image, Hsync, Vsync, vgaRed, vgaGreen, vgaBlue);
	
	// Internal Logic
	radius #(10) radius_controller(clk, increase, decrease, radius);
	image #(SCREEN_SIZE*8) memory(clk, left_button, draw_image, screen);
	draw #(SCREEN_WIDTH, SCREEN_HEIGHT) drawer(screen, x, y, radius, color, draw_image);

endmodule
