module comp_ab(a,b,gt,ls,eq);

input [15:0] a,b;
output reg gt,ls,eq;

always@(a or b)
begin

if(a>b)
begin
gt=1;
ls=0;
eq=0;
end

else if(a<b)
begin
gt=0;
ls=1;
eq=0;
end


else if(a == b)
begin
gt=0;
ls=0;
eq=1;
end

else 
begin
gt=0;
ls=0;
eq=0;
end

end

endmodule

