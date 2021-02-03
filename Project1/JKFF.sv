////////////////////////////////////////////
// File name: 	JKFF.sv
// Description: ECE582 Project 1 JK Flip Flop
// System: 	Windows10 - ModelSim PE Student Edition 10.4a
// Author: 	Abram Fouts
// Date:	1/28/21
// Revision: 	1.0
////////////////////////////////////////////

module JKFF (
input CLK,
input J,
input K,
output Q,
output Q_bar
);

wire NAND1, NAND2;

nand(NAND1, J,CLK,Q_bar);
nand(NAND2, K,CLK,Q);
nand(Q,Q_bar,NAND1);
nand(Q_bar,Q,NAND2);

endmodule
