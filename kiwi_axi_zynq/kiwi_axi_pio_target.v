// Kiwi Scientific Acceleration
// (C) 2014 DJ Greaves - University of Cambridge, Computer Laboratory
//
//
//
// kiwi_axi_pio_target.v
//


/*
 code for instantiation:
  cbg_axi cbg_axi_0(
   .clk(ACLK),
   .reset_n(ARESET_N),
   .maxi_araddr(M00_AXI_araddr),
   .maxi_arprot(M00_AXI_arprot),
   .maxi_arready(M00_AXI_arready),
   .maxi_arvalid(M00_AXI_arvalid),
   .maxi_awaddr(M00_AXI_awaddr),
   .maxi_awprot(M00_AXI_awprot),
   .maxi_awready(M00_AXI_awready),
   .maxi_awvalid(M00_AXI_awvalid),
   .maxi_bready(M00_AXI_bready),
   .maxi_bresp(M00_AXI_bresp),
   .maxi_bvalid(M00_AXI_bvalid),
   .maxi_rdata(M00_AXI_rdata),
   .maxi_rready(M00_AXI_rready),
   .maxi_rresp(M00_AXI_rresp),
   .maxi_rvalid(M00_AXI_rvalid),
   .maxi_wdata(M00_AXI_wdata),
   .maxi_wready(M00_AXI_wready),
   .maxi_wstrb(M00_AXI_wstrb),
   .maxi_wvalid(M00_AXI_wvalid));

*/


//  The slave asserts READY when it can accept new transfers (VALID doesn't have to be asserted for this).
//  The master asserts VALID when it has something to transfer (READY doesn't have to be asserted for this).
//  A master can't wait with asserting VALID until a READY is asserted since the slave can wait for VALID before asserting READY.
//  If the master waits for READY, this can create a deadlock where both master and slaves waits for each other to assert the signal.

	 
// Note: to avoid deadlock the VALID signal of one AXI component must not be dependent on the READY signal of the other component 
// in the transaction and the READY signal can wait for assertion of the VALID signal.

//
// Simple test AXI slave.
//
module kiwi_axi_pio_target(
  input 	clk,
  input 	reset_n,

  input [23:0] 	mon0,
  input [23:0] 	mon1,
  input [23:0] 	runtime0,


			// Programmed I/O access to director shim
  output [7:0] 	pio_addr,
  input [31:0] 	pio_rdata,
  output [31:0] pio_wdata,
  output 	pio_hwen,


  // AXI BUS SLAVE
  input [31:0] 	maxi_araddr, // Read address
  input [2:0] 	maxi_arprot,
  output 	maxi_arready,
  input 	maxi_arvalid,


  output [31:0] maxi_rdata, // Read data
  input 	maxi_rready,
  output [1:0] 	maxi_rresp,
  output reg 	maxi_rvalid,

  input [31:0] 	maxi_awaddr, // Write address
  input [2:0] 	maxi_awprot,
  output 	maxi_awready,
  input 	maxi_awvalid,


  input [31:0] 	maxi_wdata, // Write data
  output 	maxi_wready,
  input [3:0] 	maxi_wstrb,
  input 	maxi_wvalid,

  input 	maxi_bready, // Write response
  output [1:0] 	maxi_bresp,
  output reg 	maxi_bvalid,

  input [23:0] 	design_serial_number,
  input [63:0]  device_counter,

			   
  output 	gpio_led);
  



  assign maxi_arready = 1; // always ready
  assign maxi_awready = 1; // always ready
  assign maxi_wready = 1;  // always ready

  assign maxi_bresp = 2'd0; // code 00 is ok 

   reg 	    toggler;
   reg 	    have_wdata, have_waddr;
   wire	    wstrobe = have_wdata && have_waddr;
   
  always @(posedge clk) if (!reset_n) begin
     maxi_rvalid <= 0;
     maxi_bvalid <= 0; have_wdata <= 0; have_waddr <= 0;
     end
     else begin
	// RVALID
        if (maxi_arready && maxi_arvalid) maxi_rvalid <= 1;
        else if (maxi_rvalid && maxi_rready) maxi_rvalid <=0;

        if (maxi_awready && maxi_awvalid) have_waddr <= 1;
        if (maxi_wready && maxi_wvalid) have_wdata <= 1;	
	
	// BVALID
        if (!maxi_bvalid && have_waddr && have_wdata) begin
	   maxi_bvalid <= 1;
	   have_wdata <=0; have_waddr <= 0;
	end
	
        else if (maxi_bvalid && maxi_bready) maxi_bvalid <= 0;

	// DEBUG
        if (maxi_bvalid && maxi_bready) toggler <= !toggler; // deb w2
     end
        
  reg [15:0] counter;
  reg [31:0] wd;
  reg [8:0] slave_read_addr;
  reg [8:0] slave_write_addr;   

   always @(posedge clk) if (!reset_n) begin
         counter <= 0;
         wd <= 0;
         slave_read_addr <= 0;
     end
   else begin
      if (maxi_awvalid && maxi_awready) slave_write_addr <= maxi_awaddr >> 8;
      if (maxi_arvalid && maxi_arready) slave_read_addr <= maxi_araddr >> 8;
      if (maxi_wvalid && maxi_wready) wd <= { maxi_wstrb, maxi_wdata[27:0] };
      counter <= counter + 1;
   end

   wire pio_hwen = wrstrobe && slave_write_addr[8];
   assign maxi_rresp = 2'd0; // ok code 00
   assign gpio_led = toggler;

   assign pio_addr = (pio_hwen) ? slave_write_addr: slave_read_addr;

   assign maxi_rdata = 
     (slave_read_addr == 0 )? { 8'h55, design_serial_number }:
     (slave_read_addr == 1 )? { device_counter[31:0]}:
     //(slave_read_addr == 2 )? { wd }:
     (slave_read_addr == 2 )? { device_counter[63:32] }:
     (slave_read_addr == 3 )? { {8'hC2}, mon0 }: 
     (slave_read_addr == 4 )? { {8'hC3}, runtime0 }:
     (slave_read_addr == 5 )? { 8'hC4, mon1 }:
		      pio_rdata;
endmodule
// EOF
