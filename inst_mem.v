module inst_mem( read_address, read_data );
input [31:0] read_address;
output [31:0] read_data;
reg [7:0] imem [255:0];

integer i;

initial begin
	for (i=0;i<=255;i=i+1)
		imem[i] <= 8'b0;

//	{imem[0], imem[1], imem[2], imem[3]}       <= 32'b100011_00111_00001_0000000000000001;
//	//lw dimem[1] -> refi[1]
//	{imem[4], imem[5], imem[6], imem[7]}       <= 32'b100011_00111_00010_0000000000000010;
//	//lw dimem[2] -> refi[2]
//	{imem[8], imem[9], imem[10], imem[11]}     <= 32'b000000_00001_00010_00011_00000_100000;
//	//R  refi[1] + refi[2] -> refi[3]
//	{imem[12], imem[13], imem[14], imem[15]}   <= 32'b101011_11111_00011_0000000000001000;
//	//sw dimem[8] <- refi[3]
//	{imem[16], imem[17], imem[18], imem[19]}   <= 32'b000000_00010_00001_00100_00000_100010;
//	//R  refi[2] - refi[1] -> refi[4]
//	{imem[20], imem[21], imem[22], imem[23]}   <= 32'b101011_11111_00100_0000000000001001;
//	//sw dimem[9] <- refi[4]
//	{imem[24], imem[25], imem[26], imem[27]}   <= 32'b000000_00001_00010_00101_00000_100100;
//	//R  refi[1] and refi[2] -> refi[5]
//	{imem[28], imem[29], imem[30], imem[31]}   <= 32'b101011_11111_00101_0000000000001010;
//	//sw dimem[10] <- refi[5] 
//	{imem[32], imem[33], imem[34], imem[35]}   <= 32'b000000_00001_00010_00110_00000_100101;
//	//R  refi[1] or refi[2] -> refi[6]
//	{imem[36], imem[37], imem[38], imem[39]}   <= 32'b101011_11111_00110_0000000000001011;
//	//sw dimem[11] <- refi[6] 
//	{imem[40], imem[41], imem[42], imem[43]}   <= 32'b000000_00001_00010_00111_00000_101010;
//	//R  refi[1] slt refi[2] -> refi[7]
//	{imem[44], imem[45], imem[46], imem[47]}   <= 32'b101011_11111_00111_0000000000001100;
//	//sw dimem[12] <- refi[7]
//	{imem[48], imem[49], imem[50], imem[51]}   <= 32'b100011_11111_00011_0000000000000011;
//	//lw dimem[3] -> refi[3]
//	{imem[52], imem[53], imem[54], imem[55]}   <= 32'b000100_00010_00011_0000000000000110;
//	//if refi[2] = refi[3] then PC <= 80  
//	{imem[80], imem[81], imem[82], imem[83]}   <= 32'b000000_00001_00010_01000_00000_101010;
//	//R  refi[1] slt refi[2] -> refi[8]
//	{imem[84], imem[85], imem[86], imem[87]}   <= 32'b101011_11111_01000_0000000000001101;
//	//sw dimem[13] <- refi[8] 
//	{imem[88], imem[89], imem[90], imem[91]}   <= 32'b000010_00000000000000000000100000;
//	//jump to 128
//	{imem[128], imem[129], imem[130], imem[131]} <= 32'b101011_00000_01000_0000000000001110;
//	//sw dimem[14] <- refi[8]
{imem[0], imem[1], imem[2], imem[3]}       <= 32'b10001100000010000000000000000000;
{imem[4], imem[5], imem[6], imem[7]}       <= 32'b10001100000010010000000000000001;
{imem[8], imem[9], imem[10], imem[11]}       <= 32'b00000001001010000101000000100100;
{imem[12], imem[13], imem[14], imem[15]}       <= 32'b00010001001010100000000000001010;
{imem[16], imem[17], imem[18], imem[19]}       <= 32'b10001100000010100000000000000011;
{imem[20], imem[21], imem[22], imem[23]}       <= 32'b10001100000010110000000000000011;
{imem[24], imem[25], imem[26], imem[27]}       <= 32'b10001100000011000000000000000010;
{imem[28], imem[29], imem[30], imem[31]}       <= 32'b00000001100010110101100000100000;
{imem[32], imem[33], imem[34], imem[35]}       <= 32'b00000001001010100101000000100000;
{imem[36], imem[37], imem[38], imem[39]}       <= 32'b00000001011010000110100000101010;
{imem[40], imem[41], imem[42], imem[43]}       <= 32'b00010001001011011111111111111100;
{imem[44], imem[45], imem[46], imem[47]}       <= 32'b00000001010000000100000000100000;
{imem[48], imem[49], imem[50], imem[51]}       <= 32'b00010001001010000000000000001001;
{imem[52], imem[53], imem[54], imem[55]}       <= 32'b00001000000000000000000000000010;
{imem[56], imem[57], imem[58], imem[59]}       <= 32'b10001100000010100000000000000011;
{imem[60], imem[61], imem[62], imem[63]}       <= 32'b00000001000010100101000000100000;
{imem[64], imem[65], imem[66], imem[67]}       <= 32'b00000001000010100101000000100000;
{imem[68], imem[69], imem[70], imem[71]}       <= 32'b00000001000010100101000000100000;
{imem[72], imem[73], imem[74], imem[75]}       <= 32'b00000001001010100101000000100000;
{imem[76], imem[77], imem[78], imem[79]}       <= 32'b00000001010000000100000000100000;
{imem[80], imem[81], imem[82], imem[83]}       <= 32'b00010001001010000000000000000001;
{imem[84], imem[85], imem[86], imem[87]}       <= 32'b00001000000000000000000000000010;
end

assign read_data = {imem[read_address], imem[read_address + 1], imem[read_address + 2], imem[read_address + 3]};
endmodule
