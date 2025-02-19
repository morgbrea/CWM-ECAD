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
	wire clk_n;
	reg rst_n;
	reg [4:0] temperature;
	reg err;
	reg direction;
	wire heating;
	wire cooling;
	
//Todo: Clock generation
	initial
	begin
		clk_p = 1'b0;

	forever
		#(CLK_PERIOD/2) 
		clk_p=~clk_p;

	end
	assign clk_n=~clk_p; 

//Todo: User logic
	initial begin

		temperature=5'd5;
		err=0;
		rst_n=1;
		direction=1;
		
		#(CLK_PERIOD*2)
		
		if (clk_n!=0)		//check rst_n
			begin
			$display("***TEST FAILED! rst_n not working!*** %h, %h, %h, %h, %h error line 49", clk_p, clk_n, temperature, err, rst_n);
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
			
			
			forever begin
				#CLK_PERIOD
				direction= (temperature==5'd1)? 1: (temperature ==5'd31)?0:direction;
				temperature =direction?temperature+1:temperature-1;
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
top top1 (
	.clk_p (clk_p),
	.clk_n (clk_n),
	.rst_n (rst_n),
	.temperature_0 (temperature[0]), 
	.temperature_1 (temperature[1]), 
	.temperature_2 (temperature[2]),
	.temperature_3 (temperature[3]), 
	.temperature_4 (temperature[4]), 
	.heating (heating),
	.cooling (cooling)
	);
 
endmodule 
