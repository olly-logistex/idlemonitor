#!/bin/bash

now=$(date +"%Y%m%d")

#currently running for 1 - 13 add cmd line option for last x dates

cd ~/support/ollyk/sar
mkdir -pv $now
cd $now
mkdir raw
cd raw

for i in `seq -f %02g 1 13`; do sadf -dh -- -B /var/log/sa/sa$i  >> raw_majflt_pgscank.txt; done 
for i in `seq -f %02g 1 13`; do sadf -dh -- -q /var/log/sa/sa$i  >> raw_runq_ldavg.txt; done
for i in `seq -f %02g 1 13`; do sadf -dh -- -r /var/log/sa/sa$i  >> raw_memused.txt; done
for i in `seq -f %02g 1 13`; do sadf -dh -- -u /var/log/sa/sa$i  >> raw_iowait_idle.txt; done

awk -F\; '{print $8}' raw_iowait_idle.txt |  grep -v "%iowait" | tr '\n' ',' >  ../iowait.txt
awk -F\; '{print $10}' raw_iowait_idle.txt  | grep -v  "%idle" | tr '\n' ',' >  ../idle.txt
awk -F\; '{print $8}' raw_runq_ldavg.txt | grep -v "ldavg-15" | tr '\n' ',' >  ../ldavg-15.txt
awk -F\; '{print $7}' raw_runq_ldavg.txt  | grep -v "ldavg-5" | tr '\n' ',' >  ../ldavg-5.txt
awk -F\; '{print $6}' raw_runq_ldavg.txt  | grep -v "ldavg-1" | tr '\n' ',' > ../ldavg-1.txt
awk -F\; '{print $4}' raw_runq_ldavg.txt  | grep -v "runq-sz" | tr '\n' ',' > ../runq-sz.txt
awk -F\; '{print $7}' raw_majflt_pgscank.txt |grep -v "majflt/s" | tr '\n' ',' > ../majflt.txt
awk -F\; '{print $9}' raw_majflt_pgscank.txt | grep -v "pgscank/s" | tr '\n' ',' > ../pgscank.txt
awk -F\; '{print $6}' raw_memused.txt  | grep -v "%memused" | tr '\n' ',' > ../memused.txt

cd ..
truncate -s -1 iowait.txt
truncate -s -1 idle.txt
truncate -s -1 ldavg-15.txt
truncate -s -1 ldavg-5.txt
truncate -s -1 ldavg-1.txt
truncate -s -1 runq-sz.txt
truncate -s -1 majflt.txt
truncate -s -1 pgscank.txt
truncate -s -1 memused.txt