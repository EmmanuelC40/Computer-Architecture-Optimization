import csv

input_file = "opt_pointer_results.csv"
output_file = "B_4.csv"

with open(input_file, newline="") as f:
    reader = csv.reader(f)
    rows = list(reader)

header = rows[0]  # size, run_1, run_2, ...
data = rows[1:]  # numeric rows

sizes = [row[0] for row in data]
runs = header[1:]  # run_1 ... run_10, average_ns

# Transpose values (ignore size column)
values = list(zip(*[row[1:] for row in data]))

with open(output_file, "w", newline="") as f:
    writer = csv.writer(f)

    for run_name, run_values in zip(runs, values):
        if run_name == "average_ns":
            label = "Average"
        else:
            label = f"Run {run_name.split('_')[1]}"

        writer.writerow([label, *run_values])
