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

//Todo: Registers and wires
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
		rst=0;
		button=0;

		if (light!=24'hFFFFFF)		//check if sel=0 white light
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
		sel=1;
		rst=1;				// if rst=1, colour={000}, rgb=light =24'b0 for sel=1
		if (rst & sel & (light!=24'b0)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
			
		forever begin
		#(CLK_PERIOD)
		if (light!=24'h0000FF)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
			
		#(CLK_PERIOD)
		if (light!=24'h00FF00)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
		
		#(CLK_PERIOD)
		if (light!=24'h00FFFF)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
		
		#(CLK_PERIOD)
		if (light!=24'hFF0000)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
		
		#(CLK_PERIOD)
		if (light!=24'hFF00FF)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
			
		#(CLK_PERIOD)
		if (light!=24'hFFFF00)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
			err=1;
			end
		
		#(CLK_PERIOD)
		if (light!=24'hFFFFFF)
			begin
			$display("***TEST FAILED! not the right colour!*** %h, %h, %h, %h", sel, rst, button, light);
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
	selector selector1 ( 
	.clk (clk),
	.sel (sel),
	.rst (rst),
	.button (button),
	.light (light)
	);
 
endmodule 

