// 	Author: 	Abram Fouts
//	Date: 		2/4/21
//	Name: 		Project2 - Task1
//	Description: 	This will be a simple design file for project 2 task 1 which will compare two circles.

module top(X1, X2, Y1, Y2, OUT);
input X1, X2, Y1, Y2;
output OUT;

C1 uut1(
    .X1(X1), 
    .Y1(Y1), 
    .X2(X2), 
    .Y2(Y2), 
    .C1_out(OUT)
    );

C2 uut2(
    .X1(X1), 
    .Y1(Y1), 
    .X2(X2), 
    .Y2(Y2), 
    .C2_out(OUT)
    );

endmodule

module C1(X1, Y1, X2, Y2, C1_out);
input X1, Y1, X2, Y2;
output C1_out;

wire AND1, NOR1, OR1;
wire AND2, NOR2, OR2;

assign AND1 = X1 & Y1;
assign NOR1 = ~(X1 | Y1);

assign AND2 = X2 & Y2;
assign NOR2 = ~(X2 | Y2);

assign OR1 = AND1 | NOR1;
assign OR2 = AND2 | NOR2;

assign C1_out = OR1 & OR2;

endmodule

module C2(X1, Y1, X2, Y2, C2_out);
input X1, Y1, X2, Y2;
output C2_out;

wire AND1, AND2, AND3, AND4;
wire OR1;

assign AND1 = X1 & X2 & Y1 & Y2;
assign AND2 = ~X1 & X2 & ~Y1 & Y2;
assign AND3 = X1 & ~X2 & Y1 & Y2;
assign AND4 = ~X1 & ~X2 & ~Y1 & Y2;

assign OR1 = AND1 | AND2 | AND3 | AND4;
endmodule

