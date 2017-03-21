`timescale 1ns / 1ps

// Kiwi Scientific Acceleration
// Ksubstrate wrapper toplevel for Zynq
// Rev 0.0  (C) 2015 DJ Greaves


module ksubs2_zynq_toplevel
   (
`ifdef PARCARD10
    output GPIO0_N, output GPIO0_P,
    output GPIO1_N, output GPIO1_P,
    output GPIO2_N, output GPIO2_P,
    output GPIO3_N, output GPIO3_P,
    output GPIO4_N, output GPIO4_P,
    output GPIO5_N, output GPIO5_P,
    output GPIO7_N, output GPIO7_P,
`endif

`ifdef ZEDBOARD20
    input  GCLK_in /*33 MHz Y9*/,
    input  BTNC, BTND, BTNL, BTNR, BTNU,
    input  USER_SW7, input USER_SW6, input USER_SW5, input USER_SW4,
    input  USER_SW3, input USER_SW2, input USER_SW1, input USER_SW0,
    output USER_LD7, output USER_LD6, output USER_LD5, output USER_LD4,
    output USER_LD3, output USER_LD2, output USER_LD1, output USER_LD0,
`endif
    
    inout [14:0]DDR_addr,
    inout [2:0]DDR_ba,
    inout DDR_cas_n,
    inout DDR_ck_n,
    inout DDR_ck_p,
    inout DDR_cke,
    inout DDR_cs_n,
    inout [3:0]DDR_dm,
    inout [31:0]DDR_dq,
    inout [3:0]DDR_dqs_n,
    inout [3:0]DDR_dqs_p,
    inout DDR_odt,
    inout DDR_ras_n,
    inout DDR_reset_n,
    inout DDR_we_n,
    inout FIXED_IO_ddr_vrn,
    inout FIXED_IO_ddr_vrp,
    inout [53:0]FIXED_IO_mio,
    inout FIXED_IO_ps_clk,
    inout FIXED_IO_ps_porb,
    inout FIXED_IO_ps_srstb
    );
   

   wire    gpio_led;
   
`ifdef PARCARD10
   // Parcard-djg3 has an LED soldered to GPIO0 - drive both N and P in parallel please.
   assign GPIO0_N = gpio_led;
   assign GPIO0_P = gpio_led;
`endif

`ifdef ZEDBOARD20

   wire [7:0] 	     user_sliders = { USER_SW7, USER_SW6, USER_SW5, USER_SW4, USER_SW3, USER_SW2, USER_SW1, USER_SW0 };
   wire [7:0] 	     user_leds;

   assign { USER_LD7, USER_LD6, USER_LD5, USER_LD4, USER_LD3, USER_LD2, USER_LD1, USER_LD0 } = user_leds;

   assign user_leds = gpio_led;
`endif
   
 

  wire ACLK;
  wire ARESET_N;
//  wire [14:0]DDR_addr;
//  wire [2:0]DDR_ba;
//  wire DDR_cas_n;
//  wire DDR_ck_n;
//  wire DDR_ck_p;
//  wire DDR_cke;
//  wire DDR_cs_n;
//  wire [3:0]DDR_dm;
//  wire [31:0]DDR_dq;
//  wire [3:0]DDR_dqs_n;
//  wire [3:0]DDR_dqs_p;
//  wire DDR_odt;
//  wire DDR_ras_n;
//  wire DDR_reset_n;
//  wire DDR_we_n;
//  wire FIXED_IO_ddr_vrn;
//  wire FIXED_IO_ddr_vrp;
//  wire [53:0]FIXED_IO_mio;
//  wire FIXED_IO_ps_clk;
//  wire FIXED_IO_ps_porb;
//  wire FIXED_IO_ps_srstb;
  wire [31:0]M00_AXI_araddr;
  wire [2:0]M00_AXI_arprot;
  wire M00_AXI_arready;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire [2:0]M00_AXI_awprot;
  wire M00_AXI_awready;
  wire M00_AXI_awvalid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;

  wire finished;

  wire [23:0] design_serial_number; 
  wire [23:0] pcmon, runtime0;
  wire [63:0] count;

   // Programmed I/O access to director shim
   wire [7:0] 		    pio_addr;
   wire [31:0] 		    pio_rdata, pio_wdata;
   wire 		    pio_hwen;

  ksubs2_innercore ksubs2_innercore_i(
				      .clk(ACLK),
				      .pcmon(pcmon),
				      .runtime0(runtime0),
				      .count(count),
				      .reset_n(ARESET_N),
				      .design_serial_number(design_serial_number),
				      .led(finished),

				      // Programmed I/O access to director shim
				      .pio_hwen(pio_hwen), .pio_rdata(pio_rdata), .pio_wdata(pio_wdata), .pio_addr(pio_addr)
		       
    );

  wire [23:0] mon0, mon1;
 
  
  assign mon0 = { finished, 7'd0, pcmon };
  assign mon1 = count[23:0];
   wire       clk = ACLK;
    
  djgaxi zynq_axi_master_i
       (.ACLK(ACLK),
        .ARESET_N(ARESET_N),
        
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .M00_AXI_araddr(M00_AXI_araddr),
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arvalid(M00_AXI_arvalid),
        .M00_AXI_awaddr(M00_AXI_awaddr),
        .M00_AXI_awprot(M00_AXI_awprot),
        .M00_AXI_awready(M00_AXI_awready),
        .M00_AXI_awvalid(M00_AXI_awvalid),
        .M00_AXI_bready(M00_AXI_bready),
        .M00_AXI_bresp(M00_AXI_bresp),
        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
        .M00_AXI_wdata(M00_AXI_wdata),
        .M00_AXI_wready(M00_AXI_wready),
        .M00_AXI_wstrb(M00_AXI_wstrb),
        .M00_AXI_wvalid(M00_AXI_wvalid));
        


   reg [13:0] ctr0, ctr1;
   reg 	      ovf0;
   
   always @(posedge clk) begin
      ctr0 <= ctr0 + 1;
      ovf0 <= ctr0 == 0;
      ctr1 <= ctr1 + ovf0;
   end

   // Divide by 2**28 = 268435456  12 in 30 seconds gives 107 374 182 - i.e. 100 MHz.
   wire pipoff = ctr1[13];
   assign gpio_led = finished;
        
          reg[3:0] ctr;  // Kiwi substrate version
          reg m0, m1, m2;
          always @(posedge ACLK) if (!ARESET_N) begin
             m0 <= 0;
             m1 <= 0;
             m2 <= 0;
             ctr <= 0;
             end
             else begin
                 ctr <= ctr + 1;
             end

                          

   kiwi_axi_pio_target kiwi_axi_pio_target_i(
					     .clk(ACLK),
					     //             .gpio_led(gpio_led),
					     .reset_n(ARESET_N),
					     .runtime0(runtime0),   .mon0(mon0), .mon1(mon1),       
					     .design_serial_number(design_serial_number),
					     .device_counter(count),

					     // Programmed I/O access to director shim
					     .pio_hwen(pio_hwen), .pio_rdata(pio_rdata), .pio_wdata(pio_wdata), .pio_addr(pio_addr),
					     
					     
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
endmodule
// eof

