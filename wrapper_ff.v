module wrapper_ff (
	input R,S,C,D,J,K,T,
	output RSQ,RSnQ,DLQ,DLnQ,DQ,DnQ,JKQ,JKnQ,TQ,TnQ

);
	rs_ff	rst (.R(R), .S(S) , .Q(RSQ), .nQ(RSnQ));
	d_latch dl(.R(R), .S(S) , .C(C) ,.D(D) , .Q(DLQ) , .nQ(DLnQ));
	d_ff dt (.R(R) , .S(S), .C(C) , .D(D) , .Q(DQ) , .nQ(DnQ));
	jk_ff jkt(.R(R) , .S(S) , .C(C) , .J(J) , .K(K) , .Q(JKQ) ,.nQ(JKnQ));
	t_ff tt (.R(R) , .S(S) , .C(C) , .T(T) , .Q(TQ) , .nQ(TnQ));


endmodule