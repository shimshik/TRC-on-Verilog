module driver7seg (
input[3:0] bin,
output[6:0] hex
);
reg [6:0] rhex;
always@*
case(bin)
4'b0000: rhex=7'b0010010;
4'b0001: rhex=7'b0000011;
4'b0010: rhex=7'b0001110;
4'b0011: rhex=7'b0000010;
4'b0100: rhex=7'b0001100;
endcase
assign hex=rhex;
endmodule
