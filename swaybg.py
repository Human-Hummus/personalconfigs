import os, random, subprocess, time

while True:
    subprocess.Popen(["swaybg", "-i", "/configs/wallpapers/" + random.choice(os.listdir("/configs/wallpapers"))])
    time.sleep(60*60*2) # 2 hours
    subprocess.run(["killall", "swaybg"])
