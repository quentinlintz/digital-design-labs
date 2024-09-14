# Digital Design Labs

This repo has my solutions to labs from Sarah and David Harris' _Digital Design and Computer Architecture, RISC-V Edition_ (2021).

I won't include the instructions, but you can download them as PDFs from [Elsevier](https://www.elsevier.com/books-and-journals/book-companion/9780128200643).

## Simulation Instructions

To compile and run a file, use the following commands:

```bash
iverilog -g2012 -o thunderbird_tb.vvp thunderbird.sv thunderbird_tb.sv
vvp thunderbird_tb.vvp
```

If you have gtkwave installed, you can view the waveform with:

```bash
gtkwave thunderbird_tb.vcd
```
