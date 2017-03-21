

// CBG Orangepath HPR L/S System

// Verilog output file generated at 10/02/2017 17:08:09
// Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.18a : 5th-December-2016 Unix 3.13.0.65
//  /home/djg11/d320/hprls/kiwipro/kiwic/distro/lib/kiwic.exe csharp/primes_offchip.exe -res2-loadstore-port-count=0 -vnl=primes_offchip.v -vnl-rootmodname=primes_offchip csharp/KSubs2_Director.dll -vnl-resets=synchronous -kiwic-finish=disable -vnl-roundtrip=disable -kiwic-register-colours=1 -bevelab-default-pause-mode=bblock -fp-fl-sp-mul=4
`timescale 1ns/1ns


module primes_offchip(    output reg [639:0] KppWaypoint0,
    output reg [639:0] KppWaypoint1,
    output reg signed [31:0] design_serial_number,
    input signed [31:0] pio_addr,
    input signed [31:0] pio_wdata,
    output reg signed [31:0] pio_rdata,
    input pio_hwen,
    input [31:0] volume,
    output reg [31:0] count,
    output reg signed [31:0] elimit,
    output reg signed [31:0] evariant,
    output reg signed [31:0] edesign,
    output reg finished,
    input clk,
    input reset);
  integer primesya_T404_Main_T404_Main_V_2_GP;
  integer primesya_T404_Main_T404_Main_V_4_GP;
  reg [4:0] xpc10nz;
  reg [3:0] A_BOOL_CC_SCALbx10_ARA0_AD0;
  reg A_BOOL_CC_SCALbx10_ARA0_WRD0;
  reg A_BOOL_CC_SCALbx10_ARA0_WEN0;
  wire A_BOOL_CC_SCALbx10_ARA0_RDD0;
  reg A_BOOL_CC_SCALbx10_ARA0_REN0;
  reg BOOLCCSCALbx10ARA0RRh10hold;
  reg BOOLCCSCALbx10ARA0RRh10shot0;
  reg [2:0] xpc12nz;
  wire signed [31:0] A_SINT_CC_SCALbx12_ARA0_RDD0;
  reg [3:0] A_SINT_CC_SCALbx12_ARA0_AD0;
  reg A_SINT_CC_SCALbx12_ARA0_REN0;
  reg signed [31:0] SINTCCSCALbx12ARA0RRh10hold;
  reg SINTCCSCALbx12ARA0RRh10shot0;
  reg signed [31:0] A_SINT_CC_SCALbx12_ARA0_WRD0;
  reg A_SINT_CC_SCALbx12_ARA0_WEN0;
 always   @(* )  begin 
       KppWaypoint1 = 32'sd0;
       KppWaypoint0 = 32'sd0;
       A_SINT_CC_SCALbx12_ARA0_AD0 = 32'sd0;
       A_SINT_CC_SCALbx12_ARA0_WRD0 = 32'sd0;
       A_SINT_CC_SCALbx12_ARA0_REN0 = 32'sd0;
       A_SINT_CC_SCALbx12_ARA0_WEN0 = 32'sd0;
       A_BOOL_CC_SCALbx10_ARA0_AD0 = 32'sd0;
       A_BOOL_CC_SCALbx10_ARA0_WRD0 = 32'sd0;
       A_BOOL_CC_SCALbx10_ARA0_REN0 = 32'sd0;
       A_BOOL_CC_SCALbx10_ARA0_WEN0 = 32'sd0;
       A_BOOL_CC_SCALbx10_ARA0_WEN0 = ((xpc10nz==5'sd21/*21:xpc10nz*/) || (xpc10nz==5'sd1/*1:xpc10nz*/) || (xpc10nz==5'sd19/*19:xpc10nz*/)? 32'd1
      : 32'd0);

       A_BOOL_CC_SCALbx10_ARA0_REN0 = ((xpc10nz==5'sd14/*14:xpc10nz*/)? 32'd1: 32'd0);

      case (xpc10nz)
          5'sd1/*1:xpc10nz*/:  begin 
               A_BOOL_CC_SCALbx10_ARA0_WRD0 = (32'sd0<$signed(volume));
               A_BOOL_CC_SCALbx10_ARA0_AD0 = 32'd0;
               end 
              
          5'sd14/*14:xpc10nz*/:  A_BOOL_CC_SCALbx10_ARA0_AD0 = primesya_T404_Main_T404_Main_V_4_GP;

          5'sd19/*19:xpc10nz*/:  begin 
               A_BOOL_CC_SCALbx10_ARA0_WRD0 = 1'h0;
               A_BOOL_CC_SCALbx10_ARA0_AD0 = primesya_T404_Main_T404_Main_V_4_GP;
               end 
              
          5'sd21/*21:xpc10nz*/:  begin 
               A_BOOL_CC_SCALbx10_ARA0_WRD0 = 1'h1;
               A_BOOL_CC_SCALbx10_ARA0_AD0 = primesya_T404_Main_T404_Main_V_2_GP;
               end 
              endcase
       A_SINT_CC_SCALbx12_ARA0_WEN0 = (pio_hwen && (xpc12nz==3'sd1/*1:xpc12nz*/)? pio_hwen: 32'd0);
       A_SINT_CC_SCALbx12_ARA0_REN0 = !pio_hwen && (xpc12nz==3'sd1/*1:xpc12nz*/);
      if ((xpc12nz==3'sd1/*1:xpc12nz*/)) if (!pio_hwen)  A_SINT_CC_SCALbx12_ARA0_AD0 = pio_addr;
               else  begin 
                   A_SINT_CC_SCALbx12_ARA0_WRD0 = pio_wdata;
                   A_SINT_CC_SCALbx12_ARA0_AD0 = pio_addr;
                   end 
                  
      case (xpc10nz)
          5'sd6/*6:xpc10nz*/:  begin 
               KppWaypoint0 = "wp3";
               KppWaypoint1 = "COUNTING";
               end 
              
          5'sd9/*9:xpc10nz*/:  KppWaypoint0 = "FINISH";
      endcase
      if ((primesya_T404_Main_T404_Main_V_2_GP>=32'sd1000) && (xpc10nz==5'sd4/*4:xpc10nz*/))  begin 
               KppWaypoint0 = "wp2";
               KppWaypoint1 = "CROSSOFF";
               end 
              if ((xpc10nz==5'sd0/*0:xpc10nz*/))  begin 
               KppWaypoint0 = "START";
               KppWaypoint1 = "INITIALISE";
               end 
               end 
      

 always   @(posedge clk )  begin 
      //Start structure HPR csharp/primes_offchip
      if (reset)  begin 
               SINTCCSCALbx12ARA0RRh10hold <= 32'd0;
               SINTCCSCALbx12ARA0RRh10shot0 <= 32'd0;
               xpc12nz <= 32'd0;
               primesya_T404_Main_T404_Main_V_4_GP <= 32'd0;
               primesya_T404_Main_T404_Main_V_2_GP <= 32'd0;
               count <= 32'd0;
               evariant <= 32'd0;
               edesign <= 32'd0;
               finished <= 32'd0;
               design_serial_number <= 32'd0;
               pio_rdata <= 32'd0;
               elimit <= 32'd0;
               BOOLCCSCALbx10ARA0RRh10hold <= 32'd0;
               BOOLCCSCALbx10ARA0RRh10shot0 <= 32'd0;
               xpc10nz <= 32'd0;
               end 
               else  begin 
              if ((xpc10nz==5'sd21/*21:xpc10nz*/)) $display("Setting initial array flag to hold : addr=%1d readback=%1d", primesya_T404_Main_T404_Main_V_2_GP
                  , 1'h1);
                  if ((primesya_T404_Main_T404_Main_V_4_GP<32'sd1000) && (xpc10nz==5'sd18/*18:xpc10nz*/)) $display("Cross off %1d %1d   (count1=%1d)"
                  , primesya_T404_Main_T404_Main_V_2_GP, primesya_T404_Main_T404_Main_V_4_GP, 32'sd2);
                  if ((primesya_T404_Main_T404_Main_V_2_GP+primesya_T404_Main_T404_Main_V_2_GP>=32'sd1000) && (xpc10nz==5'sd17/*17:xpc10nz*/)) 
              $display("Skip out on square");
                  if ((xpc10nz==5'sd16/*16:xpc10nz*/)) $display("Tally counting %1d %1d", primesya_T404_Main_T404_Main_V_4_GP, count);
                  if ((primesya_T404_Main_T404_Main_V_4_GP>=32'sd1000) && (xpc10nz==5'sd7/*7:xpc10nz*/))  begin 
                      $display("There are %1d primes below the natural number %1d.", count, 32'sd1000);
                      $display("Optimisation variant=%1d (count1 is %1d).", 32'sd0, 32'sd2);
                       end 
                      
              case (xpc10nz)
                  5'sd0/*0:xpc10nz*/:  begin 
                      $display("%s%1d", "Primes Up To ", 32'sd1000);
                       count <= 32'h0;
                       evariant <= 32'sd0;
                       edesign <= 32'sd4032;
                       finished <= 1'h0;
                       design_serial_number <= 32'sh22_1102;
                       pio_rdata <= 32'sd0;
                       elimit <= 32'sd1000;
                       xpc10nz <= 5'sd1/*1:xpc10nz*/;
                       end 
                      
                  5'sd6/*6:xpc10nz*/: $display("Now counting");
              endcase
              if ((primesya_T404_Main_T404_Main_V_4_GP<32'sd1000)) 
                  case (xpc10nz)
                      5'sd7/*7:xpc10nz*/:  xpc10nz <= 5'sd14/*14:xpc10nz*/;

                      5'sd18/*18:xpc10nz*/:  xpc10nz <= 5'sd19/*19:xpc10nz*/;
                  endcase
                   else 
                  case (xpc10nz)
                      5'sd7/*7:xpc10nz*/:  xpc10nz <= 5'sd8/*8:xpc10nz*/;

                      5'sd18/*18:xpc10nz*/:  begin 
                           primesya_T404_Main_T404_Main_V_2_GP <= 32'sd1+primesya_T404_Main_T404_Main_V_2_GP;
                           xpc10nz <= 5'sd5/*5:xpc10nz*/;
                           end 
                          endcase
              if ((primesya_T404_Main_T404_Main_V_2_GP<32'sd1000)) 
                  case (xpc10nz)
                      5'sd4/*4:xpc10nz*/:  xpc10nz <= 5'sd21/*21:xpc10nz*/;

                      5'sd5/*5:xpc10nz*/:  xpc10nz <= 5'sd17/*17:xpc10nz*/;
                  endcase
                   else 
                  case (xpc10nz)
                      5'sd4/*4:xpc10nz*/:  begin 
                           primesya_T404_Main_T404_Main_V_2_GP <= 32'sd2;
                           xpc10nz <= 5'sd5/*5:xpc10nz*/;
                           end 
                          
                      5'sd5/*5:xpc10nz*/:  xpc10nz <= 5'sd6/*6:xpc10nz*/;
                  endcase

              case (xpc10nz)
                  5'sd3/*3:xpc10nz*/:  begin 
                       primesya_T404_Main_T404_Main_V_2_GP <= 32'sd0;
                       count <= 32'h0;
                       xpc10nz <= 5'sd4/*4:xpc10nz*/;
                       end 
                      
                  5'sd6/*6:xpc10nz*/:  begin 
                       primesya_T404_Main_T404_Main_V_4_GP <= 32'sd0;
                       xpc10nz <= 5'sd7/*7:xpc10nz*/;
                       end 
                      
                  5'sd15/*15:xpc10nz*/:  begin 
                      if (((xpc10nz==5'sd15/*15:xpc10nz*/)? A_BOOL_CC_SCALbx10_ARA0_RDD0: BOOLCCSCALbx10ARA0RRh10hold))  begin 
                               count <= $unsigned(32'd1+count);
                               xpc10nz <= 5'sd16/*16:xpc10nz*/;
                               end 
                              if (((xpc10nz==5'sd15/*15:xpc10nz*/)? !A_BOOL_CC_SCALbx10_ARA0_RDD0: !BOOLCCSCALbx10ARA0RRh10hold))  xpc10nz
                           <= 5'sd16/*16:xpc10nz*/;

                           end 
                      
                  5'sd16/*16:xpc10nz*/:  begin 
                       primesya_T404_Main_T404_Main_V_4_GP <= 32'sd1+primesya_T404_Main_T404_Main_V_4_GP;
                       xpc10nz <= 5'sd7/*7:xpc10nz*/;
                       end 
                      
                  5'sd17/*17:xpc10nz*/:  begin 
                      if ((primesya_T404_Main_T404_Main_V_2_GP+primesya_T404_Main_T404_Main_V_2_GP<32'sd1000))  xpc10nz <= 5'sd18/*18:xpc10nz*/;
                           else  xpc10nz <= 5'sd6/*6:xpc10nz*/;
                       primesya_T404_Main_T404_Main_V_4_GP <= primesya_T404_Main_T404_Main_V_2_GP+primesya_T404_Main_T404_Main_V_2_GP
                      ;

                       end 
                      
                  5'sd21/*21:xpc10nz*/:  begin 
                       primesya_T404_Main_T404_Main_V_2_GP <= 32'sd1+primesya_T404_Main_T404_Main_V_2_GP;
                       xpc10nz <= 5'sd22/*22:xpc10nz*/;
                       end 
                      endcase
              if (pio_hwen)  begin if ((xpc12nz==3'sd1/*1:xpc12nz*/))  xpc12nz <= 3'sd2/*2:xpc12nz*/;
                       end 
                   else 
                  case (xpc12nz)
                      3'sd1/*1:xpc12nz*/:  xpc12nz <= 3'sd3/*3:xpc12nz*/;

                      3'sd3/*3:xpc12nz*/:  pio_rdata <= $signed(((xpc12nz==3'sd3/*3:xpc12nz*/)? A_SINT_CC_SCALbx12_ARA0_RDD0: SINTCCSCALbx12ARA0RRh10hold
                      ));

                  endcase
              if ((xpc12nz==3'sd3/*3:xpc12nz*/))  xpc12nz <= 3'sd4/*4:xpc12nz*/;
                  if (BOOLCCSCALbx10ARA0RRh10shot0)  begin 
                       BOOLCCSCALbx10ARA0RRh10hold <= A_BOOL_CC_SCALbx10_ARA0_RDD0;
                       BOOLCCSCALbx10ARA0RRh10hold <= A_BOOL_CC_SCALbx10_ARA0_RDD0;
                       end 
                      
              case (xpc10nz)
                  5'sd10/*10:xpc10nz*/:  begin 
                       finished <= 1'h1;
                       xpc10nz <= 5'sd11/*11:xpc10nz*/;
                       end 
                      
                  5'sd19/*19:xpc10nz*/:  begin 
                       primesya_T404_Main_T404_Main_V_4_GP <= primesya_T404_Main_T404_Main_V_2_GP+primesya_T404_Main_T404_Main_V_4_GP
                      ;

                       xpc10nz <= 5'sd20/*20:xpc10nz*/;
                       end 
                      endcase
              if (SINTCCSCALbx12ARA0RRh10shot0)  SINTCCSCALbx12ARA0RRh10hold <= A_SINT_CC_SCALbx12_ARA0_RDD0;
                  
              case (xpc12nz)
                  3'sd0/*0:xpc12nz*/:  xpc12nz <= 3'sd1/*1:xpc12nz*/;

                  3'sd2/*2:xpc12nz*/:  xpc12nz <= 3'sd4/*4:xpc12nz*/;

                  3'sd4/*4:xpc12nz*/:  xpc12nz <= 3'sd5/*5:xpc12nz*/;

                  3'sd5/*5:xpc12nz*/:  xpc12nz <= 3'sd1/*1:xpc12nz*/;
              endcase

              case (xpc10nz)
                  5'sd1/*1:xpc10nz*/:  xpc10nz <= 5'sd2/*2:xpc10nz*/;

                  5'sd2/*2:xpc10nz*/:  xpc10nz <= 5'sd3/*3:xpc10nz*/;

                  5'sd8/*8:xpc10nz*/:  xpc10nz <= 5'sd9/*9:xpc10nz*/;

                  5'sd9/*9:xpc10nz*/:  xpc10nz <= 5'sd10/*10:xpc10nz*/;

                  5'sd11/*11:xpc10nz*/:  xpc10nz <= 5'sd12/*12:xpc10nz*/;

                  5'sd12/*12:xpc10nz*/:  xpc10nz <= 5'sd13/*13:xpc10nz*/;

                  5'sd13/*13:xpc10nz*/:  xpc10nz <= 5'sd12/*12:xpc10nz*/;

                  5'sd14/*14:xpc10nz*/:  xpc10nz <= 5'sd15/*15:xpc10nz*/;

                  5'sd20/*20:xpc10nz*/:  xpc10nz <= 5'sd18/*18:xpc10nz*/;

                  5'sd22/*22:xpc10nz*/:  xpc10nz <= 5'sd4/*4:xpc10nz*/;
              endcase
               SINTCCSCALbx12ARA0RRh10shot0 <= !pio_hwen && (xpc12nz==3'sd1/*1:xpc12nz*/);
               BOOLCCSCALbx10ARA0RRh10shot0 <= (xpc10nz==5'sd14/*14:xpc10nz*/);
               end 
              //End structure HPR csharp/primes_offchip


       end 
      

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd4, 32'sd10, 32'sd32) A_SINT_CC_SCALbx12_ARA0(clk, reset, A_SINT_CC_SCALbx12_ARA0_RDD0, A_SINT_CC_SCALbx12_ARA0_AD0
, A_SINT_CC_SCALbx12_ARA0_WEN0, A_SINT_CC_SCALbx12_ARA0_REN0, A_SINT_CC_SCALbx12_ARA0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd1, 32'sd4, 32'sd10, 32'sd1) A_BOOL_CC_SCALbx10_ARA0(clk, reset, A_BOOL_CC_SCALbx10_ARA0_RDD0, A_BOOL_CC_SCALbx10_ARA0_AD0
, A_BOOL_CC_SCALbx10_ARA0_WEN0, A_BOOL_CC_SCALbx10_ARA0_REN0, A_BOOL_CC_SCALbx10_ARA0_WRD0);

// 8 vectors of width 1
// 2 vectors of width 32
// 2 vectors of width 4
// 1 vectors of width 3
// 1 vectors of width 5
// 64 bits in scalar variables
// Total state bits in module = 152 bits.
// 33 continuously assigned (wire/non-state) bits 
//   cell CV_SP_SSRAM_FL1 count=2
// Total number of leaf cells = 2
endmodule

//  
// LCP delay estimations included: turn off with -vnl-lcp-delay-estimate=disable
//HPR L/S (orangepath) auxiliary reports.
//KiwiC compilation report
//Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.18a : 5th-December-2016
//10/02/2017 17:08:01
//Cmd line args:  /home/djg11/d320/hprls/kiwipro/kiwic/distro/lib/kiwic.exe csharp/primes_offchip.exe -res2-loadstore-port-count=0 -vnl=primes_offchip.v -vnl-rootmodname=primes_offchip csharp/KSubs2_Director.dll -vnl-resets=synchronous -kiwic-finish=disable -vnl-roundtrip=disable -kiwic-register-colours=1 -bevelab-default-pause-mode=bblock -fp-fl-sp-mul=4


//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T400:::
//: Linear scan colouring done for 0 vregs using 0 pregs
//

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T401:::
//: Linear scan colouring done for 0 vregs using 0 pregs
//

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T402:::
//: Linear scan colouring done for 0 vregs using 0 pregs
//

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T403:::
//: Linear scan colouring done for 0 vregs using 0 pregs
//

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T404:::
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5003 dt=SINT usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5004 dt=SINT usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5005 dt=SINT usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5006 dt=SINT usecount=2
//
//: Linear scan colouring done for 4 vregs using 2 pregs
//

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T405:::
//: Linear scan colouring done for 0 vregs using 0 pregs
//

//----------------------------------------------------------

//Report from KiwiC-fe.rpt:::
//KiwiC: front end input processing of class or method called KiwiSystem/Kiwi
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor10
//
//KiwiC start_thread (or entry point) id=cctor10
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+0
//
//KiwiC: front end input processing of class or method called System/BitConverter
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor12
//
//KiwiC start_thread (or entry point) id=cctor12
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+1
//
//KiwiC: front end input processing of class or method called KSubs2_Director
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor14
//
//KiwiC start_thread (or entry point) id=cctor14
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+2
//
//KiwiC: front end input processing of class or method called primesya
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor16
//
//KiwiC start_thread (or entry point) id=cctor16
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+3
//
//KiwiC: front end input processing of class or method called primesya
//
//root_compiler: start elaborating class 'primesya'
//
//elaborating class 'primesya'
//
//compiling static method as entry point: style=Root idl=primesya/Main
//
//Performing root elaboration of method Main
//
//KiwiC start_thread (or entry point) id=Main10
//
//Register sharing: general primesya/T404/Main/T404/Main/V_4/GP used for primesya/T404/Main/T404/Main/V_4
//
//Register sharing: general primesya/T404/Main/T404/Main/V_4/GP used for primesya/T404/Main/T404/Main/V_3
//
//Register sharing: general primesya/T404/Main/T404/Main/V_2/GP used for primesya/T404/Main/T404/Main/V_2
//
//Register sharing: general primesya/T404/Main/T404/Main/V_2/GP used for primesya/T404/Main/T404/Main/V_1
//
//root_compiler class done: primesya
//
//KiwiC: front end input processing of class or method called KSubs2_Director
//
//root_compiler: start elaborating class 'KSubs2_Director'
//
//elaborating class 'KSubs2_Director'
//
//compiling static method as entry point: style=Root idl=KSubs2_Director/host_pio_process
//
//Performing root elaboration of method host_pio_process
//
//KiwiC start_thread (or entry point) id=hostpioprocess10
//
//root_compiler class done: KSubs2_Director
//
//Report of all settings used from the recipe or command line:
//
//   cil-uwind-budget=10000
//
//   kiwic-finish=disable
//
//   kiwic-cil-dump=disable
//
//   kiwic-kcode-dump=disable
//
//   kiwic-register-colours=1
//
//   array-4d-name=KIWIARRAY4D
//
//   array-3d-name=KIWIARRAY3D
//
//   array-2d-name=KIWIARRAY2D
//
//   kiwi-dll=Kiwi.dll
//
//   kiwic-dll=Kiwic.dll
//
//   kiwic-zerolength-arrays=disable
//
//   kiwic-fpgaconsole-default=enable
//
//   postgen-optimise=enable
//
//   kiwife-loglevel=20
//
//   ataken-loglevel=20
//
//   gtrace-loglevel=20
//
//   firstpass-loglevel=20
//
//   overloads-loglevel=20
//
//   root=$attributeroot
//
//   ?>?=srcfile, csharp/primes_offchip.exe, csharp/KSubs2_Director.dll
//
//   kiwic-autodispose=disable
//
//END OF KIWIC REPORT FILE
//

//----------------------------------------------------------

//Report from restructure2:::
//Offchip Load/Store (and other) Ports = Nothing to Report
//

//----------------------------------------------------------

//Report from restructure2:::
//Restructure Technology Settings
//*---------------------------+---------+---------------------------------------------------------------------------------*
//| Key                       | Value   | Description                                                                     |
//*---------------------------+---------+---------------------------------------------------------------------------------*
//| int-flr-mul               | -3000   |                                                                                 |
//| fp-fl-dp-div              | 5       |                                                                                 |
//| fp-fl-dp-add              | 4       |                                                                                 |
//| fp-fl-dp-mul              | 3       |                                                                                 |
//| fp-fl-sp-div              | 5       |                                                                                 |
//| fp-fl-sp-add              | 4       |                                                                                 |
//| fp-fl-sp-mul              | 4       |                                                                                 |
//| max-no-fp-addsubs         | 6       | Maximum number of adders and subtractors (or combos) to instantiate per thread. |
//| max-no-fp-muls            | 6       | Maximum number of f/p multipliers or dividers to instantiate per thread.        |
//| max-no-int-muls           | 3       | Maximum number of int multipliers to instantiate per thread.                    |
//| max-no-fp-divs            | 2       | Maximum number of f/p dividers to instantiate per thread.                       |
//| max-no-int-divs           | 2       | Maximum number of int dividers to instantiate per thread.                       |
//| res2-offchip-threshold    | 1000000 |                                                                                 |
//| res2-combrom-threshold    | 64      |                                                                                 |
//| res2-combram-threshold    | 32      |                                                                                 |
//| res2-regfile-threshold    | 8       |                                                                                 |
//| res2-loadstore-port-count | 0       |                                                                                 |
//*---------------------------+---------+---------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//PC codings points for xpc10 
//*--------------------------+-----+-------------+------+------+-------+-----+-------------+------*
//| gb-flag/Pause            | eno | hwm         | root | exec | start | end | antecedants | next |
//*--------------------------+-----+-------------+------+------+-------+-----+-------------+------*
//|   X0:"0:xpc10"           | 900 | hwm=0.0.0   | 0    | 0    | -     | -   | ---         | 1    |
//|   X1:"1:xpc10"           | 901 | hwm=0.0.1   | 1    | 1    | 2     | 2   | ---         | 3    |
//|   X2:"2:xpc10"           | 902 | hwm=0.0.0   | 3    | 3    | -     | -   | ---         | 4    |
//|   X4:"4:xpc10"           | 904 | hwm=0.0.0   | 4    | 4    | -     | -   | ---         | 21   |
//|   X4:"4:xpc10"           | 903 | hwm=0.0.0   | 4    | 4    | -     | -   | ---         | 5    |
//|   X8:"8:xpc10"           | 906 | hwm=0.0.0   | 5    | 5    | -     | -   | ---         | 17   |
//|   X8:"8:xpc10"           | 905 | hwm=0.0.0   | 5    | 5    | -     | -   | ---         | 6    |
//|   X16:"16:xpc10"         | 907 | hwm=0.0.0   | 6    | 6    | -     | -   | ---         | 7    |
//|   X32:"32:xpc10"         | 909 | hwm=0.0.0   | 7    | 7    | -     | -   | ---         | 14   |
//|   X32:"32:xpc10"         | 908 | hwm=0.0.0   | 7    | 7    | -     | -   | ---         | 8    |
//|   X64:"64:xpc10"         | 910 | hwm=0.0.0   | 8    | 8    | -     | -   | ---         | 9    |
//|   X128:"128:xpc10"       | 911 | hwm=0.0.0   | 9    | 9    | -     | -   | ---         | 10   |
//|   X256:"256:xpc10"       | 912 | hwm=0.0.0   | 10   | 10   | -     | -   | ---         | 11   |
//|   X512:"512:xpc10"       | 913 | hwm=0.0.0   | 11   | 11   | -     | -   | ---         | 12   |
//|   X1024:"1024:xpc10"     | 914 | hwm=0.0.0   | 12   | 12   | -     | -   | ---         | 13   |
//|   X2048:"2048:xpc10"     | 915 | hwm=0.0.0   | 13   | 13   | -     | -   | ---         | 12   |
//|   X4096:"4096:xpc10"     | 917 | hwm=1.1.0   | 14   | 15   | -     | -   | ---         | 16   |
//|   X4096:"4096:xpc10"     | 916 | hwm=1.1.0   | 14   | 15   | -     | -   | ---         | 16   |
//|   X8192:"8192:xpc10"     | 918 | hwm=0.0.0   | 16   | 16   | -     | -   | ---         | 7    |
//|   X16384:"16384:xpc10"   | 920 | hwm=0.0.0   | 17   | 17   | -     | -   | ---         | 18   |
//|   X16384:"16384:xpc10"   | 919 | hwm=0.0.0   | 17   | 17   | -     | -   | ---         | 6    |
//|   X32768:"32768:xpc10"   | 922 | hwm=0.0.0   | 18   | 18   | -     | -   | ---         | 19   |
//|   X32768:"32768:xpc10"   | 921 | hwm=0.0.0   | 18   | 18   | -     | -   | ---         | 5    |
//|   X65536:"65536:xpc10"   | 923 | hwm=0.0.1   | 19   | 19   | 20    | 20  | ---         | 18   |
//|   X131072:"131072:xpc10" | 924 | hwm=0.0.1   | 21   | 21   | 22    | 22  | ---         | 4    |
//*--------------------------+-----+-------------+------+------+-------+-----+-------------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X0:"0:xpc10"
//res2: Thread=xpc10 state=X0:"0:xpc10"
//*-----+-----+---------+-------------------------------------------------------------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                                                                              |
//*-----+-----+---------+-------------------------------------------------------------------------------------------------------------------*
//| 0   | -   | R0 CTRL |                                                                                                                   |
//| 0   | 900 | R0 DATA |                                                                                                                   |
//| 0+E | 900 | W0 DATA | elimit te=te:0 scalarw(1000) pio_rdata te=te:0 scalarw(0) design_serial_number te=te:0 scalarw(S32'2232578) fini\ |
//|     |     |         | shed te=te:0 scalarw(U1'0) edesign te=te:0 scalarw(4032) evariant te=te:0 scalarw(0) count te=te:0 scalarw(U32'0\ |
//|     |     |         | )  PLI:Primes Up To   W/P:START                                                                                   |
//*-----+-----+---------+-------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X1:"1:xpc10"
//res2: Thread=xpc10 state=X1:"1:xpc10"
//*-----+-----+---------+----------------------------------------------------*
//| pc  | eno | Phaser  | Work                                               |
//*-----+-----+---------+----------------------------------------------------*
//| 1   | -   | R0 CTRL |                                                    |
//| 1   | 901 | R0 DATA |                                                    |
//| 1+E | 901 | W0 DATA | @_BOOL/CC/SCALbx10_ARA0 te=te:1 write(0, 0<volume) |
//| 2   | 901 | W1 DATA |                                                    |
//*-----+-----+---------+----------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X2:"2:xpc10"
//res2: Thread=xpc10 state=X2:"2:xpc10"
//*-----+-----+---------+-------------------------------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                                                |
//*-----+-----+---------+-------------------------------------------------------------------------------------*
//| 3   | -   | R0 CTRL |                                                                                     |
//| 3   | 902 | R0 DATA |                                                                                     |
//| 3+E | 902 | W0 DATA | count te=te:3 scalarw(U32'0) primesya/T404/Main/T404/Main/V_2_GP te=te:3 scalarw(0) |
//*-----+-----+---------+-------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X4:"4:xpc10"
//res2: Thread=xpc10 state=X4:"4:xpc10"
//*-----+-----+---------+-----------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                            |
//*-----+-----+---------+-----------------------------------------------------------------*
//| 4   | -   | R0 CTRL |                                                                 |
//| 4   | 903 | R0 DATA |                                                                 |
//| 4+E | 903 | W0 DATA | primesya/T404/Main/T404/Main/V_2_GP te=te:4 scalarw(2)  W/P:wp2 |
//| 4   | 904 | R0 DATA |                                                                 |
//| 4+E | 904 | W0 DATA |                                                                 |
//*-----+-----+---------+-----------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X8:"8:xpc10"
//res2: Thread=xpc10 state=X8:"8:xpc10"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 5   | -   | R0 CTRL |      |
//| 5   | 905 | R0 DATA |      |
//| 5+E | 905 | W0 DATA |      |
//| 5   | 906 | R0 DATA |      |
//| 5+E | 906 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X16:"16:xpc10"
//res2: Thread=xpc10 state=X16:"16:xpc10"
//*-----+-----+---------+-----------------------------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                                              |
//*-----+-----+---------+-----------------------------------------------------------------------------------*
//| 6   | -   | R0 CTRL |                                                                                   |
//| 6   | 907 | R0 DATA |                                                                                   |
//| 6+E | 907 | W0 DATA | primesya/T404/Main/T404/Main/V_4_GP te=te:6 scalarw(0)  PLI:Now counting  W/P:wp3 |
//*-----+-----+---------+-----------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X32:"32:xpc10"
//res2: Thread=xpc10 state=X32:"32:xpc10"
//*-----+-----+---------+-----------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                      |
//*-----+-----+---------+-----------------------------------------------------------*
//| 7   | -   | R0 CTRL |                                                           |
//| 7   | 908 | R0 DATA |                                                           |
//| 7+E | 908 | W0 DATA |  PLI:Optimisation variant...  PLI:There are %d primes ... |
//| 7   | 909 | R0 DATA |                                                           |
//| 7+E | 909 | W0 DATA |                                                           |
//*-----+-----+---------+-----------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X64:"64:xpc10"
//res2: Thread=xpc10 state=X64:"64:xpc10"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 8   | -   | R0 CTRL |      |
//| 8   | 910 | R0 DATA |      |
//| 8+E | 910 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X128:"128:xpc10"
//res2: Thread=xpc10 state=X128:"128:xpc10"
//*-----+-----+---------+-------------*
//| pc  | eno | Phaser  | Work        |
//*-----+-----+---------+-------------*
//| 9   | -   | R0 CTRL |             |
//| 9   | 911 | R0 DATA |             |
//| 9+E | 911 | W0 DATA |  W/P:FINISH |
//*-----+-----+---------+-------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X256:"256:xpc10"
//res2: Thread=xpc10 state=X256:"256:xpc10"
//*------+-----+---------+---------------------------------*
//| pc   | eno | Phaser  | Work                            |
//*------+-----+---------+---------------------------------*
//| 10   | -   | R0 CTRL |                                 |
//| 10   | 912 | R0 DATA |                                 |
//| 10+E | 912 | W0 DATA | finished te=te:10 scalarw(U1'1) |
//*------+-----+---------+---------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X512:"512:xpc10"
//res2: Thread=xpc10 state=X512:"512:xpc10"
//*------+-----+---------+------*
//| pc   | eno | Phaser  | Work |
//*------+-----+---------+------*
//| 11   | -   | R0 CTRL |      |
//| 11   | 913 | R0 DATA |      |
//| 11+E | 913 | W0 DATA |      |
//*------+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X1024:"1024:xpc10"
//res2: Thread=xpc10 state=X1024:"1024:xpc10"
//*------+-----+---------+------*
//| pc   | eno | Phaser  | Work |
//*------+-----+---------+------*
//| 12   | -   | R0 CTRL |      |
//| 12   | 914 | R0 DATA |      |
//| 12+E | 914 | W0 DATA |      |
//*------+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X2048:"2048:xpc10"
//res2: Thread=xpc10 state=X2048:"2048:xpc10"
//*------+-----+---------+------*
//| pc   | eno | Phaser  | Work |
//*------+-----+---------+------*
//| 13   | -   | R0 CTRL |      |
//| 13   | 915 | R0 DATA |      |
//| 13+E | 915 | W0 DATA |      |
//*------+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X4096:"4096:xpc10"
//res2: Thread=xpc10 state=X4096:"4096:xpc10"
//*------+-----+---------+-------------------------------------------*
//| pc   | eno | Phaser  | Work                                      |
//*------+-----+---------+-------------------------------------------*
//| 14   | -   | R0 CTRL | @_BOOL/CC/SCALbx10_ARA0 te=te:14 read(E1) |
//| 15   | -   | R1 CTRL |                                           |
//| 14   | 916 | R0 DATA |                                           |
//| 15   | 916 | R1 DATA |                                           |
//| 15+E | 916 | W0 DATA | count te=te:15 scalarw(Cu(1+count))       |
//| 14   | 917 | R0 DATA |                                           |
//| 15   | 917 | R1 DATA |                                           |
//| 15+E | 917 | W0 DATA |                                           |
//*------+-----+---------+-------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X8192:"8192:xpc10"
//res2: Thread=xpc10 state=X8192:"8192:xpc10"
//*------+-----+---------+------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                               |
//*------+-----+---------+------------------------------------------------------------------------------------*
//| 16   | -   | R0 CTRL |                                                                                    |
//| 16   | 918 | R0 DATA |                                                                                    |
//| 16+E | 918 | W0 DATA | primesya/T404/Main/T404/Main/V_4_GP te=te:16 scalarw(E2)  PLI:Tally counting %u %d |
//*------+-----+---------+------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X16384:"16384:xpc10"
//res2: Thread=xpc10 state=X16384:"16384:xpc10"
//*------+-----+---------+----------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                             |
//*------+-----+---------+----------------------------------------------------------------------------------*
//| 17   | -   | R0 CTRL |                                                                                  |
//| 17   | 919 | R0 DATA |                                                                                  |
//| 17+E | 919 | W0 DATA | primesya/T404/Main/T404/Main/V_4_GP te=te:17 scalarw(E3)  PLI:Skip out on square |
//| 17   | 920 | R0 DATA |                                                                                  |
//| 17+E | 920 | W0 DATA | primesya/T404/Main/T404/Main/V_4_GP te=te:17 scalarw(E3)                         |
//*------+-----+---------+----------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X32768:"32768:xpc10"
//res2: Thread=xpc10 state=X32768:"32768:xpc10"
//*------+-----+---------+----------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                     |
//*------+-----+---------+----------------------------------------------------------*
//| 18   | -   | R0 CTRL |                                                          |
//| 18   | 921 | R0 DATA |                                                          |
//| 18+E | 921 | W0 DATA | primesya/T404/Main/T404/Main/V_2_GP te=te:18 scalarw(E4) |
//| 18   | 922 | R0 DATA |                                                          |
//| 18+E | 922 | W0 DATA |  PLI:Cross off %u %u   (c...                             |
//*------+-----+---------+----------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X65536:"65536:xpc10"
//res2: Thread=xpc10 state=X65536:"65536:xpc10"
//*------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                      |
//*------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//| 19   | -   | R0 CTRL |                                                                                                           |
//| 19   | 923 | R0 DATA |                                                                                                           |
//| 19+E | 923 | W0 DATA | @_BOOL/CC/SCALbx10_ARA0 te=te:19 write(E1, U1'0) primesya/T404/Main/T404/Main/V_4_GP te=te:19 scalarw(E5) |
//| 20   | 923 | W1 DATA |                                                                                                           |
//*------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X131072:"131072:xpc10"
//res2: Thread=xpc10 state=X131072:"131072:xpc10"
//*------+-----+---------+----------------------------------------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                                                   |
//*------+-----+---------+----------------------------------------------------------------------------------------------------------------------------------------*
//| 21   | -   | R0 CTRL |                                                                                                                                        |
//| 21   | 924 | R0 DATA |                                                                                                                                        |
//| 21+E | 924 | W0 DATA | @_BOOL/CC/SCALbx10_ARA0 te=te:21 write(E6, U1'1) primesya/T404/Main/T404/Main/V_2_GP te=te:21 scalarw(E4)  PLI:Setting initial arra... |
//| 22   | 924 | W1 DATA |                                                                                                                                        |
//*------+-----+---------+----------------------------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//PC codings points for xpc12 
//*----------------+-----+-------------+------+------+-------+-----+-------------+------*
//| gb-flag/Pause  | eno | hwm         | root | exec | start | end | antecedants | next |
//*----------------+-----+-------------+------+------+-------+-----+-------------+------*
//|   X0:"0:xpc12" | 925 | hwm=0.0.0   | 0    | 0    | -     | -   | ---         | 1    |
//|   X1:"1:xpc12" | 927 | hwm=0.1.0   | 1    | 3    | 3     | 3   | ---         | 4    |
//|   X1:"1:xpc12" | 926 | hwm=0.0.1   | 1    | 1    | 2     | 2   | ---         | 4    |
//|   X2:"2:xpc12" | 928 | hwm=0.0.0   | 4    | 4    | -     | -   | ---         | 5    |
//|   X4:"4:xpc12" | 929 | hwm=0.0.0   | 5    | 5    | -     | -   | ---         | 1    |
//*----------------+-----+-------------+------+------+-------+-----+-------------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X0:"0:xpc12"
//res2: Thread=xpc12 state=X0:"0:xpc12"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 0   | -   | R0 CTRL |      |
//| 0   | 925 | R0 DATA |      |
//| 0+E | 925 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X1:"1:xpc12"
//res2: Thread=xpc12 state=X1:"1:xpc12"
//*-----+-----+---------+---------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                          |
//*-----+-----+---------+---------------------------------------------------------------*
//| 1   | -   | R0 CTRL |                                                               |
//| 1   | 926 | R0 DATA |                                                               |
//| 1+E | 926 | W0 DATA | @_SINT/CC/SCALbx12_ARA0 te=te:1 write(pio_addr, C(pio_wdata)) |
//| 2   | 926 | W1 DATA |                                                               |
//| 1   | 927 | R0 DATA | @_SINT/CC/SCALbx12_ARA0 te=te:1 read(pio_addr)                |
//| 3   | 927 | R1 DATA |                                                               |
//| 3+E | 927 | W0 DATA | pio_rdata te=te:3 scalarw(E7)                                 |
//*-----+-----+---------+---------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X2:"2:xpc12"
//res2: Thread=xpc12 state=X2:"2:xpc12"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 4   | -   | R0 CTRL |      |
//| 4   | 928 | R0 DATA |      |
//| 4+E | 928 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X4:"4:xpc12"
//res2: Thread=xpc12 state=X4:"4:xpc12"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 5   | -   | R0 CTRL |      |
//| 5   | 929 | R0 DATA |      |
//| 5+E | 929 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from enumbers:::
//Concise expression alias report.
//
//  E1 =.= primesya/T404/Main/T404/Main/V_4_GP
//
//  E2 =.= 1+primesya/T404/Main/T404/Main/V_4_GP
//
//  E3 =.= primesya/T404/Main/T404/Main/V_2_GP+primesya/T404/Main/T404/Main/V_2_GP
//
//  E4 =.= 1+primesya/T404/Main/T404/Main/V_2_GP
//
//  E5 =.= primesya/T404/Main/T404/Main/V_2_GP+primesya/T404/Main/T404/Main/V_4_GP
//
//  E6 =.= primesya/T404/Main/T404/Main/V_2_GP
//
//  E7 =.= C(@_SINT/CC/SCALbx12_ARA0[pio_addr])
//
//  E8 =.= primesya/T404/Main/T404/Main/V_2_GP>=1000
//
//  E9 =.= primesya/T404/Main/T404/Main/V_2_GP<1000
//
//  E10 =.= primesya/T404/Main/T404/Main/V_4_GP>=1000
//
//  E11 =.= primesya/T404/Main/T404/Main/V_4_GP<1000
//
//  E12 =.= {[xpc10nz==X15:"15:xpc10nz", |-|@_BOOL/CC/SCALbx10_ARA0_RDD0]; [xpc10nz!=X15:"15:xpc10nz", |-|BOOLCCSCALbx10ARA0RRh10hold]}
//
//  E13 =.= {[xpc10nz==X15:"15:xpc10nz", !(|-|@_BOOL/CC/SCALbx10_ARA0_RDD0)]; [xpc10nz!=X15:"15:xpc10nz", !(|-|BOOLCCSCALbx10ARA0RRh10hold)]}
//
//  E14 =.= primesya/T404/Main/T404/Main/V_2_GP+primesya/T404/Main/T404/Main/V_2_GP>=1000
//
//  E15 =.= primesya/T404/Main/T404/Main/V_2_GP+primesya/T404/Main/T404/Main/V_2_GP<1000
//

//----------------------------------------------------------

//Report from verilog_render:::
//8 vectors of width 1
//
//2 vectors of width 32
//
//2 vectors of width 4
//
//1 vectors of width 3
//
//1 vectors of width 5
//
//64 bits in scalar variables
//
//Total state bits in module = 152 bits.
//
//33 continuously assigned (wire/non-state) bits 
//
//Total number of leaf cells = 0
//

//Major Statistics Report:
//Thread .cctor uid=cctor10 has 3 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor12 has 2 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor14 has 5 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor16 has 10 CIL instructions in 1 basic blocks
//Thread Main uid=Main10 has 65 CIL instructions in 18 basic blocks
//Thread host_pio_process uid=hostpioprocess10 has 9 CIL instructions in 4 basic blocks
//Thread mpc10 has 19 bevelab control states (pauses)
//Thread mpc12 has 4 bevelab control states (pauses)
//Reindexed thread xpc10 with 23 minor control states
//Reindexed thread xpc12 with 6 minor control states
// eof (HPR L/S Verilog)
