import requests
import json
import Browser

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
