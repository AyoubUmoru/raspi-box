import RPi.GPIO as GPIO
import os
import time

switch = 3
led = 27

GPIO.setmode(GPIO.BCM)
GPIO.setup(switch, GPIO.IN)
GPIO.setup(led, GPIO.OUT)
GPIO.output(led, 1)

try:
    while True:
        time.sleep(0.2)
        if GPIO.input(switch) == 0:
            GPIO.output(led, False)
            os.system('systemctl poweroff')
except KeyboardInterrupt:
    print("Bye Bye")
    GPIO.output(led, GPIO.LOW)
    GPIO.cleanup()
