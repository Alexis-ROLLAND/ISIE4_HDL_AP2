/*----------------------------------------------------------------------------
// Compteur avec entrée Enable
// Générique :
// 	- Modulo N
//		- Taille vecteur Sortie
//		- Front actif Clk
----------------------------------------------------------------------------*/
module CntModEN(Clk, Q, En);

parameter	BUS_SIZE	= 4;		// Taille vecteur sortie, en bits
parameter	MODULO = 10;		// Modulo du compteur /!\ must fit the bus size /!\
parameter	CLK_POL = 0;		// Clock polarity (0 : neg edge, 1 : pos edge)

input Clk;
input En;		// Enable input - Active High

output[(BUS_SIZE - 1):0]	Q;
reg[(BUS_SIZE - 1):0]	Q;

wire iClk;

// Clock circuitry
assign iClk = (CLK_POL == 0)?(Clk):(~Clk);

// Main process (full synchronous module)
always @(negedge(iClk))
begin
	if (En == 1)
		begin
		if (Q < (MODULO-1))
		begin
			Q <= Q+1;
		end
		else
		begin
			Q <= 0;
		end
	end
end 

endmodule
