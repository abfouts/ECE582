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
