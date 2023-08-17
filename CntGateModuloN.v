module CntGateModuloN(Clk, Gate, Q);

parameter BUS_SIZE = 4;
parameter MODULO = 10;

input	Clk;		// Clk falling edge
input	Gate;		// Gate = 1 : Count up, Gate = 0 : Output forced to 0

output[(BUS_SIZE - 1):0] Q;
reg[(BUS_SIZE - 1):0] Q;

always @(negedge(Clk))
begin
	if (Gate == 0)
	begin
		Q <= 0;
	end
	else
	begin
		if (Q < (MODULO - 1))
		begin
			Q <= Q + 1;
		end
		else
		begin
			Q <= 0;
		end
	
	
	end
	


end


endmodule


