#!bin/bash

# //TODO 
# []check if files exist already
# []change append or overrdide option 
# []add dates to the filename
# [x]remove tagline/ header from file before reading into array 
    # sed regex is currently untested

awk -F\; '{print $8}' iowait_idle.txt | sed 's/[^0-9]*//g' |tee -a iowait.txt
awk -F\; '{print $10}' iowait_idle.txt | sed 's/[^0-9]*//g' | tee -a idle.txt
awk -F\; '{print $8}' runq_ldavg.txt | sed 's/[^0-9]*//g' | tee -a ldavg.txt
awk -F\; '{print $7}' runq_ldavg.txt | sed 's/[^0-9]*//g' | tee -a ldavg-5.txt
awk -F\; '{print $6}' runq_ldavg.txt | sed 's/[^0-9]*//g' | tee -a ldavg-1.txt
awk -F\; '{print $4}' runq_ldavg.txt | sed 's/[^0-9]*//g' | tee -a runq-sz.txt
awk -F\; '{print $7}' majflt_pgscank.txt | sed 's/[^0-9]*//g' | tee -a majflt.txt
awk -F\; '{print $9}' majflt_pgscank.txt | sed 's/[^0-9]*//g' | tee -a pgscank.txt
awk -F\; '{print $6}' memused.txt | sed 's/[^0-9]*//g' | tee -a memused.txt

# tee -a would need to be changed if the current dataset was to be compared against future datasets as it appends to the file
# it may be easier to discard array value 0 in the python script