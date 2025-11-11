module wrapper_moore
(
input reset,
clock, ctrl,
output [6:0]
rhex
);
wire [3:0] b;
moore moore_instance
(
.reset(reset),
.clock(clock),
.ctrl(ctrl),
.evnt(b)
);
driver7seg driver7seg_instance
(
.bin(b),
.hex(rhex)
);
endmodule

