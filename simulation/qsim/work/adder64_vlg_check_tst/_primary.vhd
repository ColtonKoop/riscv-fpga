library verilog;
use verilog.vl_types.all;
entity adder64_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        sum             : in     vl_logic_vector(63 downto 0);
        sampler_rx      : in     vl_logic
    );
end adder64_vlg_check_tst;
