module tb;

reg clk,start;
reg [15:0] data_in;
wire done;

top t1(data_in,clk,start,done);

initial begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end

initial begin
clk=0;
forever #1 clk=~clk;
end

initial begin
start=0;data_in=10;#10
start=1;data_in=20;#2
start=0;data_in=20;#2
data_in=20;#50
$finish;
end

endmodule



