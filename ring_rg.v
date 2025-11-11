module ring_rg #(parameter N=4) (
	input clk, S,
	output [N-1:0] Q
);

	reg [N-1:0] rq;
	assign Q = rq;
	
	always @(posedge clk, negedge S) begin
		if (~S) rq <= 1'b1;
		else begin 
			rq[N-1:1] <= rq[N-2:0];
			rq[0] <= rq[N-1];
		end
	end
	
endmodule