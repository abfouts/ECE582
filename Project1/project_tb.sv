////////////////////////////////////////////
// File name: 	project.sv
// Description: ECE582 Project 1 code to visually check each state in the state machine
// System: 	Windows10 - ModelSim PE Student Edition 10.4a
// Author: 	Abram Fouts
// Date:	1/28/21
// Revision: 	1.0
////////////////////////////////////////////

`timescale 10ns/10ns

module project_tb();
logic [3:0] 	in;
logic [1:0] 	out;
logic 		clk;

project uut1(
.CLK(clk),
.IN(in),
.OUT(out)
);

initial begin
	clk <= 0;
	in <= 4'b0000;
forever begin
#1	clk <= ~clk;
end
end

initial begin
$monitor("Monitor in:%b out:%b", in, out);
	for (int i = 0; i< 2**4; i = i+1) begin
		in <= in + 1'b1;
#6		$display("Display in:%b out:%b", in, out);
	end
	

end

endmodule
