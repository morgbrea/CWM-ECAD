//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg change;
	reg on_off;
	reg err;
	reg [7;0] counter_out;

//Todo: Clock generation
	initial
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end
//Todo: User logic
	initial begin
	#CLK_PERIOD
		rst=1
		change=0;
		on_off=ab;
		err=0;
		counter_out=0;
		forever begin
			if ((counter_out!=0'b0)&rst)
			begin
			$display("***TEST FAILED! did not count correctly!***",rst, change, on_off,counter_out);
			err=1;
			end
			if (on_off) //on_off 1 shoud count up
			a=counter_out
			begin #CLK_PERIOD
				if (counter_out!=a+1'b1)
				$display("***TEST FAILED! did not count correctly!***",rst, change, on_off,counter_out);
			err=1;
			end
			else //on_off 0 shoud count down
			b=counter_out
			begin #CLK_PERIOD
				if (counter_out!=b-1'b1)
				$display("***TEST FAILED! did not count correctly!***",rst, change, on_off,counter_out);
			err=1;
			end
			if (change==0'b0)
			c=counter_out
			begin #CLK_PERIOD
				if (counter_out!=c)
				$display("***TEST FAILED! did not count correctly!***",rst, change, on_off,counter_out);
			err=1;
			end
//Todo: Finish test, check for success
	initial begin
	#50
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
//Todo: Instantiate counter module
	moniter (
	.change (change),
	.on_off (on_off),
	.rst (rst),
	.counter_out (counter_out)
	);
 
endmodule 
