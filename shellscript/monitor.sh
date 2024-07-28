#monitor cpu and memory
#!/bin/bash

# Define the CPU usage threshold
CPU_THRESHOLD=10.0
LOG_FILE="high_cpu_usage.log"

# Monitor processes and log those exceeding the threshold
while true; do
  ps aux | awk -v threshold="$CPU_THRESHOLD" '$3 > threshold {print strftime("%Y-%m-%d %H:%M:%S"), $0}' >> $LOG_FILE
  sleep 10
done

