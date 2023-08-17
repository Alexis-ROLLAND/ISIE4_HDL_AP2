module WindowedCounterMem(Clk, Gate, Q);


parameter BUS_SIZE = 8;
parameter MODULO = 100;

input	Clk;		// Clk falling edge
input	Gate;		// Gate = 1 : Count up, Gate = 0 : Output forced to 0, Output is memorized when Gate falls to low level (Synchronous behavior)

output[(BUS_SIZE - 1):0] Q;

wire[(BUS_SIZE - 1):0] iNb;


CntGateModuloN	#(BUS_SIZE,MODULO)		internalCnt(Clk, Gate, iNb);
Memoire			#(BUS_SIZE)					internalMem(iNb,Q,Gate);


endmodule

