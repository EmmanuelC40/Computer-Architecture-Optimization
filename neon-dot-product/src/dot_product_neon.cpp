#include <iostream>
#include <arm_neon.h>

// Scalar dot product (your original version)
float dot_product_scalar(const float* a, const float* b, int n) {
    float sum = 0.0f;
    for (int i = 0; i < n; ++i) {
        sum += a[i] * b[i];
    }
    return sum;
}

// NEON dot product for 4-element float vectors
float dot_product_neon_4(const float* a, const float* b) {
    // Load 4 floats from each array into NEON registers
    float32x4_t va = vld1q_f32(a);  // [a0, a1, a2, a3]
    float32x4_t vb = vld1q_f32(b);  // [b0, b1, b2, b3]

    // Element-wise multiply: va * vb
    float32x4_t vmul = vmulq_f32(va, vb); // [a0*b0, a1*b1, a2*b2, a3*b3]

    // Now horizontally add the 4 lanes:
    // Step 1: split into low [0,1] and high [2,3]
    float32x2_t vlow  = vget_low_f32(vmul);   // [a0*b0, a1*b1]
    float32x2_t vhigh = vget_high_f32(vmul);  // [a2*b2, a3*b3]

    // Step 2: add low and high pairwise → [a0*b0 + a2*b2, a1*b1 + a3*b3]
    float32x2_t vsum2 = vadd_f32(vlow, vhigh);

    // Step 3: add the two lanes of vsum2
    float sum = vget_lane_f32(vsum2, 0) + vget_lane_f32(vsum2, 1);

    return sum;
}

int main() {
    // Two 4-element float vectors
    float vecA[4] = {1.0f, 2.0f, 3.0f, 4.0f};
    float vecB[4] = {5.0f, 6.0f, 7.0f, 8.0f};

    int n = 4;

    float scalar_result = dot_product_scalar(vecA, vecB, n);
    float neon_result   = dot_product_neon_4(vecA, vecB);

    std::cout << "Scalar dot product = " << scalar_result << std::endl;
    std::cout << "NEON   dot product = " << neon_result   << std::endl;

    return 0;
}
