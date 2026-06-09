import subprocess
import csv
from collections import defaultdict
import statistics

executable = "./raspberry_pi_optimized_pointer"
runs = 10
output_file = "opt_pi_pointer_results.csv"

# Store data as {size: [run1, run2, run3...]}
raw_data = defaultdict(list)

print(f"Running benchmark {runs} times...")

for i in range(runs):
    print(f"Iteration {i + 1}/{runs}...")
    process = subprocess.run([executable], capture_output=True, text=True)

    if process.returncode == 0:
        lines = process.stdout.strip().split("\n")
        for line in lines:
            try:
                size_str, time_str = line.split(",")
                raw_data[int(size_str)].append(int(time_str))
            except ValueError:
                continue

# Prepare CSV Headers: ["size", "run_1", "run_2", ..., "average_ns"]
headers = ["size"] + [f"run_{i + 1}" for i in range(runs)] + ["average_ns"]

# Prepare Rows
rows = []
for size in sorted(raw_data.keys()):
    durations = raw_data[size]
    avg_time = statistics.mean(durations)

    # Create a dictionary for the row
    row = {"size": size}
    for i, duration in enumerate(durations):
        row[f"run_{i + 1}"] = duration
    row["average_ns"] = avg_time

    rows.append(row)

# Save to CSV
with open(output_file, mode="w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=headers)
    writer.writeheader()
    writer.writerows(rows)

print(f"\nDone! Detailed results saved to {output_file}")
