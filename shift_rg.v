module shift_rg #(parameter N=4) (
	input D,
	input clk, R,S,
	output Q
);

	reg [N-1:0] rq;
	assign Q = rq[N-1];
	
	always @(posedge clk, negedge R,negedge S) begin
		if (~R) rq <= {N{1'b0}};
		else if (~S) rq <= {N{1'b1}};
		else rq <= {rq[N-2:0],D};
	end
	
endmodule