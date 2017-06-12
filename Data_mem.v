module Data_mem( clk, res, address, write_data, MemWrite, MemRead, read_data );
input clk, res, MemWrite, MemRead;
input [31:0] address;
input [31:0] write_data;
output [31:0] read_data;
reg [31:0] dmem [255:0];
integer i;

always @(posedge clk) begin
	if (res == 1'b1) begin
		for ( i = 0; i < 255; i = 1 + i ) begin
			dmem[i] = 0;
		end

//      dmem[1] <= 32'b00000000000000000000000000001010;
//      dmem[2] <= 32'b00000000000000000000000000010110;
//      dmem[3] <= 32'b00000000000000000000000000010110;
//      dmem[4] <= 32'b00000000000000000000000001010000;
		dmem[0] <= 111;
		dmem[1] <= 1;
		dmem[2] <= 2;
	end

	if (MemWrite == 1'b1) dmem[address] = write_data;
end

	assign read_data = (MemRead == 1'b1) ? dmem[address] : 0;

endmodule

