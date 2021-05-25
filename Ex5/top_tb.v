//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Morgane
// Date: Breabout
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg [4:0] temperature;
	reg err;
	wire heating;
	wire cooling;

//Todo: Clock generation
	initial
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	initial begin
		temperature=4'd17; // testing starting with 17?
		err=0;

		forever begin
			#CLK_PERIOD

			if ((heating & (temperature>=4'd20))|(!heating & (temperature<=4'd18)) // test heating
				begin
				$display("***TEST FAILED! not the right state!***", temperature, heating, cooling);
				err=1;
				end

			if ((cooling & (temperature<=4'd20))|(!cooling & (temperature>=4'd22)) // test cooling 
				begin
				$display("***TEST FAILED! not the right state!***", temperature, heating, cooling);
				err=1;
				end

		end
	end



