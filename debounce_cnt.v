module debounce_cnt #( parameter N=10, parameter top = 1000)

(input clk, btn, 
 output realised);
 
assign realized = rbtn;

reg [N-1:0] rq;
reg rbtn;

always @(posedge clk)
  begin 
  rq <= rq + 1;
  if (btn != rbtn)
    begin 
    rq <= {N{1'b0}};
    rbtn <= btn;
    end
  else if (rq + 1 == top)  
    begin 
    rbtn <= btn;
    rq <= {N{1'b0}};
    end
  end
  
endmodule
