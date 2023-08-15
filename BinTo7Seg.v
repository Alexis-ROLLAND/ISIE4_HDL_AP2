module BinTo7Seg(BinIn, SegOut);

parameter	CC_CA = 0;		// Display technology : Common Cathode = 0, Common Anode = 1;

input[3:0] BinIn;
output[0:6] SegOut;

reg[0:6] iSegOut;		// internal register - Common Cathode Transcoded

assign SegOut[0:6] = (CC_CA == 0)?iSegOut[0:6]:~iSegOut[0:6];

always @(BinIn)
begin
	case (BinIn)
								// abcdefg   - 	CC mode	
		0 : iSegOut <= 	7'b1111110;
		1 : iSegOut <= 	7'b0110000;
		2 : iSegOut <= 	7'b1101101;
		3 : iSegOut <= 	7'b1111001;
		4 : iSegOut <= 	7'b0110011;
		5 : iSegOut <= 	7'b1011011;
		6 : iSegOut <= 	7'b1011111;
		7 : iSegOut <= 	7'b1110000;
		8 : iSegOut <= 	7'b1111111;
		9 : iSegOut <= 	7'b1111011;
		10: iSegOut <= 	7'b1110111;
		11: iSegOut <= 	7'b0111101;
		12: iSegOut <= 	7'b1001110;
		13: iSegOut <= 	7'b0011111;
		14: iSegOut <= 	7'b1001111;
		15: iSegOut <= 	7'b1000111;
	endcase
end



endmodule

