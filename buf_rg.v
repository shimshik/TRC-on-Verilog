module buf_rg #(parameter N=4) (
	input [N-1:0] D,
	input clk, R,S, wr,rd,
	output [N-1:0] Q
);

	reg [N-1:0] rq;
	assign Q = rq ? rq : {N{1'bz}};
	
	always @(posedge clk) begin
		if (~wr) rq <= rq;
		else rq <= D;
	end
	
endmodule