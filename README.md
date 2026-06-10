# Computer Architecture and Performance Optimization Projects

## Overview

This repository contains a collection of projects focused on performance analysis, compiler behavior, and low-level optimization across ARM64 and x86-64 systems.

The projects examine how C++ code is translated into machine code, how different processor architectures execute that code, and how these differences impact performance.

All projects include benchmarking, assembly analysis, and performance evaluation.

## Included Projects

### 1. Index vs Pointer Array Traversal (ARM vs x86-64)

Compares index-based and pointer-based array traversal in C++ across ARM64 and x86-64 systems.

**Topics explored:**
- Compiler-generated assembly
- Memory access patterns
- Register usage
- Manual assembly optimization
- Cross-platform performance differences

**Highlights:**
- Analyzed compiler-generated and optimized assembly
- Compared performance across architectures

**Documentation:**
[index-vs-pointer/docs/Manual-Optimization-Index-vs-Pointer.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/1d1c1e3b3373ecc9e279f6ea942ddfbeac09dee5/index-vs-pointer/docs/Manual-Optimization-Index-vs-Pointer.pdf)

### 2. Recursive GCD Timing and Manual Assembly Optimization

Analyzes the performance of a recursive Euclidean GCD implementation.

**Topics explored:**
- Recursive function overhead
- Stack frame management
- Register usage
- Iterative vs recursive execution
- Assembly-level optimization

**Highlights:**
- Reduced recursion overhead through manual optimization
- Measured performance across multiple input cases

**Documentation:**
[recursive-gcd/docs/Recursive-GCD-Timed-Optimization.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/e85993d9f7ed89bdaaffddb4e5d89f5c92ba187b/recursive-gcd/docs/Recursive-GCD-Timed-Optimization.pdf)

### 3. ARM NEON vs Scalar Dot Product

Compares a scalar C++ dot product implementation with an ARM NEON SIMD implementation on a Raspberry Pi 5.

**Topics explored:**
- SIMD vectorization
- ARM NEON intrinsics
- Compiler auto-vectorization
- Assembly analysis
- Performance benchmarking

**Highlights:**
- Compared compiler-generated SIMD with manual NEON code
- Analyzed reduction and vectorization strategies

**Documentation:**
[neon-dot-product/docs/ARM-NEON-vs-Scalar-Dot-Product.pdf](https://github.com/EmmanuelC40/Computer-Architecture-Optimization/blob/6c4e6ffb9a827f6bf3d7c9e53cfdec1b0471b26f/neon-dot-product/docs/ARM-NEON-vs-Scalar-Dot-Product.pdf)

## Technologies and Concepts

### Languages
- C++
- ARM64 Assembly
- x86-64 Assembly
- Python

### Performance Analysis
- Benchmarking
- std::chrono timing
- Assembly inspection
- Instruction-level optimization
- Cross-platform comparison

### Architectures
- ARMv8-A (AArch64)
- x86-64

### Tools
- GCC / G++
- GNU Assembler
- Python
- Matplotlib
- Linux

## Repository Structure
```
.
├── index-vs-pointer/
├── neon-dot-product/
├── recursive-gcd/
└── README.md
```

## Purpose

These projects explore how software interacts with hardware at the instruction level, focusing on how compilers generate machine code and how architectural differences affect performance.

Rather than simply optimizing for speed, the goal is to understand why performance differences occur.

## Author

Emmanuel Cano
