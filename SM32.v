module SM32( lt, rt, sm, lgin, lg, out );
input [31:0] lt;
input [31:0] rt;
input sm;
input lgin;
output lg;
output out;
wire [7:0] s;
wire [7:0] l;

	SM4 a8( lt[31:28], rt[31:28], sm, lgin, l[6],s[6] );
	SM4 a7( lt[27:24], rt[27:24], s[6], l[6], l[5], s[5] );
	SM4 a6( lt[23:20], rt[23:20], s[5], l[5], l[4], s[4] );
	SM4 a5( lt[19:16], rt[19:16], s[4], l[4], l[3], s[3] );
	SM4 a4( lt[15:12], rt[15:12], s[3], l[3], l[2], s[2] );
	SM4 a3( lt[11:8], rt[11:8], s[2], l[2], l[1], s[1] );
	SM4 a2( lt[7:4], rt[7:4], s[1], l[1], l[0], s[0] );
	SM4 a1( lt[3:0], rt[3:0], s[0], l[0], lg, out );

endmodule
