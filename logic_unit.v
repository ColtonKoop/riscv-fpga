module logic_unit(
	input [63:0] A, B,
	input [1:0] LogicFn,
	output reg [63:0] Y
);

	always @(*) begin
		case(LogicFn)
			2'b00: begin
				Y[63:0] = B[63:0];
			end
			2'b01: begin
				Y[63:0] = A[63:0] ^ B[63:0];
			end
			2'b10: begin
				Y[63:0] = A[63:0] | B[63:0];
			end
			2'b11: begin
				Y[63:0] = A[63:0] & B[63:0];
			end
			default: Y[63:0] = {64{1'b0}};
		endcase
	end

endmodule 