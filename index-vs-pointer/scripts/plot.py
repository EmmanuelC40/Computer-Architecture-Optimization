import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.ticker import FuncFormatter

df_index = pd.read_csv("pi_pointer_results.csv")
df_pointer = pd.read_csv("opt_pi_pointer_results.csv")

plt.figure(figsize=(10, 6))

plt.plot(
    df_index["size"],
    df_index["average_ns"],
    marker="o",
    color="tab:blue",
    label="Pointer Access",
)

plt.plot(
    df_pointer["size"],
    df_pointer["average_ns"],
    marker="s",
    color="tab:orange",
    label="Optimized-Pointer Access",
)

plt.xscale("log")
plt.yscale("log")

# Format ticks with commas instead of 10^x
formatter = FuncFormatter(lambda x, _: f"{int(x):,}" if x >= 1 else f"{x:g}")
plt.gca().xaxis.set_major_formatter(formatter)
plt.gca().yaxis.set_major_formatter(formatter)

plt.title("Pointer vs Optimized-Pointer Performance (Raspberry Pi)")
plt.xlabel("Array Size")
plt.ylabel("Time (nanoseconds)")
plt.grid(True, which="both", ls="-", alpha=0.3)
plt.legend()

plt.show()
