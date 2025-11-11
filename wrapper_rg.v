module wrapper_rg (
	input R,S,clk,
	input wr,rd,
	input [3:0] D,
	output [6:0] p7sout,b7sout,
	output [3:0] spout, rout,
	output sout,psout

);
	wire [3:0] par_out;
	wire [3:0] buf_out;
	
	driver7seg p7s(.bin(par_out), .hex(p7sout));
	driver7seg b7s(.bin(buf_out), .hex(b7sout));
	
	par_rg #(.N(4)) par4 (.clk(clk) , .R(R), .S(S) , .D(D) , .Q(par_out));
	buf_rg #(.N(4)) buf4 (.clk(clk) , .R(R), .S(S) , .D(D) , .Q(buf_out), .wr(wr) , .rd(rd));
	
	parshift_rg #(.N(4)) parshift4 (.clk(clk) , .R(R), .S(S) , .D(D) , .Q(psout), .wr(wr));
	shift_rg #(.N(4)) shift4 (.clk(clk) , .R(R), .S(S) , .D(D) , .Q(sout));
	shiftpar_rg #(.N(4)) shiftpar4 (.clk(clk) , .R(R), .S(S) , .D(D) , .Q(spout), .rd(rd));
	ring_rg #(.N(4)) ring4 (.clk(clk) , .S(S) , .Q(rout));

endmodule