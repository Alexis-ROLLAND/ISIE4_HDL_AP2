module memoire(DataIN, DataOUT, latch);

parameter DATA_SIZE = 8;
parameter LATCH_POLARITY = 0;		// 0 : falling edge - 1 : rising edge

input latch;
input[(DATA_SIZE-1):0] DataIN;
output[(DATA_SIZE-1):0] DataOUT;
reg[(DATA_SIZE-1):0] DataOUT;

wire iLatch;

assign iLatch = (LATCH_POLARITY == 0)?latch:~latch;

always @(negedge(iLatch))
begin
	DataOUT <= DataIN;
end


endmodule

