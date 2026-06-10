#include <iostream>
#include <vector>
#include <chrono>
#include <random>
#include <arm_neon.h>
#include <iomanip>

// --- 1. The Scalar Implementation ---
float dot_product_scalar(const float* a, const float* b, size_t n) {
    float sum = 0.0f;
    for (size_t i = 0; i < n; ++i) {
        sum += a[i] * b[i];
    }
    return sum;
}

// --- 2. The NEON Intrinsic Implementation ---
float dot_product_neon(const float* a, const float* b, size_t n) {
    float32x4_t vec_sum = vdupq_n_f32(0.0f);
    size_t i = 0;

    // Main NEON Loop (Unrolled 4x)
    for (; i <= n - 4; i += 4) {
        float32x4_t vec_a = vld1q_f32(a + i);
        float32x4_t vec_b = vld1q_f32(b + i);
        vec_sum = vmlaq_f32(vec_sum, vec_a, vec_b);
    }

    // Reduction
    float result = vaddvq_f32(vec_sum);

    // Peeling (Handle remaining elements)
    for (; i < n; ++i) {
        result += a[i] * b[i];
    }
    return result;
}

int main() {
    // A. Setup: Create 100 Million elements (Approx 400MB of data)
    const size_t N = 100000000; 
    
    // Note: Use aligned_alloc to ensure 128-bit alignment for NEON
    float* a = static_cast<float*>(aligned_alloc(16, N * sizeof(float)));
    float* b = static_cast<float*>(aligned_alloc(16, N * sizeof(float)));

    // Fill with random data
    std::cout << "Initializing " << N << " elements..." << std::endl;
    for(size_t i = 0; i < N; i++) {
        a[i] = 1.0f; // Simplified for speed of initialization
        b[i] = 1.0f;
    }

    // --- B. Benchmark Scalar ---
    auto start_scalar = std::chrono::high_resolution_clock::now();
    float res_scalar = dot_product_scalar(a, b, N);
    auto end_scalar = std::chrono::high_resolution_clock::now();
    
    std::chrono::duration<double> diff_scalar = end_scalar - start_scalar;
    std::cout << "Scalar Time: " << std::fixed << std::setprecision(4) 
              << diff_scalar.count() << " s (Result: " << res_scalar << ")" << std::endl;

    // --- C. Benchmark NEON ---
    auto start_neon = std::chrono::high_resolution_clock::now();
    float res_neon = dot_product_neon(a, b, N);
    auto end_neon = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> diff_neon = end_neon - start_neon;
    std::cout << "NEON Time:   " << std::fixed << std::setprecision(4) 
              << diff_neon.count() << " s (Result: " << res_neon << ")" << std::endl;

    // --- D. Analysis Output ---
    double speedup = diff_scalar.count() / diff_neon.count();
    std::cout << "---------------------------------" << std::endl;
    std::cout << "Speedup Factor: " << speedup << "x" << std::endl;

    free(a);
    free(b);
    return 0;
}
