module dec_cnt #( parameter N = 4)
          ( input clk, R, en, 
            output [N-1:0] Q);
            
reg [N-1:0] rq;
assign Q = rq;

always @(posedge clk, negedge R)
begin
  if (~R) rq<= {N{1'b0}};
  else if (en) rq <= rq - 1;
  else rq <= rq;
end


endmodule
