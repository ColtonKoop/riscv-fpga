library verilog;
use verilog.vl_types.all;
entity adder64_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(63 downto 0);
        b               : in     vl_logic_vector(63 downto 0);
        cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end adder64_vlg_sample_tst;
