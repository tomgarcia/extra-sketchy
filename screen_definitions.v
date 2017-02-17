`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:35 11/27/2016 
// Design Name: 
// Module Name:    screen_definitions 
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
localparam SCREEN_WIDTH = 20;
localparam SCREEN_HEIGHT = 15;
localparam SCREEN_SIZE = SCREEN_WIDTH * SCREEN_HEIGHT;
localparam SCALING_FACTOR = 640 / SCREEN_WIDTH;
localparam MAX_X = 1920;
localparam MAX_Y = 1080;
