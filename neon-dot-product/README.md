# 3. ARM NEON vs. Scalar Dot Product

## Overview

This project compares a scalar C++ dot product implementation with an ARM NEON SIMD implementation on a Raspberry Pi 5.

The goal is to evaluate the performance impact of SIMD vectorization and compare compiler auto-vectorization against manually written NEON intrinsics.

## Why Dot Products?

Dot products are widely used in scientific computing, signal processing, computer graphics, and machine learning. Because the computation is highly data-parallel, it is well suited for SIMD optimization.

## Key Findings
- Modern compilers can automatically generate efficient NEON SIMD instructions from scalar C++ code.
- Manual NEON intrinsics provided greater control over instruction selection and reduction strategy.
- The manually optimized implementation achieved the best overall performance.
- Assembly analysis showed that compiler-generated SIMD code was highly competitive.

## Methodology
- Implemented scalar and NEON versions to compute the dot product of two single-precision floating-point arrays in C++.
- Compiled all code using **-O3**.
- No vectorization was explicitly forced or disabled.
- Generated assembly with **g++ -S**.
- Measured execution time using **std::chrono**.
- Examined generated assembly to compare vectorization strategies.

## System Information
- CPU: ARM Cortex-A76
- Architecture: aarch64
- OS: Debian GNU/Linux 12 (bookworm)
- Compiler: g++ 12.2.0

## Project Structure
```
.
├── docs/
|   └── ARM-NEON-vs-Scalar-Dot-Product.pdf
|
├── figures/
|   └── benchmark_screenshot.png
|
├── src/   
|   ├── benchmark.cpp
|   ├── benchmark.s
|   ├── dot_product_neon.cpp
|   ├── dot_product_neon.s
|   ├── dot_product_scalar.cpp
|   └── dot_product_scalar.s
|
└── README.md
```

## Build and Run

### Compile and Run

```
g++ dot_product_scalar.cpp -O3 -o output_name
g++ dot_product_neon.cpp -O3 -o output_name
g++ benchmark.cpp -O3 -o output_name
./output_name
```

### Generate S files

```
g++ desired_program.cpp -O3 -S -o output_name.s
```

*Note: To compile and run, same process as a regular cpp program.*

### Run Benchmark

```
./benchmark
```

## Documentation

The full report includes:
- NEON implementation details
- Assembly analysis
- Benchmark results
- Optimization discussion

See:
[docs/ARM-NEON-vs-Scalar-Dot-Product.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/6c4e6ffb9a827f6bf3d7c9e53cfdec1b0471b26f/neon-dot-product/docs/ARM-NEON-vs-Scalar-Dot-Product.pdf)

## Author

Emmanuel Cano

