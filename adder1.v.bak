module adder(
	input input1, 
	input input2, 
	input i_carry, 
	output result, 
	output o_carry);
	
	assign result = input1 ^ input2 ^ i_carry;
	assign o_carry = (input1 & input2) | (input1 & i_carry) | (input2 & i_carry);

endmodule 