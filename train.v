module train (
	input clk, reset, ctrl, mng,
	output reg [3:0] evnt
);
reg [2:0] state;

localparam
at_depo = 3'd000,
at_tn = 3'd001,
at_st = 3'd010,
opendrs = 3'd011,
closedrs = 3'd100;


always @(posedge clk, negedge reset) begin
	if (~reset) state <= at_depo;
	else case (state)
at_depo: if (ctrl) state  <= at_tn;
	else state 					  <= at_depo;
at_tn: if (ctrl) state    <= at_st;
	else state 					  <= at_depo;
at_st: if (ctrl) state    <= at_tn;
	else state 					  <= opendrs;
opendrs: if (ctrl) state  <= at_tn;
	else state 					  <= closedrs;
closedrs: if (ctrl) state <= opendrs;
	else state 					  <= at_tn;
	
	default: state <= at_depo;
endcase
end
always@(state)
	case(state)
at_depo:if (mng) 	      evnt =
4'b0000; // GoToWork
								else
evnt = 4'b0001; //StopWork
at_tn: if (mng) 			evnt =
4'b0010; // GoToSt
								else
evnt = 4'b1000; // SmthWrong
at_st: if (mng) 			evnt =
4'b0011; // Wait
								else
evnt = 4'b0011; // Wait
opendrs: if (mng)		   evnt =
4'b0100; // DrsIsOpen
								else
evnt = 4'b0101; //DrsCntOpen
closedrs: if (mng)	   evnt =
4'b0110; // DrsIsClose
								else
evnt = 4'b0111; // DrsCntClose

default: evnt = 4'b0001; //StopWork

endcase
endmodule