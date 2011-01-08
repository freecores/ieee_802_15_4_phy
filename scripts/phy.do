# script general de simulacion

vlib work

# Rx Core

vcom -explicit  -93 "rtl/vhdl/rx_fir.vhd"
vcom -explicit  -93 "rtl/vhdl/downsampler.vhd"
vcom -explicit  -93 "rtl/vhdl/rz_enc.vhd"
vcom -explicit  -93 "rtl/vhdl/sym_corr.vhd"
vcom -explicit  -93 "rtl/vhdl/rx_core.vhd"


# Tx Core

vcom -explicit  -93 "rtl/vhdl/upsampler.vhd"
vcom -explicit  -93 "rtl/vhdl/chip_gen.vhd"
vcom -explicit  -93 "rtl/vhdl/tx_fir.vhd"
vcom -explicit  -93 "rtl/vhdl/tx_core.vhd"

# Top

vcom -explicit  -93 "rtl/vhdl/ieee_802_15_4_phy.vhd"

# Test

vcom -explicit  -93 "test/tb_ieee_802_15_4_phy.vhd"

# Sim

vsim -lib work -t 1ps tb_ieee_802_15_4_phy

view wave
view source
view structure
view signals
add wave *

add wave \
{sim:/tb_ieee_802_15_4_phy/uut/tx/chip_gen/chip_gen_iout } \
{sim:/tb_ieee_802_15_4_phy/uut/tx/chip_gen/chip_gen_qout } 
add wave \
{sim:/tb_ieee_802_15_4_phy/uut/tx/upsampler_ch_i/upsampler_output } 
add wave \
{sim:/tb_ieee_802_15_4_phy/uut/tx/upsampler_ch_q/upsampler_output } 

run 100 us

