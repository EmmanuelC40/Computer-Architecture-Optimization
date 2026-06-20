# 2. Recursive GCD Timing and Manual Assembly Optimization

## Overview

This project analyzes the performance of a recursive implementation of the Euclidean algorithm for computing the greatest common divisor (GCD) on ARM64 and x86-64 systems.

The focus is on understanding the overhead introduced by recursion, examining compiler-generated assembly, and evaluating the impact of manual assembly-level optimizations. 

## Euclidean Algorithm
```
int gcd_recurs(int a, int b) {
    if (b == 0)
        return a;
    return gcd_recurs(b, a % b);
}
```

## Key Findings
- Recursive function calls introduce measurable stack and control-flow overhead.
- Register-based implementations consistently outperformed compiler-generated versions.
- Replacing recursion with an iterative loop significantly improved x86-64 performance.
- ARM optimizations benefited from reduced memory traffic and efficient arithmetic instructions.

## Methodology
- Compiled using default **g++** settings (no optimization flags).
- Generated assembly with **g++ -S**.
- Measured execution time using **std::chrono**.
- A Python script runs each executable **10 times** and computes average execution time (executed single-threaded).
- Compared compiler-generated and manually optimized assembly implementations.

## Test Cases
| Input Pair | Purpose |
| --- | ----- |
| (13, 17) | Relatively prime values|
| (60, 20)| Immediate termination |
| (55, 34) | Deep recursion |
| (47373888, 18883888) | Large general case |

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
|   ├── B_1.csv
|   └── B_2.csv
|
├── docs/
|   └── Recursive-GCD-Timed-Optimization.pdf
|
├── figures/
|   ├── lin_opt_lin_gcd.png
|   ├── linux_stack_frame.png
|   ├── opt_pi_opt_lin_gcd.png
|   ├── pi_lin_gcd.png
|   ├── pi_opt_pi_gcd.png
|   ├── pi_stack_frame.png
|   └── stack_frame_reference.png
|
├── scripts/
|   ├── format.py
|   ├── gcd_benchmark.py
|   └── plot.py
|
├── src/
|   ├── linux_optimized_recursion.s
|   ├── linux_original_recursion.s
|   ├── raspberry_pi_optimized_recursion.s
|   ├── raspberry_pi_original_recursion.s
|   └── recursive_timed.cpp
|
└── README.md
```

### Compile and Run

```
g++ recursive_timed.cpp -o output_name
./output_name
```

*Note: Change lines 15 and 16 for the values of a and b. One compilation is one test case of a and b.*

### Generate S files

```
g++ desired_program.cpp -S -o output_name.s
```

*Note: To compile and run, same process as a regular cpp program.*

### Run benchmarks

```
python3 gcd_benchmark.py
```

*Note: You have to change line 6 to run the desired executables. It is in the form of a list. Optional, you could change line 8 for the name of output csv file.*

### Generate plots

```
python3 plot.py
```

*Note: Change lines 4 and 5 for the desired data to be plotted. Change lines 17 and 26 for label names. Change line 32 for figure title. This script requires pandas and matplotlib as dependencies. To install, run: `pip install pandas matplotlib`* 

### Formatter

```
python3 format.py
```

*Note: This script is used to format the output csv file of the gcd_benchmark script.*


## Documentation

The report includes:
- Assembly analysis
- Stack inspection 
- Optimization details
- Performance comparisons
- Raw timing data

See:
[docs/Recursive-GCD-Timed-Optimization.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/e85993d9f7ed89bdaaffddb4e5d89f5c92ba187b/recursive-gcd/docs/Recursive-GCD-Timed-Optimization.pdf)

## Author

Emmanuel Cano

