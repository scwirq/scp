module mux (lt, rt, op, out);
parameter W = 32;
input [W-1:0] lt, rt;
input op;
output [W-1:0] out;
	assign out = (op) ? rt : lt;
endmodule
