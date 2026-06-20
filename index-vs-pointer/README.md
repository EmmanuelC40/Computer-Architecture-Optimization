# 1. Manual Optimization: Index vs Pointer (ARM vs x86-64)

## Overview

This project investigates the performance differences between index-based and pointer-based array traversal in C++ on ARM and x86-64 systems.

The goal was to examine how each approach is translated into machine code, compare compiler-generated assembly with manually optimized assembly, and measure the resulting performance differences.

Benchmarks were performed on a Raspberry Pi 5 (ARM64) and an Intel-based Linux system (x86-64).

# Key Findings
- Performance differences were driven primarily by generated machine code rather than C++ syntax alone.
- Manual assembly optimization reduced unnecessary memory accesses and instruction count.
- ARM benefited from efficient addressing modes, while x86-64 often converged toward specialized instructions such as **rep stosl**.

# Methodology
- Implemented index-based and pointer-based array clearing functions in C++.
- Compiled using default **g++** settings (no optimization flags).
- Generated assembly with **g++ -S**.
- Measured execution time using **std::chrono**.
- A Python script runs each executable **10 times** and computes average execution time (executed single-threaded).
- Inspected compiler-generated assembly and manually optimized critical sections.
- Re-ran benchmarks using the optimized implementations.

## System Information

### Intel System
- CPU: Intel Core i7-1355U (13th Gen)
- Architecture: x86_64
- OS: Ubuntu 25.10 (64-bit)
- Compiler: g++ 15.2.0

### Raspberry Pi 5
- CPU: ARM Cortex-A76
- Architecture: aarch64
- OS: Debian GNU/Linux 12 (bookworm)
- Compiler: g++ 12.2.0

## Project Structure
```
.
├── appendix-tables/
|   ├── A_1.csv
|   ├── A_2.csv
|   ├── A_3.csv
|   ├── A_4.csv
|   ├── B_1.csv
|   ├── B_2.csv
|   ├── B_3.csv
|   └── B_4.csv
|
├── docs/
|   └── Manual-Optimization-Index-vs-Pointer.pdf
|
├── figures/
|   ├── index_pointer_linux.png
|   ├── index_pointer_pi.png
|   ├── linux_index.png
|   ├── linux_pointer.png
|   ├── opt_index_pointer_linux.png
|   ├── opt_index_pointer_pi.png
|   ├── opt_zoom_index_pointer_pi.png
|   ├── pi_index.png
|   └── pi_pointer.png
|
├── scripts/
|   ├── benchmark.py 
|   ├── formatter.py
|   └── plot.py
|
├── src/
|   ├── clearusingindex.cpp
|   ├── clearusingpointer.cpp
|   ├── linux_optimized_index.s
|   ├── linux_optimized_pointer.s
|   ├── linux_original_index.s
|   ├── linux_original_pointer.s
|   ├── raspberry_pi_optimized_index.s
|   ├── raspberry_pi_optimized_pointer.s
|   ├── raspberry_pi_original_index.s
|   └── raspberry_pi_original_pointer.s
|
└── README.md
```

## Build and Run

### Compile and Run
```
g++ clearusingindex.cpp -o output_name
g++ clearusingpointer.cpp -o output_name
./output_name
```
### Generate S files

```
g++ desired_program.cpp -S -o output_name.s
```

*Note: To compile and run, same process as a regular cpp program.*

### Run benchmarks

```
python3 benchmark.py
```

*Note: You have to change line 6 to run the desired executable. Optional, you could change line 8 for the name of output csv file.*

### Generate plots

```
python3 plot.py
```

*Note: Change lines 5 and 6 for the desired data to be plotted. Change lines 15 and 23 for label names. Change line 34 for figure title. This script requires pandas and matplotlib as dependencies. To install, run: `pip install pandas matplotlib`* 

### Formatter

```
python3 formatter.py
```

*Note: This script is used to format the output csv file of the benchmark script.*

## Documentation

The full report includes:
- Assembly analysis
- Optimization discussion
- Performance graphs
- Appendices with raw timing data

See:
[docs/Manual-Optimization-Index-vs-Pointer.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/1d1c1e3b3373ecc9e279f6ea942ddfbeac09dee5/index-vs-pointer/docs/Manual-Optimization-Index-vs-Pointer.pdf)

## Author

Emmanuel Cano
