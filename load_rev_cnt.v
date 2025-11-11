module load_rev_cnt # (parameter N=4)

            (  input clk, R, en, rev, load,
              input [N-1:0] D,
              output [N-1:0] Q
            );
            
reg [N-1:0] rq;

always @(posedge clk, negedge R)  
begin
  if (~R) rq <= {N{1'b0}};
  else if (load) rq <= D;
  else if (en) begin
  if (rev) rq <= rq - 1;
  else rq <= rq + 1;
  end 
  else rq <= rq;
  
end

assign Q = rq;

endmodule
