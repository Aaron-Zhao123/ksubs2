

// CBG Orangepath HPR L/S System

// Verilog output file generated at 10/02/2017 15:40:31
// Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.18a : 5th-December-2016 Unix 3.13.0.65
//  /home/djg11/d320/hprls/kiwipro/kiwic/distro/lib/kiwic.exe csharp/lu-decomp-sp.exe -res2-loadstore-port-count=0 -vnl=lu-decomp-sp.v -vnl-rootmodname=lu-decomp-sp csharp/KSubs2_Director.dll -vnl-resets=synchronous -kiwic-finish=disable -vnl-roundtrip=disable -kiwic-register-colours=1 -bevelab-default-pause-mode=bblock -fp-fl-sp-mul=4
`timescale 1ns/1ns


module lu_decomp_sp(    output reg [639:0] KppWaypoint0,
    output [639:0] KppWaypoint1,
    output reg signed [31:0] design_serial_number,
    output reg signed [31:0] pio_address,
    input signed [31:0] pio_wdata,
    output reg signed [31:0] pio_rdata,
    input pio_hwen,
    output reg signed [31:0] runstate,
    output reg signed [31:0] out_idx,
    output reg /*fp*/ [31:0] out_data,
    input clk,
    input reset);

function [63:0] hpr_flt2dbl2;//Floating-point convert single to double precision.
input [31:0] darg;
  hpr_flt2dbl2 = {darg[31], darg[30], {3{~darg[30]}}, darg[29:23], darg[22:0], {29{1'b0}}};
endfunction


function signed [31:0] rtl_signed_bitextract0;
   input [63:0] arg;
   rtl_signed_bitextract0 = $signed(arg[31:0]);
   endfunction


function [63:0] rtl_unsigned_extend1;
   input [31:0] arg;
   rtl_unsigned_extend1 = { 32'b0, arg[31:0] };
   endfunction

  wire fpcvt10_fail;
  wire CVFPMULTIPLIER10_fail;
  wire fpcvt12_fail;
  wire CVFPMULTIPLIER12_fail;
  wire CVFPADDER10_fail;
  wire CVFPADDER12_fail;
  wire CVFPMULTIPLIER14_fail;
  wire CVFPADDER14_fail;
  wire CVFPMULTIPLIER16_fail;
  wire CVFPADDER16_fail;
  wire CVFPADDER18_fail;
  wire CVFPDIVIDER10_fail;
  wire CVFPMULTIPLIER18_fail;
  wire CVFPADDER20_fail;
  wire CVFPMULTIPLIER20_fail;
  wire CVFPDIVIDER12_fail;
  wire [63:0] tnow;
  reg/*fp*/  [31:0] T404_MatrixLib_mpx_1_23_V_1_GP;
  integer T404_MatrixLib_mpx_1_23_V_2_GP;
  integer luTest_T404_Main_T404_Main_V_3_GP;
  integer luTest_T404_Main_T404_Main_V_1_GP;
  reg signed [31:0] A_SINT_CC_SCALbx10_SCALARA0_0;
  reg signed [31:0] fpcvt10_arg;
  wire/*fp*/  [31:0] fpcvt10_result;
  reg/*fp*/  [31:0] CVFPMULTIPLIER10_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER10_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER10_FPRR;
  reg signed [31:0] fpcvt12_arg;
  wire/*fp*/  [31:0] fpcvt12_result;
  reg/*fp*/  [31:0] CVFPMULTIPLIER12_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER12_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER12_FPRR;
  reg/*fp*/  [31:0] CVFPADDER10_A0;
  reg/*fp*/  [31:0] CVFPADDER10_A1;
  wire/*fp*/  [31:0] CVFPADDER10_FPRR;
  reg/*fp*/  [31:0] CVFPADDER12_A0;
  reg/*fp*/  [31:0] CVFPADDER12_A1;
  wire/*fp*/  [31:0] CVFPADDER12_FPRR;
  reg/*fp*/  [31:0] CVFPMULTIPLIER14_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER14_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER14_FPRR;
  reg/*fp*/  [31:0] CVFPADDER14_A0;
  reg/*fp*/  [31:0] CVFPADDER14_A1;
  wire/*fp*/  [31:0] CVFPADDER14_FPRR;
  reg/*fp*/  [31:0] CVFPMULTIPLIER16_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER16_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER16_FPRR;
  reg/*fp*/  [31:0] CVFPADDER16_A0;
  reg/*fp*/  [31:0] CVFPADDER16_A1;
  wire/*fp*/  [31:0] CVFPADDER16_FPRR;
  reg/*fp*/  [31:0] CVFPADDER18_A0;
  reg/*fp*/  [31:0] CVFPADDER18_A1;
  wire/*fp*/  [31:0] CVFPADDER18_FPRR;
  reg/*fp*/  [31:0] CVFPDIVIDER10_NN;
  reg/*fp*/  [31:0] CVFPDIVIDER10_DD;
  wire/*fp*/  [31:0] CVFPDIVIDER10_FPRR;
  reg/*fp*/  [31:0] CVFPMULTIPLIER18_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER18_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER18_FPRR;
  reg/*fp*/  [31:0] CVFPADDER20_A0;
  reg/*fp*/  [31:0] CVFPADDER20_A1;
  wire/*fp*/  [31:0] CVFPADDER20_FPRR;
  reg/*fp*/  [31:0] CVFPMULTIPLIER20_A0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER20_A1;
  wire/*fp*/  [31:0] CVFPMULTIPLIER20_FPRR;
  reg/*fp*/  [31:0] CVFPDIVIDER12_NN;
  reg/*fp*/  [31:0] CVFPDIVIDER12_DD;
  wire/*fp*/  [31:0] CVFPDIVIDER12_FPRR;
  reg [7:0] xpc10nz;
  reg [5:0] A_FPS_CC_SCALbx36_ARB0_AD0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx36_ARB0_WRD0;
  reg A_FPS_CC_SCALbx36_ARB0_WEN0;
  reg [5:0] A_FPS_CC_SCALbx46_ARG0_AD0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx46_ARG0_WRD0;
  reg A_FPS_CC_SCALbx46_ARG0_WEN0;
  reg [5:0] A_FPS_CC_SCALbx34_ARA0_AD0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx34_ARA0_WRD0;
  reg A_FPS_CC_SCALbx34_ARA0_WEN0;
  reg [2:0] A_FPS_CC_SCALbx40_ARD0_AD0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx40_ARD0_WRD0;
  reg A_FPS_CC_SCALbx40_ARD0_WEN0;
  reg/*fp*/  [31:0] fpcvt10RRh10hold;
  reg fpcvt10RRh10shot0;
  reg fpcvt10RRh10shot1;
  reg/*fp*/  [31:0] fpcvt12RRh10hold;
  reg fpcvt12RRh10shot0;
  reg fpcvt12RRh10shot1;
  reg/*fp*/  [31:0] CVFPMULTIPLIER10RRh10hold;
  reg CVFPMULTIPLIER10RRh10shot0;
  reg CVFPMULTIPLIER10RRh10shot1;
  reg CVFPMULTIPLIER10RRh10shot2;
  reg CVFPMULTIPLIER10RRh10shot3;
  reg/*fp*/  [31:0] CVFPMULTIPLIER12RRh10hold;
  reg CVFPMULTIPLIER12RRh10shot0;
  reg CVFPMULTIPLIER12RRh10shot1;
  reg CVFPMULTIPLIER12RRh10shot2;
  reg CVFPMULTIPLIER12RRh10shot3;
  reg/*fp*/  [31:0] CVFPADDER10RRh10hold;
  reg CVFPADDER10RRh10shot0;
  reg CVFPADDER10RRh10shot1;
  reg CVFPADDER10RRh10shot2;
  reg CVFPADDER10RRh10shot3;
  reg/*fp*/  [31:0] CVFPADDER12RRh10hold;
  reg CVFPADDER12RRh10shot0;
  reg CVFPADDER12RRh10shot1;
  reg CVFPADDER12RRh10shot2;
  reg CVFPADDER12RRh10shot3;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx40_ARD0_RDD0;
  reg A_FPS_CC_SCALbx40_ARD0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx40ARD0RRh10hold;
  reg FPSCCSCALbx40ARD0RRh10shot0;
  reg [2:0] A_FPS_CC_SCALbx42_ARE0_AD0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx42_ARE0_WRD0;
  reg A_FPS_CC_SCALbx42_ARE0_WEN0;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx42_ARE0_RDD0;
  reg A_FPS_CC_SCALbx42_ARE0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx42ARE0RRh10hold;
  reg FPSCCSCALbx42ARE0RRh10shot0;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx44_ARF0_RDD0;
  reg [2:0] A_FPS_CC_SCALbx44_ARF0_AD0;
  reg A_FPS_CC_SCALbx44_ARF0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx44ARF0RRh10hold;
  reg FPSCCSCALbx44ARF0RRh10shot0;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx48_ARH0_RDD0;
  reg [2:0] A_FPS_CC_SCALbx48_ARH0_AD0;
  reg A_FPS_CC_SCALbx48_ARH0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx48ARH0RRh10hold;
  reg FPSCCSCALbx48ARH0RRh10shot0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx48_ARH0_WRD0;
  reg A_FPS_CC_SCALbx48_ARH0_WEN0;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx46_ARG0_RDD0;
  reg A_FPS_CC_SCALbx46_ARG0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx46ARG0RRh10hold;
  reg FPSCCSCALbx46ARG0RRh10shot0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER14RRh10hold;
  reg CVFPMULTIPLIER14RRh10shot0;
  reg CVFPMULTIPLIER14RRh10shot1;
  reg CVFPMULTIPLIER14RRh10shot2;
  reg CVFPMULTIPLIER14RRh10shot3;
  reg/*fp*/  [31:0] CVFPADDER14RRh10hold;
  reg CVFPADDER14RRh10shot0;
  reg CVFPADDER14RRh10shot1;
  reg CVFPADDER14RRh10shot2;
  reg CVFPADDER14RRh10shot3;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx36_ARB0_RDD0;
  reg A_FPS_CC_SCALbx36_ARB0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx36ARB0RRh10hold;
  reg FPSCCSCALbx36ARB0RRh10shot0;
  reg/*fp*/  [31:0] CVFPADDER18RRh10hold;
  reg CVFPADDER18RRh10shot0;
  reg CVFPADDER18RRh10shot1;
  reg CVFPADDER18RRh10shot2;
  reg CVFPADDER18RRh10shot3;
  reg/*fp*/  [31:0] CVFPDIVIDER10RRh10hold;
  reg CVFPDIVIDER10RRh10shot0;
  reg CVFPDIVIDER10RRh10shot1;
  reg CVFPDIVIDER10RRh10shot2;
  reg CVFPDIVIDER10RRh10shot3;
  reg CVFPDIVIDER10RRh10shot4;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx44_ARF0_WRD0;
  reg A_FPS_CC_SCALbx44_ARF0_WEN0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER16RRh10hold;
  reg CVFPMULTIPLIER16RRh10shot0;
  reg CVFPMULTIPLIER16RRh10shot1;
  reg CVFPMULTIPLIER16RRh10shot2;
  reg CVFPMULTIPLIER16RRh10shot3;
  reg/*fp*/  [31:0] CVFPADDER16RRh10hold;
  reg CVFPADDER16RRh10shot0;
  reg CVFPADDER16RRh10shot1;
  reg CVFPADDER16RRh10shot2;
  reg CVFPADDER16RRh10shot3;
  reg/*fp*/  [31:0] CVFPADDER20RRh10hold;
  reg CVFPADDER20RRh10shot0;
  reg CVFPADDER20RRh10shot1;
  reg CVFPADDER20RRh10shot2;
  reg CVFPADDER20RRh10shot3;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx34_ARA0_RDD0;
  reg A_FPS_CC_SCALbx34_ARA0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx34ARA0RRh10hold;
  reg FPSCCSCALbx34ARA0RRh10shot0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER18RRh10hold;
  reg CVFPMULTIPLIER18RRh10shot0;
  reg CVFPMULTIPLIER18RRh10shot1;
  reg CVFPMULTIPLIER18RRh10shot2;
  reg CVFPMULTIPLIER18RRh10shot3;
  wire/*fp*/  [31:0] A_FPS_CC_SCALbx38_ARC0_RDD0;
  reg [5:0] A_FPS_CC_SCALbx38_ARC0_AD0;
  reg A_FPS_CC_SCALbx38_ARC0_REN0;
  reg/*fp*/  [31:0] FPSCCSCALbx38ARC0RRh10hold;
  reg FPSCCSCALbx38ARC0RRh10shot0;
  reg/*fp*/  [31:0] A_FPS_CC_SCALbx38_ARC0_WRD0;
  reg A_FPS_CC_SCALbx38_ARC0_WEN0;
  reg/*fp*/  [31:0] CVFPMULTIPLIER20RRh10hold;
  reg CVFPMULTIPLIER20RRh10shot0;
  reg CVFPMULTIPLIER20RRh10shot1;
  reg CVFPMULTIPLIER20RRh10shot2;
  reg CVFPMULTIPLIER20RRh10shot3;
  reg/*fp*/  [31:0] FPSCCSCALbx36ARB0RRh12hold;
  reg FPSCCSCALbx36ARB0RRh12shot0;
  reg/*fp*/  [31:0] CVFPDIVIDER12RRh10hold;
  reg CVFPDIVIDER12RRh10shot0;
  reg CVFPDIVIDER12RRh10shot1;
  reg CVFPDIVIDER12RRh10shot2;
  reg CVFPDIVIDER12RRh10shot3;
  reg CVFPDIVIDER12RRh10shot4;
  reg [2:0] xpc12nz;
 always   @(* )  begin 
       KppWaypoint0 = 32'sd0;
       CVFPDIVIDER12_NN = 32'sd0;
       CVFPDIVIDER12_DD = 32'sd0;
       A_FPS_CC_SCALbx38_ARC0_WRD0 = 32'sd0;
       CVFPMULTIPLIER20_A0 = 32'sd0;
       CVFPMULTIPLIER20_A1 = 32'sd0;
       A_FPS_CC_SCALbx38_ARC0_AD0 = 32'sd0;
       CVFPADDER20_A0 = 32'sd0;
       CVFPADDER20_A1 = 32'sd0;
       CVFPMULTIPLIER18_A0 = 32'sd0;
       CVFPMULTIPLIER18_A1 = 32'sd0;
       A_FPS_CC_SCALbx44_ARF0_WRD0 = 32'sd0;
       CVFPDIVIDER10_NN = 32'sd0;
       CVFPDIVIDER10_DD = 32'sd0;
       CVFPADDER18_A0 = 32'sd0;
       CVFPADDER18_A1 = 32'sd0;
       CVFPADDER16_A0 = 32'sd0;
       CVFPADDER16_A1 = 32'sd0;
       CVFPMULTIPLIER16_A0 = 32'sd0;
       CVFPMULTIPLIER16_A1 = 32'sd0;
       A_FPS_CC_SCALbx48_ARH0_WRD0 = 32'sd0;
       CVFPADDER14_A0 = 32'sd0;
       CVFPADDER14_A1 = 32'sd0;
       CVFPMULTIPLIER14_A0 = 32'sd0;
       CVFPMULTIPLIER14_A1 = 32'sd0;
       A_FPS_CC_SCALbx48_ARH0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx44_ARF0_AD0 = 32'sd0;
       CVFPADDER12_A0 = 32'sd0;
       CVFPADDER12_A1 = 32'sd0;
       CVFPADDER10_A0 = 32'sd0;
       CVFPADDER10_A1 = 32'sd0;
       CVFPMULTIPLIER12_A0 = 32'sd0;
       CVFPMULTIPLIER12_A1 = 32'sd0;
       CVFPMULTIPLIER10_A0 = 32'sd0;
       CVFPMULTIPLIER10_A1 = 32'sd0;
       fpcvt12_arg = 32'sd0;
       fpcvt10_arg = 32'sd0;
       A_FPS_CC_SCALbx42_ARE0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx42_ARE0_WRD0 = 32'sd0;
       A_FPS_CC_SCALbx34_ARA0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx34_ARA0_WRD0 = 32'sd0;
       A_FPS_CC_SCALbx40_ARD0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx40_ARD0_WRD0 = 32'sd0;
       A_FPS_CC_SCALbx46_ARG0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'sd0;
       A_FPS_CC_SCALbx36_ARB0_AD0 = 32'sd0;
       A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'sd0;
       A_FPS_CC_SCALbx38_ARC0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx38_ARC0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx48_ARH0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx48_ARH0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx44_ARF0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx44_ARF0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx42_ARE0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx42_ARE0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx40_ARD0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx40_ARD0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx34_ARA0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx34_ARA0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx46_ARG0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx46_ARG0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx36_ARB0_REN0 = 32'sd0;
       A_FPS_CC_SCALbx36_ARB0_WEN0 = 32'sd0;
       A_FPS_CC_SCALbx36_ARB0_WEN0 = (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd191/*191:xpc10nz*/) || (xpc10nz==8'sd0/*0:xpc10nz*/) || 
      (xpc10nz==8'sd2/*2:xpc10nz*/) || (xpc10nz==8'sd4/*4:xpc10nz*/) || (xpc10nz==8'sd6/*6:xpc10nz*/) || (xpc10nz==8'sd8/*8:xpc10nz*/) || 
      (xpc10nz==8'sd10/*10:xpc10nz*/) || (xpc10nz==8'sd12/*12:xpc10nz*/) || (xpc10nz==8'sd14/*14:xpc10nz*/) || (xpc10nz==8'sd16/*16:xpc10nz*/) || 
      (xpc10nz==8'sd18/*18:xpc10nz*/) || (xpc10nz==8'sd20/*20:xpc10nz*/) || (xpc10nz==8'sd22/*22:xpc10nz*/) || (xpc10nz==8'sd24/*24:xpc10nz*/) || 
      (xpc10nz==8'sd26/*26:xpc10nz*/) || (xpc10nz==8'sd28/*28:xpc10nz*/) || (xpc10nz==8'sd30/*30:xpc10nz*/) || (xpc10nz==8'sd32/*32:xpc10nz*/) || 
      (xpc10nz==8'sd34/*34:xpc10nz*/) || (xpc10nz==8'sd36/*36:xpc10nz*/) || (xpc10nz==8'sd38/*38:xpc10nz*/) || (xpc10nz==8'sd40/*40:xpc10nz*/) || 
      (xpc10nz==8'sd42/*42:xpc10nz*/) || (xpc10nz==8'sd44/*44:xpc10nz*/) || (xpc10nz==8'sd46/*46:xpc10nz*/) || (xpc10nz==8'sd48/*48:xpc10nz*/) || 
      (xpc10nz==8'sd50/*50:xpc10nz*/) || (xpc10nz==8'sd52/*52:xpc10nz*/) || (xpc10nz==8'sd54/*54:xpc10nz*/) || (xpc10nz==8'sd56/*56:xpc10nz*/) || 
      (xpc10nz==8'sd58/*58:xpc10nz*/) || (xpc10nz==8'sd60/*60:xpc10nz*/) || (xpc10nz==8'sd62/*62:xpc10nz*/) || (xpc10nz==8'sd63/*63:xpc10nz*/) || 
      (xpc10nz==8'sd61/*61:xpc10nz*/) || (xpc10nz==8'sd59/*59:xpc10nz*/) || (xpc10nz==8'sd57/*57:xpc10nz*/) || (xpc10nz==8'sd55/*55:xpc10nz*/) || 
      (xpc10nz==8'sd53/*53:xpc10nz*/) || (xpc10nz==8'sd51/*51:xpc10nz*/) || (xpc10nz==8'sd49/*49:xpc10nz*/) || (xpc10nz==8'sd47/*47:xpc10nz*/) || 
      (xpc10nz==8'sd45/*45:xpc10nz*/) || (xpc10nz==8'sd43/*43:xpc10nz*/) || (xpc10nz==8'sd41/*41:xpc10nz*/) || (xpc10nz==8'sd39/*39:xpc10nz*/) || 
      (xpc10nz==8'sd37/*37:xpc10nz*/) || (xpc10nz==8'sd35/*35:xpc10nz*/) || (xpc10nz==8'sd33/*33:xpc10nz*/) || (xpc10nz==8'sd31/*31:xpc10nz*/) || 
      (xpc10nz==8'sd29/*29:xpc10nz*/) || (xpc10nz==8'sd27/*27:xpc10nz*/) || (xpc10nz==8'sd25/*25:xpc10nz*/) || (xpc10nz==8'sd23/*23:xpc10nz*/) || 
      (xpc10nz==8'sd21/*21:xpc10nz*/) || (xpc10nz==8'sd19/*19:xpc10nz*/) || (xpc10nz==8'sd17/*17:xpc10nz*/) || (xpc10nz==8'sd15/*15:xpc10nz*/) || 
      (xpc10nz==8'sd13/*13:xpc10nz*/) || (xpc10nz==8'sd11/*11:xpc10nz*/) || (xpc10nz==8'sd9/*9:xpc10nz*/) || (xpc10nz==8'sd7/*7:xpc10nz*/) || 
      (xpc10nz==8'sd5/*5:xpc10nz*/) || (xpc10nz==8'sd3/*3:xpc10nz*/) || (xpc10nz==8'sd1/*1:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_1_GP
      <32'sd8) && (xpc10nz==8'sd203/*203:xpc10nz*/);

       A_FPS_CC_SCALbx36_ARB0_REN0 = ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8)? (xpc10nz==8'sd184/*184:xpc10nz*/) || (xpc10nz==8'sd124
      /*124:xpc10nz*/) || (xpc10nz==8'sd165/*165:xpc10nz*/) || (xpc10nz==8'sd185/*185:xpc10nz*/) || (xpc10nz==8'sd205/*205:xpc10nz*/): (xpc10nz
      ==8'sd134/*134:xpc10nz*/)) || (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd179/*179:xpc10nz*/) || ((xpc10nz==8'sd193
      /*193:xpc10nz*/) || (xpc10nz==8'sd194/*194:xpc10nz*/)) && (luTest_T404_Main_T404_Main_V_1_GP<32'sd8);

       A_FPS_CC_SCALbx46_ARG0_WEN0 = ((xpc10nz==8'sd0/*0:xpc10nz*/) || (xpc10nz==8'sd2/*2:xpc10nz*/) || (xpc10nz==8'sd4/*4:xpc10nz*/) || 
      (xpc10nz==8'sd6/*6:xpc10nz*/) || (xpc10nz==8'sd8/*8:xpc10nz*/) || (xpc10nz==8'sd10/*10:xpc10nz*/) || (xpc10nz==8'sd12/*12:xpc10nz*/) || 
      (xpc10nz==8'sd14/*14:xpc10nz*/) || (xpc10nz==8'sd16/*16:xpc10nz*/) || (xpc10nz==8'sd18/*18:xpc10nz*/) || (xpc10nz==8'sd20/*20:xpc10nz*/) || 
      (xpc10nz==8'sd22/*22:xpc10nz*/) || (xpc10nz==8'sd24/*24:xpc10nz*/) || (xpc10nz==8'sd26/*26:xpc10nz*/) || (xpc10nz==8'sd28/*28:xpc10nz*/) || 
      (xpc10nz==8'sd30/*30:xpc10nz*/) || (xpc10nz==8'sd32/*32:xpc10nz*/) || (xpc10nz==8'sd34/*34:xpc10nz*/) || (xpc10nz==8'sd36/*36:xpc10nz*/) || 
      (xpc10nz==8'sd38/*38:xpc10nz*/) || (xpc10nz==8'sd40/*40:xpc10nz*/) || (xpc10nz==8'sd42/*42:xpc10nz*/) || (xpc10nz==8'sd44/*44:xpc10nz*/) || 
      (xpc10nz==8'sd46/*46:xpc10nz*/) || (xpc10nz==8'sd48/*48:xpc10nz*/) || (xpc10nz==8'sd50/*50:xpc10nz*/) || (xpc10nz==8'sd52/*52:xpc10nz*/) || 
      (xpc10nz==8'sd54/*54:xpc10nz*/) || (xpc10nz==8'sd56/*56:xpc10nz*/) || (xpc10nz==8'sd58/*58:xpc10nz*/) || (xpc10nz==8'sd60/*60:xpc10nz*/) || 
      (xpc10nz==8'sd62/*62:xpc10nz*/) || (xpc10nz==8'sd63/*63:xpc10nz*/) || (xpc10nz==8'sd61/*61:xpc10nz*/) || (xpc10nz==8'sd59/*59:xpc10nz*/) || 
      (xpc10nz==8'sd57/*57:xpc10nz*/) || (xpc10nz==8'sd55/*55:xpc10nz*/) || (xpc10nz==8'sd53/*53:xpc10nz*/) || (xpc10nz==8'sd51/*51:xpc10nz*/) || 
      (xpc10nz==8'sd49/*49:xpc10nz*/) || (xpc10nz==8'sd47/*47:xpc10nz*/) || (xpc10nz==8'sd45/*45:xpc10nz*/) || (xpc10nz==8'sd43/*43:xpc10nz*/) || 
      (xpc10nz==8'sd41/*41:xpc10nz*/) || (xpc10nz==8'sd39/*39:xpc10nz*/) || (xpc10nz==8'sd37/*37:xpc10nz*/) || (xpc10nz==8'sd35/*35:xpc10nz*/) || 
      (xpc10nz==8'sd33/*33:xpc10nz*/) || (xpc10nz==8'sd31/*31:xpc10nz*/) || (xpc10nz==8'sd29/*29:xpc10nz*/) || (xpc10nz==8'sd27/*27:xpc10nz*/) || 
      (xpc10nz==8'sd25/*25:xpc10nz*/) || (xpc10nz==8'sd23/*23:xpc10nz*/) || (xpc10nz==8'sd21/*21:xpc10nz*/) || (xpc10nz==8'sd19/*19:xpc10nz*/) || 
      (xpc10nz==8'sd17/*17:xpc10nz*/) || (xpc10nz==8'sd15/*15:xpc10nz*/) || (xpc10nz==8'sd13/*13:xpc10nz*/) || (xpc10nz==8'sd11/*11:xpc10nz*/) || 
      (xpc10nz==8'sd9/*9:xpc10nz*/) || (xpc10nz==8'sd7/*7:xpc10nz*/) || (xpc10nz==8'sd5/*5:xpc10nz*/) || (xpc10nz==8'sd3/*3:xpc10nz*/) || 
      (xpc10nz==8'sd1/*1:xpc10nz*/)? 32'd1: 32'd0);

       A_FPS_CC_SCALbx46_ARG0_REN0 = (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd113/*113:xpc10nz*/);
       A_FPS_CC_SCALbx34_ARA0_WEN0 = (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd67/*67:xpc10nz*/) || ((xpc10nz==8'sd191
      /*191:xpc10nz*/) || (xpc10nz==8'sd182/*182:xpc10nz*/)) && (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8);

       A_FPS_CC_SCALbx34_ARA0_REN0 = (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd165/*165:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
      <luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd145/*145:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz
      ==8'sd176/*176:xpc10nz*/);

       A_FPS_CC_SCALbx40_ARD0_WEN0 = ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)? (xpc10nz==8'sd91/*91:xpc10nz*/): (xpc10nz==8'sd77/*77:xpc10nz*/));
       A_FPS_CC_SCALbx40_ARD0_REN0 = ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)? (xpc10nz==8'sd94/*94:xpc10nz*/): (xpc10nz==8'sd96/*96:xpc10nz*/)) || 
      (T404_MatrixLib_mpx_1_23_V_2_GP>=luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd145/*145:xpc10nz*/);

       A_FPS_CC_SCALbx42_ARE0_WEN0 = (luTest_T404_Main_T404_Main_V_3_GP>=32'sd8) && (xpc10nz==8'sd97/*97:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
      >=luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd159/*159:xpc10nz*/);

       A_FPS_CC_SCALbx42_ARE0_REN0 = (T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8) && (xpc10nz==8'sd124/*124:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_3_GP
      <32'sh8) && (xpc10nz==8'sd100/*100:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP<luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz
      ==8'sd145/*145:xpc10nz*/);

       A_FPS_CC_SCALbx44_ARF0_WEN0 = (T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8) && (xpc10nz==8'sd143/*143:xpc10nz*/);
       A_FPS_CC_SCALbx44_ARF0_REN0 = (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd113/*113:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_3_GP
      <32'sh8) && (xpc10nz==8'sd104/*104:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd124/*124:xpc10nz*/);

       A_FPS_CC_SCALbx48_ARH0_WEN0 = (T404_MatrixLib_mpx_1_23_V_2_GP>=32'sh8) && (xpc10nz==8'sd113/*113:xpc10nz*/);
       A_FPS_CC_SCALbx48_ARH0_REN0 = ((xpc10nz==8'sd111/*111:xpc10nz*/) || (xpc10nz==8'sd108/*108:xpc10nz*/)) && (luTest_T404_Main_T404_Main_V_3_GP
      <32'sh8);

       A_FPS_CC_SCALbx38_ARC0_WEN0 = (T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8) && (xpc10nz==8'sd165/*165:xpc10nz*/);
       A_FPS_CC_SCALbx38_ARC0_REN0 = (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd161/*161:xpc10nz*/);

      case (xpc10nz)
          8'sd0/*0:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_457d_ea7b;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd63;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_457d_ea7b;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd63;
               end 
              
          8'sd1/*1:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4566_43b5;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd62;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_44d8_1713;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd54;
               end 
              
          8'sd2/*2:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4551_54d3;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd61;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4438_b9ef;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd45;
               end 
              
          8'sd3/*3:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_453e_4d1d;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd60;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_439f_9040;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd36;
               end 
              
          8'sd4/*4:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_452d_0049;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd59;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_430d_1999;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd27;
               end 
              
          8'sd5/*5:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_451d_4614;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd58;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4283_32c8;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd18;
               end 
              
          8'sd6/*6:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_450e_f9e3;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd57;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4206_5162;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd9;
               end 
              
          8'sd7/*7:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4501_fa71;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd56;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_41a0_0000;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd0;
               end 
              
          8'sd8/*8:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_44ec_52fc;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd55;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4566_43b5;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd62;
               end 
              
          8'sd9/*9:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_44d8_1713;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd54;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4551_54d3;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd61;
               end 
              
          8'sd10/*10:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_44c3_4f28;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd53;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_453e_4d1d;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd60;
               end 
              
          8'sd11/*11:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_44b1_8dc7;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd52;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_452d_0049;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd59;
               end 
              
          8'sd12/*12:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_44a1_699d;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd51;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_451d_4614;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd58;
               end 
              
          8'sd13/*13:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4492_bd1a;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd50;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_450e_f9e3;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd57;
               end 
              
          8'sd14/*14:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4485_6617;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd49;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4501_fa71;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd56;
               end 
              
          8'sd15/*15:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4472_8b12;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd48;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_44ec_52fc;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd55;
               end 
              
          8'sd16/*16:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_445c_7e6d;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd47;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_44c3_4f28;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd53;
               end 
              
          8'sd17/*17:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4448_72ee;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd46;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_44b1_8dc7;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd52;
               end 
              
          8'sd18/*18:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4438_b9ef;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd45;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_44a1_699d;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd51;
               end 
              
          8'sd19/*19:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4425_a908;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd44;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4492_bd1a;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd50;
               end 
              
          8'sd20/*20:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4416_99aa;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd43;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4485_6617;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd49;
               end 
              
          8'sd21/*21:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4408_e8c9;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd42;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4472_8b12;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd48;
               end 
              
          8'sd22/*22:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_43f8_ed10;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd41;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_445c_7e6d;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd47;
               end 
              
          8'sd23/*23:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_43e2_4be0;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd40;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4448_72ee;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd46;
               end 
              
          8'sd24/*24:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_43cd_b957;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd39;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4425_a908;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd44;
               end 
              
          8'sd25/*25:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_43bb_0595;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd38;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4416_99aa;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd43;
               end 
              
          8'sd26/*26:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_43aa_0513;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd37;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4408_e8c9;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd42;
               end 
              
          8'sd27/*27:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_439f_9040;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd36;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_43f8_ed10;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd41;
               end 
              
          8'sd28/*28:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_438c_8323;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd35;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_43e2_4be0;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd40;
               end 
              
          8'sd29/*29:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_437f_7a11;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd34;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_43cd_b957;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd39;
               end 
              
          8'sd30/*30:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4368_406c;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd33;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_43bb_0595;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd38;
               end 
              
          8'sd31/*31:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4353_234b;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd32;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_43aa_0513;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd37;
               end 
              
          8'sd32/*32:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_433f_f18a;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd31;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_438c_8323;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd35;
               end 
              
          8'sd33/*33:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_432e_7e7d;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd30;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_437f_7a11;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd34;
               end 
              
          8'sd34/*34:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_431e_a189;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd29;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4368_406c;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd33;
               end 
              
          8'sd35/*35:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4310_35c2;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd28;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4353_234b;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd32;
               end 
              
          8'sd36/*36:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_430d_1999;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd27;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_433f_f18a;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd31;
               end 
              
          8'sd37/*37:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_42ee_5d16;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd26;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_432e_7e7d;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd30;
               end 
              
          8'sd38/*38:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_42d8_b1b7;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd25;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_431e_a189;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd29;
               end 
              
          8'sd39/*39:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_42c4_fea6;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd24;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4310_35c2;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd28;
               end 
              
          8'sd40/*40:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_42b3_160b;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd23;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_42ee_5d16;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd26;
               end 
              
          8'sd41/*41:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_42a2_ce38;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd22;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_42d8_b1b7;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd25;
               end 
              
          8'sd42/*42:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4294_014a;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd21;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_42c4_fea6;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd24;
               end 
              
          8'sd43/*43:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4286_8ccf;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd20;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_42b3_160b;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd23;
               end 
              
          8'sd44/*44:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4274_a2ec;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd19;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_42a2_ce38;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd22;
               end 
              
          8'sd45/*45:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4283_32c8;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd18;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4294_014a;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd21;
               end 
              
          8'sd46/*46:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_424a_2dc8;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd17;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4286_8ccf;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd20;
               end 
              
          8'sd47/*47:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4237_cc87;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd16;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4274_a2ec;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd19;
               end 
              
          8'sd48/*48:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4227_1706;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd15;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_424a_2dc8;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd17;
               end 
              
          8'sd49/*49:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4217_e662;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd14;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4237_cc87;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd16;
               end 
              
          8'sd50/*50:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_420a_1742;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd13;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4227_1706;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd15;
               end 
              
          8'sd51/*51:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_41fb_1304;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd12;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4217_e662;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd14;
               end 
              
          8'sd52/*52:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_41e4_3fd5;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd11;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_420a_1742;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd13;
               end 
              
          8'sd53/*53:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_41cf_7fd9;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd10;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_41fb_1304;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd12;
               end 
              
          8'sd54/*54:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4206_5162;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd9;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_41e4_3fd5;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd11;
               end 
              
          8'sd55/*55:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_41ab_7cb3;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd8;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_41cf_7fd9;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd10;
               end 
              
          8'sd56/*56:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_419b_e5ba;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd7;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_41ab_7cb3;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd8;
               end 
              
          8'sd57/*57:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_418d_b992;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd6;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_419b_e5ba;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd7;
               end 
              
          8'sd58/*58:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4180_d73f;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd5;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_418d_b992;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd6;
               end 
              
          8'sd59/*59:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_416a_418a;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd4;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4180_d73f;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd5;
               end 
              
          8'sd60/*60:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4154_f5c3;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd3;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_416a_418a;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd4;
               end 
              
          8'sd61/*61:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4141_999a;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd2;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4154_f5c3;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd3;
               end 
              
          8'sd62/*62:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_4130_0000;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd1;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4141_999a;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd2;
               end 
              
          8'sd63/*63:xpc10nz*/:  begin 
               A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h_41a0_0000;
               A_FPS_CC_SCALbx36_ARB0_AD0 = 32'd0;
               A_FPS_CC_SCALbx46_ARG0_WRD0 = 32'h_4130_0000;
               A_FPS_CC_SCALbx46_ARG0_AD0 = 32'd1;
               end 
              endcase
      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8))  begin if ((xpc10nz==8'sd67/*67:xpc10nz*/))  begin 
                   A_FPS_CC_SCALbx34_ARA0_WRD0 = 32'h_3f80_0000;
                   A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP));

                   end 
                   end 
           else if ((xpc10nz==8'sd77/*77:xpc10nz*/))  begin 
                   A_FPS_CC_SCALbx40_ARD0_WRD0 = 32'h_402d_70a4;
                   A_FPS_CC_SCALbx40_ARD0_AD0 = 32'd7;
                   end 
                  if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)) 
          case (xpc10nz)
              8'sd77/*77:xpc10nz*/:  begin 
                   fpcvt10_arg = luTest_T404_Main_T404_Main_V_3_GP;
                   fpcvt12_arg = luTest_T404_Main_T404_Main_V_1_GP;
                   end 
                  
              8'sd79/*79:xpc10nz*/:  begin 
                   CVFPMULTIPLIER10_A1 = ((xpc10nz==8'sd79/*79:xpc10nz*/)? fpcvt10_result: fpcvt10RRh10hold);
                   CVFPMULTIPLIER10_A0 = 32'h_4000_0000;
                   CVFPMULTIPLIER12_A1 = ((xpc10nz==8'sd79/*79:xpc10nz*/)? fpcvt12_result: fpcvt12RRh10hold);
                   CVFPMULTIPLIER12_A0 = 32'h_4120_0000;
                   end 
                  
              8'sd83/*83:xpc10nz*/:  begin 
                   CVFPADDER10_A1 = ((xpc10nz==8'sd83/*83:xpc10nz*/)? CVFPMULTIPLIER12_FPRR: CVFPMULTIPLIER12RRh10hold);
                   CVFPADDER10_A0 = ((xpc10nz==8'sd83/*83:xpc10nz*/)? CVFPMULTIPLIER10_FPRR: CVFPMULTIPLIER10RRh10hold);
                   end 
                  
              8'sd87/*87:xpc10nz*/:  begin 
                   CVFPADDER12_A1 = ((xpc10nz==8'sd87/*87:xpc10nz*/)? CVFPADDER10_FPRR: CVFPADDER10RRh10hold);
                   CVFPADDER12_A0 = 32'h_3f80_0000;
                   end 
                  
              8'sd91/*91:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx40_ARD0_WRD0 = ((xpc10nz==8'sd91/*91:xpc10nz*/)? CVFPADDER12_FPRR: CVFPADDER12RRh10hold);
                   A_FPS_CC_SCALbx40_ARD0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;
                   end 
                  endcase
           else 
          case (xpc10nz)
              8'sd96/*96:xpc10nz*/:  A_FPS_CC_SCALbx40_ARD0_AD0 = 32'd0;

              8'sd97/*97:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx42_ARE0_WRD0 = ((xpc10nz==8'sd97/*97:xpc10nz*/)? A_FPS_CC_SCALbx40_ARD0_RDD0: FPSCCSCALbx40ARD0RRh10hold
                  );

                   A_FPS_CC_SCALbx42_ARE0_AD0 = 32'd0;
                   end 
                  endcase
      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd94/*94:xpc10nz*/))  A_FPS_CC_SCALbx40_ARD0_AD0 = luTest_T404_Main_T404_Main_V_3_GP
          ;

          if ((luTest_T404_Main_T404_Main_V_3_GP<32'sh8)) 
          case (xpc10nz)
              8'sd100/*100:xpc10nz*/:  A_FPS_CC_SCALbx42_ARE0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;

              8'sd104/*104:xpc10nz*/:  A_FPS_CC_SCALbx44_ARF0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;

              8'sd108/*108:xpc10nz*/:  A_FPS_CC_SCALbx48_ARH0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;

              8'sd111/*111:xpc10nz*/:  A_FPS_CC_SCALbx48_ARH0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;
          endcase
          if ((T404_MatrixLib_mpx_1_23_V_2_GP>=32'sh8))  begin if ((xpc10nz==8'sd113/*113:xpc10nz*/))  begin 
                   A_FPS_CC_SCALbx48_ARH0_WRD0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   A_FPS_CC_SCALbx48_ARH0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;
                   end 
                   end 
           else 
          case (xpc10nz)
              8'sd113/*113:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx46_ARG0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP)+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
                  ));

                   A_FPS_CC_SCALbx44_ARF0_AD0 = T404_MatrixLib_mpx_1_23_V_2_GP;
                   end 
                  
              8'sd114/*114:xpc10nz*/:  begin 
                   CVFPMULTIPLIER14_A1 = ((xpc10nz==8'sd114/*114:xpc10nz*/)? A_FPS_CC_SCALbx44_ARF0_RDD0: FPSCCSCALbx44ARF0RRh10hold);
                   CVFPMULTIPLIER14_A0 = ((xpc10nz==8'sd114/*114:xpc10nz*/)? A_FPS_CC_SCALbx46_ARG0_RDD0: FPSCCSCALbx46ARG0RRh10hold);
                   end 
                  
              8'sd118/*118:xpc10nz*/:  begin 
                   CVFPADDER14_A1 = ((xpc10nz==8'sd118/*118:xpc10nz*/)? CVFPMULTIPLIER14_FPRR: CVFPMULTIPLIER14RRh10hold);
                   CVFPADDER14_A0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   end 
                  endcase
      if ((T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8)) 
          case (xpc10nz)
              8'sd124/*124:xpc10nz*/:  A_FPS_CC_SCALbx42_ARE0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;

              8'sd134/*134:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP));

                   CVFPADDER18_A1 = 32'sh_8000_0000^T404_MatrixLib_mpx_1_23_V_1_GP;
                   CVFPADDER18_A0 = ((xpc10nz==8'sd134/*134:xpc10nz*/)? A_FPS_CC_SCALbx42_ARE0_RDD0: FPSCCSCALbx42ARE0RRh10hold);
                   end 
                  
              8'sd138/*138:xpc10nz*/:  begin 
                   CVFPDIVIDER10_DD = ((xpc10nz==8'sd135/*135:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold);
                   CVFPDIVIDER10_NN = ((xpc10nz==8'sd138/*138:xpc10nz*/)? CVFPADDER18_FPRR: CVFPADDER18RRh10hold);
                   end 
                  
              8'sd143/*143:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx44_ARF0_WRD0 = ((xpc10nz==8'sd143/*143:xpc10nz*/)? CVFPDIVIDER10_FPRR: CVFPDIVIDER10RRh10hold);
                   A_FPS_CC_SCALbx44_ARF0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;
                   end 
                  endcase
           else 
          case (xpc10nz)
              8'sd124/*124:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP)+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
                  ));

                   A_FPS_CC_SCALbx44_ARF0_AD0 = T404_MatrixLib_mpx_1_23_V_2_GP;
                   end 
                  
              8'sd125/*125:xpc10nz*/:  begin 
                   CVFPMULTIPLIER16_A1 = ((xpc10nz==8'sd125/*125:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold);
                   CVFPMULTIPLIER16_A0 = ((xpc10nz==8'sd125/*125:xpc10nz*/)? A_FPS_CC_SCALbx44_ARF0_RDD0: FPSCCSCALbx44ARF0RRh10hold);
                   end 
                  
              8'sd129/*129:xpc10nz*/:  begin 
                   CVFPADDER16_A1 = ((xpc10nz==8'sd129/*129:xpc10nz*/)? CVFPMULTIPLIER16_FPRR: CVFPMULTIPLIER16RRh10hold);
                   CVFPADDER16_A0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   end 
                  endcase
      if ((T404_MatrixLib_mpx_1_23_V_2_GP>=luTest_T404_Main_T404_Main_V_3_GP)) 
          case (xpc10nz)
              8'sd145/*145:xpc10nz*/:  A_FPS_CC_SCALbx40_ARD0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;

              8'sd155/*155:xpc10nz*/:  begin 
                   CVFPADDER20_A1 = 32'sh_8000_0000^T404_MatrixLib_mpx_1_23_V_1_GP;
                   CVFPADDER20_A0 = ((xpc10nz==8'sd155/*155:xpc10nz*/)? A_FPS_CC_SCALbx40_ARD0_RDD0: FPSCCSCALbx40ARD0RRh10hold);
                   end 
                  
              8'sd159/*159:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx42_ARE0_WRD0 = ((xpc10nz==8'sd159/*159:xpc10nz*/)? CVFPADDER20_FPRR: CVFPADDER20RRh10hold);
                   A_FPS_CC_SCALbx42_ARE0_AD0 = luTest_T404_Main_T404_Main_V_3_GP;
                   end 
                  endcase
           else 
          case (xpc10nz)
              8'sd145/*145:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP)+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
                  ));

                   A_FPS_CC_SCALbx42_ARE0_AD0 = T404_MatrixLib_mpx_1_23_V_2_GP;
                   end 
                  
              8'sd146/*146:xpc10nz*/:  begin 
                   CVFPMULTIPLIER18_A1 = ((xpc10nz==8'sd146/*146:xpc10nz*/)? A_FPS_CC_SCALbx34_ARA0_RDD0: FPSCCSCALbx34ARA0RRh10hold);
                   CVFPMULTIPLIER18_A0 = ((xpc10nz==8'sd146/*146:xpc10nz*/)? A_FPS_CC_SCALbx42_ARE0_RDD0: FPSCCSCALbx42ARE0RRh10hold);
                   end 
                  
              8'sd150/*150:xpc10nz*/:  begin 
                   CVFPADDER20_A1 = ((xpc10nz==8'sd150/*150:xpc10nz*/)? CVFPMULTIPLIER18_FPRR: CVFPMULTIPLIER18RRh10hold);
                   CVFPADDER20_A0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   end 
                  endcase
      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd161/*161:xpc10nz*/))  A_FPS_CC_SCALbx38_ARC0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
          )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP));

          if ((T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8))  begin if ((xpc10nz==8'sd165/*165:xpc10nz*/))  begin 
                   A_FPS_CC_SCALbx38_ARC0_WRD0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   A_FPS_CC_SCALbx38_ARC0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP));

                   end 
                   end 
           else 
          case (xpc10nz)
              8'sd165/*165:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));

                   A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP)+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP
                  ));

                   end 
                  
              8'sd166/*166:xpc10nz*/:  begin 
                   CVFPMULTIPLIER20_A1 = ((xpc10nz==8'sd166/*166:xpc10nz*/)? A_FPS_CC_SCALbx34_ARA0_RDD0: FPSCCSCALbx34ARA0RRh10hold);
                   CVFPMULTIPLIER20_A0 = ((xpc10nz==8'sd166/*166:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold);
                   end 
                  
              8'sd170/*170:xpc10nz*/:  begin 
                   CVFPADDER18_A1 = ((xpc10nz==8'sd170/*170:xpc10nz*/)? CVFPMULTIPLIER20_FPRR: CVFPMULTIPLIER20RRh10hold);
                   CVFPADDER18_A0 = T404_MatrixLib_mpx_1_23_V_1_GP;
                   end 
                  endcase
      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)) 
          case (xpc10nz)
              8'sd176/*176:xpc10nz*/:  A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
              )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP));


              8'sd179/*179:xpc10nz*/:  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
              )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP));

          endcase
          if ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8)) 
          case (xpc10nz)
              8'sd182/*182:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx34_ARA0_WRD0 = 32'h_3f80_0000;
                   A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP)+64'sh8*rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP
                  ));

                   end 
                  
              8'sd184/*184:xpc10nz*/:  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
              )+64'sh8*rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));


              8'sd185/*185:xpc10nz*/:  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP
              )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP));


              8'sd186/*186:xpc10nz*/:  begin 
                   CVFPDIVIDER12_DD = ((xpc10nz==8'sd186/*186:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh12hold);
                   CVFPDIVIDER12_NN = ((xpc10nz==8'sd185/*185:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold);
                   end 
                  
              8'sd191/*191:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx36_ARB0_WRD0 = 32'h0;
                   A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));

                   A_FPS_CC_SCALbx34_ARA0_WRD0 = ((xpc10nz==8'sd191/*191:xpc10nz*/)? CVFPDIVIDER12_FPRR: CVFPDIVIDER12RRh10hold);
                   A_FPS_CC_SCALbx34_ARA0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP)+64'sh8
                  *rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));

                   end 
                  endcase
          if ((luTest_T404_Main_T404_Main_V_1_GP<32'sd8)) 
          case (xpc10nz)
              8'sd193/*193:xpc10nz*/:  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP
              )+64'sh8*rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));


              8'sd194/*194:xpc10nz*/:  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP
              )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP));


              8'sd195/*195:xpc10nz*/:  begin 
                   CVFPMULTIPLIER20_A1 = 32'sh_8000_0000^T404_MatrixLib_mpx_1_23_V_1_GP;
                   CVFPMULTIPLIER20_A0 = ((xpc10nz==8'sd195/*195:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold);
                   end 
                  
              8'sd199/*199:xpc10nz*/:  begin 
                   CVFPADDER16_A1 = ((xpc10nz==8'sd199/*199:xpc10nz*/)? CVFPMULTIPLIER20_FPRR: CVFPMULTIPLIER20RRh10hold);
                   CVFPADDER16_A0 = ((xpc10nz==8'sd194/*194:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh12hold);
                   end 
                  
              8'sd203/*203:xpc10nz*/:  begin 
                   A_FPS_CC_SCALbx36_ARB0_WRD0 = ((xpc10nz==8'sd203/*203:xpc10nz*/)? CVFPADDER16_FPRR: CVFPADDER16RRh10hold);
                   A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_1_GP)+64'sh8
                  *rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP));

                   end 
                  endcase
          if ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd205/*205:xpc10nz*/))  A_FPS_CC_SCALbx36_ARB0_AD0 = rtl_signed_bitextract0(rtl_unsigned_extend1(T404_MatrixLib_mpx_1_23_V_2_GP
          )+64'sh8*rtl_unsigned_extend1(luTest_T404_Main_T404_Main_V_3_GP));

          if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd3) && (xpc10nz==8'sd74/*74:xpc10nz*/))  KppWaypoint0 = "ThreeTestsFinished";
          if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd8) && (xpc10nz==8'sd73/*73:xpc10nz*/))  KppWaypoint0 = "Coefficients Created";
          if ((xpc10nz==8'sd0/*0:xpc10nz*/))  KppWaypoint0 = "Start";
           end 
      

 always   @(posedge clk )  begin 
      //Start structure HPR csharp/lu-decomp-sp
      if (reset)  begin 
               A_SINT_CC_SCALbx10_SCALARA0_0 <= 32'd0;
               xpc12nz <= 32'd0;
               out_idx <= 32'd0;
               out_data <= 32'd0;
               luTest_T404_Main_T404_Main_V_1_GP <= 32'd0;
               design_serial_number <= 32'd0;
               pio_address <= 32'd0;
               pio_rdata <= 32'd0;
               T404_MatrixLib_mpx_1_23_V_1_GP <= 32'd0;
               runstate <= 32'd0;
               luTest_T404_Main_T404_Main_V_3_GP <= 32'd0;
               T404_MatrixLib_mpx_1_23_V_2_GP <= 32'd0;
               fpcvt10RRh10hold <= 32'd0;
               fpcvt10RRh10shot1 <= 32'd0;
               fpcvt12RRh10hold <= 32'd0;
               fpcvt12RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER10RRh10hold <= 32'd0;
               CVFPMULTIPLIER10RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER10RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER10RRh10shot3 <= 32'd0;
               CVFPMULTIPLIER12RRh10hold <= 32'd0;
               CVFPMULTIPLIER12RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER12RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER12RRh10shot3 <= 32'd0;
               CVFPADDER10RRh10hold <= 32'd0;
               CVFPADDER10RRh10shot1 <= 32'd0;
               CVFPADDER10RRh10shot2 <= 32'd0;
               CVFPADDER10RRh10shot3 <= 32'd0;
               CVFPADDER12RRh10hold <= 32'd0;
               CVFPADDER12RRh10shot1 <= 32'd0;
               CVFPADDER12RRh10shot2 <= 32'd0;
               CVFPADDER12RRh10shot3 <= 32'd0;
               FPSCCSCALbx48ARH0RRh10hold <= 32'd0;
               FPSCCSCALbx46ARG0RRh10hold <= 32'd0;
               CVFPMULTIPLIER14RRh10hold <= 32'd0;
               CVFPMULTIPLIER14RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER14RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER14RRh10shot3 <= 32'd0;
               CVFPADDER14RRh10hold <= 32'd0;
               CVFPADDER14RRh10shot1 <= 32'd0;
               CVFPADDER14RRh10shot2 <= 32'd0;
               CVFPADDER14RRh10shot3 <= 32'd0;
               CVFPDIVIDER10RRh10hold <= 32'd0;
               CVFPDIVIDER10RRh10shot1 <= 32'd0;
               CVFPDIVIDER10RRh10shot2 <= 32'd0;
               CVFPDIVIDER10RRh10shot3 <= 32'd0;
               CVFPDIVIDER10RRh10shot4 <= 32'd0;
               FPSCCSCALbx44ARF0RRh10hold <= 32'd0;
               CVFPMULTIPLIER16RRh10hold <= 32'd0;
               CVFPMULTIPLIER16RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER16RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER16RRh10shot3 <= 32'd0;
               FPSCCSCALbx40ARD0RRh10hold <= 32'd0;
               FPSCCSCALbx42ARE0RRh10hold <= 32'd0;
               CVFPMULTIPLIER18RRh10hold <= 32'd0;
               CVFPMULTIPLIER18RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER18RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER18RRh10shot3 <= 32'd0;
               CVFPADDER20RRh10hold <= 32'd0;
               CVFPADDER20RRh10shot1 <= 32'd0;
               CVFPADDER20RRh10shot2 <= 32'd0;
               CVFPADDER20RRh10shot3 <= 32'd0;
               FPSCCSCALbx38ARC0RRh10hold <= 32'd0;
               CVFPADDER18RRh10hold <= 32'd0;
               CVFPADDER18RRh10shot1 <= 32'd0;
               CVFPADDER18RRh10shot2 <= 32'd0;
               CVFPADDER18RRh10shot3 <= 32'd0;
               FPSCCSCALbx34ARA0RRh10hold <= 32'd0;
               CVFPDIVIDER12RRh10hold <= 32'd0;
               CVFPDIVIDER12RRh10shot1 <= 32'd0;
               CVFPDIVIDER12RRh10shot2 <= 32'd0;
               CVFPDIVIDER12RRh10shot3 <= 32'd0;
               CVFPDIVIDER12RRh10shot4 <= 32'd0;
               FPSCCSCALbx36ARB0RRh10hold <= 32'd0;
               CVFPMULTIPLIER20RRh10hold <= 32'd0;
               CVFPMULTIPLIER20RRh10shot1 <= 32'd0;
               CVFPMULTIPLIER20RRh10shot2 <= 32'd0;
               CVFPMULTIPLIER20RRh10shot3 <= 32'd0;
               CVFPADDER16RRh10hold <= 32'd0;
               CVFPADDER16RRh10shot1 <= 32'd0;
               CVFPADDER16RRh10shot2 <= 32'd0;
               CVFPADDER16RRh10shot3 <= 32'd0;
               FPSCCSCALbx36ARB0RRh12hold <= 32'd0;
               FPSCCSCALbx36ARB0RRh12shot0 <= 32'd0;
               CVFPADDER16RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER20RRh10shot0 <= 32'd0;
               FPSCCSCALbx36ARB0RRh10shot0 <= 32'd0;
               CVFPDIVIDER12RRh10shot0 <= 32'd0;
               FPSCCSCALbx34ARA0RRh10shot0 <= 32'd0;
               CVFPADDER18RRh10shot0 <= 32'd0;
               FPSCCSCALbx38ARC0RRh10shot0 <= 32'd0;
               CVFPADDER20RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER18RRh10shot0 <= 32'd0;
               FPSCCSCALbx42ARE0RRh10shot0 <= 32'd0;
               FPSCCSCALbx40ARD0RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER16RRh10shot0 <= 32'd0;
               FPSCCSCALbx44ARF0RRh10shot0 <= 32'd0;
               CVFPDIVIDER10RRh10shot0 <= 32'd0;
               CVFPADDER14RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER14RRh10shot0 <= 32'd0;
               FPSCCSCALbx46ARG0RRh10shot0 <= 32'd0;
               FPSCCSCALbx48ARH0RRh10shot0 <= 32'd0;
               CVFPADDER12RRh10shot0 <= 32'd0;
               CVFPADDER10RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER12RRh10shot0 <= 32'd0;
               CVFPMULTIPLIER10RRh10shot0 <= 32'd0;
               fpcvt12RRh10shot0 <= 32'd0;
               fpcvt10RRh10shot0 <= 32'd0;
               xpc10nz <= 32'd0;
               end 
               else  begin 
              if ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd206/*206:xpc10nz*/)) $write(" %F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                  ==8'sd206/*206:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh12hold))));
                  if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8))  begin if ((xpc10nz==8'sd180/*180:xpc10nz*/)) $write(" %F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                      ==8'sd180/*180:xpc10nz*/)? A_FPS_CC_SCALbx36_ARB0_RDD0: FPSCCSCALbx36ARB0RRh10hold))));
                       end 
                   else if ((xpc10nz==8'sd179/*179:xpc10nz*/)) $display("");
                      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8))  begin if ((xpc10nz==8'sd177/*177:xpc10nz*/)) $write(" %F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                      ==8'sd177/*177:xpc10nz*/)? A_FPS_CC_SCALbx34_ARA0_RDD0: FPSCCSCALbx34ARA0RRh10hold))));
                       end 
                   else if ((xpc10nz==8'sd176/*176:xpc10nz*/)) $display("");
                      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8))  begin if ((xpc10nz==8'sd162/*162:xpc10nz*/)) $write(" %F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                      ==8'sd162/*162:xpc10nz*/)? A_FPS_CC_SCALbx38_ARC0_RDD0: FPSCCSCALbx38ARC0RRh10hold))));
                       end 
                   else if ((xpc10nz==8'sd161/*161:xpc10nz*/)) $display("");
                      if ((xpc10nz==8'sd110/*110:xpc10nz*/)) $display("}");
                  if ((luTest_T404_Main_T404_Main_V_3_GP<32'sh8))  begin if ((xpc10nz==8'sd109/*109:xpc10nz*/)) $write("%F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                      ==8'sd109/*109:xpc10nz*/)? A_FPS_CC_SCALbx48_ARH0_RDD0: FPSCCSCALbx48ARH0RRh10hold))));
                       end 
                   else if ((xpc10nz==8'sd107/*107:xpc10nz*/)) $write("{");
                      if ((xpc10nz==8'sd106/*106:xpc10nz*/))  begin 
                      $display("}");
                      $write("Substitute back - rhs given by solution is: y=");
                       end 
                      if ((luTest_T404_Main_T404_Main_V_3_GP<32'sh8) && (xpc10nz==8'sd105/*105:xpc10nz*/)) $write("%F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                  ==8'sd105/*105:xpc10nz*/)? A_FPS_CC_SCALbx44_ARF0_RDD0: FPSCCSCALbx44ARF0RRh10hold))));
                  if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd0) && (xpc10nz==8'sd103/*103:xpc10nz*/))  begin 
                      $write("After back subst=");
                      $write("{");
                       end 
                      if ((xpc10nz==8'sd102/*102:xpc10nz*/)) $display("}");
                  if ((luTest_T404_Main_T404_Main_V_3_GP<32'sh8) && (xpc10nz==8'sd101/*101:xpc10nz*/)) $write("%F ", $bitstoreal(hpr_flt2dbl2(((xpc10nz
                  ==8'sd101/*101:xpc10nz*/)? A_FPS_CC_SCALbx42_ARE0_RDD0: FPSCCSCALbx42ARE0RRh10hold))));
                  if ((luTest_T404_Main_T404_Main_V_3_GP>=32'sd8))  begin if ((xpc10nz==8'sd99/*99:xpc10nz*/))  begin 
                          $write("After fwds subst=");
                          $write("{");
                           end 
                           end 
                   else if ((xpc10nz==8'sd95/*95:xpc10nz*/)) $display("  test=%1d  target_rhs [%1d] == %F", luTest_T404_Main_T404_Main_V_1_GP
                      , luTest_T404_Main_T404_Main_V_3_GP, $bitstoreal(hpr_flt2dbl2(((xpc10nz==8'sd95/*95:xpc10nz*/)? A_FPS_CC_SCALbx40_ARD0_RDD0
                      : FPSCCSCALbx40ARD0RRh10hold))));
                      if ((xpc10nz==8'sd74/*74:xpc10nz*/)) if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd3)) $display("Kiwi L/U demo - L/U decomposition demo complete at %1d."
                      , $time);
                       else $display("\nKiwi L/U demo - L/U decomposition test with rhs no %1d.", luTest_T404_Main_T404_Main_V_1_GP);
                  if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd8))  begin if ((xpc10nz==8'sd73/*73:xpc10nz*/))  begin 
                          $display("");
                          $display("Kiwi L/U demo - coefficient matrix decomposed.");
                           end 
                           end 
                   else if ((xpc10nz==8'sd73/*73:xpc10nz*/)) $write("    ");
                      if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd8))  begin if ((xpc10nz==8'sd71/*71:xpc10nz*/))  begin 
                          $display("");
                          $display("Recombine LL and RR: Should result in the original:");
                           end 
                           end 
                   else if ((xpc10nz==8'sd71/*71:xpc10nz*/)) $write("    ");
                      if ((luTest_T404_Main_T404_Main_V_1_GP>=32'sd8))  begin if ((xpc10nz==8'sd70/*70:xpc10nz*/))  begin 
                          $display("");
                          $display("LL=");
                           end 
                           end 
                   else if ((xpc10nz==8'sd70/*70:xpc10nz*/)) $write("    ");
                      if ((luTest_T404_Main_T404_Main_V_3_GP>=32'sd8) && (xpc10nz==8'sd69/*69:xpc10nz*/)) $display("UU=");
                  
              case (xpc10nz)
                  8'sd0/*0:xpc10nz*/:  begin 
                      $display("Kiwi Demo - L/U decomposition");
                      $display("Kiwi L/U demo - L/U decomposition target_rhs generated.");
                      $display("L/U Decomposition - single-threaded version.\n");
                      $display("Initial Coefficient Matrix Pre L/U Decomposition:\n");
                      $write("    ");
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_41a0_0000)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_4130_0000)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_4141_999a)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_4154_f5c3)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_416a_418a)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_4180_d73f)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_418d_b992)));
                      $write(" %F ", $bitstoreal(hpr_flt2dbl2(32'h_419b_e5ba)));
                       end 
                      
                  8'sd65/*65:xpc10nz*/: $display("");

                  8'sd66/*66:xpc10nz*/: if ((luTest_T404_Main_T404_Main_V_3_GP>=32'sd7)) $display("");
                       else $write("    ");
              endcase
              if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)) 
                  case (xpc10nz)
                      8'sd67/*67:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd68/*68:xpc10nz*/;
                           end 
                          
                      8'sd69/*69:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd0;
                           xpc10nz <= 8'sd182/*182:xpc10nz*/;
                           end 
                          
                      8'sd77/*77:xpc10nz*/:  xpc10nz <= 8'sd78/*78:xpc10nz*/;

                      8'sd91/*91:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd94/*94:xpc10nz*/:  xpc10nz <= 8'sd95/*95:xpc10nz*/;

                      8'sd95/*95:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd99/*99:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= 32'h0;
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd0;
                           xpc10nz <= 8'sd145/*145:xpc10nz*/;
                           end 
                          
                      8'sd161/*161:xpc10nz*/:  xpc10nz <= 8'sd162/*162:xpc10nz*/;

                      8'sd162/*162:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd164/*164:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= 32'h0;
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd0;
                           xpc10nz <= 8'sd165/*165:xpc10nz*/;
                           end 
                          
                      8'sd176/*176:xpc10nz*/:  xpc10nz <= 8'sd177/*177:xpc10nz*/;

                      8'sd177/*177:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd179/*179:xpc10nz*/:  xpc10nz <= 8'sd180/*180:xpc10nz*/;

                      8'sd180/*180:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                  endcase
                   else 
                  case (xpc10nz)
                      8'sd67/*67:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd69/*69:xpc10nz*/;
                           end 
                          
                      8'sd69/*69:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd0;
                           xpc10nz <= 8'sd70/*70:xpc10nz*/;
                           end 
                          
                      8'sd77/*77:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd93/*93:xpc10nz*/;
                           end 
                          
                      8'sd94/*94:xpc10nz*/:  xpc10nz <= 8'sd96/*96:xpc10nz*/;

                      8'sd97/*97:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1;

                      8'sd99/*99:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd100/*100:xpc10nz*/;
                           end 
                          
                      8'sd161/*161:xpc10nz*/:  xpc10nz <= 8'sd163/*163:xpc10nz*/;

                      8'sd164/*164:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                           xpc10nz <= 8'sd72/*72:xpc10nz*/;
                           end 
                          
                      8'sd176/*176:xpc10nz*/:  xpc10nz <= 8'sd178/*178:xpc10nz*/;

                      8'sd179/*179:xpc10nz*/:  xpc10nz <= 8'sd181/*181:xpc10nz*/;
                  endcase
              if ((luTest_T404_Main_T404_Main_V_1_GP<32'sd8)) 
                  case (xpc10nz)
                      8'sd70/*70:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd179/*179:xpc10nz*/;
                           end 
                          
                      8'sd71/*71:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd176/*176:xpc10nz*/;
                           end 
                          
                      8'sd72/*72:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd164/*164:xpc10nz*/;
                           end 
                          
                      8'sd73/*73:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd161/*161:xpc10nz*/;
                           end 
                          
                      8'sd193/*193:xpc10nz*/:  xpc10nz <= 8'sd194/*194:xpc10nz*/;

                      8'sd203/*203:xpc10nz*/:  luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                  endcase
                   else 
                  case (xpc10nz)
                      8'sd70/*70:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd0;
                           xpc10nz <= 8'sd71/*71:xpc10nz*/;
                           end 
                          
                      8'sd71/*71:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd0;
                           xpc10nz <= 8'sd72/*72:xpc10nz*/;
                           end 
                          
                      8'sd72/*72:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd0;
                           xpc10nz <= 8'sd73/*73:xpc10nz*/;
                           end 
                          
                      8'sd73/*73:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd0;
                           runstate <= 32'sd5;
                           xpc10nz <= 8'sd74/*74:xpc10nz*/;
                           end 
                          
                      8'sd193/*193:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           xpc10nz <= 8'sd184/*184:xpc10nz*/;
                           end 
                          endcase
              if ((luTest_T404_Main_T404_Main_V_3_GP<32'sh8)) 
                  case (xpc10nz)
                      8'sd100/*100:xpc10nz*/:  xpc10nz <= 8'sd101/*101:xpc10nz*/;

                      8'sd101/*101:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd104/*104:xpc10nz*/:  xpc10nz <= 8'sd105/*105:xpc10nz*/;

                      8'sd105/*105:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd107/*107:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= 32'h0;
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd0;
                           xpc10nz <= 8'sd113/*113:xpc10nz*/;
                           end 
                          
                      8'sd108/*108:xpc10nz*/:  xpc10nz <= 8'sd109/*109:xpc10nz*/;

                      8'sd109/*109:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd111/*111:xpc10nz*/:  xpc10nz <= 8'sd112/*112:xpc10nz*/;

                      8'sd112/*112:xpc10nz*/:  begin 
                           out_idx <= luTest_T404_Main_T404_Main_V_3_GP;
                           out_data <= ((xpc10nz==8'sd112/*112:xpc10nz*/)? A_FPS_CC_SCALbx48_ARH0_RDD0: FPSCCSCALbx48ARH0RRh10hold);
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           end 
                          endcase
                   else 
                  case (xpc10nz)
                      8'sd100/*100:xpc10nz*/:  xpc10nz <= 8'sd102/*102:xpc10nz*/;

                      8'sd104/*104:xpc10nz*/:  xpc10nz <= 8'sd106/*106:xpc10nz*/;

                      8'sd107/*107:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd108/*108:xpc10nz*/;
                           end 
                          
                      8'sd108/*108:xpc10nz*/:  xpc10nz <= 8'sd110/*110:xpc10nz*/;

                      8'sd111/*111:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                           xpc10nz <= 8'sd74/*74:xpc10nz*/;
                           end 
                          endcase
              if ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8)) 
                  case (xpc10nz)
                      8'sd124/*124:xpc10nz*/:  xpc10nz <= 8'sd125/*125:xpc10nz*/;

                      8'sd133/*133:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= ((xpc10nz==8'sd133/*133:xpc10nz*/)? CVFPADDER16_FPRR: CVFPADDER16RRh10hold
                          );

                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           end 
                          
                      8'sd165/*165:xpc10nz*/:  xpc10nz <= 8'sd166/*166:xpc10nz*/;

                      8'sd174/*174:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= ((xpc10nz==8'sd174/*174:xpc10nz*/)? CVFPADDER18_FPRR: CVFPADDER18RRh10hold
                          );

                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           end 
                          
                      8'sd182/*182:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           xpc10nz <= 8'sd183/*183:xpc10nz*/;
                           end 
                          
                      8'sd184/*184:xpc10nz*/:  xpc10nz <= 8'sd185/*185:xpc10nz*/;

                      8'sd191/*191:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           T404_MatrixLib_mpx_1_23_V_1_GP <= ((xpc10nz==8'sd191/*191:xpc10nz*/)? CVFPDIVIDER12_FPRR: CVFPDIVIDER12RRh10hold
                          );

                           end 
                          
                      8'sd205/*205:xpc10nz*/:  xpc10nz <= 8'sd206/*206:xpc10nz*/;

                      8'sd206/*206:xpc10nz*/:  T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                  endcase
                   else 
                  case (xpc10nz)
                      8'sd124/*124:xpc10nz*/:  xpc10nz <= 8'sd134/*134:xpc10nz*/;

                      8'sd143/*143:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= -32'sd1+luTest_T404_Main_T404_Main_V_3_GP;

                      8'sd165/*165:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd175/*175:xpc10nz*/;
                           end 
                          
                      8'sd182/*182:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd184/*184:xpc10nz*/;
                           end 
                          
                      8'sd184/*184:xpc10nz*/:  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd69/*69:xpc10nz*/;
                           end 
                          
                      8'sd205/*205:xpc10nz*/:  xpc10nz <= 8'sd65/*65:xpc10nz*/;
                  endcase
              if ((xpc10nz==8'sd0/*0:xpc10nz*/))  begin 
                       design_serial_number <= 32'sh22_1102;
                       pio_address <= 32'sd0;
                       pio_rdata <= 32'sd0;
                       T404_MatrixLib_mpx_1_23_V_1_GP <= 32'h_458b_4f5d;
                       runstate <= 32'sd4;
                       luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                       T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd8;
                       xpc10nz <= 8'sd1/*1:xpc10nz*/;
                       end 
                      if (FPSCCSCALbx36ARB0RRh10shot0)  begin 
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh10hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       end 
                      
              case (xpc10nz)
                  8'sd66/*66:xpc10nz*/: if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd7))  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd0;
                           xpc10nz <= 8'sd205/*205:xpc10nz*/;
                           end 
                           else  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd67/*67:xpc10nz*/;
                           end 
                          
                  8'sd74/*74:xpc10nz*/: if ((luTest_T404_Main_T404_Main_V_1_GP<32'sd3))  begin 
                           runstate <= 32'sd10+luTest_T404_Main_T404_Main_V_1_GP;
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd77/*77:xpc10nz*/;
                           end 
                           else  begin 
                           runstate <= 32'sd20;
                           xpc10nz <= 8'sd75/*75:xpc10nz*/;
                           end 
                          
                  8'sd103/*103:xpc10nz*/: if ((luTest_T404_Main_T404_Main_V_3_GP<32'sd0))  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                           xpc10nz <= 8'sd104/*104:xpc10nz*/;
                           end 
                           else  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= 32'h0;
                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd124/*124:xpc10nz*/;
                           end 
                          endcase
              if (FPSCCSCALbx36ARB0RRh12shot0)  begin 
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       FPSCCSCALbx36ARB0RRh12hold <= A_FPS_CC_SCALbx36_ARB0_RDD0;
                       end 
                      if (FPSCCSCALbx34ARA0RRh10shot0)  begin 
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       FPSCCSCALbx34ARA0RRh10hold <= A_FPS_CC_SCALbx34_ARA0_RDD0;
                       end 
                      if (FPSCCSCALbx44ARF0RRh10shot0)  begin 
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       FPSCCSCALbx44ARF0RRh10hold <= A_FPS_CC_SCALbx44_ARF0_RDD0;
                       end 
                      if (FPSCCSCALbx42ARE0RRh10shot0)  begin 
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       FPSCCSCALbx42ARE0RRh10hold <= A_FPS_CC_SCALbx42_ARE0_RDD0;
                       end 
                      if ((T404_MatrixLib_mpx_1_23_V_2_GP<luTest_T404_Main_T404_Main_V_3_GP)) 
                  case (xpc10nz)
                      8'sd145/*145:xpc10nz*/:  xpc10nz <= 8'sd146/*146:xpc10nz*/;

                      8'sd154/*154:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= ((xpc10nz==8'sd154/*154:xpc10nz*/)? CVFPADDER20_FPRR: CVFPADDER20RRh10hold
                          );

                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           end 
                          endcase
                   else 
                  case (xpc10nz)
                      8'sd145/*145:xpc10nz*/:  xpc10nz <= 8'sd155/*155:xpc10nz*/;

                      8'sd159/*159:xpc10nz*/:  luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                  endcase
              if ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8)) 
                  case (xpc10nz)
                      8'sd113/*113:xpc10nz*/:  xpc10nz <= 8'sd114/*114:xpc10nz*/;

                      8'sd122/*122:xpc10nz*/:  begin 
                           T404_MatrixLib_mpx_1_23_V_1_GP <= ((xpc10nz==8'sd122/*122:xpc10nz*/)? CVFPADDER14_FPRR: CVFPADDER14RRh10hold
                          );

                           T404_MatrixLib_mpx_1_23_V_2_GP <= 32'sd1+T404_MatrixLib_mpx_1_23_V_2_GP;
                           end 
                          endcase
                   else if ((xpc10nz==8'sd113/*113:xpc10nz*/))  begin 
                           luTest_T404_Main_T404_Main_V_3_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_3_GP;
                           xpc10nz <= 8'sd123/*123:xpc10nz*/;
                           end 
                          if (CVFPMULTIPLIER20RRh10shot3)  begin 
                       CVFPMULTIPLIER20RRh10hold <= CVFPMULTIPLIER20_FPRR;
                       CVFPMULTIPLIER20RRh10hold <= CVFPMULTIPLIER20_FPRR;
                       CVFPMULTIPLIER20RRh10hold <= CVFPMULTIPLIER20_FPRR;
                       CVFPMULTIPLIER20RRh10hold <= CVFPMULTIPLIER20_FPRR;
                       end 
                      if (CVFPADDER20RRh10shot3)  begin 
                       CVFPADDER20RRh10hold <= CVFPADDER20_FPRR;
                       CVFPADDER20RRh10hold <= CVFPADDER20_FPRR;
                       CVFPADDER20RRh10hold <= CVFPADDER20_FPRR;
                       CVFPADDER20RRh10hold <= CVFPADDER20_FPRR;
                       end 
                      if (CVFPADDER16RRh10shot3)  begin 
                       CVFPADDER16RRh10hold <= CVFPADDER16_FPRR;
                       CVFPADDER16RRh10hold <= CVFPADDER16_FPRR;
                       CVFPADDER16RRh10hold <= CVFPADDER16_FPRR;
                       CVFPADDER16RRh10hold <= CVFPADDER16_FPRR;
                       end 
                      if (CVFPADDER18RRh10shot3)  begin 
                       CVFPADDER18RRh10hold <= CVFPADDER18_FPRR;
                       CVFPADDER18RRh10hold <= CVFPADDER18_FPRR;
                       CVFPADDER18RRh10hold <= CVFPADDER18_FPRR;
                       CVFPADDER18RRh10hold <= CVFPADDER18_FPRR;
                       end 
                      if (FPSCCSCALbx40ARD0RRh10shot0)  begin 
                       FPSCCSCALbx40ARD0RRh10hold <= A_FPS_CC_SCALbx40_ARD0_RDD0;
                       FPSCCSCALbx40ARD0RRh10hold <= A_FPS_CC_SCALbx40_ARD0_RDD0;
                       FPSCCSCALbx40ARD0RRh10hold <= A_FPS_CC_SCALbx40_ARD0_RDD0;
                       FPSCCSCALbx40ARD0RRh10hold <= A_FPS_CC_SCALbx40_ARD0_RDD0;
                       end 
                      
              case (xpc10nz)
                  8'sd106/*106:xpc10nz*/:  begin 
                       luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                       xpc10nz <= 8'sd107/*107:xpc10nz*/;
                       end 
                      
                  8'sd110/*110:xpc10nz*/:  begin 
                       runstate <= 32'sd9;
                       luTest_T404_Main_T404_Main_V_3_GP <= 32'sd0;
                       xpc10nz <= 8'sd111/*111:xpc10nz*/;
                       end 
                      
                  8'sd112/*112:xpc10nz*/:  xpc10nz <= 8'sd111/*111:xpc10nz*/;
              endcase
              if ((xpc12nz==3'sd1/*1:xpc12nz*/))  begin 
                      if (pio_hwen)  A_SINT_CC_SCALbx10_SCALARA0_0 <= pio_wdata;
                           else  pio_rdata <= A_SINT_CC_SCALbx10_SCALARA0_0;
                       xpc12nz <= 3'sd2/*2:xpc12nz*/;
                       end 
                      
              case (xpc10nz)
                  8'sd95/*95:xpc10nz*/:  xpc10nz <= 8'sd94/*94:xpc10nz*/;

                  8'sd101/*101:xpc10nz*/:  xpc10nz <= 8'sd100/*100:xpc10nz*/;

                  8'sd102/*102:xpc10nz*/:  begin 
                       luTest_T404_Main_T404_Main_V_3_GP <= 32'sd7;
                       xpc10nz <= 8'sd103/*103:xpc10nz*/;
                       end 
                      
                  8'sd105/*105:xpc10nz*/:  xpc10nz <= 8'sd104/*104:xpc10nz*/;

                  8'sd109/*109:xpc10nz*/:  xpc10nz <= 8'sd108/*108:xpc10nz*/;

                  8'sd122/*122:xpc10nz*/:  xpc10nz <= 8'sd113/*113:xpc10nz*/;

                  8'sd133/*133:xpc10nz*/:  xpc10nz <= 8'sd124/*124:xpc10nz*/;

                  8'sd154/*154:xpc10nz*/:  xpc10nz <= 8'sd145/*145:xpc10nz*/;

                  8'sd162/*162:xpc10nz*/:  xpc10nz <= 8'sd161/*161:xpc10nz*/;

                  8'sd174/*174:xpc10nz*/:  xpc10nz <= 8'sd165/*165:xpc10nz*/;

                  8'sd177/*177:xpc10nz*/:  xpc10nz <= 8'sd176/*176:xpc10nz*/;

                  8'sd180/*180:xpc10nz*/:  xpc10nz <= 8'sd179/*179:xpc10nz*/;

                  8'sd191/*191:xpc10nz*/:  xpc10nz <= 8'sd192/*192:xpc10nz*/;

                  8'sd206/*206:xpc10nz*/:  xpc10nz <= 8'sd205/*205:xpc10nz*/;
              endcase
              if (CVFPDIVIDER12RRh10shot4)  begin 
                       CVFPDIVIDER12RRh10hold <= CVFPDIVIDER12_FPRR;
                       CVFPDIVIDER12RRh10hold <= CVFPDIVIDER12_FPRR;
                       end 
                      if (FPSCCSCALbx38ARC0RRh10shot0)  begin 
                       FPSCCSCALbx38ARC0RRh10hold <= A_FPS_CC_SCALbx38_ARC0_RDD0;
                       FPSCCSCALbx38ARC0RRh10hold <= A_FPS_CC_SCALbx38_ARC0_RDD0;
                       end 
                      if (CVFPMULTIPLIER18RRh10shot3)  begin 
                       CVFPMULTIPLIER18RRh10hold <= CVFPMULTIPLIER18_FPRR;
                       CVFPMULTIPLIER18RRh10hold <= CVFPMULTIPLIER18_FPRR;
                       end 
                      if (CVFPMULTIPLIER16RRh10shot3)  begin 
                       CVFPMULTIPLIER16RRh10hold <= CVFPMULTIPLIER16_FPRR;
                       CVFPMULTIPLIER16RRh10hold <= CVFPMULTIPLIER16_FPRR;
                       end 
                      if (CVFPDIVIDER10RRh10shot4)  begin 
                       CVFPDIVIDER10RRh10hold <= CVFPDIVIDER10_FPRR;
                       CVFPDIVIDER10RRh10hold <= CVFPDIVIDER10_FPRR;
                       end 
                      if (CVFPADDER14RRh10shot3)  begin 
                       CVFPADDER14RRh10hold <= CVFPADDER14_FPRR;
                       CVFPADDER14RRh10hold <= CVFPADDER14_FPRR;
                       end 
                      if (CVFPMULTIPLIER14RRh10shot3)  begin 
                       CVFPMULTIPLIER14RRh10hold <= CVFPMULTIPLIER14_FPRR;
                       CVFPMULTIPLIER14RRh10hold <= CVFPMULTIPLIER14_FPRR;
                       end 
                      if (FPSCCSCALbx46ARG0RRh10shot0)  begin 
                       FPSCCSCALbx46ARG0RRh10hold <= A_FPS_CC_SCALbx46_ARG0_RDD0;
                       FPSCCSCALbx46ARG0RRh10hold <= A_FPS_CC_SCALbx46_ARG0_RDD0;
                       end 
                      if (FPSCCSCALbx48ARH0RRh10shot0)  begin 
                       FPSCCSCALbx48ARH0RRh10hold <= A_FPS_CC_SCALbx48_ARH0_RDD0;
                       FPSCCSCALbx48ARH0RRh10hold <= A_FPS_CC_SCALbx48_ARH0_RDD0;
                       end 
                      if (CVFPADDER12RRh10shot3)  begin 
                       CVFPADDER12RRh10hold <= CVFPADDER12_FPRR;
                       CVFPADDER12RRh10hold <= CVFPADDER12_FPRR;
                       end 
                      if (CVFPADDER10RRh10shot3)  begin 
                       CVFPADDER10RRh10hold <= CVFPADDER10_FPRR;
                       CVFPADDER10RRh10hold <= CVFPADDER10_FPRR;
                       end 
                      if (CVFPMULTIPLIER12RRh10shot3)  begin 
                       CVFPMULTIPLIER12RRh10hold <= CVFPMULTIPLIER12_FPRR;
                       CVFPMULTIPLIER12RRh10hold <= CVFPMULTIPLIER12_FPRR;
                       end 
                      if (CVFPMULTIPLIER10RRh10shot3)  begin 
                       CVFPMULTIPLIER10RRh10hold <= CVFPMULTIPLIER10_FPRR;
                       CVFPMULTIPLIER10RRh10hold <= CVFPMULTIPLIER10_FPRR;
                       end 
                      if (fpcvt12RRh10shot1)  begin 
                       fpcvt12RRh10hold <= fpcvt12_result;
                       fpcvt12RRh10hold <= fpcvt12_result;
                       end 
                      if (fpcvt10RRh10shot1)  begin 
                       fpcvt10RRh10hold <= fpcvt10_result;
                       fpcvt10RRh10hold <= fpcvt10_result;
                       end 
                      
              case (xpc10nz)
                  8'sd65/*65:xpc10nz*/:  xpc10nz <= 8'sd66/*66:xpc10nz*/;

                  8'sd91/*91:xpc10nz*/:  xpc10nz <= 8'sd92/*92:xpc10nz*/;

                  8'sd97/*97:xpc10nz*/:  xpc10nz <= 8'sd98/*98:xpc10nz*/;

                  8'sd143/*143:xpc10nz*/:  xpc10nz <= 8'sd144/*144:xpc10nz*/;

                  8'sd159/*159:xpc10nz*/:  xpc10nz <= 8'sd160/*160:xpc10nz*/;

                  8'sd163/*163:xpc10nz*/:  begin 
                       luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                       xpc10nz <= 8'sd73/*73:xpc10nz*/;
                       end 
                      
                  8'sd178/*178:xpc10nz*/:  begin 
                       luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                       xpc10nz <= 8'sd71/*71:xpc10nz*/;
                       end 
                      
                  8'sd181/*181:xpc10nz*/:  begin 
                       luTest_T404_Main_T404_Main_V_1_GP <= 32'sd1+luTest_T404_Main_T404_Main_V_1_GP;
                       xpc10nz <= 8'sd70/*70:xpc10nz*/;
                       end 
                      
                  8'sd203/*203:xpc10nz*/:  xpc10nz <= 8'sd204/*204:xpc10nz*/;
              endcase

              case (xpc12nz)
                  3'sd0/*0:xpc12nz*/:  xpc12nz <= 3'sd1/*1:xpc12nz*/;

                  3'sd2/*2:xpc12nz*/:  xpc12nz <= 3'sd3/*3:xpc12nz*/;

                  3'sd3/*3:xpc12nz*/:  xpc12nz <= 3'sd1/*1:xpc12nz*/;
              endcase

              case (xpc10nz)
                  8'sd1/*1:xpc10nz*/:  xpc10nz <= 8'sd2/*2:xpc10nz*/;

                  8'sd2/*2:xpc10nz*/:  xpc10nz <= 8'sd3/*3:xpc10nz*/;

                  8'sd3/*3:xpc10nz*/:  xpc10nz <= 8'sd4/*4:xpc10nz*/;

                  8'sd4/*4:xpc10nz*/:  xpc10nz <= 8'sd5/*5:xpc10nz*/;

                  8'sd5/*5:xpc10nz*/:  xpc10nz <= 8'sd6/*6:xpc10nz*/;

                  8'sd6/*6:xpc10nz*/:  xpc10nz <= 8'sd7/*7:xpc10nz*/;

                  8'sd7/*7:xpc10nz*/:  xpc10nz <= 8'sd8/*8:xpc10nz*/;

                  8'sd8/*8:xpc10nz*/:  xpc10nz <= 8'sd9/*9:xpc10nz*/;

                  8'sd9/*9:xpc10nz*/:  xpc10nz <= 8'sd10/*10:xpc10nz*/;

                  8'sd10/*10:xpc10nz*/:  xpc10nz <= 8'sd11/*11:xpc10nz*/;

                  8'sd11/*11:xpc10nz*/:  xpc10nz <= 8'sd12/*12:xpc10nz*/;

                  8'sd12/*12:xpc10nz*/:  xpc10nz <= 8'sd13/*13:xpc10nz*/;

                  8'sd13/*13:xpc10nz*/:  xpc10nz <= 8'sd14/*14:xpc10nz*/;

                  8'sd14/*14:xpc10nz*/:  xpc10nz <= 8'sd15/*15:xpc10nz*/;

                  8'sd15/*15:xpc10nz*/:  xpc10nz <= 8'sd16/*16:xpc10nz*/;

                  8'sd16/*16:xpc10nz*/:  xpc10nz <= 8'sd17/*17:xpc10nz*/;

                  8'sd17/*17:xpc10nz*/:  xpc10nz <= 8'sd18/*18:xpc10nz*/;

                  8'sd18/*18:xpc10nz*/:  xpc10nz <= 8'sd19/*19:xpc10nz*/;

                  8'sd19/*19:xpc10nz*/:  xpc10nz <= 8'sd20/*20:xpc10nz*/;

                  8'sd20/*20:xpc10nz*/:  xpc10nz <= 8'sd21/*21:xpc10nz*/;

                  8'sd21/*21:xpc10nz*/:  xpc10nz <= 8'sd22/*22:xpc10nz*/;

                  8'sd22/*22:xpc10nz*/:  xpc10nz <= 8'sd23/*23:xpc10nz*/;

                  8'sd23/*23:xpc10nz*/:  xpc10nz <= 8'sd24/*24:xpc10nz*/;

                  8'sd24/*24:xpc10nz*/:  xpc10nz <= 8'sd25/*25:xpc10nz*/;

                  8'sd25/*25:xpc10nz*/:  xpc10nz <= 8'sd26/*26:xpc10nz*/;

                  8'sd26/*26:xpc10nz*/:  xpc10nz <= 8'sd27/*27:xpc10nz*/;

                  8'sd27/*27:xpc10nz*/:  xpc10nz <= 8'sd28/*28:xpc10nz*/;

                  8'sd28/*28:xpc10nz*/:  xpc10nz <= 8'sd29/*29:xpc10nz*/;

                  8'sd29/*29:xpc10nz*/:  xpc10nz <= 8'sd30/*30:xpc10nz*/;

                  8'sd30/*30:xpc10nz*/:  xpc10nz <= 8'sd31/*31:xpc10nz*/;

                  8'sd31/*31:xpc10nz*/:  xpc10nz <= 8'sd32/*32:xpc10nz*/;

                  8'sd32/*32:xpc10nz*/:  xpc10nz <= 8'sd33/*33:xpc10nz*/;

                  8'sd33/*33:xpc10nz*/:  xpc10nz <= 8'sd34/*34:xpc10nz*/;

                  8'sd34/*34:xpc10nz*/:  xpc10nz <= 8'sd35/*35:xpc10nz*/;

                  8'sd35/*35:xpc10nz*/:  xpc10nz <= 8'sd36/*36:xpc10nz*/;

                  8'sd36/*36:xpc10nz*/:  xpc10nz <= 8'sd37/*37:xpc10nz*/;

                  8'sd37/*37:xpc10nz*/:  xpc10nz <= 8'sd38/*38:xpc10nz*/;

                  8'sd38/*38:xpc10nz*/:  xpc10nz <= 8'sd39/*39:xpc10nz*/;

                  8'sd39/*39:xpc10nz*/:  xpc10nz <= 8'sd40/*40:xpc10nz*/;

                  8'sd40/*40:xpc10nz*/:  xpc10nz <= 8'sd41/*41:xpc10nz*/;

                  8'sd41/*41:xpc10nz*/:  xpc10nz <= 8'sd42/*42:xpc10nz*/;

                  8'sd42/*42:xpc10nz*/:  xpc10nz <= 8'sd43/*43:xpc10nz*/;

                  8'sd43/*43:xpc10nz*/:  xpc10nz <= 8'sd44/*44:xpc10nz*/;

                  8'sd44/*44:xpc10nz*/:  xpc10nz <= 8'sd45/*45:xpc10nz*/;

                  8'sd45/*45:xpc10nz*/:  xpc10nz <= 8'sd46/*46:xpc10nz*/;

                  8'sd46/*46:xpc10nz*/:  xpc10nz <= 8'sd47/*47:xpc10nz*/;

                  8'sd47/*47:xpc10nz*/:  xpc10nz <= 8'sd48/*48:xpc10nz*/;

                  8'sd48/*48:xpc10nz*/:  xpc10nz <= 8'sd49/*49:xpc10nz*/;

                  8'sd49/*49:xpc10nz*/:  xpc10nz <= 8'sd50/*50:xpc10nz*/;

                  8'sd50/*50:xpc10nz*/:  xpc10nz <= 8'sd51/*51:xpc10nz*/;

                  8'sd51/*51:xpc10nz*/:  xpc10nz <= 8'sd52/*52:xpc10nz*/;

                  8'sd52/*52:xpc10nz*/:  xpc10nz <= 8'sd53/*53:xpc10nz*/;

                  8'sd53/*53:xpc10nz*/:  xpc10nz <= 8'sd54/*54:xpc10nz*/;

                  8'sd54/*54:xpc10nz*/:  xpc10nz <= 8'sd55/*55:xpc10nz*/;

                  8'sd55/*55:xpc10nz*/:  xpc10nz <= 8'sd56/*56:xpc10nz*/;

                  8'sd56/*56:xpc10nz*/:  xpc10nz <= 8'sd57/*57:xpc10nz*/;

                  8'sd57/*57:xpc10nz*/:  xpc10nz <= 8'sd58/*58:xpc10nz*/;

                  8'sd58/*58:xpc10nz*/:  xpc10nz <= 8'sd59/*59:xpc10nz*/;

                  8'sd59/*59:xpc10nz*/:  xpc10nz <= 8'sd60/*60:xpc10nz*/;

                  8'sd60/*60:xpc10nz*/:  xpc10nz <= 8'sd61/*61:xpc10nz*/;

                  8'sd61/*61:xpc10nz*/:  xpc10nz <= 8'sd62/*62:xpc10nz*/;

                  8'sd62/*62:xpc10nz*/:  xpc10nz <= 8'sd63/*63:xpc10nz*/;

                  8'sd63/*63:xpc10nz*/:  xpc10nz <= 8'sd64/*64:xpc10nz*/;

                  8'sd64/*64:xpc10nz*/:  xpc10nz <= 8'sd65/*65:xpc10nz*/;

                  8'sd68/*68:xpc10nz*/:  xpc10nz <= 8'sd67/*67:xpc10nz*/;

                  8'sd75/*75:xpc10nz*/:  xpc10nz <= 8'sd76/*76:xpc10nz*/;

                  8'sd76/*76:xpc10nz*/:  xpc10nz <= 8'sd75/*75:xpc10nz*/;

                  8'sd78/*78:xpc10nz*/:  xpc10nz <= 8'sd79/*79:xpc10nz*/;

                  8'sd79/*79:xpc10nz*/:  xpc10nz <= 8'sd80/*80:xpc10nz*/;

                  8'sd80/*80:xpc10nz*/:  xpc10nz <= 8'sd81/*81:xpc10nz*/;

                  8'sd81/*81:xpc10nz*/:  xpc10nz <= 8'sd82/*82:xpc10nz*/;

                  8'sd82/*82:xpc10nz*/:  xpc10nz <= 8'sd83/*83:xpc10nz*/;

                  8'sd83/*83:xpc10nz*/:  xpc10nz <= 8'sd84/*84:xpc10nz*/;

                  8'sd84/*84:xpc10nz*/:  xpc10nz <= 8'sd85/*85:xpc10nz*/;

                  8'sd85/*85:xpc10nz*/:  xpc10nz <= 8'sd86/*86:xpc10nz*/;

                  8'sd86/*86:xpc10nz*/:  xpc10nz <= 8'sd87/*87:xpc10nz*/;

                  8'sd87/*87:xpc10nz*/:  xpc10nz <= 8'sd88/*88:xpc10nz*/;

                  8'sd88/*88:xpc10nz*/:  xpc10nz <= 8'sd89/*89:xpc10nz*/;

                  8'sd89/*89:xpc10nz*/:  xpc10nz <= 8'sd90/*90:xpc10nz*/;

                  8'sd90/*90:xpc10nz*/:  xpc10nz <= 8'sd91/*91:xpc10nz*/;

                  8'sd92/*92:xpc10nz*/:  xpc10nz <= 8'sd77/*77:xpc10nz*/;

                  8'sd93/*93:xpc10nz*/:  xpc10nz <= 8'sd94/*94:xpc10nz*/;

                  8'sd96/*96:xpc10nz*/:  xpc10nz <= 8'sd97/*97:xpc10nz*/;

                  8'sd98/*98:xpc10nz*/:  xpc10nz <= 8'sd99/*99:xpc10nz*/;

                  8'sd114/*114:xpc10nz*/:  xpc10nz <= 8'sd115/*115:xpc10nz*/;

                  8'sd115/*115:xpc10nz*/:  xpc10nz <= 8'sd116/*116:xpc10nz*/;

                  8'sd116/*116:xpc10nz*/:  xpc10nz <= 8'sd117/*117:xpc10nz*/;

                  8'sd117/*117:xpc10nz*/:  xpc10nz <= 8'sd118/*118:xpc10nz*/;

                  8'sd118/*118:xpc10nz*/:  xpc10nz <= 8'sd119/*119:xpc10nz*/;

                  8'sd119/*119:xpc10nz*/:  xpc10nz <= 8'sd120/*120:xpc10nz*/;

                  8'sd120/*120:xpc10nz*/:  xpc10nz <= 8'sd121/*121:xpc10nz*/;

                  8'sd121/*121:xpc10nz*/:  xpc10nz <= 8'sd122/*122:xpc10nz*/;

                  8'sd123/*123:xpc10nz*/:  xpc10nz <= 8'sd107/*107:xpc10nz*/;

                  8'sd125/*125:xpc10nz*/:  xpc10nz <= 8'sd126/*126:xpc10nz*/;

                  8'sd126/*126:xpc10nz*/:  xpc10nz <= 8'sd127/*127:xpc10nz*/;

                  8'sd127/*127:xpc10nz*/:  xpc10nz <= 8'sd128/*128:xpc10nz*/;

                  8'sd128/*128:xpc10nz*/:  xpc10nz <= 8'sd129/*129:xpc10nz*/;

                  8'sd129/*129:xpc10nz*/:  xpc10nz <= 8'sd130/*130:xpc10nz*/;

                  8'sd130/*130:xpc10nz*/:  xpc10nz <= 8'sd131/*131:xpc10nz*/;

                  8'sd131/*131:xpc10nz*/:  xpc10nz <= 8'sd132/*132:xpc10nz*/;

                  8'sd132/*132:xpc10nz*/:  xpc10nz <= 8'sd133/*133:xpc10nz*/;

                  8'sd134/*134:xpc10nz*/:  xpc10nz <= 8'sd135/*135:xpc10nz*/;

                  8'sd135/*135:xpc10nz*/:  xpc10nz <= 8'sd136/*136:xpc10nz*/;

                  8'sd136/*136:xpc10nz*/:  xpc10nz <= 8'sd137/*137:xpc10nz*/;

                  8'sd137/*137:xpc10nz*/:  xpc10nz <= 8'sd138/*138:xpc10nz*/;

                  8'sd138/*138:xpc10nz*/:  xpc10nz <= 8'sd139/*139:xpc10nz*/;

                  8'sd139/*139:xpc10nz*/:  xpc10nz <= 8'sd140/*140:xpc10nz*/;

                  8'sd140/*140:xpc10nz*/:  xpc10nz <= 8'sd141/*141:xpc10nz*/;

                  8'sd141/*141:xpc10nz*/:  xpc10nz <= 8'sd142/*142:xpc10nz*/;

                  8'sd142/*142:xpc10nz*/:  xpc10nz <= 8'sd143/*143:xpc10nz*/;

                  8'sd144/*144:xpc10nz*/:  xpc10nz <= 8'sd103/*103:xpc10nz*/;

                  8'sd146/*146:xpc10nz*/:  xpc10nz <= 8'sd147/*147:xpc10nz*/;

                  8'sd147/*147:xpc10nz*/:  xpc10nz <= 8'sd148/*148:xpc10nz*/;

                  8'sd148/*148:xpc10nz*/:  xpc10nz <= 8'sd149/*149:xpc10nz*/;

                  8'sd149/*149:xpc10nz*/:  xpc10nz <= 8'sd150/*150:xpc10nz*/;

                  8'sd150/*150:xpc10nz*/:  xpc10nz <= 8'sd151/*151:xpc10nz*/;

                  8'sd151/*151:xpc10nz*/:  xpc10nz <= 8'sd152/*152:xpc10nz*/;

                  8'sd152/*152:xpc10nz*/:  xpc10nz <= 8'sd153/*153:xpc10nz*/;

                  8'sd153/*153:xpc10nz*/:  xpc10nz <= 8'sd154/*154:xpc10nz*/;

                  8'sd155/*155:xpc10nz*/:  xpc10nz <= 8'sd156/*156:xpc10nz*/;

                  8'sd156/*156:xpc10nz*/:  xpc10nz <= 8'sd157/*157:xpc10nz*/;

                  8'sd157/*157:xpc10nz*/:  xpc10nz <= 8'sd158/*158:xpc10nz*/;

                  8'sd158/*158:xpc10nz*/:  xpc10nz <= 8'sd159/*159:xpc10nz*/;

                  8'sd160/*160:xpc10nz*/:  xpc10nz <= 8'sd99/*99:xpc10nz*/;

                  8'sd166/*166:xpc10nz*/:  xpc10nz <= 8'sd167/*167:xpc10nz*/;

                  8'sd167/*167:xpc10nz*/:  xpc10nz <= 8'sd168/*168:xpc10nz*/;

                  8'sd168/*168:xpc10nz*/:  xpc10nz <= 8'sd169/*169:xpc10nz*/;

                  8'sd169/*169:xpc10nz*/:  xpc10nz <= 8'sd170/*170:xpc10nz*/;

                  8'sd170/*170:xpc10nz*/:  xpc10nz <= 8'sd171/*171:xpc10nz*/;

                  8'sd171/*171:xpc10nz*/:  xpc10nz <= 8'sd172/*172:xpc10nz*/;

                  8'sd172/*172:xpc10nz*/:  xpc10nz <= 8'sd173/*173:xpc10nz*/;

                  8'sd173/*173:xpc10nz*/:  xpc10nz <= 8'sd174/*174:xpc10nz*/;

                  8'sd175/*175:xpc10nz*/:  xpc10nz <= 8'sd164/*164:xpc10nz*/;

                  8'sd183/*183:xpc10nz*/:  xpc10nz <= 8'sd182/*182:xpc10nz*/;

                  8'sd185/*185:xpc10nz*/:  xpc10nz <= 8'sd186/*186:xpc10nz*/;

                  8'sd186/*186:xpc10nz*/:  xpc10nz <= 8'sd187/*187:xpc10nz*/;

                  8'sd187/*187:xpc10nz*/:  xpc10nz <= 8'sd188/*188:xpc10nz*/;

                  8'sd188/*188:xpc10nz*/:  xpc10nz <= 8'sd189/*189:xpc10nz*/;

                  8'sd189/*189:xpc10nz*/:  xpc10nz <= 8'sd190/*190:xpc10nz*/;

                  8'sd190/*190:xpc10nz*/:  xpc10nz <= 8'sd191/*191:xpc10nz*/;

                  8'sd192/*192:xpc10nz*/:  xpc10nz <= 8'sd193/*193:xpc10nz*/;

                  8'sd194/*194:xpc10nz*/:  xpc10nz <= 8'sd195/*195:xpc10nz*/;

                  8'sd195/*195:xpc10nz*/:  xpc10nz <= 8'sd196/*196:xpc10nz*/;

                  8'sd196/*196:xpc10nz*/:  xpc10nz <= 8'sd197/*197:xpc10nz*/;

                  8'sd197/*197:xpc10nz*/:  xpc10nz <= 8'sd198/*198:xpc10nz*/;

                  8'sd198/*198:xpc10nz*/:  xpc10nz <= 8'sd199/*199:xpc10nz*/;

                  8'sd199/*199:xpc10nz*/:  xpc10nz <= 8'sd200/*200:xpc10nz*/;

                  8'sd200/*200:xpc10nz*/:  xpc10nz <= 8'sd201/*201:xpc10nz*/;

                  8'sd201/*201:xpc10nz*/:  xpc10nz <= 8'sd202/*202:xpc10nz*/;

                  8'sd202/*202:xpc10nz*/:  xpc10nz <= 8'sd203/*203:xpc10nz*/;

                  8'sd204/*204:xpc10nz*/:  xpc10nz <= 8'sd193/*193:xpc10nz*/;
              endcase
               fpcvt10RRh10shot1 <= fpcvt10RRh10shot0;
               fpcvt12RRh10shot1 <= fpcvt12RRh10shot0;
               CVFPMULTIPLIER10RRh10shot1 <= CVFPMULTIPLIER10RRh10shot0;
               CVFPMULTIPLIER10RRh10shot2 <= CVFPMULTIPLIER10RRh10shot1;
               CVFPMULTIPLIER10RRh10shot3 <= CVFPMULTIPLIER10RRh10shot2;
               CVFPMULTIPLIER12RRh10shot1 <= CVFPMULTIPLIER12RRh10shot0;
               CVFPMULTIPLIER12RRh10shot2 <= CVFPMULTIPLIER12RRh10shot1;
               CVFPMULTIPLIER12RRh10shot3 <= CVFPMULTIPLIER12RRh10shot2;
               CVFPADDER10RRh10shot1 <= CVFPADDER10RRh10shot0;
               CVFPADDER10RRh10shot2 <= CVFPADDER10RRh10shot1;
               CVFPADDER10RRh10shot3 <= CVFPADDER10RRh10shot2;
               CVFPADDER12RRh10shot1 <= CVFPADDER12RRh10shot0;
               CVFPADDER12RRh10shot2 <= CVFPADDER12RRh10shot1;
               CVFPADDER12RRh10shot3 <= CVFPADDER12RRh10shot2;
               CVFPMULTIPLIER14RRh10shot1 <= CVFPMULTIPLIER14RRh10shot0;
               CVFPMULTIPLIER14RRh10shot2 <= CVFPMULTIPLIER14RRh10shot1;
               CVFPMULTIPLIER14RRh10shot3 <= CVFPMULTIPLIER14RRh10shot2;
               CVFPADDER14RRh10shot1 <= CVFPADDER14RRh10shot0;
               CVFPADDER14RRh10shot2 <= CVFPADDER14RRh10shot1;
               CVFPADDER14RRh10shot3 <= CVFPADDER14RRh10shot2;
               CVFPDIVIDER10RRh10shot1 <= CVFPDIVIDER10RRh10shot0;
               CVFPDIVIDER10RRh10shot2 <= CVFPDIVIDER10RRh10shot1;
               CVFPDIVIDER10RRh10shot3 <= CVFPDIVIDER10RRh10shot2;
               CVFPDIVIDER10RRh10shot4 <= CVFPDIVIDER10RRh10shot3;
               CVFPMULTIPLIER16RRh10shot1 <= CVFPMULTIPLIER16RRh10shot0;
               CVFPMULTIPLIER16RRh10shot2 <= CVFPMULTIPLIER16RRh10shot1;
               CVFPMULTIPLIER16RRh10shot3 <= CVFPMULTIPLIER16RRh10shot2;
               CVFPMULTIPLIER18RRh10shot1 <= CVFPMULTIPLIER18RRh10shot0;
               CVFPMULTIPLIER18RRh10shot2 <= CVFPMULTIPLIER18RRh10shot1;
               CVFPMULTIPLIER18RRh10shot3 <= CVFPMULTIPLIER18RRh10shot2;
               CVFPADDER20RRh10shot1 <= CVFPADDER20RRh10shot0;
               CVFPADDER20RRh10shot2 <= CVFPADDER20RRh10shot1;
               CVFPADDER20RRh10shot3 <= CVFPADDER20RRh10shot2;
               CVFPADDER18RRh10shot1 <= CVFPADDER18RRh10shot0;
               CVFPADDER18RRh10shot2 <= CVFPADDER18RRh10shot1;
               CVFPADDER18RRh10shot3 <= CVFPADDER18RRh10shot2;
               CVFPDIVIDER12RRh10shot1 <= CVFPDIVIDER12RRh10shot0;
               CVFPDIVIDER12RRh10shot2 <= CVFPDIVIDER12RRh10shot1;
               CVFPDIVIDER12RRh10shot3 <= CVFPDIVIDER12RRh10shot2;
               CVFPDIVIDER12RRh10shot4 <= CVFPDIVIDER12RRh10shot3;
               CVFPMULTIPLIER20RRh10shot1 <= CVFPMULTIPLIER20RRh10shot0;
               CVFPMULTIPLIER20RRh10shot2 <= CVFPMULTIPLIER20RRh10shot1;
               CVFPMULTIPLIER20RRh10shot3 <= CVFPMULTIPLIER20RRh10shot2;
               CVFPADDER16RRh10shot1 <= CVFPADDER16RRh10shot0;
               CVFPADDER16RRh10shot2 <= CVFPADDER16RRh10shot1;
               CVFPADDER16RRh10shot3 <= CVFPADDER16RRh10shot2;
               fpcvt10RRh10shot1 <= fpcvt10RRh10shot0;
               fpcvt12RRh10shot1 <= fpcvt12RRh10shot0;
               CVFPMULTIPLIER10RRh10shot1 <= CVFPMULTIPLIER10RRh10shot0;
               CVFPMULTIPLIER10RRh10shot2 <= CVFPMULTIPLIER10RRh10shot1;
               CVFPMULTIPLIER10RRh10shot3 <= CVFPMULTIPLIER10RRh10shot2;
               CVFPMULTIPLIER12RRh10shot1 <= CVFPMULTIPLIER12RRh10shot0;
               CVFPMULTIPLIER12RRh10shot2 <= CVFPMULTIPLIER12RRh10shot1;
               CVFPMULTIPLIER12RRh10shot3 <= CVFPMULTIPLIER12RRh10shot2;
               CVFPADDER10RRh10shot1 <= CVFPADDER10RRh10shot0;
               CVFPADDER10RRh10shot2 <= CVFPADDER10RRh10shot1;
               CVFPADDER10RRh10shot3 <= CVFPADDER10RRh10shot2;
               CVFPADDER12RRh10shot1 <= CVFPADDER12RRh10shot0;
               CVFPADDER12RRh10shot2 <= CVFPADDER12RRh10shot1;
               CVFPADDER12RRh10shot3 <= CVFPADDER12RRh10shot2;
               CVFPMULTIPLIER14RRh10shot1 <= CVFPMULTIPLIER14RRh10shot0;
               CVFPMULTIPLIER14RRh10shot2 <= CVFPMULTIPLIER14RRh10shot1;
               CVFPMULTIPLIER14RRh10shot3 <= CVFPMULTIPLIER14RRh10shot2;
               CVFPADDER14RRh10shot1 <= CVFPADDER14RRh10shot0;
               CVFPADDER14RRh10shot2 <= CVFPADDER14RRh10shot1;
               CVFPADDER14RRh10shot3 <= CVFPADDER14RRh10shot2;
               CVFPDIVIDER10RRh10shot1 <= CVFPDIVIDER10RRh10shot0;
               CVFPDIVIDER10RRh10shot2 <= CVFPDIVIDER10RRh10shot1;
               CVFPDIVIDER10RRh10shot3 <= CVFPDIVIDER10RRh10shot2;
               CVFPDIVIDER10RRh10shot4 <= CVFPDIVIDER10RRh10shot3;
               CVFPMULTIPLIER16RRh10shot1 <= CVFPMULTIPLIER16RRh10shot0;
               CVFPMULTIPLIER16RRh10shot2 <= CVFPMULTIPLIER16RRh10shot1;
               CVFPMULTIPLIER16RRh10shot3 <= CVFPMULTIPLIER16RRh10shot2;
               CVFPMULTIPLIER18RRh10shot1 <= CVFPMULTIPLIER18RRh10shot0;
               CVFPMULTIPLIER18RRh10shot2 <= CVFPMULTIPLIER18RRh10shot1;
               CVFPMULTIPLIER18RRh10shot3 <= CVFPMULTIPLIER18RRh10shot2;
               CVFPADDER20RRh10shot1 <= CVFPADDER20RRh10shot0;
               CVFPADDER20RRh10shot2 <= CVFPADDER20RRh10shot1;
               CVFPADDER20RRh10shot3 <= CVFPADDER20RRh10shot2;
               CVFPADDER18RRh10shot1 <= CVFPADDER18RRh10shot0;
               CVFPADDER18RRh10shot2 <= CVFPADDER18RRh10shot1;
               CVFPADDER18RRh10shot3 <= CVFPADDER18RRh10shot2;
               CVFPDIVIDER12RRh10shot1 <= CVFPDIVIDER12RRh10shot0;
               CVFPDIVIDER12RRh10shot2 <= CVFPDIVIDER12RRh10shot1;
               CVFPDIVIDER12RRh10shot3 <= CVFPDIVIDER12RRh10shot2;
               CVFPDIVIDER12RRh10shot4 <= CVFPDIVIDER12RRh10shot3;
               CVFPMULTIPLIER20RRh10shot1 <= CVFPMULTIPLIER20RRh10shot0;
               CVFPMULTIPLIER20RRh10shot2 <= CVFPMULTIPLIER20RRh10shot1;
               CVFPMULTIPLIER20RRh10shot3 <= CVFPMULTIPLIER20RRh10shot2;
               CVFPADDER16RRh10shot1 <= CVFPADDER16RRh10shot0;
               CVFPADDER16RRh10shot2 <= CVFPADDER16RRh10shot1;
               CVFPADDER16RRh10shot3 <= CVFPADDER16RRh10shot2;
               FPSCCSCALbx36ARB0RRh12shot0 <= (luTest_T404_Main_T404_Main_V_1_GP<32'sd8) && (xpc10nz==8'sd193/*193:xpc10nz*/) || ((xpc10nz
              ==8'sd185/*185:xpc10nz*/) || (xpc10nz==8'sd205/*205:xpc10nz*/)) && (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8);

               CVFPADDER16RRh10shot0 <= (luTest_T404_Main_T404_Main_V_1_GP<32'sd8) && (xpc10nz==8'sd199/*199:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
              <32'sd8) && (xpc10nz==8'sd129/*129:xpc10nz*/);

               CVFPMULTIPLIER20RRh10shot0 <= (luTest_T404_Main_T404_Main_V_1_GP<32'sd8) && (xpc10nz==8'sd195/*195:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
              <32'sd8) && (xpc10nz==8'sd166/*166:xpc10nz*/);

               FPSCCSCALbx36ARB0RRh10shot0 <= ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8)? (xpc10nz==8'sd184/*184:xpc10nz*/) || (xpc10nz
              ==8'sd165/*165:xpc10nz*/) || (xpc10nz==8'sd124/*124:xpc10nz*/): (xpc10nz==8'sd134/*134:xpc10nz*/)) || (luTest_T404_Main_T404_Main_V_3_GP
              <32'sd8) && (xpc10nz==8'sd179/*179:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_1_GP<32'sd8) && (xpc10nz==8'sd194/*194:xpc10nz*/);

               CVFPDIVIDER12RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd186/*186:xpc10nz*/);
               FPSCCSCALbx34ARA0RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd176/*176:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
              <luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd145/*145:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && 
              (xpc10nz==8'sd165/*165:xpc10nz*/);

               CVFPADDER18RRh10shot0 <= ((T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8)? (xpc10nz==8'sd170/*170:xpc10nz*/): (xpc10nz==8'sd134
              /*134:xpc10nz*/));

               FPSCCSCALbx38ARC0RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd161/*161:xpc10nz*/);
               CVFPADDER20RRh10shot0 <= ((T404_MatrixLib_mpx_1_23_V_2_GP<luTest_T404_Main_T404_Main_V_3_GP)? (xpc10nz==8'sd150/*150:xpc10nz*/): (xpc10nz
              ==8'sd155/*155:xpc10nz*/));

               CVFPMULTIPLIER18RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd146/*146:xpc10nz*/);
               FPSCCSCALbx42ARE0RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd145
              /*145:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_3_GP<32'sh8) && (xpc10nz==8'sd100/*100:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP
              >=32'sd8) && (xpc10nz==8'sd124/*124:xpc10nz*/);

               FPSCCSCALbx40ARD0RRh10shot0 <= ((luTest_T404_Main_T404_Main_V_3_GP<32'sd8)? (xpc10nz==8'sd94/*94:xpc10nz*/): (xpc10nz==
              8'sd96/*96:xpc10nz*/)) || (T404_MatrixLib_mpx_1_23_V_2_GP>=luTest_T404_Main_T404_Main_V_3_GP) && (xpc10nz==8'sd145/*145:xpc10nz*/);

               CVFPMULTIPLIER16RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd125/*125:xpc10nz*/);
               FPSCCSCALbx44ARF0RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sd8) && (xpc10nz==8'sd124/*124:xpc10nz*/) || (luTest_T404_Main_T404_Main_V_3_GP
              <32'sh8) && (xpc10nz==8'sd104/*104:xpc10nz*/) || (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd113/*113:xpc10nz*/);

               CVFPDIVIDER10RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP>=32'sd8) && (xpc10nz==8'sd138/*138:xpc10nz*/);
               CVFPADDER14RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd118/*118:xpc10nz*/);
               CVFPMULTIPLIER14RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd114/*114:xpc10nz*/);
               FPSCCSCALbx46ARG0RRh10shot0 <= (T404_MatrixLib_mpx_1_23_V_2_GP<32'sh8) && (xpc10nz==8'sd113/*113:xpc10nz*/);
               FPSCCSCALbx48ARH0RRh10shot0 <= ((xpc10nz==8'sd108/*108:xpc10nz*/) || (xpc10nz==8'sd111/*111:xpc10nz*/)) && (luTest_T404_Main_T404_Main_V_3_GP
              <32'sh8);

               CVFPADDER12RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd87/*87:xpc10nz*/);
               CVFPADDER10RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd83/*83:xpc10nz*/);
               CVFPMULTIPLIER12RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd79/*79:xpc10nz*/);
               CVFPMULTIPLIER10RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd79/*79:xpc10nz*/);
               fpcvt12RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd77/*77:xpc10nz*/);
               fpcvt10RRh10shot0 <= (luTest_T404_Main_T404_Main_V_3_GP<32'sd8) && (xpc10nz==8'sd77/*77:xpc10nz*/);
               end 
              //End structure HPR csharp/lu-decomp-sp


       end 
      

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd6, 32'sd64, 32'sd32) A_FPS_CC_SCALbx36_ARB0(clk, reset, A_FPS_CC_SCALbx36_ARB0_RDD0, A_FPS_CC_SCALbx36_ARB0_AD0
, A_FPS_CC_SCALbx36_ARB0_WEN0, A_FPS_CC_SCALbx36_ARB0_REN0, A_FPS_CC_SCALbx36_ARB0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd6, 32'sd64, 32'sd32) A_FPS_CC_SCALbx46_ARG0(clk, reset, A_FPS_CC_SCALbx46_ARG0_RDD0, A_FPS_CC_SCALbx46_ARG0_AD0
, A_FPS_CC_SCALbx46_ARG0_WEN0, A_FPS_CC_SCALbx46_ARG0_REN0, A_FPS_CC_SCALbx46_ARG0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd6, 32'sd64, 32'sd32) A_FPS_CC_SCALbx34_ARA0(clk, reset, A_FPS_CC_SCALbx34_ARA0_RDD0, A_FPS_CC_SCALbx34_ARA0_AD0
, A_FPS_CC_SCALbx34_ARA0_WEN0, A_FPS_CC_SCALbx34_ARA0_REN0, A_FPS_CC_SCALbx34_ARA0_WRD0);

  CV_FP_CVT_FL2_F32_I32 ifpcvt10(clk, fpcvt10_result, fpcvt10_arg, fpcvt10_fail);
  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER10(clk, reset, CVFPMULTIPLIER10_FPRR, CVFPMULTIPLIER10_A0, CVFPMULTIPLIER10_A1, CVFPMULTIPLIER10_fail
);
  CV_FP_CVT_FL2_F32_I32 ifpcvt12(clk, fpcvt12_result, fpcvt12_arg, fpcvt12_fail);
  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER12(clk, reset, CVFPMULTIPLIER12_FPRR, CVFPMULTIPLIER12_A0, CVFPMULTIPLIER12_A1, CVFPMULTIPLIER12_fail
);
  CV_FP_FL4_SP_ADDER CVFPADDER10(clk, reset, CVFPADDER10_FPRR, CVFPADDER10_A0, CVFPADDER10_A1, CVFPADDER10_fail);
  CV_FP_FL4_SP_ADDER CVFPADDER12(clk, reset, CVFPADDER12_FPRR, CVFPADDER12_A0, CVFPADDER12_A1, CVFPADDER12_fail);
  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd3, 32'sd8, 32'sd32) A_FPS_CC_SCALbx40_ARD0(clk, reset, A_FPS_CC_SCALbx40_ARD0_RDD0, A_FPS_CC_SCALbx40_ARD0_AD0
, A_FPS_CC_SCALbx40_ARD0_WEN0, A_FPS_CC_SCALbx40_ARD0_REN0, A_FPS_CC_SCALbx40_ARD0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd3, 32'sd8, 32'sd32) A_FPS_CC_SCALbx42_ARE0(clk, reset, A_FPS_CC_SCALbx42_ARE0_RDD0, A_FPS_CC_SCALbx42_ARE0_AD0
, A_FPS_CC_SCALbx42_ARE0_WEN0, A_FPS_CC_SCALbx42_ARE0_REN0, A_FPS_CC_SCALbx42_ARE0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd3, 32'sd8, 32'sd32) A_FPS_CC_SCALbx44_ARF0(clk, reset, A_FPS_CC_SCALbx44_ARF0_RDD0, A_FPS_CC_SCALbx44_ARF0_AD0
, A_FPS_CC_SCALbx44_ARF0_WEN0, A_FPS_CC_SCALbx44_ARF0_REN0, A_FPS_CC_SCALbx44_ARF0_WRD0);

  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd3, 32'sd8, 32'sd32) A_FPS_CC_SCALbx48_ARH0(clk, reset, A_FPS_CC_SCALbx48_ARH0_RDD0, A_FPS_CC_SCALbx48_ARH0_AD0
, A_FPS_CC_SCALbx48_ARH0_WEN0, A_FPS_CC_SCALbx48_ARH0_REN0, A_FPS_CC_SCALbx48_ARH0_WRD0);

  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER14(clk, reset, CVFPMULTIPLIER14_FPRR, CVFPMULTIPLIER14_A0, CVFPMULTIPLIER14_A1, CVFPMULTIPLIER14_fail
);
  CV_FP_FL4_SP_ADDER CVFPADDER14(clk, reset, CVFPADDER14_FPRR, CVFPADDER14_A0, CVFPADDER14_A1, CVFPADDER14_fail);
  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER16(clk, reset, CVFPMULTIPLIER16_FPRR, CVFPMULTIPLIER16_A0, CVFPMULTIPLIER16_A1, CVFPMULTIPLIER16_fail
);
  CV_FP_FL4_SP_ADDER CVFPADDER16(clk, reset, CVFPADDER16_FPRR, CVFPADDER16_A0, CVFPADDER16_A1, CVFPADDER16_fail);
  CV_FP_FL4_SP_ADDER CVFPADDER18(clk, reset, CVFPADDER18_FPRR, CVFPADDER18_A0, CVFPADDER18_A1, CVFPADDER18_fail);
  CV_FP_FL5_SP_DIVIDER CVFPDIVIDER10(clk, reset, CVFPDIVIDER10_FPRR, CVFPDIVIDER10_NN, CVFPDIVIDER10_DD, CVFPDIVIDER10_fail);
  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER18(clk, reset, CVFPMULTIPLIER18_FPRR, CVFPMULTIPLIER18_A0, CVFPMULTIPLIER18_A1, CVFPMULTIPLIER18_fail
);
  CV_FP_FL4_SP_ADDER CVFPADDER20(clk, reset, CVFPADDER20_FPRR, CVFPADDER20_A0, CVFPADDER20_A1, CVFPADDER20_fail);
  CV_SP_SSRAM_FL1 #(32'sd32, 32'sd6, 32'sd64, 32'sd32) A_FPS_CC_SCALbx38_ARC0(clk, reset, A_FPS_CC_SCALbx38_ARC0_RDD0, A_FPS_CC_SCALbx38_ARC0_AD0
, A_FPS_CC_SCALbx38_ARC0_WEN0, A_FPS_CC_SCALbx38_ARC0_REN0, A_FPS_CC_SCALbx38_ARC0_WRD0);

  CV_FP_FL4_SP_MULTIPLIER CVFPMULTIPLIER20(clk, reset, CVFPMULTIPLIER20_FPRR, CVFPMULTIPLIER20_A0, CVFPMULTIPLIER20_A1, CVFPMULTIPLIER20_fail
);
  CV_FP_FL5_SP_DIVIDER CVFPDIVIDER12(clk, reset, CVFPDIVIDER12_FPRR, CVFPDIVIDER12_NN, CVFPDIVIDER12_DD, CVFPDIVIDER12_fail);
// 5 vectors of width 3
// 87 vectors of width 1
// 65 vectors of width 32
// 4 vectors of width 6
// 1 vectors of width 8
// 96 bits in scalar variables
// Total state bits in module = 2310 bits.
// 848 continuously assigned (wire/non-state) bits 
//   cell CV_SP_SSRAM_FL1 count=8
//   cell CV_FP_CVT_FL2_F32_I32 count=2
//   cell CV_FP_FL4_SP_MULTIPLIER count=6
//   cell CV_FP_FL4_SP_ADDER count=6
//   cell CV_FP_FL5_SP_DIVIDER count=2
// Total number of leaf cells = 24
endmodule

//  
// LCP delay estimations included: turn off with -vnl-lcp-delay-estimate=disable
//HPR L/S (orangepath) auxiliary reports.
//KiwiC compilation report
//Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.18a : 5th-December-2016
//10/02/2017 15:39:43
//Cmd line args:  /home/djg11/d320/hprls/kiwipro/kiwic/distro/lib/kiwic.exe csharp/lu-decomp-sp.exe -res2-loadstore-port-count=0 -vnl=lu-decomp-sp.v -vnl-rootmodname=lu-decomp-sp csharp/KSubs2_Director.dll -vnl-resets=synchronous -kiwic-finish=disable -vnl-roundtrip=disable -kiwic-register-colours=1 -bevelab-default-pause-mode=bblock -fp-fl-sp-mul=4


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

//Report from Abbreviation:::
//Setting up abbreviation @$s@ for prefix @/$star1$/@

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TKG3._SPILL for prefix T404/KIWIARRAY2D`1/GetLength/3.4/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TKG5._SPILL for prefix T404/KIWIARRAY2D`1/GetLength/5.4/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TKG4._SPILL for prefix T404/KIWIARRAY2D`1/GetLength/4.4/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TKG6._SPILL for prefix T404/KIWIARRAY2D`1/GetLength/6.4/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TKG8._SPILL for prefix T404/KIWIARRAY2D`1/GetLength/8.4/_SPILL

//----------------------------------------------------------

//Report from kiwife virtual to physical register colouring/mapping for thread T404:::
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5009 dt=$star1$/SimuSolve usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5018 dt=FPS usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5019 dt=SINT usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5020 dt=SINT usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5021 dt=SINT usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5023 dt=SINT usecount=3
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5024 dt=SINT usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5025 dt=SINT usecount=4
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5026 dt=SINT usecount=3
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5027 dt=SINT usecount=5
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5028 dt=SINT usecount=6
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5029 dt=SINT usecount=4
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5030 dt=SINT usecount=5
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5031 dt=FPS usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5032 dt=SINT usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5033 dt=SINT usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5034 dt=SINT usecount=7
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5035 dt=SINT usecount=3
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5036 dt=SINT usecount=8
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5037 dt=SINT usecount=4
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5038 dt=SINT usecount=9
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5039 dt=FPS usecount=3
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5040 dt=SINT usecount=6
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5041 dt=SINT usecount=5
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5042 dt=SINT usecount=10
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5010 dt=SINT usecount=6
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5043 dt=SINT usecount=11
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5044 dt=SINT usecount=12
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5047 dt=SINT usecount=13
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5048 dt=FPS usecount=4
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5049 dt=SINT usecount=7
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5045 dt=$star1$/@/FPS usecount=1
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5050 dt=SINT usecount=14
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5051 dt=SINT usecount=15
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5052 dt=FPS usecount=5
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5053 dt=SINT usecount=8
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5046 dt=$star1$/@/FPS usecount=2
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5054 dt=SINT usecount=16
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5011 dt=$star1$/@/FPS usecount=3
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5055 dt=SINT usecount=17
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5056 dt=FPS usecount=6
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5057 dt=SINT usecount=9
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5058 dt=SINT usecount=18
//
//Allocate phy reg purpose=localvar msg=allocation for thread T404 for V5012 dt=SINT usecount=19
//
//: Linear scan colouring done for 45 vregs using 6 pregs
//

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation @$sKIWIARRAY2D`1 for prefix @/$star1$/KIWIARRAY2D`1

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation $s@ for prefix $star1$/@

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation $sKIWIARRAY2D`1 for prefix $star1$/KIWIARRAY2D`1

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
//KiwiC: front end input processing of class or method called luTest
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor16
//
//KiwiC start_thread (or entry point) id=cctor16
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+3
//
//KiwiC: front end input processing of class or method called luTest
//
//root_compiler: start elaborating class 'luTest'
//
//elaborating class 'luTest'
//
//compiling static method as entry point: style=Root idl=luTest/Main
//
//Performing root elaboration of method Main
//
//KiwiC start_thread (or entry point) id=Main10
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/MatrixLib/mpx/1.23/V_1
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/SimuSolve/BackSubst/0.13/V_1
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/SimuSolve/FwdsSubst/0.4/V_1
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/MatrixLib/mpx/0.26/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/SimuSolve/LUdecompose/0.11/V_4
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_1/GP used for T404/luTest/generate_example_coefficients/0.11/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for luTest/T404/Main/T404/Main/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for T404/MatrixLib/printa/0.30/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for T404/MatrixLib/mpx/0.26/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for T404/MatrixLib/printa/0.19/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for T404/MatrixLib/printa/0.15/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_1/GP used for T404/SimuSolve/LUdecompose/0.11/V_5
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for luTest/T404/Main/T404/Main/V_3
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/1.24/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/mpx/1.23/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.18/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/SimuSolve/BackSubst/0.13/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.9/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/SimuSolve/FwdsSubst/0.4/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/luTest/generate_example_rhs/1.11/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/luTest/generate_example_rhs/1.11/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.30/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/mpx/0.26/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.19/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.15/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/SimuSolve/LUdecompose/0.11/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/SimuSolve/LUdecompose/0.11/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/printa/0.6/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/MatrixLib/copy2d/0.16/V_0
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/luTest/generate_example_coefficients/0.11/V_3
//
//Register sharing: general luTest/T404/Main/T404/Main/V_3/GP used for T404/luTest/generate_example_coefficients/0.11/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/MatrixLib/mpx/1.23/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/SimuSolve/BackSubst/0.13/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/SimuSolve/FwdsSubst/0.4/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/MatrixLib/mpx/0.26/V_3
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/SimuSolve/LUdecompose/0.11/V_3
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/SimuSolve/LUdecompose/0.11/V_2
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/MatrixLib/printa/0.6/V_1
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/MatrixLib/copy2d/0.16/V_1
//
//Register sharing: general T404/MatrixLib/mpx/1.23/V_2/GP used for T404/luTest/generate_example_coefficients/0.11/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_2/GP used for luTest/T404/Main/T404/Main/V_2
//
//Register sharing: general luTest/T404/Main/T404/Main/V_2/GP used for T404/SimuSolve/SolveVerbose/1.16/V_1
//
//Register sharing: general luTest/T404/Main/T404/Main/V_2/GP used for T404/SimuSolve/SolveVerbose/1.16/V_0
//
//root_compiler class done: luTest
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
//   ?>?=srcfile, csharp/lu-decomp-sp.exe, csharp/KSubs2_Director.dll
//
//   kiwic-autodispose=disable
//
//END OF KIWIC REPORT FILE
//

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation KIFPS/CT for prefix KIWIARRAY2D`1/FPS/CT

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
//*------------------+-----+--------------+------+------+-------+-----+-------------+------*
//| gb-flag/Pause    | eno | hwm          | root | exec | start | end | antecedants | next |
//*------------------+-----+--------------+------+------+-------+-----+-------------+------*
//|   X0:"0:xpc10"   | 900 | hwm=0.0.64   | 0    | 0    | 1     | 64  | ---         | 65   |
//|   X1:"1:xpc10"   | 901 | hwm=0.0.0    | 65   | 65   | -     | -   | ---         | 66   |
//|   X2:"2:xpc10"   | 903 | hwm=0.0.0    | 66   | 66   | -     | -   | ---         | 205  |
//|   X2:"2:xpc10"   | 902 | hwm=0.0.0    | 66   | 66   | -     | -   | ---         | 67   |
//|   X3:"3:xpc10"   | 905 | hwm=0.0.0    | 67   | 67   | -     | -   | ---         | 69   |
//|   X3:"3:xpc10"   | 904 | hwm=0.0.1    | 67   | 67   | 68    | 68  | ---         | 67   |
//|   X4:"4:xpc10"   | 907 | hwm=0.0.0    | 69   | 69   | -     | -   | ---         | 182  |
//|   X4:"4:xpc10"   | 906 | hwm=0.0.0    | 69   | 69   | -     | -   | ---         | 70   |
//|   X5:"5:xpc10"   | 909 | hwm=0.0.0    | 70   | 70   | -     | -   | ---         | 179  |
//|   X5:"5:xpc10"   | 908 | hwm=0.0.0    | 70   | 70   | -     | -   | ---         | 71   |
//|   X6:"6:xpc10"   | 911 | hwm=0.0.0    | 71   | 71   | -     | -   | ---         | 176  |
//|   X6:"6:xpc10"   | 910 | hwm=0.0.0    | 71   | 71   | -     | -   | ---         | 72   |
//|   X7:"7:xpc10"   | 913 | hwm=0.0.0    | 72   | 72   | -     | -   | ---         | 164  |
//|   X7:"7:xpc10"   | 912 | hwm=0.0.0    | 72   | 72   | -     | -   | ---         | 73   |
//|   X8:"8:xpc10"   | 915 | hwm=0.0.0    | 73   | 73   | -     | -   | ---         | 161  |
//|   X8:"8:xpc10"   | 914 | hwm=0.0.0    | 73   | 73   | -     | -   | ---         | 74   |
//|   X9:"9:xpc10"   | 917 | hwm=0.0.0    | 74   | 74   | -     | -   | ---         | 77   |
//|   X9:"9:xpc10"   | 916 | hwm=0.0.0    | 74   | 74   | -     | -   | ---         | 75   |
//|   X10:"10:xpc10" | 918 | hwm=0.0.0    | 75   | 75   | -     | -   | ---         | 76   |
//|   X11:"11:xpc10" | 919 | hwm=0.0.0    | 76   | 76   | -     | -   | ---         | 75   |
//|   X12:"12:xpc10" | 921 | hwm=0.0.1    | 77   | 77   | 93    | 93  | ---         | 94   |
//|   X12:"12:xpc10" | 920 | hwm=0.14.1   | 77   | 91   | 78    | 92  | ---         | 77   |
//|   X13:"13:xpc10" | 923 | hwm=0.2.1    | 94   | 97   | 96    | 98  | ---         | 99   |
//|   X13:"13:xpc10" | 922 | hwm=0.1.0    | 94   | 95   | 95    | 95  | ---         | 94   |
//|   X14:"14:xpc10" | 925 | hwm=0.0.0    | 99   | 99   | -     | -   | ---         | 145  |
//|   X14:"14:xpc10" | 924 | hwm=0.0.0    | 99   | 99   | -     | -   | ---         | 100  |
//|   X15:"15:xpc10" | 927 | hwm=0.0.0    | 100  | 100  | -     | -   | ---         | 102  |
//|   X15:"15:xpc10" | 926 | hwm=0.1.0    | 100  | 101  | 101   | 101 | ---         | 100  |
//|   X16:"16:xpc10" | 928 | hwm=0.0.0    | 102  | 102  | -     | -   | ---         | 103  |
//|   X17:"17:xpc10" | 930 | hwm=0.0.0    | 103  | 103  | -     | -   | ---         | 124  |
//|   X17:"17:xpc10" | 929 | hwm=0.0.0    | 103  | 103  | -     | -   | ---         | 104  |
//|   X18:"18:xpc10" | 932 | hwm=0.0.0    | 104  | 104  | -     | -   | ---         | 106  |
//|   X18:"18:xpc10" | 931 | hwm=0.1.0    | 104  | 105  | 105   | 105 | ---         | 104  |
//|   X19:"19:xpc10" | 933 | hwm=0.0.0    | 106  | 106  | -     | -   | ---         | 107  |
//|   X20:"20:xpc10" | 935 | hwm=0.0.0    | 107  | 107  | -     | -   | ---         | 113  |
//|   X20:"20:xpc10" | 934 | hwm=0.0.0    | 107  | 107  | -     | -   | ---         | 108  |
//|   X21:"21:xpc10" | 937 | hwm=0.0.0    | 108  | 108  | -     | -   | ---         | 110  |
//|   X21:"21:xpc10" | 936 | hwm=0.1.0    | 108  | 109  | 109   | 109 | ---         | 108  |
//|   X22:"22:xpc10" | 938 | hwm=0.0.0    | 110  | 110  | -     | -   | ---         | 111  |
//|   X23:"23:xpc10" | 940 | hwm=0.0.0    | 111  | 111  | -     | -   | ---         | 74   |
//|   X23:"23:xpc10" | 939 | hwm=0.1.0    | 111  | 112  | 112   | 112 | ---         | 111  |
//|   X24:"24:xpc10" | 942 | hwm=0.0.1    | 113  | 113  | 123   | 123 | ---         | 107  |
//|   X24:"24:xpc10" | 941 | hwm=0.9.0    | 113  | 122  | 114   | 122 | ---         | 113  |
//|   X25:"25:xpc10" | 944 | hwm=0.10.1   | 124  | 143  | 134   | 144 | ---         | 103  |
//|   X25:"25:xpc10" | 943 | hwm=0.9.0    | 124  | 133  | 125   | 133 | ---         | 124  |
//|   X26:"26:xpc10" | 946 | hwm=0.5.1    | 145  | 159  | 155   | 160 | ---         | 99   |
//|   X26:"26:xpc10" | 945 | hwm=0.9.0    | 145  | 154  | 146   | 154 | ---         | 145  |
//|   X27:"27:xpc10" | 948 | hwm=0.0.0    | 161  | 161  | -     | -   | ---         | 163  |
//|   X27:"27:xpc10" | 947 | hwm=0.1.0    | 161  | 162  | 162   | 162 | ---         | 161  |
//|   X28:"28:xpc10" | 949 | hwm=0.0.0    | 163  | 163  | -     | -   | ---         | 73   |
//|   X29:"29:xpc10" | 951 | hwm=0.0.0    | 164  | 164  | -     | -   | ---         | 165  |
//|   X29:"29:xpc10" | 950 | hwm=0.0.0    | 164  | 164  | -     | -   | ---         | 72   |
//|   X30:"30:xpc10" | 953 | hwm=0.0.1    | 165  | 165  | 175   | 175 | ---         | 164  |
//|   X30:"30:xpc10" | 952 | hwm=0.9.0    | 165  | 174  | 166   | 174 | ---         | 165  |
//|   X31:"31:xpc10" | 955 | hwm=0.0.0    | 176  | 176  | -     | -   | ---         | 178  |
//|   X31:"31:xpc10" | 954 | hwm=0.1.0    | 176  | 177  | 177   | 177 | ---         | 176  |
//|   X32:"32:xpc10" | 956 | hwm=0.0.0    | 178  | 178  | -     | -   | ---         | 71   |
//|   X33:"33:xpc10" | 958 | hwm=0.0.0    | 179  | 179  | -     | -   | ---         | 181  |
//|   X33:"33:xpc10" | 957 | hwm=0.1.0    | 179  | 180  | 180   | 180 | ---         | 179  |
//|   X34:"34:xpc10" | 959 | hwm=0.0.0    | 181  | 181  | -     | -   | ---         | 70   |
//|   X35:"35:xpc10" | 961 | hwm=0.0.0    | 182  | 182  | -     | -   | ---         | 184  |
//|   X35:"35:xpc10" | 960 | hwm=0.0.1    | 182  | 182  | 183   | 183 | ---         | 182  |
//|   X36:"36:xpc10" | 963 | hwm=0.7.1    | 184  | 191  | 185   | 192 | ---         | 193  |
//|   X36:"36:xpc10" | 962 | hwm=0.0.0    | 184  | 184  | -     | -   | ---         | 69   |
//|   X37:"37:xpc10" | 965 | hwm=0.0.0    | 193  | 193  | -     | -   | ---         | 184  |
//|   X37:"37:xpc10" | 964 | hwm=0.10.1   | 193  | 203  | 194   | 204 | ---         | 193  |
//|   X38:"38:xpc10" | 967 | hwm=0.0.0    | 205  | 205  | -     | -   | ---         | 65   |
//|   X38:"38:xpc10" | 966 | hwm=0.1.0    | 205  | 206  | 206   | 206 | ---         | 205  |
//*------------------+-----+--------------+------+------+-------+-----+-------------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X0:"0:xpc10"
//res2: Thread=xpc10 state=X0:"0:xpc10"
//*-----+-----+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*
//| pc  | eno | Phaser   | Work                                                                                                                                                                  |
//*-----+-----+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*
//| 0   | -   | R0 CTRL  |                                                                                                                                                                       |
//| 0   | 900 | R0 DATA  |                                                                                                                                                                       |
//| 0+E | 900 | W0 DATA  | T404/MatrixLib/mpx/1.23/V_2_GP te=te:0 scalarw(8) luTest/T404/Main/T404/Main/V_3_GP te=te:0 scalarw(0) runstate te=te:0 scalarw(4) T404/MatrixLib/mpx/1.23/V_1_GP te\ |
//|     |     |          | =te:0 scalarw(4457.92041ff) pio_rdata te=te:0 scalarw(0) pio_address te=te:0 scalarw(0) design_serial_number te=te:0 scalarw(S32'2232578) @_FPS/CC/SCALbx36_ARB0 te=\ |
//|     |     |          | te:0 write(63, 4062.65503ff) @_FPS/CC/SCALbx46_ARG0 te=te:0 write(63, 4062.65503ff)  PLI: %F   PLI:      PLI:Initial Coefficient ...  PLI:L/U Decomposition - ...  P\ |
//|     |     |          | LI:Kiwi L/U demo - L/U ...  W/P:Start  PLI:Kiwi Demo - L/U deco...                                                                                                    |
//| 1   | 900 | W1 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:1 write(62, 3684.23169ff) @_FPS/CC/SCALbx46_ARG0 te=te:1 write(54, 1728.72107ff)                                                         |
//| 2   | 900 | W2 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:2 write(61, 3349.30151ff) @_FPS/CC/SCALbx46_ARG0 te=te:2 write(45, 738.905212ff)                                                         |
//| 3   | 900 | W3 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:3 write(60, 3044.81958ff) @_FPS/CC/SCALbx46_ARG0 te=te:3 write(36, 319.126953ff)                                                         |
//| 4   | 900 | W4 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:4 write(59, 2768.01782ff) @_FPS/CC/SCALbx46_ARG0 te=te:4 write(27, 141.099991ff)                                                         |
//| 5   | 900 | W5 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:5 write(58, 2516.37988ff) @_FPS/CC/SCALbx46_ARG0 te=te:5 write(18, 65.5991821ff)                                                         |
//| 6   | 900 | W6 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:6 write(57, 2287.61792ff) @_FPS/CC/SCALbx46_ARG0 te=te:6 write(9, 33.5794754ff)                                                          |
//| 7   | 900 | W7 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:7 write(56, 2079.65259ff) @_FPS/CC/SCALbx46_ARG0 te=te:7 write(0, 20.0ff)                                                                |
//| 8   | 900 | W8 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:8 write(55, 1890.59326ff) @_FPS/CC/SCALbx46_ARG0 te=te:8 write(62, 3684.23169ff)                                                         |
//| 9   | 900 | W9 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:9 write(54, 1728.72107ff) @_FPS/CC/SCALbx46_ARG0 te=te:9 write(61, 3349.30151ff)                                                         |
//| 10  | 900 | W10 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:10 write(53, 1562.47363ff) @_FPS/CC/SCALbx46_ARG0 te=te:10 write(60, 3044.81958ff)                                                       |
//| 11  | 900 | W11 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:11 write(52, 1420.43054ff) @_FPS/CC/SCALbx46_ARG0 te=te:11 write(59, 2768.01782ff)                                                       |
//| 12  | 900 | W12 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:12 write(51, 1291.30042ff) @_FPS/CC/SCALbx46_ARG0 te=te:12 write(58, 2516.37988ff)                                                       |
//| 13  | 900 | W13 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:13 write(50, 1173.90942ff) @_FPS/CC/SCALbx46_ARG0 te=te:13 write(57, 2287.61792ff)                                                       |
//| 14  | 900 | W14 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:14 write(49, 1067.19031ff) @_FPS/CC/SCALbx46_ARG0 te=te:14 write(56, 2079.65259ff)                                                       |
//| 15  | 900 | W15 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:15 write(48, 970.172974ff) @_FPS/CC/SCALbx46_ARG0 te=te:15 write(55, 1890.59326ff)                                                       |
//| 16  | 900 | W16 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:16 write(47, 881.975403ff) @_FPS/CC/SCALbx46_ARG0 te=te:16 write(53, 1562.47363ff)                                                       |
//| 17  | 900 | W17 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:17 write(46, 801.795776ff) @_FPS/CC/SCALbx46_ARG0 te=te:17 write(52, 1420.43054ff)                                                       |
//| 18  | 900 | W18 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:18 write(45, 738.905212ff) @_FPS/CC/SCALbx46_ARG0 te=te:18 write(51, 1291.30042ff)                                                       |
//| 19  | 900 | W19 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:19 write(44, 662.641113ff) @_FPS/CC/SCALbx46_ARG0 te=te:19 write(50, 1173.90942ff)                                                       |
//| 20  | 900 | W20 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:20 write(43, 602.401001ff) @_FPS/CC/SCALbx46_ARG0 te=te:20 write(49, 1067.19031ff)                                                       |
//| 21  | 900 | W21 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:21 write(42, 547.637268ff) @_FPS/CC/SCALbx46_ARG0 te=te:21 write(48, 970.172974ff)                                                       |
//| 22  | 900 | W22 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:22 write(41, 497.852051ff) @_FPS/CC/SCALbx46_ARG0 te=te:22 write(47, 881.975403ff)                                                       |
//| 23  | 900 | W23 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:23 write(40, 452.592773ff) @_FPS/CC/SCALbx46_ARG0 te=te:23 write(46, 801.795776ff)                                                       |
//| 24  | 900 | W24 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:24 write(39, 411.447968ff) @_FPS/CC/SCALbx46_ARG0 te=te:24 write(44, 662.641113ff)                                                       |
//| 25  | 900 | W25 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:25 write(38, 374.04361ff) @_FPS/CC/SCALbx46_ARG0 te=te:25 write(43, 602.401001ff)                                                        |
//| 26  | 900 | W26 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:26 write(37, 340.039642ff) @_FPS/CC/SCALbx46_ARG0 te=te:26 write(42, 547.637268ff)                                                       |
//| 27  | 900 | W27 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:27 write(36, 319.126953ff) @_FPS/CC/SCALbx46_ARG0 te=te:27 write(41, 497.852051ff)                                                       |
//| 28  | 900 | W28 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:28 write(35, 281.024506ff) @_FPS/CC/SCALbx46_ARG0 te=te:28 write(40, 452.592773ff)                                                       |
//| 29  | 900 | W29 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:29 write(34, 255.476822ff) @_FPS/CC/SCALbx46_ARG0 te=te:29 write(39, 411.447968ff)                                                       |
//| 30  | 900 | W30 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:30 write(33, 232.251648ff) @_FPS/CC/SCALbx46_ARG0 te=te:30 write(38, 374.04361ff)                                                        |
//| 31  | 900 | W31 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:31 write(32, 211.137863ff) @_FPS/CC/SCALbx46_ARG0 te=te:31 write(37, 340.039642ff)                                                       |
//| 32  | 900 | W32 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:32 write(31, 191.943512ff) @_FPS/CC/SCALbx46_ARG0 te=te:32 write(35, 281.024506ff)                                                       |
//| 33  | 900 | W33 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:33 write(30, 174.494095ff) @_FPS/CC/SCALbx46_ARG0 te=te:33 write(34, 255.476822ff)                                                       |
//| 34  | 900 | W34 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:34 write(29, 158.630997ff) @_FPS/CC/SCALbx46_ARG0 te=te:34 write(33, 232.251648ff)                                                       |
//| 35  | 900 | W35 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:35 write(28, 144.209991ff) @_FPS/CC/SCALbx46_ARG0 te=te:35 write(32, 211.137863ff)                                                       |
//| 36  | 900 | W36 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:36 write(27, 141.099991ff) @_FPS/CC/SCALbx46_ARG0 te=te:36 write(31, 191.943512ff)                                                       |
//| 37  | 900 | W37 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:37 write(26, 119.181808ff) @_FPS/CC/SCALbx46_ARG0 te=te:37 write(30, 174.494095ff)                                                       |
//| 38  | 900 | W38 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:38 write(25, 108.347099ff) @_FPS/CC/SCALbx46_ARG0 te=te:38 write(29, 158.630997ff)                                                       |
//| 39  | 900 | W39 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:39 write(24, 98.4973602ff) @_FPS/CC/SCALbx46_ARG0 te=te:39 write(28, 144.209991ff)                                                       |
//| 40  | 900 | W40 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:40 write(23, 89.5430527ff) @_FPS/CC/SCALbx46_ARG0 te=te:40 write(26, 119.181808ff)                                                       |
//| 41  | 900 | W41 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:41 write(22, 81.402771ff) @_FPS/CC/SCALbx46_ARG0 te=te:41 write(25, 108.347099ff)                                                        |
//| 42  | 900 | W42 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:42 write(21, 74.0025177ff) @_FPS/CC/SCALbx46_ARG0 te=te:42 write(24, 98.4973602ff)                                                       |
//| 43  | 900 | W43 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:43 write(20, 67.2750168ff) @_FPS/CC/SCALbx46_ARG0 te=te:43 write(23, 89.5430527ff)                                                       |
//| 44  | 900 | W44 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:44 write(19, 61.1591034ff) @_FPS/CC/SCALbx46_ARG0 te=te:44 write(22, 81.402771ff)                                                        |
//| 45  | 900 | W45 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:45 write(18, 65.5991821ff) @_FPS/CC/SCALbx46_ARG0 te=te:45 write(21, 74.0025177ff)                                                       |
//| 46  | 900 | W46 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:46 write(17, 50.5447083ff) @_FPS/CC/SCALbx46_ARG0 te=te:46 write(20, 67.2750168ff)                                                       |
//| 47  | 900 | W47 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:47 write(16, 45.9497337ff) @_FPS/CC/SCALbx46_ARG0 te=te:47 write(19, 61.1591034ff)                                                       |
//| 48  | 900 | W48 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:48 write(15, 41.7724838ff) @_FPS/CC/SCALbx46_ARG0 te=te:48 write(17, 50.5447083ff)                                                       |
//| 49  | 900 | W49 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:49 write(14, 37.9749832ff) @_FPS/CC/SCALbx46_ARG0 te=te:49 write(16, 45.9497337ff)                                                       |
//| 50  | 900 | W50 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:50 write(13, 34.5227127ff) @_FPS/CC/SCALbx46_ARG0 te=te:50 write(15, 41.7724838ff)                                                       |
//| 51  | 900 | W51 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:51 write(12, 31.384285ff) @_FPS/CC/SCALbx46_ARG0 te=te:51 write(14, 37.9749832ff)                                                        |
//| 52  | 900 | W52 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:52 write(11, 28.531168ff) @_FPS/CC/SCALbx46_ARG0 te=te:52 write(13, 34.5227127ff)                                                        |
//| 53  | 900 | W53 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:53 write(10, 25.9374256ff) @_FPS/CC/SCALbx46_ARG0 te=te:53 write(12, 31.384285ff)                                                        |
//| 54  | 900 | W54 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:54 write(9, 33.5794754ff) @_FPS/CC/SCALbx46_ARG0 te=te:54 write(11, 28.531168ff)                                                         |
//| 55  | 900 | W55 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:55 write(8, 21.4358883ff) @_FPS/CC/SCALbx46_ARG0 te=te:55 write(10, 25.9374256ff)                                                        |
//| 56  | 900 | W56 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:56 write(7, 19.4871712ff) @_FPS/CC/SCALbx46_ARG0 te=te:56 write(8, 21.4358883ff)                                                         |
//| 57  | 900 | W57 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:57 write(6, 17.7156105ff) @_FPS/CC/SCALbx46_ARG0 te=te:57 write(7, 19.4871712ff)                                                         |
//| 58  | 900 | W58 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:58 write(5, 16.1051006ff) @_FPS/CC/SCALbx46_ARG0 te=te:58 write(6, 17.7156105ff)                                                         |
//| 59  | 900 | W59 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:59 write(4, 14.6410007ff) @_FPS/CC/SCALbx46_ARG0 te=te:59 write(5, 16.1051006ff)                                                         |
//| 60  | 900 | W60 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:60 write(3, 13.3100004ff) @_FPS/CC/SCALbx46_ARG0 te=te:60 write(4, 14.6410007ff)                                                         |
//| 61  | 900 | W61 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:61 write(2, 12.1000004ff) @_FPS/CC/SCALbx46_ARG0 te=te:61 write(3, 13.3100004ff)                                                         |
//| 62  | 900 | W62 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:62 write(1, 11.0ff) @_FPS/CC/SCALbx46_ARG0 te=te:62 write(2, 12.1000004ff)                                                               |
//| 63  | 900 | W63 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:63 write(0, 20.0ff) @_FPS/CC/SCALbx46_ARG0 te=te:63 write(1, 11.0ff)                                                                     |
//| 64  | 900 | W64 DATA |                                                                                                                                                                       |
//*-----+-----+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X1:"1:xpc10"
//res2: Thread=xpc10 state=X1:"1:xpc10"
//*------+-----+---------+-------*
//| pc   | eno | Phaser  | Work  |
//*------+-----+---------+-------*
//| 65   | -   | R0 CTRL |       |
//| 65   | 901 | R0 DATA |       |
//| 65+E | 901 | W0 DATA |  PLI: |
//*------+-----+---------+-------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X2:"2:xpc10"
//res2: Thread=xpc10 state=X2:"2:xpc10"
//*------+-----+---------+---------------------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                                |
//*------+-----+---------+---------------------------------------------------------------------------------------------------------------------*
//| 66   | -   | R0 CTRL |                                                                                                                     |
//| 66   | 902 | R0 DATA |                                                                                                                     |
//| 66+E | 902 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:66 scalarw(0)  PLI:                                                         |
//| 66   | 903 | R0 DATA |                                                                                                                     |
//| 66+E | 903 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:66 scalarw(0) luTest/T404/Main/T404/Main/V_3_GP te=te:66 scalarw(E1)  PLI:     |
//*------+-----+---------+---------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X3:"3:xpc10"
//res2: Thread=xpc10 state=X3:"3:xpc10"
//*------+-----+---------+------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                 |
//*------+-----+---------+------------------------------------------------------------------------------------------------------*
//| 67   | -   | R0 CTRL |                                                                                                      |
//| 67   | 904 | R0 DATA |                                                                                                      |
//| 67+E | 904 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:67 scalarw(E1) @_FPS/CC/SCALbx34_ARA0 te=te:67 write(E2, 1f) |
//| 68   | 904 | W1 DATA |                                                                                                      |
//| 67   | 905 | R0 DATA |                                                                                                      |
//| 67+E | 905 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:67 scalarw(0)                                                |
//*------+-----+---------+------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X4:"4:xpc10"
//res2: Thread=xpc10 state=X4:"4:xpc10"
//*------+-----+---------+----------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                           |
//*------+-----+---------+----------------------------------------------------------------*
//| 69   | -   | R0 CTRL |                                                                |
//| 69   | 906 | R0 DATA |                                                                |
//| 69+E | 906 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:69 scalarw(0)  PLI:UU= |
//| 69   | 907 | R0 DATA |                                                                |
//| 69+E | 907 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:69 scalarw(0)             |
//*------+-----+---------+----------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X5:"5:xpc10"
//res2: Thread=xpc10 state=X5:"5:xpc10"
//*------+-----+---------+----------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                 |
//*------+-----+---------+----------------------------------------------------------------------*
//| 70   | -   | R0 CTRL |                                                                      |
//| 70   | 908 | R0 DATA |                                                                      |
//| 70+E | 908 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:70 scalarw(0)  PLI:LL=  PLI: |
//| 70   | 909 | R0 DATA |                                                                      |
//| 70+E | 909 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:70 scalarw(0)  PLI:          |
//*------+-----+---------+----------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X6:"6:xpc10"
//res2: Thread=xpc10 state=X6:"6:xpc10"
//*------+-----+---------+------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                     |
//*------+-----+---------+------------------------------------------------------------------------------------------*
//| 71   | -   | R0 CTRL |                                                                                          |
//| 71   | 910 | R0 DATA |                                                                                          |
//| 71+E | 910 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:71 scalarw(0)  PLI:Recombine LL and RR:...  PLI: |
//| 71   | 911 | R0 DATA |                                                                                          |
//| 71+E | 911 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:71 scalarw(0)  PLI:                              |
//*------+-----+---------+------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X7:"7:xpc10"
//res2: Thread=xpc10 state=X7:"7:xpc10"
//*------+-----+---------+-------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                  |
//*------+-----+---------+-------------------------------------------------------*
//| 72   | -   | R0 CTRL |                                                       |
//| 72   | 912 | R0 DATA |                                                       |
//| 72+E | 912 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:72 scalarw(0) |
//| 72   | 913 | R0 DATA |                                                       |
//| 72+E | 913 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:72 scalarw(0) |
//*------+-----+---------+-------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X8:"8:xpc10"
//res2: Thread=xpc10 state=X8:"8:xpc10"
//*------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                                                            |
//*------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------------*
//| 73   | -   | R0 CTRL |                                                                                                                                                 |
//| 73   | 914 | R0 DATA |                                                                                                                                                 |
//| 73+E | 914 | W0 DATA | runstate te=te:73 scalarw(5) luTest/T404/Main/T404/Main/V_1_GP te=te:73 scalarw(0)  W/P:Coefficients Created  PLI:Kiwi L/U demo - coef...  PLI: |
//| 73   | 915 | R0 DATA |                                                                                                                                                 |
//| 73+E | 915 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:73 scalarw(0)  PLI:                                                                                     |
//*------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X9:"9:xpc10"
//res2: Thread=xpc10 state=X9:"9:xpc10"
//*------+-----+---------+------------------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                             |
//*------+-----+---------+------------------------------------------------------------------------------------------------------------------*
//| 74   | -   | R0 CTRL |                                                                                                                  |
//| 74   | 916 | R0 DATA |                                                                                                                  |
//| 74+E | 916 | W0 DATA | runstate te=te:74 scalarw(20)  PLI:Kiwi L/U demo - L/U ...  W/P:ThreeTestsFinished                               |
//| 74   | 917 | R0 DATA |                                                                                                                  |
//| 74+E | 917 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:74 scalarw(0) runstate te=te:74 scalarw(E3)  PLI:
//Kiwi L/U demo - L/U... |
//*------+-----+---------+------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X10:"10:xpc10"
//res2: Thread=xpc10 state=X10:"10:xpc10"
//*------+-----+---------+------*
//| pc   | eno | Phaser  | Work |
//*------+-----+---------+------*
//| 75   | -   | R0 CTRL |      |
//| 75   | 918 | R0 DATA |      |
//| 75+E | 918 | W0 DATA |      |
//*------+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X11:"11:xpc10"
//res2: Thread=xpc10 state=X11:"11:xpc10"
//*------+-----+---------+------*
//| pc   | eno | Phaser  | Work |
//*------+-----+---------+------*
//| 76   | -   | R0 CTRL |      |
//| 76   | 919 | R0 DATA |      |
//| 76+E | 919 | W0 DATA |      |
//*------+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X12:"12:xpc10"
//res2: Thread=xpc10 state=X12:"12:xpc10"
//*------+-----+----------+--------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser   | Work                                                                                                   |
//*------+-----+----------+--------------------------------------------------------------------------------------------------------*
//| 77   | -   | R0 CTRL  |                                                                                                        |
//| 77   | 920 | R0 DATA  | fpcvt10 te=te:77 cvt(E4) fpcvt12 te=te:77 cvt(E5)                                                      |
//| 78   | 920 | R1 DATA  |                                                                                                        |
//| 79   | 920 | R2 DATA  | CVFPMULTIPLIER12 te=te:79 *fixed-func-ALU*(10f, E6) CVFPMULTIPLIER10 te=te:79 *fixed-func-ALU*(2f, E7) |
//| 80   | 920 | R3 DATA  |                                                                                                        |
//| 81   | 920 | R4 DATA  |                                                                                                        |
//| 82   | 920 | R5 DATA  |                                                                                                        |
//| 83   | 920 | R6 DATA  | CVFPADDER10 te=te:83 *fixed-func-ALU*(E8, E9)                                                          |
//| 84   | 920 | R7 DATA  |                                                                                                        |
//| 85   | 920 | R8 DATA  |                                                                                                        |
//| 86   | 920 | R9 DATA  |                                                                                                        |
//| 87   | 920 | R10 DATA | CVFPADDER12 te=te:87 *fixed-func-ALU*(1f, E10)                                                         |
//| 88   | 920 | R11 DATA |                                                                                                        |
//| 89   | 920 | R12 DATA |                                                                                                        |
//| 90   | 920 | R13 DATA |                                                                                                        |
//| 91   | 920 | R14 DATA |                                                                                                        |
//| 91+E | 920 | W0 DATA  | luTest/T404/Main/T404/Main/V_3_GP te=te:91 scalarw(E1) @_FPS/CC/SCALbx40_ARD0 te=te:91 write(E4, E11)  |
//| 92   | 920 | W1 DATA  |                                                                                                        |
//| 77   | 921 | R0 DATA  |                                                                                                        |
//| 77+E | 921 | W0 DATA  | luTest/T404/Main/T404/Main/V_3_GP te=te:77 scalarw(0) @_FPS/CC/SCALbx40_ARD0 te=te:77 write(7, 2.71f)  |
//| 93   | 921 | W1 DATA  |                                                                                                        |
//*------+-----+----------+--------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X13:"13:xpc10"
//res2: Thread=xpc10 state=X13:"13:xpc10"
//*------+-----+---------+-----------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                |
//*------+-----+---------+-----------------------------------------------------------------------------------------------------*
//| 94   | -   | R0 CTRL |                                                                                                     |
//| 94   | 922 | R0 DATA | @_FPS/CC/SCALbx40_ARD0 te=te:94 read(E4)                                                            |
//| 95   | 922 | R1 DATA |                                                                                                     |
//| 95+E | 922 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:95 scalarw(E1)  PLI:  test=%u  target_rh...                 |
//| 94   | 923 | R0 DATA |                                                                                                     |
//| 96   | 923 | R1 DATA | @_FPS/CC/SCALbx40_ARD0 te=te:96 read(0)                                                             |
//| 97   | 923 | R2 DATA |                                                                                                     |
//| 97+E | 923 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:97 scalarw(1) @_FPS/CC/SCALbx42_ARE0 te=te:97 write(0, E12) |
//| 98   | 923 | W1 DATA |                                                                                                     |
//*------+-----+---------+-----------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X14:"14:xpc10"
//res2: Thread=xpc10 state=X14:"14:xpc10"
//*------+-----+---------+--------------------------------------------------------------------------------------------------------*
//| pc   | eno | Phaser  | Work                                                                                                   |
//*------+-----+---------+--------------------------------------------------------------------------------------------------------*
//| 99   | -   | R0 CTRL |                                                                                                        |
//| 99   | 924 | R0 DATA |                                                                                                        |
//| 99+E | 924 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:99 scalarw(0)  PLI:{  PLI:After fwds subst=                    |
//| 99   | 925 | R0 DATA |                                                                                                        |
//| 99+E | 925 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:99 scalarw(0) T404/MatrixLib/mpx/1.23/V_1_GP te=te:99 scalarw(0f) |
//*------+-----+---------+--------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X15:"15:xpc10"
//res2: Thread=xpc10 state=X15:"15:xpc10"
//*-------+-----+---------+------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                             |
//*-------+-----+---------+------------------------------------------------------------------*
//| 100   | -   | R0 CTRL |                                                                  |
//| 100   | 926 | R0 DATA | @_FPS/CC/SCALbx42_ARE0 te=te:100 read(E4)                        |
//| 101   | 926 | R1 DATA |                                                                  |
//| 101+E | 926 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:101 scalarw(E1)  PLI:%F  |
//| 100   | 927 | R0 DATA |                                                                  |
//| 100+E | 927 | W0 DATA |                                                                  |
//*-------+-----+---------+------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X16:"16:xpc10"
//res2: Thread=xpc10 state=X16:"16:xpc10"
//*-------+-----+---------+---------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                          |
//*-------+-----+---------+---------------------------------------------------------------*
//| 102   | -   | R0 CTRL |                                                               |
//| 102   | 928 | R0 DATA |                                                               |
//| 102+E | 928 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:102 scalarw(7)  PLI:} |
//*-------+-----+---------+---------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X17:"17:xpc10"
//res2: Thread=xpc10 state=X17:"17:xpc10"
//*-------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                      |
//*-------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//| 103   | -   | R0 CTRL |                                                                                                           |
//| 103   | 929 | R0 DATA |                                                                                                           |
//| 103+E | 929 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:103 scalarw(0)  PLI:{  PLI:After back subst=                      |
//| 103   | 930 | R0 DATA |                                                                                                           |
//| 103+E | 930 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:103 scalarw(E1) T404/MatrixLib/mpx/1.23/V_1_GP te=te:103 scalarw(0f) |
//*-------+-----+---------+-----------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X18:"18:xpc10"
//res2: Thread=xpc10 state=X18:"18:xpc10"
//*-------+-----+---------+------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                             |
//*-------+-----+---------+------------------------------------------------------------------*
//| 104   | -   | R0 CTRL |                                                                  |
//| 104   | 931 | R0 DATA | @_FPS/CC/SCALbx44_ARF0 te=te:104 read(E4)                        |
//| 105   | 931 | R1 DATA |                                                                  |
//| 105+E | 931 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:105 scalarw(E1)  PLI:%F  |
//| 104   | 932 | R0 DATA |                                                                  |
//| 104+E | 932 | W0 DATA |                                                                  |
//*-------+-----+---------+------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X19:"19:xpc10"
//res2: Thread=xpc10 state=X19:"19:xpc10"
//*-------+-----+---------+--------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                       |
//*-------+-----+---------+--------------------------------------------------------------------------------------------*
//| 106   | -   | R0 CTRL |                                                                                            |
//| 106   | 933 | R0 DATA |                                                                                            |
//| 106+E | 933 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:106 scalarw(0)  PLI:Substitute back - rh...  PLI:} |
//*-------+-----+---------+--------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X20:"20:xpc10"
//res2: Thread=xpc10 state=X20:"20:xpc10"
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                     |
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//| 107   | -   | R0 CTRL |                                                                                                          |
//| 107   | 934 | R0 DATA |                                                                                                          |
//| 107+E | 934 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:107 scalarw(0)  PLI:{                                            |
//| 107   | 935 | R0 DATA |                                                                                                          |
//| 107+E | 935 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:107 scalarw(0) T404/MatrixLib/mpx/1.23/V_1_GP te=te:107 scalarw(0f) |
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X21:"21:xpc10"
//res2: Thread=xpc10 state=X21:"21:xpc10"
//*-------+-----+---------+------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                             |
//*-------+-----+---------+------------------------------------------------------------------*
//| 108   | -   | R0 CTRL |                                                                  |
//| 108   | 936 | R0 DATA | @_FPS/CC/SCALbx48_ARH0 te=te:108 read(E4)                        |
//| 109   | 936 | R1 DATA |                                                                  |
//| 109+E | 936 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:109 scalarw(E1)  PLI:%F  |
//| 108   | 937 | R0 DATA |                                                                  |
//| 108+E | 937 | W0 DATA |                                                                  |
//*-------+-----+---------+------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X22:"22:xpc10"
//res2: Thread=xpc10 state=X22:"22:xpc10"
//*-------+-----+---------+---------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                        |
//*-------+-----+---------+---------------------------------------------------------------------------------------------*
//| 110   | -   | R0 CTRL |                                                                                             |
//| 110   | 938 | R0 DATA |                                                                                             |
//| 110+E | 938 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:110 scalarw(0) runstate te=te:110 scalarw(9)  PLI:} |
//*-------+-----+---------+---------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X23:"23:xpc10"
//res2: Thread=xpc10 state=X23:"23:xpc10"
//*-------+-----+---------+------------------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                                   |
//*-------+-----+---------+------------------------------------------------------------------------------------------------------------------------*
//| 111   | -   | R0 CTRL |                                                                                                                        |
//| 111   | 939 | R0 DATA | @_FPS/CC/SCALbx48_ARH0 te=te:111 read(E4)                                                                              |
//| 112   | 939 | R1 DATA |                                                                                                                        |
//| 112+E | 939 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:112 scalarw(E1) out_data te=te:112 scalarw(E13) out_idx te=te:112 scalarw(E14) |
//| 111   | 940 | R0 DATA |                                                                                                                        |
//| 111+E | 940 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:111 scalarw(E15)                                                               |
//*-------+-----+---------+------------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X24:"24:xpc10"
//res2: Thread=xpc10 state=X24:"24:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                        |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| 113   | -   | R0 CTRL |                                                                                                             |
//| 113   | 941 | R0 DATA | @_FPS/CC/SCALbx46_ARG0 te=te:113 read(E16) @_FPS/CC/SCALbx44_ARF0 te=te:113 read(E17)                       |
//| 114   | 941 | R1 DATA | CVFPMULTIPLIER14 te=te:114 *fixed-func-ALU*(E18, E19)                                                       |
//| 115   | 941 | R2 DATA |                                                                                                             |
//| 116   | 941 | R3 DATA |                                                                                                             |
//| 117   | 941 | R4 DATA |                                                                                                             |
//| 118   | 941 | R5 DATA | CVFPADDER14 te=te:118 *fixed-func-ALU*(E20, E21)                                                            |
//| 119   | 941 | R6 DATA |                                                                                                             |
//| 120   | 941 | R7 DATA |                                                                                                             |
//| 121   | 941 | R8 DATA |                                                                                                             |
//| 122   | 941 | R9 DATA |                                                                                                             |
//| 122+E | 941 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:122 scalarw(E22) T404/MatrixLib/mpx/1.23/V_1_GP te=te:122 scalarw(E23) |
//| 113   | 942 | R0 DATA |                                                                                                             |
//| 113+E | 942 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:113 scalarw(E1) @_FPS/CC/SCALbx48_ARH0 te=te:113 write(E4, E24)     |
//| 123   | 942 | W1 DATA |                                                                                                             |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X25:"25:xpc10"
//res2: Thread=xpc10 state=X25:"25:xpc10"
//*-------+-----+----------+-------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser   | Work                                                                                                        |
//*-------+-----+----------+-------------------------------------------------------------------------------------------------------------*
//| 124   | -   | R0 CTRL  |                                                                                                             |
//| 124   | 943 | R0 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:124 read(E16) @_FPS/CC/SCALbx44_ARF0 te=te:124 read(E17)                       |
//| 125   | 943 | R1 DATA  | CVFPMULTIPLIER16 te=te:125 *fixed-func-ALU*(E19, E25)                                                       |
//| 126   | 943 | R2 DATA  |                                                                                                             |
//| 127   | 943 | R3 DATA  |                                                                                                             |
//| 128   | 943 | R4 DATA  |                                                                                                             |
//| 129   | 943 | R5 DATA  | CVFPADDER16 te=te:129 *fixed-func-ALU*(E20, E26)                                                            |
//| 130   | 943 | R6 DATA  |                                                                                                             |
//| 131   | 943 | R7 DATA  |                                                                                                             |
//| 132   | 943 | R8 DATA  |                                                                                                             |
//| 133   | 943 | R9 DATA  |                                                                                                             |
//| 133+E | 943 | W0 DATA  | T404/MatrixLib/mpx/1.23/V_2_GP te=te:133 scalarw(E22) T404/MatrixLib/mpx/1.23/V_1_GP te=te:133 scalarw(E27) |
//| 124   | 944 | R0 DATA  | @_FPS/CC/SCALbx42_ARE0 te=te:124 read(E4)                                                                   |
//| 134   | 944 | R1 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:134 read(E2) CVFPADDER18 te=te:134 *fixed-func-ALU*(E28, E29)                  |
//| 135   | 944 | R2 DATA  |                                                                                                             |
//| 136   | 944 | R3 DATA  |                                                                                                             |
//| 137   | 944 | R4 DATA  |                                                                                                             |
//| 138   | 944 | R5 DATA  | CVFPDIVIDER10 te=te:138 *fixed-func-ALU*(E30, E31)                                                          |
//| 139   | 944 | R6 DATA  |                                                                                                             |
//| 140   | 944 | R7 DATA  |                                                                                                             |
//| 141   | 944 | R8 DATA  |                                                                                                             |
//| 142   | 944 | R9 DATA  |                                                                                                             |
//| 143   | 944 | R10 DATA |                                                                                                             |
//| 143+E | 944 | W0 DATA  | luTest/T404/Main/T404/Main/V_3_GP te=te:143 scalarw(E32) @_FPS/CC/SCALbx44_ARF0 te=te:143 write(E4, E33)    |
//| 144   | 944 | W1 DATA  |                                                                                                             |
//*-------+-----+----------+-------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X26:"26:xpc10"
//res2: Thread=xpc10 state=X26:"26:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                        |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| 145   | -   | R0 CTRL |                                                                                                             |
//| 145   | 945 | R0 DATA | @_FPS/CC/SCALbx34_ARA0 te=te:145 read(E16) @_FPS/CC/SCALbx42_ARE0 te=te:145 read(E17)                       |
//| 146   | 945 | R1 DATA | CVFPMULTIPLIER18 te=te:146 *fixed-func-ALU*(E34, E35)                                                       |
//| 147   | 945 | R2 DATA |                                                                                                             |
//| 148   | 945 | R3 DATA |                                                                                                             |
//| 149   | 945 | R4 DATA |                                                                                                             |
//| 150   | 945 | R5 DATA | CVFPADDER20 te=te:150 *fixed-func-ALU*(E20, E36)                                                            |
//| 151   | 945 | R6 DATA |                                                                                                             |
//| 152   | 945 | R7 DATA |                                                                                                             |
//| 153   | 945 | R8 DATA |                                                                                                             |
//| 154   | 945 | R9 DATA |                                                                                                             |
//| 154+E | 945 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:154 scalarw(E22) T404/MatrixLib/mpx/1.23/V_1_GP te=te:154 scalarw(E37) |
//| 145   | 946 | R0 DATA | @_FPS/CC/SCALbx40_ARD0 te=te:145 read(E4)                                                                   |
//| 155   | 946 | R1 DATA | CVFPADDER20 te=te:155 *fixed-func-ALU*(E38, E29)                                                            |
//| 156   | 946 | R2 DATA |                                                                                                             |
//| 157   | 946 | R3 DATA |                                                                                                             |
//| 158   | 946 | R4 DATA |                                                                                                             |
//| 159   | 946 | R5 DATA |                                                                                                             |
//| 159+E | 946 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:159 scalarw(E1) @_FPS/CC/SCALbx42_ARE0 te=te:159 write(E4, E39)     |
//| 160   | 946 | W1 DATA |                                                                                                             |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X27:"27:xpc10"
//res2: Thread=xpc10 state=X27:"27:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                              |
//*-------+-----+---------+-------------------------------------------------------------------*
//| 161   | -   | R0 CTRL |                                                                   |
//| 161   | 947 | R0 DATA | @_FPS/CC/SCALbx38_ARC0 te=te:161 read(E40)                        |
//| 162   | 947 | R1 DATA |                                                                   |
//| 162+E | 947 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:162 scalarw(E1)  PLI: %F  |
//| 161   | 948 | R0 DATA |                                                                   |
//| 161+E | 948 | W0 DATA |  PLI:                                                             |
//*-------+-----+---------+-------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X28:"28:xpc10"
//res2: Thread=xpc10 state=X28:"28:xpc10"
//*-------+-----+---------+----------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                     |
//*-------+-----+---------+----------------------------------------------------------*
//| 163   | -   | R0 CTRL |                                                          |
//| 163   | 949 | R0 DATA |                                                          |
//| 163+E | 949 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:163 scalarw(E15) |
//*-------+-----+---------+----------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X29:"29:xpc10"
//res2: Thread=xpc10 state=X29:"29:xpc10"
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                     |
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//| 164   | -   | R0 CTRL |                                                                                                          |
//| 164   | 950 | R0 DATA |                                                                                                          |
//| 164+E | 950 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:164 scalarw(E15)                                                 |
//| 164   | 951 | R0 DATA |                                                                                                          |
//| 164+E | 951 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:164 scalarw(0) T404/MatrixLib/mpx/1.23/V_1_GP te=te:164 scalarw(0f) |
//*-------+-----+---------+----------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X30:"30:xpc10"
//res2: Thread=xpc10 state=X30:"30:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                        |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//| 165   | -   | R0 CTRL |                                                                                                             |
//| 165   | 952 | R0 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:165 read(E41) @_FPS/CC/SCALbx34_ARA0 te=te:165 read(E42)                       |
//| 166   | 952 | R1 DATA | CVFPMULTIPLIER20 te=te:166 *fixed-func-ALU*(E43, E44)                                                       |
//| 167   | 952 | R2 DATA |                                                                                                             |
//| 168   | 952 | R3 DATA |                                                                                                             |
//| 169   | 952 | R4 DATA |                                                                                                             |
//| 170   | 952 | R5 DATA | CVFPADDER18 te=te:170 *fixed-func-ALU*(E20, E45)                                                            |
//| 171   | 952 | R6 DATA |                                                                                                             |
//| 172   | 952 | R7 DATA |                                                                                                             |
//| 173   | 952 | R8 DATA |                                                                                                             |
//| 174   | 952 | R9 DATA |                                                                                                             |
//| 174+E | 952 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:174 scalarw(E22) T404/MatrixLib/mpx/1.23/V_1_GP te=te:174 scalarw(E46) |
//| 165   | 953 | R0 DATA |                                                                                                             |
//| 165+E | 953 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:165 scalarw(E1) @_FPS/CC/SCALbx38_ARC0 te=te:165 write(E40, E24)    |
//| 175   | 953 | W1 DATA |                                                                                                             |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X31:"31:xpc10"
//res2: Thread=xpc10 state=X31:"31:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                              |
//*-------+-----+---------+-------------------------------------------------------------------*
//| 176   | -   | R0 CTRL |                                                                   |
//| 176   | 954 | R0 DATA | @_FPS/CC/SCALbx34_ARA0 te=te:176 read(E40)                        |
//| 177   | 954 | R1 DATA |                                                                   |
//| 177+E | 954 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:177 scalarw(E1)  PLI: %F  |
//| 176   | 955 | R0 DATA |                                                                   |
//| 176+E | 955 | W0 DATA |  PLI:                                                             |
//*-------+-----+---------+-------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X32:"32:xpc10"
//res2: Thread=xpc10 state=X32:"32:xpc10"
//*-------+-----+---------+----------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                     |
//*-------+-----+---------+----------------------------------------------------------*
//| 178   | -   | R0 CTRL |                                                          |
//| 178   | 956 | R0 DATA |                                                          |
//| 178+E | 956 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:178 scalarw(E15) |
//*-------+-----+---------+----------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X33:"33:xpc10"
//res2: Thread=xpc10 state=X33:"33:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                              |
//*-------+-----+---------+-------------------------------------------------------------------*
//| 179   | -   | R0 CTRL |                                                                   |
//| 179   | 957 | R0 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:179 read(E40)                        |
//| 180   | 957 | R1 DATA |                                                                   |
//| 180+E | 957 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:180 scalarw(E1)  PLI: %F  |
//| 179   | 958 | R0 DATA |                                                                   |
//| 179+E | 958 | W0 DATA |  PLI:                                                             |
//*-------+-----+---------+-------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X34:"34:xpc10"
//res2: Thread=xpc10 state=X34:"34:xpc10"
//*-------+-----+---------+----------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                     |
//*-------+-----+---------+----------------------------------------------------------*
//| 181   | -   | R0 CTRL |                                                          |
//| 181   | 959 | R0 DATA |                                                          |
//| 181+E | 959 | W0 DATA | luTest/T404/Main/T404/Main/V_1_GP te=te:181 scalarw(E15) |
//*-------+-----+---------+----------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X35:"35:xpc10"
//res2: Thread=xpc10 state=X35:"35:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                  |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------*
//| 182   | -   | R0 CTRL |                                                                                                       |
//| 182   | 960 | R0 DATA |                                                                                                       |
//| 182+E | 960 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:182 scalarw(E22) @_FPS/CC/SCALbx34_ARA0 te=te:182 write(E47, 1f) |
//| 183   | 960 | W1 DATA |                                                                                                       |
//| 182   | 961 | R0 DATA |                                                                                                       |
//| 182+E | 961 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:182 scalarw(E1)                                                  |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X36:"36:xpc10"
//res2: Thread=xpc10 state=X36:"36:xpc10"
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                                                                                                      |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------*
//| 184   | -   | R0 CTRL |                                                                                                                                           |
//| 184   | 962 | R0 DATA |                                                                                                                                           |
//| 184+E | 962 | W0 DATA | luTest/T404/Main/T404/Main/V_3_GP te=te:184 scalarw(E1)                                                                                   |
//| 184   | 963 | R0 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:184 read(E41)                                                                                                |
//| 185   | 963 | R1 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:185 read(E2)                                                                                                 |
//| 186   | 963 | R2 DATA | CVFPDIVIDER12 te=te:186 *fixed-func-ALU*(E43, E31)                                                                                        |
//| 187   | 963 | R3 DATA |                                                                                                                                           |
//| 188   | 963 | R4 DATA |                                                                                                                                           |
//| 189   | 963 | R5 DATA |                                                                                                                                           |
//| 190   | 963 | R6 DATA |                                                                                                                                           |
//| 191   | 963 | R7 DATA |                                                                                                                                           |
//| 191+E | 963 | W0 DATA | T404/MatrixLib/mpx/1.23/V_1_GP te=te:191 scalarw(E48) @_FPS/CC/SCALbx36_ARB0 te=te:191 write(E41, 0f) @_FPS/CC/SCALbx34_ARA0 te=te:191 w\ |
//|       |     |         | rite(E41, E49) luTest/T404/Main/T404/Main/V_1_GP te=te:191 scalarw(E1)                                                                    |
//| 192   | 963 | W1 DATA |                                                                                                                                           |
//*-------+-----+---------+-------------------------------------------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X37:"37:xpc10"
//res2: Thread=xpc10 state=X37:"37:xpc10"
//*-------+-----+----------+-----------------------------------------------------------------------------------------------------------*
//| pc    | eno | Phaser   | Work                                                                                                      |
//*-------+-----+----------+-----------------------------------------------------------------------------------------------------------*
//| 193   | -   | R0 CTRL  |                                                                                                           |
//| 193   | 964 | R0 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:193 read(E50)                                                                |
//| 194   | 964 | R1 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:194 read(E51)                                                                |
//| 195   | 964 | R2 DATA  | CVFPMULTIPLIER20 te=te:195 *fixed-func-ALU*(E52, E29)                                                     |
//| 196   | 964 | R3 DATA  |                                                                                                           |
//| 197   | 964 | R4 DATA  |                                                                                                           |
//| 198   | 964 | R5 DATA  |                                                                                                           |
//| 199   | 964 | R6 DATA  | CVFPADDER16 te=te:199 *fixed-func-ALU*(E53, E54)                                                          |
//| 200   | 964 | R7 DATA  |                                                                                                           |
//| 201   | 964 | R8 DATA  |                                                                                                           |
//| 202   | 964 | R9 DATA  |                                                                                                           |
//| 203   | 964 | R10 DATA |                                                                                                           |
//| 203+E | 964 | W0 DATA  | @_FPS/CC/SCALbx36_ARB0 te=te:203 write(E50, E55) luTest/T404/Main/T404/Main/V_1_GP te=te:203 scalarw(E15) |
//| 204   | 964 | W1 DATA  |                                                                                                           |
//| 193   | 965 | R0 DATA  |                                                                                                           |
//| 193+E | 965 | W0 DATA  | T404/MatrixLib/mpx/1.23/V_2_GP te=te:193 scalarw(E22)                                                     |
//*-------+-----+----------+-----------------------------------------------------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc10 state=X38:"38:xpc10"
//res2: Thread=xpc10 state=X38:"38:xpc10"
//*-------+-----+---------+-----------------------------------------------------------------*
//| pc    | eno | Phaser  | Work                                                            |
//*-------+-----+---------+-----------------------------------------------------------------*
//| 205   | -   | R0 CTRL |                                                                 |
//| 205   | 966 | R0 DATA | @_FPS/CC/SCALbx36_ARB0 te=te:205 read(E16)                      |
//| 206   | 966 | R1 DATA |                                                                 |
//| 206+E | 966 | W0 DATA | T404/MatrixLib/mpx/1.23/V_2_GP te=te:206 scalarw(E22)  PLI: %F  |
//| 205   | 967 | R0 DATA |                                                                 |
//| 205+E | 967 | W0 DATA |                                                                 |
//*-------+-----+---------+-----------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//PC codings points for xpc12 
//*----------------+-----+-------------+------+------+-------+-----+-------------+------*
//| gb-flag/Pause  | eno | hwm         | root | exec | start | end | antecedants | next |
//*----------------+-----+-------------+------+------+-------+-----+-------------+------*
//|   X0:"0:xpc12" | 968 | hwm=0.0.0   | 0    | 0    | -     | -   | ---         | 1    |
//|   X1:"1:xpc12" | 970 | hwm=0.0.0   | 1    | 1    | -     | -   | ---         | 2    |
//|   X1:"1:xpc12" | 969 | hwm=0.0.0   | 1    | 1    | -     | -   | ---         | 2    |
//|   X2:"2:xpc12" | 971 | hwm=0.0.0   | 2    | 2    | -     | -   | ---         | 3    |
//|   X4:"4:xpc12" | 972 | hwm=0.0.0   | 3    | 3    | -     | -   | ---         | 1    |
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
//| 0   | 968 | R0 DATA |      |
//| 0+E | 968 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X1:"1:xpc12"
//res2: Thread=xpc12 state=X1:"1:xpc12"
//*-----+-----+---------+-------------------------------------------------------------*
//| pc  | eno | Phaser  | Work                                                        |
//*-----+-----+---------+-------------------------------------------------------------*
//| 1   | -   | R0 CTRL |                                                             |
//| 1   | 969 | R0 DATA |                                                             |
//| 1+E | 969 | W0 DATA | @_SINT/CC/SCALbx10_SCALARA0_0 te=te:1 scalarw(C(pio_wdata)) |
//| 1   | 970 | R0 DATA |                                                             |
//| 1+E | 970 | W0 DATA | pio_rdata te=te:1 scalarw(E56)                              |
//*-----+-----+---------+-------------------------------------------------------------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X2:"2:xpc12"
//res2: Thread=xpc12 state=X2:"2:xpc12"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 2   | -   | R0 CTRL |      |
//| 2   | 971 | R0 DATA |      |
//| 2+E | 971 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from restructure2:::
//<NONE>Simple greedy schedule for res2: Thread=xpc12 state=X4:"4:xpc12"
//res2: Thread=xpc12 state=X4:"4:xpc12"
//*-----+-----+---------+------*
//| pc  | eno | Phaser  | Work |
//*-----+-----+---------+------*
//| 3   | -   | R0 CTRL |      |
//| 3   | 972 | R0 DATA |      |
//| 3+E | 972 | W0 DATA |      |
//*-----+-----+---------+------*
//

//----------------------------------------------------------

//Report from enumbers:::
//Concise expression alias report.
//
//  E1 =.= 1+luTest/T404/Main/T404/Main/V_3_GP
//
//  E2 =.= C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))
//
//  E3 =.= 10+luTest/T404/Main/T404/Main/V_1_GP
//
//  E4 =.= luTest/T404/Main/T404/Main/V_3_GP
//
//  E5 =.= luTest/T404/Main/T404/Main/V_1_GP
//
//  E6 =.= Cf(luTest/T404/Main/T404/Main/V_1_GP)
//
//  E7 =.= Cf(luTest/T404/Main/T404/Main/V_3_GP)
//
//  E8 =.= 2f*(Cf(luTest/T404/Main/T404/Main/V_3_GP))
//
//  E9 =.= 10f*(Cf(luTest/T404/Main/T404/Main/V_1_GP))
//
//  E10 =.= 2f*(Cf(luTest/T404/Main/T404/Main/V_3_GP))+10f*(Cf(luTest/T404/Main/T404/Main/V_1_GP))
//
//  E11 =.= 1f+2f*(Cf(luTest/T404/Main/T404/Main/V_3_GP))+10f*(Cf(luTest/T404/Main/T404/Main/V_1_GP))
//
//  E12 =.= Cf(@_FPS/CC/SCALbx40_ARD0[0])
//
//  E13 =.= Cf(@_FPS/CC/SCALbx48_ARH0[luTest/T404/Main/T404/Main/V_3_GP])
//
//  E14 =.= C(luTest/T404/Main/T404/Main/V_3_GP)
//
//  E15 =.= 1+luTest/T404/Main/T404/Main/V_1_GP
//
//  E16 =.= C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))
//
//  E17 =.= T404/MatrixLib/mpx/1.23/V_2_GP
//
//  E18 =.= @_FPS/CC/SCALbx46_ARG0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E19 =.= @_FPS/CC/SCALbx44_ARF0[T404/MatrixLib/mpx/1.23/V_2_GP]
//
//  E20 =.= T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E21 =.= @_FPS/CC/SCALbx46_ARG0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]*@_FPS/CC/SCALbx44_ARF0[T404/MatrixLib/mpx/1.23/V_2_GP]
//
//  E22 =.= 1+T404/MatrixLib/mpx/1.23/V_2_GP
//
//  E23 =.= T404/MatrixLib/mpx/1.23/V_1_GP+@_FPS/CC/SCALbx46_ARG0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]*@_FPS/CC/SCALbx44_ARF0[T404/MatrixLib/mpx/1.23/V_2_GP]
//
//  E24 =.= Cf(T404/MatrixLib/mpx/1.23/V_1_GP)
//
//  E25 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E26 =.= @_FPS/CC/SCALbx44_ARF0[T404/MatrixLib/mpx/1.23/V_2_GP]*@_FPS/CC/SCALbx36_ARB0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E27 =.= T404/MatrixLib/mpx/1.23/V_1_GP+@_FPS/CC/SCALbx44_ARF0[T404/MatrixLib/mpx/1.23/V_2_GP]*@_FPS/CC/SCALbx36_ARB0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E28 =.= @_FPS/CC/SCALbx42_ARE0[luTest/T404/Main/T404/Main/V_3_GP]
//
//  E29 =.= -T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E30 =.= @_FPS/CC/SCALbx42_ARE0[luTest/T404/Main/T404/Main/V_3_GP]+-T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E31 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E32 =.= -1+luTest/T404/Main/T404/Main/V_3_GP
//
//  E33 =.= (@_FPS/CC/SCALbx42_ARE0[luTest/T404/Main/T404/Main/V_3_GP]+-T404/MatrixLib/mpx/1.23/V_1_GP)/@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E34 =.= @_FPS/CC/SCALbx42_ARE0[T404/MatrixLib/mpx/1.23/V_2_GP]
//
//  E35 =.= @_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E36 =.= @_FPS/CC/SCALbx42_ARE0[T404/MatrixLib/mpx/1.23/V_2_GP]*@_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E37 =.= T404/MatrixLib/mpx/1.23/V_1_GP+@_FPS/CC/SCALbx42_ARE0[T404/MatrixLib/mpx/1.23/V_2_GP]*@_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E38 =.= @_FPS/CC/SCALbx40_ARD0[luTest/T404/Main/T404/Main/V_3_GP]
//
//  E39 =.= @_FPS/CC/SCALbx40_ARD0[luTest/T404/Main/T404/Main/V_3_GP]+-T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E40 =.= C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_1_GP)))
//
//  E41 =.= C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))
//
//  E42 =.= C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_1_GP)))
//
//  E43 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]
//
//  E44 =.= @_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_1_GP)))]
//
//  E45 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]*@_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_1_GP)))]
//
//  E46 =.= T404/MatrixLib/mpx/1.23/V_1_GP+@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]*@_FPS/CC/SCALbx34_ARA0[C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_1_GP)))]
//
//  E47 =.= C((C64u(T404/MatrixLib/mpx/1.23/V_2_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))
//
//  E48 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]/@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E49 =.= Cf(@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]/@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_3_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))])
//
//  E50 =.= C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))
//
//  E51 =.= C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))
//
//  E52 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]
//
//  E53 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]
//
//  E54 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]*-T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E55 =.= @_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(T404/MatrixLib/mpx/1.23/V_2_GP)))]+@_FPS/CC/SCALbx36_ARB0[C((C64u(luTest/T404/Main/T404/Main/V_1_GP))+S64'8*(C64u(luTest/T404/Main/T404/Main/V_3_GP)))]*-T404/MatrixLib/mpx/1.23/V_1_GP
//
//  E56 =.= C(@_SINT/CC/SCALbx10_SCALARA0_0)
//
//  E57 =.= luTest/T404/Main/T404/Main/V_3_GP>=7
//
//  E58 =.= luTest/T404/Main/T404/Main/V_3_GP<7
//
//  E59 =.= luTest/T404/Main/T404/Main/V_3_GP<8
//
//  E60 =.= luTest/T404/Main/T404/Main/V_3_GP>=8
//
//  E61 =.= luTest/T404/Main/T404/Main/V_1_GP>=8
//
//  E62 =.= luTest/T404/Main/T404/Main/V_1_GP<8
//
//  E63 =.= luTest/T404/Main/T404/Main/V_1_GP>=3
//
//  E64 =.= luTest/T404/Main/T404/Main/V_1_GP<3
//
//  E65 =.= luTest/T404/Main/T404/Main/V_3_GP<S32'8
//
//  E66 =.= luTest/T404/Main/T404/Main/V_3_GP>=S32'8
//
//  E67 =.= luTest/T404/Main/T404/Main/V_3_GP<0
//
//  E68 =.= luTest/T404/Main/T404/Main/V_3_GP>=0
//
//  E69 =.= T404/MatrixLib/mpx/1.23/V_2_GP<S32'8
//
//  E70 =.= T404/MatrixLib/mpx/1.23/V_2_GP>=S32'8
//
//  E71 =.= T404/MatrixLib/mpx/1.23/V_2_GP<8
//
//  E72 =.= T404/MatrixLib/mpx/1.23/V_2_GP>=8
//
//  E73 =.= T404/MatrixLib/mpx/1.23/V_2_GP<luTest/T404/Main/T404/Main/V_3_GP
//
//  E74 =.= T404/MatrixLib/mpx/1.23/V_2_GP>=luTest/T404/Main/T404/Main/V_3_GP
//

//----------------------------------------------------------

//Report from verilog_render:::
//5 vectors of width 3
//
//87 vectors of width 1
//
//65 vectors of width 32
//
//4 vectors of width 6
//
//1 vectors of width 8
//
//96 bits in scalar variables
//
//Total state bits in module = 2310 bits.
//
//848 continuously assigned (wire/non-state) bits 
//
//Total number of leaf cells = 0
//

//Major Statistics Report:
//Thread .cctor uid=cctor10 has 3 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor12 has 2 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor14 has 6 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor16 has 23 CIL instructions in 1 basic blocks
//Thread Main uid=Main10 has 409 CIL instructions in 124 basic blocks
//Thread host_pio_process uid=hostpioprocess10 has 9 CIL instructions in 4 basic blocks
//Thread mpc10 has 39 bevelab control states (pauses)
//Thread mpc12 has 4 bevelab control states (pauses)
//Reindexed thread xpc10 with 207 minor control states
//Reindexed thread xpc12 with 4 minor control states
// eof (HPR L/S Verilog)
