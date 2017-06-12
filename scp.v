module scp(clk, res);
input clk, res;
wire [31:0] op;
wire [4:0] writen;
wire [31:0] read_data1, read_data2;
wire [3:0] ALUCtrl;
wire [31:0] op_sign_extended;
wire [31:0] mux2_out;
wire [31:0] mux4_out;
wire [31:0] ALU_out;
wire [31:0] data_mem_read;
wire [31:0] reg_write_data;
wire [31:0] im_address;
reg [31:0] PC;
wire [31:0] PC4;
wire cout;
wire [27:0] ls1_out;
wire [31:0] ls2_out;
wire [31:0] mux3_out;
wire [31:0] ALU_add_ans;

	inst_mem im( im_address, op );
	Controller con(op[31:26], RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, Jump);
	ALU_Ctrl aluctrl( {ALUOp1, ALUOp0}, op[5:0], ALUCtrl ); 
	defparam mux1.W = 5;
	mux mux1(op[20:16], op[15:11], RegDst, writen);
	defparam mux2.W = 32;
	mux mux2(read_data2, op_sign_extended, ALUSrc, mux2_out);
	defparam mux3.W = 32;
	mux mux3(PC4, ALU_add_ans, Branch & zero_flag, mux3_out );
	defparam mux4.W = 32;
	mux mux4(mux3_out, {PC4[31:28], ls1_out}, Jump, mux4_out);
	defparam mux5.W = 32;
	mux mux5(ALU_out, data_mem_read, MemtoReg, reg_write_data);
	register regi( clk, res, op[25:21], op[20:16], writen, reg_write_data, RegWrite, read_data1, read_data2 );
	sign_ext se(op[15:0], op_sign_extended);
	ALU32 alu32( ALUCtrl, read_data1, mux2_out, ALU_out, zero_flag );
	Data_mem dm( clk, res, ALU_out, read_data2, MemWrite, MemRead, data_mem_read );

	ADDER32 addpc4( im_address, 4, 1'b0, PC4, cout );
	ADDER32 add(PC4, ls2_out, 1'b0, ALU_add_ans, cout);
	Left_shift ls1(op[25:0], ls1_out);
	Left_shift ls2(op_sign_extended, ls2_out);



	assign im_address = PC;

	always @(posedge clk) begin
		if (res == 1'b1)
			PC = 0;
		else
			PC = mux4_out;
	end
endmodule
