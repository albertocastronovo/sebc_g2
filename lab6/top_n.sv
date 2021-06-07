/***********************************************************************
 * Top-level module for testing the 1 bit adder model.  Connects the
 * testbench to one of three versions of the adder, using conditional
 * compilation.
 **********************************************************************/

module top_n();
  timeunit 1ns; timeprecision 1ns;
  parameter NBIT = 16;

  initial $timeformat(-9,0, "ns", 3);

  // interconnecting nets
  logic [NBIT-1:0] a, b;
  logic ci, co;
  logic [NBIT-1:0] sum;
  logic test_clk;

  // clock generators
  initial begin
    test_clk = 0;
    forever #5ns test_clk = ~test_clk;
  end

  adder_n_test #(NBIT) test (.a(a), .b(b), .ci(ci), .sum(sum), .co(co), .test_clk(test_clk));  // testbench instance

//  `define RCA_VH_ADDER

  `ifdef RCA_VH_ADDER
    // add the design instance
    rca_vh_adder #(NBIT) dut (.in1(a), .in2(b), .c_in(ci), .res(sum), .c_out(co));  // design instance
  `else
    initial $display("\n\nERROR in %m: no adder module was instantiated!\n");
  `endif

endmodule
