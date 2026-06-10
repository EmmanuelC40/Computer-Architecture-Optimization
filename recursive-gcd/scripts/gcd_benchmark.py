import subprocess
import csv
from collections import defaultdict
import statistics

executables = ["opt_13_17", "opt_60_20", "opt_55_34", "opt_47373888_18883888"]
runs = 10
output_file = "linux_opt_gcd_results.csv"

raw_data = defaultdict(list)

print(f"Benchmarking {len(executables)} optimized executables...")

for exe in executables:
    print(f"Testing {exe}...")
    for _ in range(runs):
        process = subprocess.run([f"./{exe}"], capture_output=True, text=True)

        if process.returncode != 0:
            continue

        output = process.stdout.strip()

        try:
            a_b, gcd_val, time_val = output.split(",")
            raw_data[exe].append(int(time_val))
        except ValueError:
            print(f"Error parsing output from {exe}: {output}")

# CSV headers
headers = ["executable"] + [f"run_{i + 1}" for i in range(runs)] + ["average_ns"]

rows = []
for exe in executables:
    durations = raw_data[exe]
    if not durations:
        continue

    row = {"executable": exe}
    for i, duration in enumerate(durations):
        row[f"run_{i + 1}"] = duration

    row["average_ns"] = statistics.mean(durations)
    rows.append(row)

with open(output_file, "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=headers)
    writer.writeheader()
    writer.writerows(rows)

print(f"\nDone! Benchmark results saved to {output_file}")
