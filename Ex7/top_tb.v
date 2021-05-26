//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Morgane Breabout
// Date: 26 May 2021
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	wire [23:0] light;
	
//Todo: Clock generation
	initial
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	initial begin
		sel=0;
		err=0;
		rst=1;
		button=0;
				
		forever begin
			#(CLK_PERIOD*2)
			a=light;
			colour=colour+1;
			
			if ((!sel)&(light!=23'hffffff))
				begin
				$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
				err=1;
				end
			
			if (enable)
				begin
				#(CLK_PERIOD*10)
					if (light==a)
					begin
					$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
					err=1;
					end
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
	converter converter1 ( 
	.clk (clk),
	.enable (enable),
	.colour (colour),
	.rgb (rgb)
	);
 
endmodule 

