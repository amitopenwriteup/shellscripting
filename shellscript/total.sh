#!/bin/bash

# Calculate total CPU and memory usage
total_cpu=$(ps aux | awk 'NR>1 {cpu+=$3} END {print cpu}')
total_mem=$(ps aux | awk 'NR>1 {mem+=$4} END {print mem}')

echo "Total CPU Usage: $total_cpu%"
echo "Total Memory Usage: $total_mem%"
