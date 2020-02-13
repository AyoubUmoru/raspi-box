#!/usr/bin/env python3

from copy import copy
from time import sleep
from os import getenv
from os import system
import requests
import keyboard


SCREENLY_OSE_API = getenv(
    'SCREENLY_OSE_API',
    'http://localhost:8080'
)
SCREENLY_OSE_ENDPOINT = getenv(
    'SCREENLY_OSE_ENDPOINT',
    'api/v1/assets/control'
)


def switch_slide(action):
    if action not in ['next', 'previous']:
        print('{} is an invalid action.'.format(action))
        return False

    url = '{}/{}/{}'.format(
        SCREENLY_OSE_API,
        SCREENLY_OSE_ENDPOINT,
        action
    )

    r = requests.get(url)
    print('Got action {} (status code: {})'.format(action, r.status_code))
    if r.ok:
        sleep(0.5)
    return


def command_exec(action):
    if action not in ['reboot', 'close']:
        print('{} is an invalid action.'.format(action))
        return False

    if action == "reboot":
        system('sudo shutdown -r now')

    if action == "close":
        system('sudo shutdown -h now')


def main():

    while True:
        try:  #
            sleep(0.1)

            if keyboard.is_pressed('p'):
                switch_slide('previous')
                sleep(0.5)
            if keyboard.is_pressed('d'):
                switch_slide('next')
                sleep(0.5)

            if keyboard.is_pressed('left'):
                switch_slide('previous')
                sleep(0.5)
            if keyboard.is_pressed('right'):
                switch_slide('next')
                sleep(0.5)

            if keyboard.is_pressed('r'):
                command_exec('reboot')
                sleep(0.5)
            if keyboard.is_pressed('c'):
                command_exec('close')
                sleep(0.5)
        except:
            print('errrrr')


if __name__ == "__main__":
    main()
