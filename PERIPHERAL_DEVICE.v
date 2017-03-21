`define WRDS 4

`define PD_DATA_REG 0
`define PD_PTR_REG  8
`define PD_CR_REG   16
`define PD_ST_REG   24
module PERIPHERAL_DEVICE(clk, reset, addr, hwen, hren, wdata, rdata, interrupt);
  input clk, reset;

  input [4:0] addr;    //  Internal address selection within a target,
  input hwen ;         //  Asserted during a target write,
  input hren ;         //  Asserted during a target read,
  input [31:0] wdata;  //  Input data to a target when written,
  output [31:0] rdata; //  Output data when target is read,
  output interrupt;    //  Asserted by target when wanting attention.


   reg [7:0] ptr_reg;

   reg [7:0] ctr_reg;

   reg [63:0] codewords [0:`WRDS-1];

   reg running;

   reg int_enable;

   integer i;

   wire matched =
	(codewords[0] >> 4) &
	(codewords[0] >> 14) &
	(codewords[0] >> 44) &
	(codewords[1] >> 14) &
	(codewords[1] >> 24) &
	(codewords[1] >> 54) &
	(codewords[2] >> 4) &
	(codewords[3] >> 34);
  // wire[63:0] tmp_two = codewords[0] >> 4;
  // wire[63:0] tmp_word= codewords[0];
  // wire tmp_two = codewords[0] >> 14;
  initial begin
    running <= 0;
  end

  always @(posedge clk) begin
    if (hwen && addr == `PD_PTR_REG)
      ptr_reg <= wdata;
    if (hwen && addr == `PD_DATA_REG)
      codewords[ptr_reg]  <= wdata;
    if (hwen && addr==`PD_CR_REG)
      { int_enable, running, ctr_reg } <= wdata;
    if (matched)
      running <= 0;
    if (running) begin
      codewords[`WRDS-1] <= -1;
      for (i =0 ;i<`WRDS-1; i=i+1)
        codewords[i] = (codewords[i]) | (codewords[i+1] >> 4);
    end
    $display("%m %h %h %h %h     ptr=%h  running=%d matched=%d\n", codewords[3], codewords[2], codewords[1], codewords[0], ptr_reg, running, matched);
  end


   assign interrupt = int_enable && !running;


   assign rdata =
		 (addr==`PD_PTR_REG)  ? ptr_reg:
		 (addr==`PD_DATA_REG) ? codewords[ptr_reg]:
		 (addr==`PD_CR_REG) ? { 54'b0, int_enable, running, ctr_reg }:
		 (addr==`PD_ST_REG) ? { 53'b0, matched, int_enable, running, ctr_reg }:
		 64'hDEADBEEF;


endmodule // PERIPHERAL_DEVICE
