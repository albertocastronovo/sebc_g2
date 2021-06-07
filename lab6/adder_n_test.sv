/***********************************************************************
 * Test bench for the N bit adder model.
 **********************************************************************/


module adder_n_test
 #(parameter N = 4) 
 (output logic  [N-1:0] a, b, 
  output logic ci,
  input  logic  [N-1:0] sum,
  input  logic co,
  input  logic test_clk);

  timeunit 1ns; timeprecision 1ns;

  int error_count = 0;  // number of errors detected

  initial                 // input stimulus
    begin
	  $display("\nInitializing inputs...");
      a = 0;
      b = 0;             
      ci = 0;
	  repeat (2) @(posedge test_clk) ;     // hold in reset for 2 clock cycles

	  $display("\nStart applying inputs...");
      repeat (100) begin
        @(posedge test_clk);
	      begin
		    @(negedge test_clk) check_results();  // call output verification task
		    randomize_inputs();
          end
      end

	  @(posedge test_clk);
	  $display("\nADDER TESTS COMPLETED WITH %0d ERRORS!\n", error_count);
	  $stop();
    end


  function void randomize_inputs();
    // Generate random inputs
    a     = $urandom_range(2**N);       // between 0 and 2^N
    b     = $urandom_range(2**N);       // between 0 and 2^N
    ci    = b[0];  						// get the b LSB as carry in
  endfunction: randomize_inputs

  task check_results;
    logic [N:0] expected;    // local variable
    logic [N:0] result;      // local variable
       
    result = {co, sum};      // concatenation
    expected = a + b + int'(ci);
    
    $write("At %t:  a=%d  b=%d ci=%d : sum=%d (%b), co=%d (%b)", $realtime, a, b, ci, sum, sum, co, co);
    if (result === expected)
      $display(" - OK");
    else begin
      $display(" - ERROR: expected %d (%b)", expected, expected);
      error_count++;
    end
  endtask

endmodule




