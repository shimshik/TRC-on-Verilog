module wrapper_train (
input clk, reset, ctrl, mng,
output [6*7-1:0] sout
);
wire [3:0] evnt;
train train
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
