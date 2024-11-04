// This testbench was copied from the lab PDF

module thunderbird_tb ();
  logic clk, reset;
  logic left, right, la, lb, lc, ra, rb, rc;
  logic [5:0] expected;
  logic [31:0] vectornum, errors;
  logic [7:0] testvectors[10000:0];

  // instantiate device under test
  thunderbird dut (
      clk,
      reset,
      left,
      right,
      la,
      lb,
      lc,
      ra,
      rb,
      rc
  );

  // generate clock
  always begin
    clk = 1;
    #5;
    clk = 0;
    #5;
  end

  // at start of test, load vectors and pulse reset
  initial begin
    // I have to add this to dump the vcd file
    $dumpfile("thunderbird_tb.vcd");
    $dumpvars(0, thunderbird_tb);

    $readmemb("thunderbird.tv", testvectors);
    vectornum = 0;
    errors = 0;
    reset = 1;
    #22;
    reset = 0;
  end

  // apply test vectors on rising edge of clk
  always @(posedge clk) begin
    #1;
    {left, right, expected} = testvectors[vectornum];
  end

  // check results on falling edge of clk
  always @(negedge clk)
    if (~reset) begin  // skip during reset
      if ({la, lb, lc, ra, rb, rc} !== expected) begin  // check result
        $display("Error: inputs = %b", {left, right});
        $display(" outputs = %b %b %b %b %b %b (%b expected)", la, lb, lc, ra, rb, rc, expected);
        errors = errors + 1;
      end
      vectornum = vectornum + 1;
      if (testvectors[vectornum] === 8'bx) begin
        $display("%d tests completed with %d errors", vectornum, errors);
        $stop;
      end
    end
endmodule
