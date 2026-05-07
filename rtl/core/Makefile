##################################################
# (C) Amlal El Mahrouss 2024-2025, 2024-2025, licensed under Apache 2.0.
# This is the RTL makefile.
##################################################

# Use the 2008 standard for that matter.
VHDL_FLAG=-a --work=RTL --std=08 --ieee=synopsys
VCD_FLAG=-r --std=08

ifeq ($(shell uname), Darwin)
VHDL_CC=$(GHDL_PATH)
else
VHDL_CC=ghdl
endif

.PHONY: all
all:
	@echo "=> BUILDING..."
	$(VHDL_CC) $(VHDL_FLAG) InstructionDecode.vhd
	$(VHDL_CC) $(VHDL_FLAG) FPRegister.vhd
	$(VHDL_CC) $(VHDL_FLAG) GPRegister.vhd
	$(VHDL_CC) $(VHDL_FLAG) GPRegisterBank.vhd
	$(VHDL_CC) $(VHDL_FLAG) FPRegisterBank.vhd
	$(VHDL_CC) $(VHDL_FLAG) InterruptRegister.vhd
	$(VHDL_CC) $(VHDL_FLAG) ThreadRegister.vhd
	$(VHDL_CC) $(VHDL_FLAG) ClockCircuit.vhd
	$(VHDL_CC) $(VHDL_FLAG) InstructionFetch.vhd
	$(VHDL_CC) $(VCD_FLAG) RTL.InstructionFetch --vcd=InstructionFetch.vcd
	@echo "=> BUILDING DONE."

.PHONY: help
help:
	@echo "=> HELP:"
	@echo "=> all: Build CPU for simulation."
