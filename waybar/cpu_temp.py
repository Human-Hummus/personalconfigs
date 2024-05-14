import time,sys,os

while True:
    print(
            str(round(float(os.popen("sensors | grep \"CPU temp\"")
            .read()
            .split("+")[1].strip()
            .split("°")[0]))) + "°C", flush=True)
    time.sleep(2)
