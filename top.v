module top(data_in,clk,start,done);

input [15:0] data_in;
input clk,start;
output done;

wire lda,ldb,sela,selb,sel_in,gt,ls,eq;

data d1(lda,ldb,sela,selb,sel_in,clk,data_in,gt,ls,eq);

control co1(start,gt,ls,eq,clk,lda,ldb,sela,selb,sel_in,done);

endmodule
