set_property package_pin P16 [get_ports in[0]]
set_property package_pin N17 [get_ports in[1]]
set_property package_pin T12 [get_ports sel]
set_property package_pin P15 [get_ports out]

set_property IOSTANDARD LVCMOS33 [get_ports {in[0] in[1] sel out}]