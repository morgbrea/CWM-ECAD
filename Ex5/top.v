//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Morgane Breabout
// Date: 25 May 2021
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module aircond (clk, temperature, heating, cooling);
    //Todo: add ports 
	input clk;
	input [4:0] temperature;
	output reg [1:0] heating;
	output reg [1:0]cooling; 

    //Todo: add registers and wires, if needed

    //Todo: add user logic
	always @(posedge clk) 
		begin
		if (temperature<=4'd18) // if cold, heating
			begin
			heating<=1'd1;
			cooling<=1'd0;
			end
		else if (temperature>=4'd20) //idle
			(heating<=1'd0);
		if (temperature>=4'd22) // if hot, cooling
			begin
			cooling<=1'd1;
			heating<=1'd0;
			end
		else if (temperature<=4'd20) //idle
			(cooling<=1'd0);	
		end     
endmodule
    
	
