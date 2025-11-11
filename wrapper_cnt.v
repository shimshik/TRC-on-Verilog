module wrapper_cnt (
							input R, clk_50MHz,
							input en, load, rev,
							input clk_btn,
							input [1:0] addr, 
							input [3:0] D,
							output [6:0] i7sout, d7sout, r7sout, l7sout
							);
							
							
wire [3:0] sw1, sw2, sw3, sw4;
wire realised, clkp, clkp1, clk_05Hz, clk1;
							
debounce_cnt debounce_cnt1
	(
		.btn(clk_btn),
		.clk(clk_50MHz),
		.realised(realised)
	);
	
pll_cnt pll_cnt1
	(
		.clk_50MHz(clk_50MHz),
		.rst(R),
		.clk_05Hz(clk_05Hz)
	);
	
div_cnt div_cnt1
	(
		.R(R),
		.en(en),
		.clk(clk_50MHz),
		.clkp(clkp),
		.clkp1(clkp1)
	);
	
mux_4_1 m1
	(
		.addr(addr),
		.in1(realised),
		.in2(clkp),
		.in3(clkp1),
		.in4(clk_05Hz),
		.y(clk1)
	);
	
inc_cnt inc_cnt1
	(
		.R(R),
		.en(en),
		.clk(clk1),
		.Q(sw1)
	);

driver7seg driver1 
	(
		.bin(sw1),
		.hex(i7sout)
	);
	
dec_cnt dec_cnt1
	(
		.R(R),
		.en(en),
		.clk(clk1),
		.Q(sw2)
	);
	
driver7seg driver2
	(
		.bin(sw2),
		.hex(d7sout),
	);
	
rev_cnt rev_cnt1	
	(
		.R(R),
		.en(en),
		.rev(rev),
		.clk(clk1),
		.Q(sw3)
	);
	
driver7seg driver3
	(
		.bin(sw3),
		.hex(r7sout)
	);

load_rev_cnt load_rev_cnt1
	(
		.D(D),
		.R(R),
		.en(en),
		.rev(rev),
		.load(load),
		.clk(clk1),
		.Q(sw4)
	);
	
driver7seg driver4
	(
		.bin(sw4),
		.hex(l7sout)
	);

							
endmodule 