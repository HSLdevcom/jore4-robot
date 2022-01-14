import requests
import json


class hasura_queries:
    def __init__(self, hasuraApiUrl):
      self.url = hasuraApiUrl
      self.headers= {
        'x-hasura-admin-secret': 'hasura',
        'Content-Type': 'application/json'
      }

    def getLineDetailsFromHasura(self, label):
        query="{{\"query\":\"query MyQuery {{\\n  route_line(where: {{label: {{_eq: \\\"{}\\\"}}}}) {{\\n    label\\n    name_i18n\\n    line_id\\n    description_i18n\\n    primary_vehicle_mode\\n    priority\\n    short_name_i18n\\n    validity_end\\n    validity_start\\n  }}\\n}}\",\"variables\":{{}}}}".format(label)
        response = requests.request("POST", self.url, headers=self.headers, data=query)
        return response.text
