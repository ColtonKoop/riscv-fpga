library verilog;
use verilog.vl_types.all;
entity adder_vlg_sample_tst is
    port(
        i_carry         : in     vl_logic;
        input1          : in     vl_logic;
        input2          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end adder_vlg_sample_tst;
