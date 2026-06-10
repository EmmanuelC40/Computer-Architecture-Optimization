import matplotlib.pyplot as plt
import pandas as pd

df_pi = pd.read_csv("linux_gcd_results.csv")
df_intel = pd.read_csv("linux_opt_gcd_results.csv")

plt.style.use("seaborn-v0_8-whitegrid")
plt.figure(figsize=(10, 6))

x = range(len(df_pi))

plt.plot(
    x,
    df_pi["average_ns"],
    marker="o",
    linewidth=2,
    label="Intel x86_64 (Linux)",
)

plt.plot(
    x,
    df_intel["average_ns"],
    marker="s",
    linestyle="--",
    linewidth=2,
    label="Optimzed-Intel x86_64 (Linux)",
)

plt.xticks(x, df_pi["executable"])

plt.title(
    "Recursive Test Case Performance\nIntel x86_64 (Linux) vs Optimized-Intel x86_64"
)
plt.xlabel("Input Pair (a, b)")
plt.ylabel("Execution Time (ns)")

plt.grid(True, alpha=0.3)
plt.legend()
plt.tight_layout()

plt.show()
