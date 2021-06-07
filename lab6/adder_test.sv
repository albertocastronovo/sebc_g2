/***********************************************************************
 * Test bench for the 1 bit adder model.
 **********************************************************************/


module adder_test
(output logic  a, b, ci,
 input  logic  sum, co);
  timeunit 1ns; timeprecision 1ns;

  initial                 // input stimulus
    begin
      a = 0;
      b = 0;              //              sum   co
      ci = 0;             // should get:   0     0
      #10 a = 1;          // should get:   1     0
      #10 b = 1;          // should get:   0     1
      #10 ci = 1;         // should get:   1     1
      #10 $stop();
      #1000 $finish();
    end

  initial                      //response checking
    begin
      //display time in ns, 2 decimal places, 10 char column width
      $timeformat(-9,2," ns",10);
      //print message on change
      $monitor("At %t: \t a=%b  b=%b  ci=%b  sum=%b  co=%b",
               $realtime, a, b, ci, sum, co);
    end
endmodule

