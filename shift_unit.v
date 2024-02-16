module shift_unit(
	input [63:0] A, B, C,
	input [1:0] ShiftFn,
	input ExtWord,
	output [63:0] Y
);

	wire [5:0] ShiftCount;
	wire [63:0] Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, Wire8; //TODO: Make wire names more descriptive
	
	assign ShiftCount[5:0] = ExtWord ? B[4:0] : B[5:0];
	assign Wire1 = (ShiftFn[1] & ExtWord) ? ({A[31:0], A[63:32]}) : A[63:0]; 

	sll64 sll64_1(.X(Wire1[63:0]), .ShiftCount(ShiftCount[5:0]), .Y(Wire2[63:0]));
	srl64 srl64_1(.X(Wire1[63:0]), .ShiftCount(ShiftCount[5:0]), .Y(Wire3[63:0]));
	sra64 sra64_1(.X(Wire1[63:0]), .ShiftCount(ShiftCount[5:0]), .Y(Wire4[63:0]));
	
	assign Wire5[63:0] = ShiftFn[0] ? Wire2[63:0] : C[63:0];
	assign Wire6[63:0] = ShiftFn[0] ? Wire4[63:0] : Wire3[63:0];
	assign Wire7[63:0] = ExtWord ? {{32{Wire5[31]}}, Wire5[31:0]} : Wire5[63:0];
	assign Wire8[63:0] = ExtWord ? {{32{Wire6[63]}}, Wire6[63:32]} : Wire6[63:0];
	assign Y[63:0] = ShiftFn[1] ? Wire8[63:0] : Wire7[63:0];

endmodule 