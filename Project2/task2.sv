// 	Author: 	Abram Fouts
//	Date: 		2/4/21
//	Name: 		Project2 - Task2
//	Description: 	This will be a simple design file for project 2 task 2 which will compare two circuits.


module top(a, b, c, d, f, clk);
input a, b, c, d, clk;
output f;

C1 uut1(
    .a(a),
    .b(b), 
    .c(c), 
    .d(d), 
    .f(f), 
    .clk(clk)
);

C2 uut2(
    .a(a),
    .b(b), 
    .c(c), 
    .d(d), 
    .f(f), 
    .clk(clk)
);

endmodule

module C1(a, b, c, d, f, clk);
input a, b, c, d, clk;
output f;

wire h, g, n;
reg k, j;

assign h = ~(a | b);
assign g = (b ^ c);
assign n = ~(c & d);

assign j = (n | f);
assign f = (k) ? g : h;

always@(posedge clk) begin 
#2    k <= j;
end

endmodule

module C2(a, b, c, d, f, clk);
input a, b, c, d, clk;
output f;

wire h, g, n;
reg k, j;

assign h = ~(a | b);
assign g = (b & c);
assign n = ~(c & d);

assign j = (n ^ f);
assign f = (k) ? g : h;

always@(posedge clk) begin 
#2    k <= j;
end

endmodule