module control(start,gt,ls,eq,clk,lda,ldb,sela,selb,sel_in,done);

parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5;

input start,clk,gt,ls,eq;
output reg lda,ldb,sela,selb,sel_in,done;
reg [2:0] state;


always@(posedge clk)
begin
case(state)
s0:begin
if(start)
state=s1;
else
state=s0;
end

s1:state=s2;

s2:begin
if(gt)
state=s3;

else if(ls)
state=s4;

else if(eq)
state=s5;

end

s3:
begin
if(eq)
state=s5;
else
state=s3;
end

s4:
begin
if(eq)
state=s5;
else
state=s4;
end

s5:state=s0;

default:state=s0;
endcase
end

always@(state or start)
begin
case(state)
s0:begin
done=0;
end

s1:begin
lda=1;
sel_in=1;
end

s2:begin
lda=0;
ldb=1;
sel_in=1;
end

s3:begin
lda=1;
ldb=0;
sela=1;
selb=0;
sel_in=0;
done=0;
end

s4:begin
lda=0;
ldb=1;
sela=0;
selb=1;
sel_in=0;
done=0;
end

s5:begin
lda=0;
ldb=0;
sela=0;
selb=0;
sel_in=1;
done=1;
end
endcase

end

endmodule
