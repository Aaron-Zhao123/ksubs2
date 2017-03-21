# Parallella - xc7z010GLG400


# GIO0N and GPIOP are LEDs
set_property PACKAGE_PIN U17    [get_ports GPIO0_N]
set_property PACKAGE_PIN T16    [get_ports GPIO0_P]
set_property PACKAGE_PIN W16    [get_ports GPIO1_N]
set_property PACKAGE_PIN V16    [get_ports GPIO1_P]


set_property PACKAGE_PIN P16    [get_ports GPIO2_N]
set_property PACKAGE_PIN P15    [get_ports GPIO2_P]
set_property PACKAGE_PIN R14    [get_ports GPIO4_N]
set_property PACKAGE_PIN P14    [get_ports GPIO4_P]


set_property PACKAGE_PIN U19    [get_ports GPIO3_N]
set_property PACKAGE_PIN U18    [get_ports GPIO3_P]
# gnd pin 12
set_property PACKAGE_PIN T15    [get_ports GPIO5_N]
set_property PACKAGE_PIN T14    [get_ports GPIO5_P]
set_property PACKAGE_PIN Y14    [get_ports GPIO7_N]
set_property PACKAGE_PIN W14    [get_ports GPIO7_P]

# Note: 18 to 20 are not present using the smaller 7010 Zynq part found on our boards.
set_property PACKAGE_PIN W8    [get_ports GPIO18_N]
set_property PACKAGE_PIN V8    [get_ports GPIO18_P]
set_property PACKAGE_PIN Y6    [get_ports GPIO20_N]
set_property PACKAGE_PIN Y7    [get_ports GPIO20_P]


set_property IOSTANDARD LVCMOS18 [get_ports GPIO0_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO0_P]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO1_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO1_P]

set_property IOSTANDARD LVCMOS18 [get_ports GPIO2_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO2_P]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO4_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO4_P]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO3_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO3_P]

set_property IOSTANDARD LVCMOS18 [get_ports GPIO5_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO5_P]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO7_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO7_P]

set_property IOSTANDARD LVCMOS18 [get_ports GPIO18_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO18_P]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO20_N]
set_property IOSTANDARD LVCMOS18 [get_ports GPIO20_P]

set_property IOSTANDARD LVCMOS18 [get_ports dvv]
set_property LOC T17 [get_cells dvv_OBUF_inst]
