module mux(a,b,sel,y);

input [15:0] a,b;
input sel;

output [15:0] y;

assign y=sel?b:a;

endmodule
