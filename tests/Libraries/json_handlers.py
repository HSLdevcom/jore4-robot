import requests
import json
import Browser
import random

class json_handlers:

  def getValueFromResponseByKey(self, response, dataType, key):
    try:
      data = json.loads(response)
      value = data['data'][dataType][0][key]
      return value
    except KeyError:
      data = json.loads(response)
      value = data['data'][dataType][key]
      return value


  def dictToJson(self, dict):
    return json.dumps(dict)

  def getRandomElementFromResponse(self, response, dataType):
    try:
      data = json.loads(response)
      elements = data['data'][dataType][0]
      return random.choice(elements)
    except KeyError:
      data = json.loads(response)
      elements = data['data'][dataType]
      return random.choice(elements)
