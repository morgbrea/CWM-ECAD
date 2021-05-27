//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Morgane Breabout
// Date: 25 May 2020
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg button;
	reg err;
	wire [2:0] colour;
	reg [2:0] a;

//Todo: Clock generation
	initial
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	initial begin
		rst=1;
		button=0;
		err=0;
		#CLK_PERIOD
		if ((colour!=3'b000)&rst) // testing for reset
				begin
				$display("***TEST FAILED! not the right colour!***", rst, button, colour);
				err=1;
				end
		rst=0;
		
		
		forever begin
			#CLK_PERIOD	//spend one clock period where you are
			button=1;
			#CLK_PERIOD	//button on so change

			if (button & colour<3'b110) // test incrementing colour by 1 up to colour 6
				begin 
				a=colour;
				#CLK_PERIOD
				if (colour!=a+3'b001)
					begin
					$display("***TEST FAILED! not the right colour!***", rst, button, colour);
					err=1;
					end
				end
			else if (button & (colour==3'b110 | colour == 3'b111)) // test cases 6 and 7 incrementing
				begin
				#CLK_PERIOD
				if (colour!=3'b001)
					begin
					$display("***TEST FAILED! not the right colour!***", rst, button, colour);
					err=1;
					end
				end

			if (!button) // test that doesn't move if not button
				begin
				a=colour;
				#CLK_PERIOD
				if (colour!=a)
					begin
					$display("***TEST FAILED! not the right colour!***", rst, button, colour);
					err=1;
					end
				end

			if (colour>=3'b111)
				begin
				$display("***TEST FAILED! not the right colour!***", rst, button, colour);
				err=1;
				end
		end
	end

//Todo: Finish test, check for success
	initial begin
	#(500*CLK_PERIOD)
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
	lights lights1 (
	.rst (rst),
	.clk (clk),
	.button (button),
	.colour (colour)
	);
 
endmodule 


