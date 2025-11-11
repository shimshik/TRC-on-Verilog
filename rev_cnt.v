module rev_cnt #(
	parameter N=4
)(
	input clk, R, en, rev,
	output [N-1:0] Q
);

reg [N-1:0] rq;

always @(posedge clk, negedge R)
begin
	if (~R) rq <= {N{1'b0}};
	else if (en & ~rev) rq <= rq + 1;
	else if (en & rev) rq <= rq - 1;
	else rq <= rq;
end

assign Q = rq;

endmodule
