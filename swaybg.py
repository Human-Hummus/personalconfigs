import os, random, subprocess

subprocess.Popen(["swaybg", "-i", "/configs/wallpapers/" + random.choice(os.listdir("/configs/wallpapers"))])
