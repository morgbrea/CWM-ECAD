//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Morgane Breabout
// Date: 25 May 2021
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps


module lights (rst, clk, button, colour);
    //Todo: add ports 
	input rst, clk, button;
	output reg [2:0] colour; 

    //Todo: add registers and wires, if needed
	
    //Todo: add user logic
	always @(posedge clk) 
		begin
		if (rst)
			colour<=3'b000;
		if (button & colour<=6)
			colour<=colour+3'b001;
		else if ((button & colour==6)|(button & colour==7))
			colour<=3'b001;
			
		end     
endmodule
    
