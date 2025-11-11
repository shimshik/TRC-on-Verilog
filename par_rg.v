module par_rg #(parameter N=4) (
	input [N-1:0] D,
	input clk, R,S,
	output [N-1:0] Q
);

	reg [N-1:0] rq;
	assign Q = rq;
	
	always @(posedge clk, negedge R,negedge S) begin
		if (~R) rq <= {N{1'b0}};
		else if (~S) rq <= {N{1'b1}};
		else rq <= D;
	end
	
endmodule