#!/nix/store/6sb0k4fh4sib7avqdv939s5nlvpi1v8s-system-path/bin/python3

import os, sys, time

while True:
	cpu_cores = 0
	total_clock = 0
	avg_clock = 0
	for i in os.popen("cat /proc/cpuinfo | grep 'cpu MHz'").read().split("\n"):
		if i == "":
			continue
		cpu_cores+=1
		total_clock+=float(i.split(":")[1].strip())

	avg_clock=total_clock/cpu_cores
	print("<small>" + str(round(avg_clock))+" MHz</small>", flush=True)
	time.sleep(3)
