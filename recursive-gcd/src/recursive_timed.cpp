#include <iostream>
#include <chrono>

using namespace std;
using namespace std::chrono;

int gcd_recurs(int a, int b) {
    if (b == 0)
        return a;
    else
        return gcd_recurs(b, a % b);
}

int main() {
    int a = 47373888;
    int b = 18883888;
    
    // Start timing
    auto start = high_resolution_clock::now();

    int result = gcd_recurs(a, b);

    // End timing
    auto end = high_resolution_clock::now(); 

    // Compute elapsed time and cast to microseconds
    auto duration = duration_cast<nanoseconds>(end - start); 

    cout << "GCD(" << a << ", " << b << ") = " << result << endl;
    

    cout << "Time taken: " << duration.count() 
             << " nanoseconds" << endl;

    return 0;
}
