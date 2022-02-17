import logging
import time
import json
from robot.libraries.BuiltIn import BuiltIn


def removeSpaces(text):
    return text.replace(" ", "")

def addSpaceToThousands(number):
    return '{:,}'.format(number).replace(',', ' ')
