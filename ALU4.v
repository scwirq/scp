module ALU4( op, lt, rt, out );
input [3:0] lt, rt;
input [3:0] op;
output [3:0] out;
wire [3:0] ans;
wire co;
wire [3:0] ad;
wire sig;

	assign ad = lt & rt;
	assign sig = ~(lt[3] ^ rt[3]);
	ADD_SUB4 as( lt, rt, op[2], ans, co );
	SM4 sm4( lt, rt, 1'b0, 1'b0, lg, sm );
	assign out = (op == 4'b0000) ? (lt & rt) :
				(op[1] == 1'b0) ? ( (op[2] == 1'b1) ? ~ad : ad) :
				(op[0] == 1'b0) ? (ans) :
				(sig) ? sm : lt[3];

endmodule

