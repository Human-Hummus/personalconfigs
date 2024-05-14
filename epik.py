import os, sys, time

cpu_cores = 8
def cpu_use():
    total = 0
    for i in os.popen("ps -eo pcpu").read().split("\n"):
        try:
            x =float(i) 
            total+=x    
        except:
            pass
    return total/cpu_cores

def brightness():
    bctl_out = os.popen("brightnessctl i").read()
    for item in bctl_out.split("\n"):
        if "Current" in item:
            return item.split("(")[1].split(")")[0]

def clock_speed():
    cpu_cores = 0
    total_clock = 0
    avg_clock = 0
    for i in os.popen("cat /proc/cpuinfo | grep 'cpu MHz'").read().split("\n"):
        if i == "":
            continue
        cpu_cores+=1
        total_clock+=float(i.split(":")[1].strip())

    avg_clock=total_clock/cpu_cores
    return avg_clock

a = 0
while True:
    a = 1

    print("<small>("+
          brightness() +
       " 🖵 )\t("+
            str(cpu_use())
       +"% CPU)\t("
       +str(round(clock_speed()))+
       " MHz)\t("+
            str(round(float(os.popen("sensors | grep \"CPU temp\"")
            .read()
            .split("+")[1].strip()
            .split("°")[0]))) + "°C)\t(" +
        os.popen("df --total -hl | grep 'total'").read().split("%")[0].split(" ")[-1]
        +"% 🖬)"+
       
       "</small>"
       , flush=True)
    time.sleep(1)
