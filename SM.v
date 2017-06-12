module SM( lt, rt, sm, lgin, lg,  out );
input lt;
input rt;
input sm;
input lgin;
output lg;
output out;

	assign lg = (lgin == 1) ? 1 : lt & (~rt);
	assign out = (sm == 1) ? 1 :
				(lgin == 1) ? 0 :
				(~lt) & rt;

endmodule
