module ALU32( op, lt, rt, out, zero_flag );
input [31:0] lt, rt;
input [3:0] op;
output [31:0] out;
output zero_flag;
wire [31:0] ans;
wire co;
wire [31:0] ad;
wire sig;

	assign ad = lt | rt;
	assign sig = ~(lt[31] ^ rt[31]);
	ADD_SUB32 as( lt, rt, op[2], ans, co );
	SM32 sm32( lt, rt, 1'b0, 1'b0, lg, sm );
	assign out = (op == 4'b0000) ? (lt & rt) :
				(op[1] == 1'b0) ? ( (op[2] == 1'b1) ? ~ad : ad) :
				(op[0] == 1'b0) ? (ans) :
				(sig) ? sm : lt[31];
	assign zero_flag = ((~lg) & (~sm));

endmodule

