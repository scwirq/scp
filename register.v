module register( clk, res, readn1, readn2, writen, write_data, write_flag, read_data1, read_data2 );
input [4:0] readn1, readn2, writen;
input [31:0] write_data;
input clk, res;
input write_flag;
output [31:0] read_data1, read_data2;
reg [31:0] regi [31:0];
integer i;

	always @(posedge clk) begin
		if ( res == 1'b1 ) begin
			for ( i = 0; i < 32; i = i + 1 ) begin
				regi[i] = 0;
			end
		end

		if ( write_flag == 1'b1 ) regi[writen] = write_data;
	end

	assign read_data1 = regi[readn1];
	assign read_data2 = regi[readn2];

endmodule
