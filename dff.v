module dff(din,clk,ld,dout);

input [15:0] din;
input ld,clk;
output reg [15:0] dout;

always@(posedge clk)
begin

if(ld)
dout<=din;

end

endmodule
