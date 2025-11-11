module d_latch(
	input R,S,D,C,
	output reg Q,nQ
);

always @ (S ,R, D,C) begin

	if (~S) begin
		Q <= 1'b1 ;
		nQ <= !(R&Q);
	end
	if(~R) begin	
		nQ <= 1'b1 ;
		Q <= !(S&nQ);
	end

	if (~R & ~S) begin
		nQ <= 1 ;
		Q <= 1 ;
	end
	if(C&R&S) begin
		nQ <= !Q ;
		Q <= D;
	end

	if (~C&R&S) begin
		nQ <= nQ ;
		Q <= Q;
	end
end
 

endmodule