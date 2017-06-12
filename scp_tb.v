module scp_tb;
  reg clk,res;
  reg [31:0] i;

  scp scp(clk,res);

  initial begin
    clk <= 1'b0;
    res <= 1'b1;
    i <= 0;
    #100
      res <= 1'b0;
    #50000000
      $finish;
  end

  always #1
    clk <= ~clk;

  always @( posedge clk ) begin
  //always @( pp.regi.regi[8] == 1 ) begin
	if ( scp.regi.regi[8] == 1 ) begin 
		$display("%d %d %d", i, scp.PC, scp.regi.regi[8]);
		$finish;
	end
    assign i=i+1;
  end
endmodule // scp_tb
