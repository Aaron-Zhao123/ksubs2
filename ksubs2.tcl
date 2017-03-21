
# /usr/groups/ecad/xilinx/vivado_sdk_installed/Vivado/2015.1/bin/vivado -source ~/tcl-xilinx-script1.tcl -mode batch


set TOPNAME ksubs2_zynq_toplevel

#STEP#1: define the output directory area.
#
set outputDir /tmp/ksubs2-fpga

set dropbox_dir $env(HOME)/Dropbox

# If you need hprls you will find a stable copy is being added here at some point soon:  /usr/groups/han/clteach/hprls2

# Adjust the following setting for the name of the folder containing this folder or to `pwd`
set design_dir $env(HOME)/P35/ksubs2


# Kiwi HLS library files - not needed if using your own design
set cvtech1 $env(HPRLS)/hpr/cvgates.v
set cvtech2 $env(HPRLS)/hpr/cv_fparith.v


file mkdir $outputDir


#--------------------
# STEP#2: setup design sources and constraints
#

read_verilog  $cvtech1 $cvtech2 

# headers such as /axi_infrastructure_v1_1_header.vh
set RTL_INCLUDE_PATH  "/home/djg11/vivado-cmdlines/ksubs2/xilinx_ip/ipshared/xilinx.com/axi_infrastructure_v1_1/cf21a66f/hdl/verilog"



# These are the (Kiwi-generated) RTL files for the current design - you should be importing your own
read_verilog up_counter.v
#read_verilog $design_dir/example_designs/lu-decomp-sp.v


# These are the RTL files needed for the ksubs2 wrapper.
read_verilog $design_dir/kiwi_axi_zynq/ksubs2_zynq_toplevel.v
read_verilog $design_dir/kiwi_axi_zynq/ksubs2_innercore.v
read_verilog $design_dir/kiwi_axi_zynq/kiwi_axi_pio_target.v

# This is a memory bank made up of BRAM, perhaps used in some designs.
read_verilog $design_dir/membank_hf1.v



# These are the RTL files for the Xilinx protocol convertor
read_verilog $design_dir/xilinx_ip/ipshared/xilinx.com/axi_infrastructure_v1_1/cf21a66f/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v
read_verilog $design_dir/xilinx_ip/ipshared/xilinx.com/axi_infrastructure_v1_1/cf21a66f/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v
read_verilog $design_dir/xilinx_ip/ipshared/xilinx.com/axi_register_slice_v2_1/03a8e0ba/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v
read_verilog $design_dir/xilinx_ip/ipshared/xilinx.com/axi_register_slice_v2_1/03a8e0ba/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v
read_verilog $design_dir/xilinx_ip/djgaxi_auto_pc_0/synth/djgaxi_auto_pc_0.v
read_verilog $design_dir/xilinx_ip/djgaxi_processing_system7_0_0/synth/djgaxi_processing_system7_0_0.v
read_verilog $design_dir/xilinx_ip/djgaxi_processing_system7_0_0/hdl/verilog/processing_system7_v5_5_processing_system7.v
read_verilog $design_dir/xilinx_ip/djgaxi.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_a_axi3_conv.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_axi3_conv.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_axilite_conv.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_axi_protocol_converter.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_ar_channel.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_aw_channel.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_b_channel.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_cmd_translator.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_incr_cmd.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_r_channel.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_rd_cmd_fsm.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_simple_fifo.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_wrap_cmd.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b2s_wr_cmd_fsm.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_b_downsizer.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_decerr_slave.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_r_axi3_conv.v
read_verilog xilinx_ip/ipshared/xilinx.com/axi_protocol_converter_v2_1/017861a2/hdl/verilog/axi_protocol_converter_v2_1_w_axi3_conv.v



#
#--------------------
# STEP#3: run synthesis, write design checkpoint, report timing,
# and utilization estimates
#

# Set the Zynq Chip type
# Parallella wants: set part xc7z010clg400-1  set vdefine PARCARD10=1
# Zedboard wants:   set part xc7z020clg484-1  set vdefine ZEDBOARD20=1

#set part xc7z020clg484-1  
#set vdefine ZEDBOARD20=1

set part xc7z010clg400-1  
set vdefine PARCARD10=1

# Set the PCB pinout
# Parallella wants: set pinout $design_dir/pinouts/parallella10.xdc
# Zedboard wants:   set pinout $design_dir/pinouts/zedboard20.xdc

#set pinout $design_dir/pinouts/zedboard20.xdc
set pinout $design_dir/pinouts/parallella10.xdc


synth_design -top $TOPNAME -part $part -verilog_define $vdefine -include_dirs $RTL_INCLUDE_PATH 
# Constraints - xcf file
read_xdc $pinout


#write_checkpoint -force $outputDir/post_synth.dcp
#report_timing_summary -datasheet -file $outputDir/post_synth_timing_summary.rpt
report_utilization -file $outputDir/post_synth_util.rpt

# Run custom script to report critical timing paths
# reportCriticalPaths $outputDir/post_synth_critpath_report.csv


#--------------------
# STEP#4: run logic optimization, placement and physical logic optimization,
# write design checkpoint, report utilization and timing estimates
#
opt_design
#reportCriticalPaths $outputDir/post_opt_critpath_report.csv
place_design
report_clock_utilization -file $outputDir/clock_util.rpt
#

# Optionally run optimization if there are timing violations after placement
#   if {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
#   puts "Found setup timing violations => running physical optimization"
#   phys_opt_design
#   }

#write_checkpoint -force $outputDir/post_place.dcp
report_utilization -file $outputDir/post_place_util.rpt

#report_timing_summary -file $outputDir/post_place_timing_summary.rpt

#--------------------
# STEP#5: run the router, write the post-route design checkpoint, report the routing
# status, report timing, power, and DRC, and finally save the Verilog netlist.
#
route_design

#write_checkpoint -force $outputDir/post_route.dcp
report_route_status -file $outputDir/post_route_status.rpt

# ACLK is 100 MHz at the moment. 
#create_clock -period 10.000 -name my_main_clock -waveform {0.000 5.000} [get_nets zynq_axi_master_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]]
report_timing_summary -file $outputDir/post_route_timing_summary.rpt -report_unconstrained



report_power -file $outputDir/post_route_power.rpt
#report_drc -file $outputDir/post_imp_drc.rpt
#write_verilog -force $outputDir/topfpga_impl_netlist.v -mode timesim -sdf_anno true
#
# STEP#6: generate a bitstream
#
write_bitstream -force $outputDir/topfpga.bit
