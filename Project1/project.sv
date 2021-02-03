////////////////////////////////////////////
// File name: 	project.sv
// Description: ECE582 Project 1 code to visually check each state in the state machine
// System: 	Windows10 - ModelSim PE Student Edition 10.4a
// Author: 	Abram Fouts
// Date:	1/28/21
// Revision: 	1.0
////////////////////////////////////////////

module project(
	input CLK,
	input logic [3:0] IN,
	output logic [1:0] OUT
);
	logic [1:0] moment1;
	logic [1:0] moment2;
	logic [1:0] moment3;

	wire A, B, C, D;
	wire NAND1, NAND2;
	wire XOR1, XOR2;
	wire NOR1;
	wire AND1;
	wire m1_Q, m1_Qbar;
	wire m2_Q, m2_Qbar;

	assign NAND1 = ~(A & B);
	assign NAND2 = ~(C & D);
	assign XOR1 = m1_Q ^ NAND1;
	assign XOR2 = m1_Qbar ^ NAND2;
	assign NOR1 = ~(m2_Q | XOR1);
	assign AND1 = m2_Qbar & XOR2;

	assign OUT = {NOR1, AND1};

//Moment 1 JK FF
	JKFF uut_m1(
	.CLK(CLK),
	.J(NAND1),
	.K(NAND2),
	.Q(m1_Q),
	.Q_bar(m1_Qbar)
	);
	
//Moment 2 JK FF
	JKFF uut_m2(
	.CLK(CLK),
	.J(XOR1),
	.K(XOR2),
	.Q(m2_Q),
	.Q_bar(m2_Qbar)
	);

/*
	always_ff @(posedge CLK) begin
			moment1 <= 2'b01;
			moment2 <= 2'b01;
			moment3 <= 2'b01;

	end
*/
endmodule

