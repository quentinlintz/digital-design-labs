# Digital Design Labs

This repo has my solutions to labs from Sarah and David Harris' _Digital Design and Computer Architecture, RISC-V Edition_ (2021).

I won't include the instructions, but you can download them as PDFs from [Elsevier](https://www.elsevier.com/books-and-journals/book-companion/9780128200643).

## SystemVerilog Simulation Instructions

Source your Vivado settings:

```bash
source /tools/Xilinx/Vivado/2024.1/settings64.sh
```

Change directory into `./SIM`.
To compile and run a file, use the following commands:

```bash
xvlog --sv ../SRC/thunderbird.sv ../SRC/thunderbird_tb.sv
xelab -debug typical -top thunderbird_tb -snapshot thunderbird_tb_snapshot
xsim thunderbird_tb_snapshot --tclbatch xsim_cfg.tcl  
```

To view the waveform:

```bash
xsim --gui thunderbird_tb_snapshot.wdb
```

## Assembly Simulation Instructions

To make and run the assembly files, use the following commands:

```bash
make TARGET=div9
./bin/div9
```

Where "div9" is the name of the file without the `.s` extension.

## C Compilation Instructions

I'm running this code on a [Sparkfun Thing Plus - ESP32-C6](https://www.sparkfun.com/products/22924) which is Espressif so I'm using the `idf.py` tool to build, debug, and flash.

If you want to use [gdbgui](https://www.gdbgui.com/) you need to use Python version 3.11.6.

```bash
idf.py set-target esp32c6
idf.py build
idf.py -p /dev/ttyACM0 flash
idf.py openocd gdbgui monitor
```

Hit Ctrl+] to exit the debugger.
