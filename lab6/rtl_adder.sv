/***********************************************************************
 * An RTL level 1 bit adder model.
 **********************************************************************/

module rtl_adder
(input  logic  a, b, ci,
 output logic  sum, co);
  timeunit 1ns; timeprecision 1ns;

  always @(a, b, ci) begin
    {co, sum} = a + b + ci;
  end

endmodule