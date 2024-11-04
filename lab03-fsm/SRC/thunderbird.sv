// Design a FSM to control the taillights of a 1965 Ford Thunderbird
// Two inputs: left and right, at most one of the inputs will be asserted
// Six outputs: LA, LB, LC, RA, RB, RC
// This solution is inspired by HDL Example 4.30 in the book

module thunderbird (
    input  logic clk,
    input  logic reset,
    input  logic left,
    right,
    output logic la,
    lb,
    lc,
    ra,
    rb,
    rc
);
  typedef enum logic [2:0] {
    S0,  // All lights off
    S1,  // LA
    S2,  // LA, LB
    S3,  // LA, LB, LC
    S4,  // RA
    S5,  // RA, RB
    S6   // RA, RB, RC
  } taillights_e;
  taillights_e state, nextstate;

  // State register
  always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else state <= nextstate;

  // Next state logic
  always_comb
    case (state)
      S0: begin
        if (left) nextstate = S1;
        else if (right) nextstate = S4;
        else nextstate = S0;
      end
      S1: nextstate = S2;
      S2: nextstate = S3;
      S3: nextstate = S0;
      S4: nextstate = S5;
      S5: nextstate = S6;
      S6: nextstate = S0;
      default: nextstate = S0;
    endcase

  // Output logic
  always_comb begin
    la = 0;
    lb = 0;
    lc = 0;
    ra = 0;
    rb = 0;
    rc = 0;

    case (state)
      S1: la = 1;
      S2: {la, lb} = 2'b11;
      S3: {la, lb, lc} = 3'b111;
      S4: ra = 1;
      S5: {ra, rb} = 2'b11;
      S6: {ra, rb, rc} = 3'b111;
      default: begin
      end
    endcase
  end
endmodule
