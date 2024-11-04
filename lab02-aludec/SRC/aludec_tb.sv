module aludec_tb ();

  logic opb5;
  logic [2:0] funct3;
  logic funct7b5;
  logic [1:0] ALUOp;
  logic [2:0] ALUControl;

  typedef struct {
    logic opb5;
    logic [2:0] funct3;
    logic funct7b5;
    logic [1:0] ALUOp;
    logic [2:0] ALUControl;
  } test_vector_t;

  test_vector_t test_vectors[7];

  aludec dut (
      .opb5(opb5),
      .funct3(funct3),
      .funct7b5(funct7b5),
      .ALUOp(ALUOp),
      .ALUControl(ALUControl)
  );

  initial begin
    $readmemb("aludec.tv", test_vectors);

    foreach (test_vectors[i]) begin
      opb5 = test_vectors[i].opb5;
      funct3 = test_vectors[i].funct3;
      funct7b5 = test_vectors[i].funct7b5;
      ALUOp = test_vectors[i].ALUOp;

      #10;

      if (ALUControl !== test_vectors[i].ALUControl) begin
        $display("Error at vector %0d: Expected ALUControl = %b, got %b", i, test_vectors[i].ALUControl, ALUControl);
      end else begin
        $display("Test passed for vector %0d", i);
      end
    end

    $finish;
  end

endmodule
