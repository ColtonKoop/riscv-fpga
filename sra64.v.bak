module srl64(
	input [63:0] X,
	input [5:0] ShiftCount,
	output reg [63:0] Y
);

	reg [63:0] mout1, mout2;
	
	always @(*) begin
		case(ShiftCount[5:4])
			2'b00: begin
				mout1[63:0] = X[63:0];
			end
			2'b01: begin
				mout1[63:0] = X[63:0] >> 16;
			end
			2'b10: begin
				mout1[63:0] = X[63:0] >> 32;
			end
			2'b11: begin
				mout1[63:0] = X[63:0] >> 48;
			end
			default: mout1[63:0] = X[63:0];
		endcase
	end
	
	always @(*) begin
		case(ShiftCount[3:2])
			2'b00: begin
				mout2[63:0] = mout1[63:0];
			end
			2'b01: begin
				mout2[63:0] = mout1[63:0] >> 4;
			end
			2'b10: begin
				mout2[63:0] = mout1[63:0] >> 8;
			end
			2'b11: begin
				mout2[63:0] = mout1[63:0] >> 12;
			end
			default: mout2[63:0] = mout1[63:0];
		endcase
	end
	
	always @(*) begin
		case(ShiftCount[1:0])
			2'b00: begin
				Y[63:0] = mout2[63:0];
			end
			2'b01: begin
				Y[63:0] = mout2[63:0] >> 3;
			end
			2'b10: begin
				Y[63:0] = mout2[63:0] >> 2;
			end
			2'b11: begin
				Y[63:0] = mout2[63:0] >> 1;
			end
			default: Y[63:0] = mout2[63:0];
		endcase
	end

endmodule 