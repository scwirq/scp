module ADD_SUB4 ( A, B, SUB, ANS, CY_BR_OUT );
input [3:0] A, B;
input SUB;
output [3:0] ANS;
output CY_BR_OUT;
wire SIGN_NOTEQ;
wire SIGN_REVISE;
wire ADDER_CY_OUT;
wire ANS_SIGN;
wire [3:0] ADDER_B_IN;
wire [3:0] ADDER_S_OUT;

	ADDER4 ADDER4 ( A, ADDER_B_IN, SUB, ADDER_S_OUT, ADDER_CY_OUT );
	assign ADDER_B_IN = B ^ { SUB, SUB, SUB, SUB };
	assign SIGN_REVISE = ADDER_B_IN[3] & ADDER_B_IN[2] & ADDER_B_IN[1] & ADDER_B_IN[0] & SUB;
	assign SIGN_NOTEQ = ADDER_B_IN[3] ^ A[3];
	assign ANS_SIGN = ADDER_CY_OUT ^ SIGN_NOTEQ;
	//assign ANS = { ANS_SIGN, ADDER_S_OUT[2:0] };
	assign ANS = ADDER_S_OUT;
	assign CY_BR_OUT = ( ADDER_CY_OUT ^ ADDER_S_OUT[3] ) & ( ~SIGN_NOTEQ ) & ( ~SIGN_REVISE );

endmodule
