module execution_unit(
	input [63:0] A, B,
	input [1:0] ShiftFn, LogicFn, FuncClass,
	input AddnSub, ExtWord, 
	output reg [63:0] Y,
	output Zero, AltB, AltBu, Cout, Ovfl
);

	wire [63:0] Wire1, Wire2, Wire3;

	arithmetic_unit AU(.A(A[63:0]), .B(B[63:0]), .AddnSub(AddnSub), .ExtWord(ExtWord), .AddY(), .Y(Wire1[63:0]), .Cout(Cout), .AltBu(AltBu), .Ovfl(Ovfl), .AltB(AltB), .Zero(Zero));
	shift_unit SU(.A(A[63:0]), .B(B[63:0]), .C(Wire1[63:0]), .ShiftFn(ShiftFn[1:0]), .ExtWord(ExtWord), .Y(Wire2[63:0]));
	logic_unit LU(.A(A[63:0]), .B(B[63:0]), .LogicFn(LogicFn[1:0]), .Y(Wire3[63:0]));
	
	always @(*) begin
		case(FuncClass)
			2'b00: begin
				Y[63:0] = Wire3[63:0];
			end
			2'b01: begin
				Y[63:0] = Wire2[63:0];
			end
			2'b10: begin
				Y[63:0] = {{63{1'b0}}, AltB};
			end
			2'b11: begin
				Y[63:0] = {{63{1'b0}}, AltBu};
			end
		endcase
	end
	
endmodule 