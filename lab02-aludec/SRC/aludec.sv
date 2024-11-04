module aludec (
    input logic opb5,
    input logic [2:0] funct3,
    input logic funct7b5,
    input logic [1:0] ALUOp,
    output logic [2:0] ALUControl
);

  logic add;

  always_comb begin
    add = ~(opb5 && funct7b5);

    case (ALUOp)
      2'b00:   ALUControl = 3'b000;  // Add
      2'b01:   ALUControl = 3'b001;  // Subtract
      2'b10: begin
        if (funct3 == 3'b000 && add) ALUControl = 3'b000;  // Add
        else if (funct3 == 3'b000 && ~add) ALUControl = 3'b001;  // Subtract
        else if (funct3 == 3'b010) ALUControl = 3'b101;  // SLT
        else if (funct3 == 3'b110) ALUControl = 3'b011;  // OR
        else if (funct3 == 3'b111) ALUControl = 3'b010;  // AND
        else ALUControl = 3'bxxx;
      end
      default: ALUControl = 3'bxxx;
    endcase
  end

endmodule

