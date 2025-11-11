module pll_cnt (
						input clk_50MHz, rst,
						output clk_500kHz, clk_5kHz, clk_50Hz, clk_05Hz
					);
			
	
plllab plllab0
		(
			.refclk(clk_50MHz),
			.rst(rst),
			.outclk_0(clk_500kHz)
		);
		
plllab plllab1 
		(
			.refclk(clk_500kHz),
			.rst(rsr),
			.outclk_0(clk_5kHz),
		);
		
plllab plllab2 
		(
			.refclk(clk_5kHz),
			.rst(rst),
			.outclk_0(clk_50Hz)
		);
		
plllab plllab3
		(
			.refclk(clk_50Hz),
			.rst(rst),
			.outclk_0(clk_05Hz)
		);
		
endmodule 