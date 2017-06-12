module ADDER32( lt, rt, cin, s, cout );

input [31:0] lt, rt;
input cin;
output [31:0] s;
output cout;
wire [6:0] cy;

	ADDER4 a1( lt[3:0], rt[3:0], cin, s[3:0], cy[0] );
	ADDER4 a2( lt[7:4], rt[7:4], cy[0], s[7:4], cy[1] );
	ADDER4 a3( lt[11:8], rt[11:8], cy[1], s[11:8], cy[2] );
	ADDER4 a4( lt[15:12], rt[15:12], cy[2], s[15:12], cy[3] );
	ADDER4 a5( lt[19:16], rt[19:16], cy[3], s[19:16], cy[4] );
	ADDER4 a6( lt[23:20], rt[23:20], cy[4], s[23:20], cy[5] );
	ADDER4 a7( lt[27:24], rt[27:24], cy[5], s[27:24], cy[6] );
	ADDER4 a8( lt[31:28], rt[31:28], cy[6], s[31:28], cout );
endmodule
