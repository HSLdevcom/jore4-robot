import requests
import json
from sgqlc.endpoint.http import HTTPEndpoint

class hasura_queries:
    def __init__(self, hasuraApiUrl):
      self.url = hasuraApiUrl
      self.headers= {
        'x-hasura-admin-secret': 'hasura',
        'Content-Type': 'application/json'
      }
      self.endpoint = HTTPEndpoint(self.url, self.headers)

    def getLineDetailsFromHasura(self, label):
      query='''
      query ($lineLabel: String!) {
        route_line(where: {label: {_eq: $lineLabel}}){
          name_i18n
          line_id
          primary_vehicle_mode
          priority
          short_name_i18n
          validity_end
          validity_start
        }
      }
      '''
      variables = {
        'lineLabel': str(label),
      }
      response = self.endpoint(query, variables)
      return json.dumps(response)
