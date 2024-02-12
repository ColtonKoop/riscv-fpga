module adder64(
	input[63:0] a, b,
	input cin,
	output[63:0] sum,
	output cout, ovfl
);
	
	wire[63:0] cout_wires;
	
	adder1 adder1_inst_0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout_wires[0]));
	
	genvar i;
	
	generate
		for(i = 1; i < 64; i = i + 1) begin: adders
			adder1 adder1_inst_i(.a(a[i]), .b(b[i]), .cin(cout_wires[i-1]), .sum(sum[i]), .cout(cout_wires[i]));
		end
	endgenerate
	
	assign cout = cout_wires[63];
	assign ovfl = cin ^ cout;
	
endmodule 