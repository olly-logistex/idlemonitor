#!bin/bash

# //TODO 
# []check if files exist already
# []change append or overrdide option 
# []add dates to the filename
# []remove tagline/ header from file before reading into array 
    # or add logic to dump first value

awk -F\; '{print $8}' iowait_idle.txt | tee -a iowait.txt
awk -F\; '{print $10}' iowait_idle.txt | tee -a idle_new.txt
awk -F\; '{print $8}' runq_ldavg.txt | tee -a ldavg.txt
awk -F\; '{print $7}' runq_ldavg.txt | tee -a ldavg-5.txt
awk -F\; '{print $6}' runq_ldavg.txt | tee -a ldavg-1.txt
awk -F\; '{print $4}' runq_ldavg.txt | tee -a runq-sz.txt
awk -F\; '{print $7}' majflt_pgscank.txt | tee -a majflt.txt
awk -F\; '{print $9}' majflt_pgscank.txt | tee -a pgscank.txt
awk -F\; '{print $6}' memused.txt | tee -a memused.txt
