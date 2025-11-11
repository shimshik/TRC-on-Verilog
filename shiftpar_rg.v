module shiftpar_rg #(parameter N=4) (
	input D,
	input clk, R, S, rd,
	output [N-1:0] Q
);

	reg [N-1:0] rq;
	assign Q = rd ? rq : {N{1'bz}};
	
	always @(posedge clk, negedge R,negedge S) begin
		if (~R) rq <= {N{1'b0}};
		else if (~S) rq <= {N{1'b1}};
		else rq <= {rq[N-2:0], D};
	end
	
endmodule