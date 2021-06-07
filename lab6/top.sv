/***********************************************************************
 * Top-level module for testing the 1 bit adder model.  Connects the
 * testbench to one of three versions of the adder, using conditional
 * compilation.
 **********************************************************************/

module top();
  timeunit 1ns; timeprecision 1ns;

  initial $timeformat(-9,0, "ns", 3);

  logic  a, b, ci, sum, co;  // interconnectng nets

  adder_test test (.a(a), .b(b), .ci(ci), .sum(sum), .co(co));  // testbench instance

//  `define RTL_ADDER
//  `define GATE_ADDER
//  `define GATE2_ADDER

  `ifdef RTL_ADDER
    rtl_adder  dut  (.a(a), .b(b), .ci(ci), .sum(sum), .co(co));  // design instance
  `elsif GATE_ADDER
    gate_adder dut (.a(a), .b(b), .ci(ci), .sum(sum), .co(co));  // design instance
  `elsif GATE2_ADDER
    gate2_adder  dut (.a(a), .b(b), .ci(ci), .sum(sum), .co(co));  // design instance
  `elsif GATE_VH_ADDER
    gate_vh_adder  dut (.a(a), .b(b), .c_in(ci), .sum(sum), .c_out(co));  // design instance
  `else
    initial $display("\n\nERROR in %m: no adder module was instantiated!\n");
  `endif

endmodule
