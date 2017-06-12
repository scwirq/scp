module ADD_SUB32 ( A, B, SUB, ANS, CY_BR_OUT );
input [31:0] A, B;
input SUB;
output [31:0] ANS;
output CY_BR_OUT;
wire SIGN_NOTEQ;
wire SIGN_REVISE;
wire ADDER_CY_OUT;
wire ANS_SIGN;
wire [31:0] ADDER_B_IN;
wire [31:0] ADDER_S_OUT;

	ADDER32 ADDER32 ( A, ADDER_B_IN, SUB, ADDER_S_OUT, ADDER_CY_OUT );
	assign ADDER_B_IN = B ^ { 32{SUB} };
	assign SIGN_REVISE = (&ADDER_B_IN) & SUB;
	assign SIGN_NOTEQ = ADDER_B_IN[31] ^ A[31];
	assign ANS_SIGN = ADDER_CY_OUT ^ SIGN_NOTEQ;
	//assign ANS = { ANS_SIGN, ADDER_S_OUT[2:0] };
	assign ANS = ADDER_S_OUT;
	assign CY_BR_OUT = ( ADDER_CY_OUT ^ ADDER_S_OUT[31] ) & ( ~SIGN_NOTEQ ) & ( ~SIGN_REVISE );

endmodule
