#! /usr/bin/env python3
import sys, subprocess



options = []
f = open("/etc/nixos/configs/rofi_scripts/index.txt", "r")
file = f.read()
for line in file.split("\n"):
    if len(line) <= 1:
        continue
    options.append([
        line.split("|")[0].strip() + " (" + line.split("|")[1].strip() + ")",
        line.split("|")[1].strip()
        ])

if len(sys.argv) < 2:
    for i in options:
        print(i[0])
else:
    for i in options:
        if sys.argv[1] == i[0]:
            subprocess.run(["wl-copy", i[1]])
