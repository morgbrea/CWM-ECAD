//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Morgane Breabout
// Date: 28 May 2021
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Registers and wires
	reg clk_p;
	reg clk_n;
	reg rst_n;
	reg [4:0] temperature;
	reg err;
	wire heating;
	wire cooling;
	
//Todo: Clock generation
	initial
	begin
		clk_p = 1'b0;
		clk_n = 1'b0;
	forever
		#(CLK_PERIOD/2) 
		clk_p=~clk_p;
		clk_n=~clk_n;
	end

//Todo: User logic
	initial begin
		clk_p=0;
		clk_n=0;
		temperature=5'd5;
		err=0;
		rst_n=1;
		
		#(CLK_PERIOD*2)
		
		if (clk_n!=0)		//check rst_n
			begin
			$display("***TEST FAILED! rst_n not workign!*** %h, %h, %h, %h, %h error line 49", clk_p, clk_n, temperature, err, rst_n);
			err=1;
			end
			
		rst_n=0;
		forever begin
			#CLK_PERIOD
				
			if ((heating & (temperature>=5'd20))|(!heating & (temperature<=5'd18))) // test heating
				begin
				$display("***TEST FAILED! not the right state!*** %h, %h, %h, %h, %h error line 59", clk_p, clk_n, temperature, err, rst_n);
				err=1;
				end

			if ((cooling & (temperature<=5'd20))|(!cooling & (temperature>=5'd22))) // test cooling 
				begin
				$display("***TEST FAILED! not the right state!*** %h, %h, %h, %h, %h error line 65", clk_p, clk_n, temperature, err, rst_n);
				err=1;
				end
			
			temperature=temperature+1'd1;
			if (temperature>=5'd30)
				temperature=5'd5;
			
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
top top1 (
	.clk_p (clk_p),
	.clk_n (clk_n),
	.rst_n (rst_n),
	.temperature (temperature), 
	.heating (heating),
	.cooling (cooling)
	);
 
endmodule 
