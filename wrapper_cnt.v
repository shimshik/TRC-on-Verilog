module wrapper_cnt (
input clk, reset, ctrl, mng,
output [6:0] sout
);
wire [3:0] evnt;

mealy mealy
(
	.clk(clk),
	.reset(reset),
	.ctrl(ctrl),
	.mng(mng),
	.evnt(evnt)
);
driver7seg driver1
(
	.bin(evnt),
	.hex(sout)
);
endmodule
