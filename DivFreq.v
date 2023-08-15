module DivFreq(ClkIn,ClkOut);

parameter BUS_SIZE = 8;
parameter NBT = 30;
parameter NBTON = 10;
parameter POLARITY = 1;	

input ClkIn;

output ClkOut;
reg ClkOut;

reg[(BUS_SIZE-1):0] Cnt;

always @(negedge(ClkIn))
begin

	if (Cnt < NBT) 
	begin
		Cnt <= Cnt + 1;
	end
	else
	begin
		Cnt <= 0;
	end


if (Cnt < NBTON)
begin
	ClkOut <= POLARITY;
end
else
begin
	ClkOut <= ~POLARITY;
end





end






endmodule