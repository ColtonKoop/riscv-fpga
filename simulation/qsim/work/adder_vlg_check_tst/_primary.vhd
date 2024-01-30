library verilog;
use verilog.vl_types.all;
entity adder_vlg_check_tst is
    port(
        o_carry         : in     vl_logic;
        result          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end adder_vlg_check_tst;
