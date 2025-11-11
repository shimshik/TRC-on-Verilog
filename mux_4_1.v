module mux_4_1 (
    input [1:0] addr,     
    input in1, in2, in3, in4,         
    output y               
);
    assign y = addr[1] ? (addr[0] ? in4 : in3) : (addr[0] ? in2 : in1);

endmodule
