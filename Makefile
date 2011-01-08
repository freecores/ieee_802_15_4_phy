DEVICE=xc4vsx25-12ff668

all: sim

sim_phy: scripts/phy.do
	vsim -do scripts/phy.do	     

syn_phy: 
	  echo "run -ifn synthesis/phy.prj -ifmt VHDL -ofn ieee_802_15_4_phy -p \
	        $(DEVICE) -opt_mode Speed -opt_level 1" | xst
syn_tx: 
	  echo "run -ifn synthesis/tx.prj -ifmt VHDL -ofn tx_core -p \
	        $(DEVICE) -opt_mode Speed -opt_level 1" | xst
syn_rx: 
	  echo "run -ifn synthesis/rx.prj -ifmt VHDL -ofn rx_core -p \
	        $(DEVICE) -opt_mode Speed -opt_level 1" | xst
clean:
	rm -rf transcript work vsim.wlf *.rlf *.vstf *~ *.xrpt *.ngc _xmsgs  xst .lso 

