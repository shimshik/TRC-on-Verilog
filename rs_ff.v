module rs_ff(
input R,S,
output reg Q,nQ

);
always @ (S ,R) begin

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
end
 
endmodule