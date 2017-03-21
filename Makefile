#
# Kiwi Scientific Acceleration
# (C) 2014-17 DJ Greaves - University of Cambridge, Computer Laboratory
#
# Zynq Ksubs2
#

CSC     ?=gmcs
KLIB1   ?=${HPRLS}/kiwipro/kiwic/distro/support/Kiwi.dll
KIWIC   ?=${HPRLS}/kiwipro/kiwic/distro/bin/kiwic


# The C# design name : change this from ksubs_demo to your own name
#ANAME=primes_offchip
#ANAME=PERIPHERAL_DEVICE
# ANAME=lu-decomp-sp
ANAME=up_counter


VIVADO_BIN  ?=/usr/groups/ecad/xilinx/vivado_sdk_installed/Vivado/2015.1/bin/vivado

KIWIC_FLAGS= \
	-vnl-resets=synchronous \
	-kiwic-finish=disable \
	-vnl-roundtrip=disable \
	-kiwic-register-colours=1 \
	-bevelab-default-pause-mode=bblock \


all: fpga

fpga:$(ANAME).v
	echo "THIS FOLDER CONTAINS A ROUGH GUIDING DESIGN FOR ZYNQ"
	echo "FOR ACS P35, TO GET STARTED, YOU SHOULD FIRST REMOVE THE KIWI/HLS GENERATED DESIGN AND INSERT A SIMPLE MANUAL RTL-LEVEL DESIGN OF YOUR OWN SUCH AS PERIPHERAL_DEVICE"
	$(VIVADO_BIN) -source ksubs2.tcl -mode batch 
	ls -l /tmp/ksubs2-fpga
	md5sum /tmp/ksubs2-fpga/topfpga.bit
	cp /tmp/ksubs2-fpga/topfpga.bit ~/Dropbox


# HLS:  Inkove the C# compiler and then the Kiwi compiler.
#$(ANAME).v: csharp/$(ANAME).cs csharp/KSubs2_Director.dll
#	$(CSC) -r:$(KLIB1) csharp/$(ANAME).cs 
#	$(KIWIC) csharp/$(ANAME).exe -res2-loadstore-port-count=0 -vnl=$(ANAME).v -vnl-rootmodname=$(ANAME) csharp/KSubs2_Director.dll $(KIWIC_FLAGS)

csharp/KSubs2_Director.dll:csharp/KSubs2_Director.cs
	$(CSC) -r:$(KLIB1) /target:library csharp/KSubs2_Director.cs

zip:
	zip $(ANAME).zip *.v chsharp/*.cs *.cs *.tcl Makefile *.xdc Makefile
	zip -r $(ANAME).zip xilinx_ip

# These two libraries are needed for Kiwi-generated HLS RTL only
CVTECH1   =$(HPRLS)/hpr/cvgates.v
CVTECH2   =$(HPRLS)/hpr/cv_fparith.v
X1        =../shared/X1.v

# Here we invoke Icarus verilog but you may prefer to use modelsim if you prefer.
isim:
	iverilog simsys.v $(ANAME).v $(CVTECH1) $(CVTECH2) $(X1) \
	ksubs2.v
	./a.out
	mv vcd.vcd ~/Dropbox


monorun:
	MONO_PATH=$(HPRLS)/kiwipro/kiwic/distro/support mono $(ANAME).exe


# eof


