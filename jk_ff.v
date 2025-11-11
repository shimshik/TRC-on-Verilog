module jk_ff(
		input R,S,J,K,C,
	   output reg Q,nQ
);

always @ (negedge S or negedge R or posedge C) begin
	if(~R) if(S) begin nQ <= 1'b1; Q <= ~nQ;  end
		else      begin nQ <= 1'b1; Q <= 1'b1; end
	else
	if(~S) if(R) begin Q <= 1'b1; nQ <= ~Q;   end
		else      begin Q <= 1'b1; nQ <= 1'b1; end
	else         begin 
		Q <= nQ & J | Q & ~K;
		nQ <= nQ & ~J | Q & K;	
	end
	
end

endmodule