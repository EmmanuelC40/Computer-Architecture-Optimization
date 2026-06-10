#include <iostream>

// Scalar dot product function (your code)
float dot_product_scalar(const float* a, const float* b, int n) {
    float sum = 0.0f;
    for (int i = 0; i < n; ++i) {
        sum += a[i] * b[i];
    }
    return sum;
}

int main() {
    // Two 4-element float arrays
    float vecA[4] = {1.0f, 2.0f, 3.0f, 4.0f};
    float vecB[4] = {5.0f, 6.0f, 7.0f, 8.0f};

    // Number of elements
    int n = 4;

    // Compute the dot product
    float result = dot_product_scalar(vecA, vecB, n);

    // Print result
    std::cout << "Dot product (scalar) = " << result << std::endl;

    return 0;
}
