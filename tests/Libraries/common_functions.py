import logging
import time
import json
from robot.libraries.BuiltIn import BuiltIn


def remove_spaces(text):
    return text.replace(" ", "")

def add_space_to_thousands(number):
    return '{:,}'.format(number).replace(',', ' ')

def getValueFromResponseByKey(response, dataType, key):
  data = json.loads(response)
  value = data['data'][dataType][0][key]
  return value
