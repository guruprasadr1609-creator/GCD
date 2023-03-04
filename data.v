module data(lda,ldb,sela,selb,sel_in,clk,data_in,gt,ls,eq);

input [15:0] data_in;
input lda,ldb,sela,selb,sel_in,clk;
output gt,ls,eq;

wire [15:0] data_load,a_out,b_out,x,y,z;

dff d1(.clk(clk),.din(data_load),.ld(lda),.dout(a_out));
dff d2(.clk(clk),.din(data_load),.ld(ldb),.dout(b_out));
comp_ab c1(.a(a_out),.b(b_out),.gt(gt),.ls(ls),.eq(eq));
mux m1(.a(z),.b(data_in),.sel(sel_in),.y(data_load));
mux m2(.a(b_out),.b(a_out),.sel(sela),.y(x));
mux m3(.a(b_out),.b(a_out),.sel(selb),.y(y));
sub s1(.a(x),.b(y),.y(z));

endmodule


