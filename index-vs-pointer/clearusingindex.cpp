#include <iostream>
#include <chrono>
using namespace std;
using namespace std::chrono;

// Function to clear an array using indexing
void ClearUsingIndex(int Array[], int size) {
    for (int i = 0; i < size; i++)
        Array[i] = 0;
}

int main() {
    // Array sizes to test
    int sizes[] = {10000, 100000, 1000000, 10000000, 100000000};

    for (int s = 0; s < 5; s++) {
        int size = sizes[s];

        // Dynamically allocate array of given size
        int* Array = new int[size];

        // Fill the array with dummy values first
        for (int i = 0; i < size; i++)
            Array[i] = i;

        // Start timing
        auto start = high_resolution_clock::now();

        // Clear the array
        ClearUsingIndex(Array, size);

        // End timing
        auto end = high_resolution_clock::now();

        // Compute duration
        auto duration = duration_cast<nanoseconds>(end - start);

        cout << size << "," 
             << duration.count() << endl;

        delete[] Array;
    }

    return 0;
}

