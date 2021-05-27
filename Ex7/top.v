//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Morgane Breabout
// Date: 26 May 2021
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps


module selector (
    //Todo: add ports 
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light
	);
	
wire [2:0] colour;
wire [23:0] rgb;

lights lights1 (
	.rst(rst), 
	.clk (clk), 
	.button (button), 
	.colour (colour)
	);

converter converter1 ( 
	.clk (clk),
	.enable (1'b1),
	.colour (colour),
	.rgb (rgb)
	);

doorbell doorbell1 (
	.a (24'hFFFFFF),
	.b (rgb),
	.sel (sel),
	.out (light)
	);
     

endmodule
