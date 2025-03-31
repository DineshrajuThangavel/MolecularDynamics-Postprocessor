# 📦 MD Snapshot Processor

This project contains a Bash and AWK-based workflow to process, clean, and combine multiple `.snapshot` files generated from parallel molecular dynamics simulations.

## 🛠 Features
- Header transformation (unit conversion, metadata filtering)
- Body cleanup (column filtering and unit scaling)
- Merging multiple snapshot files into one consistent output
- Designed for use with HPC parallel simulation outputs

## 📂 Files Included
- `XmasTrial.bsh`: Main Bash driver script  
- `header.awk`: Adjusts the header of each snapshot  
- `body.awk`: Filters and scales body data (positions, energies, etc.)  
- `flowchart.png`: Visual diagram of the data pipeline

## ▶️ How to Use
```bash
bash XmasTrial.bsh <prefix> <ext> <number_of_snapshots>
# Example:
bash XmasTrial.bsh Simulation_final snapshot 8
```

## 🧪 Example Output
A single combined and cleaned `.snapshot` file ready for further analysis or visualization.

## 🧾 License
This project is open-source and available under the MIT License.
