module SM4( lt, rt, sm, lgin, lg, out );
input [3:0] lt;
input [3:0] rt;
input sm;
input lgin;
output lg;
output out;
wire [3:0] s;
wire [3:0] l;

	SM a1( lt[3], rt[3], sm, lgin, l[2], s[2] );
	SM a2( lt[2], rt[2], s[2], l[2], l[1], s[1] );
	SM a3( lt[1], rt[1], s[1], l[1], l[0], s[0] );
	SM a4( lt[0], rt[0], s[0], l[0], lg, out );

endmodule
