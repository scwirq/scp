module Controller(op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, Jump);
input [5:0] op;
output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, Jump;

	function [9:0] out;
		input [5:0] in;
		begin

		if ( in == 6'b000000 ) 
			out = 10'b1001000100;
		if ( in == 6'b100011 )
			out = 10'b0111100000;
		if ( in == 6'b101011 )
			out = 10'b0100010000;
		if ( in == 6'b000100 )
			out = 10'b0000001010;
		if ( in == 6'b000010 )
			out = 10'b0000000001;

	end
	endfunction

	assign {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, Jump} = out(op);
endmodule

