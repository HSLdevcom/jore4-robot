import logging
import time
import datetime
from robot.libraries.BuiltIn import BuiltIn


def date_today():
    today = datetime.datetime.now()
    today = today.strftime("%d.%m.%Y")
    return today

def remove_spaces(text):
    return text.replace(" ", "")

def add_space_to_thousands(number):
    return '{:,}'.format(number).replace(',', ' ')
