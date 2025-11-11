module div_cnt #(
	parameter N=25,
	parameter top=25000000
)(
	input clk, R, en,
	output clkp, clkp1
);

reg [N-1:0] rq;
reg rclkp, rclkp1;
assign clkp = (rq == top) ? 1 : 0;
assign clkp1 = rclkp1;

always @(posedge clk, negedge R)
begin
	if (~R) rq <= {N{1'b0}};
	else if (~en) rq <= rq;
	else if (rq == top) rq <= {N{1'b0}};
	else rq <= rq + 1;
end

always @(posedge clkp)
	rclkp1 <= ~rclkp1;
endmodule 