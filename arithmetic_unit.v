module arithmetic_unit(
	input [63:0] A, B,
	input AddnSub, ExtWord,
	output [63:0] AddY, Y,
	output Cout, AltBu, Ovfl, AltB, Zero
);

	wire [63:0] BSig;
	assign BSig[63:0] = AddnSub ? ~B[63:0] : B[63:0];

	adder64 adder(.a(A[63:0]), .b(BSig[63:0]), .cin(AddnSub), .sum(AddY[63:0]), .cout(Cout), .ovfl(Ovfl));
	
	assign AltBu = ~Cout;
	assign AltB = Ovfl ^ AddY[63];
	assign Zero = ~(AddY[63:0] || AddY[63:0]);
	
	assign Y[63:0] = ExtWord ? {{32{Y[31]}}, AddY[31:0]} : AddY[63:0];

endmodule 