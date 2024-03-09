import os, random, subprocess

subprocess.Popen(["swaybg", "-i", "/etc/nixos/configs/wallpapers/" + random.choice(os.listdir("/etc/nixos/configs/wallpapers"))])
