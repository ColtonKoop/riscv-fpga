library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        input1          : in     vl_logic;
        input2          : in     vl_logic;
        i_carry         : in     vl_logic;
        result          : out    vl_logic;
        o_carry         : out    vl_logic
    );
end adder;
