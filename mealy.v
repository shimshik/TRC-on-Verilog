module mealy (
	input clk, reset , ctrl , mng,
	output reg[3:0] evnt
);

reg [2:0] state;

localparam START = 3'd000,
A = 3'd001,
B = 3'd010,
C = 3'd011,
D = 3'd100;

always @(posedge clk, negedge reset) begin
	if(~reset) state <= START;
	else case(state)
	START: if(ctrl) state <=C;
			 else     state <=A;
	A: if(ctrl)     state <=A;
			 else     state <=B;
	B: if(ctrl)     state <=B;
			 else     state <=C;
	C: if(ctrl)     state <=D;
			 else     state <=D;
	D: if(ctrl)     state <=C;
			 else     state <=D;
			 
	default:        state <=START;
	endcase
end 

always @(state) begin
	case(state)
	START: if(mng) evnt <=4'b0000;
			 else     evnt <=4'b0011;
	A: if(mng)     evnt <=4'b1010;
			 else     evnt <=4'b0100;
	B: if(mng)     evnt <=4'b1011;
			 else     evnt <=4'b0101;
	C: if(mng)     evnt <=4'b1100;
			 else     evnt <=4'b0110;
	D: if(mng)     evnt <=4'b1101;
			 else     evnt <=4'b0110;
	default:       evnt <= 4'b1000;
	endcase
	
end
endmodule
