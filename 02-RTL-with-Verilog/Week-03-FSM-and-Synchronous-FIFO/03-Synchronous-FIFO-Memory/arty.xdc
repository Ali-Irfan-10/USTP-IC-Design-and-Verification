set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000} [get_ports { clk }];

set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { write_enable }];
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { read_enable }];

set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { data_in[0] }];
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { data_in[1] }];

set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { data_out[0] }];
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { data_out[1] }];
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { full }];
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { empty }];

set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { almost_full }];
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { almost_empty }];
