module Memoire(Din,Dout,nLatch);

parameter BUS_SIZE = 8;

input nLatch;	// Mem on falling edge

input[(BUS_SIZE-1):0] Din;
output[(BUS_SIZE-1):0] Dout;

reg[(BUS_SIZE-1):0] Dout;


always @(negedge(nLatch))
begin
	Dout <= Din;
end 



endmodule
