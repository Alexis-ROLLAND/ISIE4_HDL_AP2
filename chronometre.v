module chronometre(ClkIn, DigitH, DigitL);

input ClkIn;

output[0:6] DigitH, DigitL;

wire			Clk100ms;
wire[7:0]	NbClk;

DivFreq	#(19,500000,250000,1)	divby500K(ClkIn,Clk100ms);	// Div by 500000, alpha = 0,5, positive polarity

CntModEN #(8,256,0)	cnt8bits_modulo256(Clk100ms, NbClk, 1);	// 8 bit, modulo 256 counter. Active clock = falling edge - counting always enabled

BinTo7Seg #(1)	HighDisplay(NbClk[7:4], DigitH);
BinTo7Seg #(1)	LowDisplay(NbClk[3:0], DigitL);

endmodule 
