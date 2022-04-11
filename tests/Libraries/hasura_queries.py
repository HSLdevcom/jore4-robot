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
          type_of_line
          transport_target
        }
      }
      '''
      variables = {
        'lineLabel': str(label),
      }
      response = self.endpoint(query, variables)
      return json.dumps(response)

    def getStopPointDetails(self, label):
      query='''
      query ($label: String!) {
        service_pattern_scheduled_stop_point(where: {label: {_eq: $label}}){
          closest_point_on_infrastructure_link
          direction
          located_on_infrastructure_link_id
          measured_location
          priority
          relative_distance_from_infrastructure_link_start
          scheduled_stop_point_id
          validity_end
          validity_start
        }
      }
      '''
      variables = {
        'label': str(label),
      }
      response = self.endpoint(query, variables)
      return json.dumps(response)

    def deleteLineByLabel(self, label):
      query='''
      mutation DeleteLineByLabel($label: String!) {
        delete_route_line(where: {label: {_eq: $label}}) {
          returning {
            line_id
            label
          }
        }
      }
      '''
      variables = {
        'label': str(label),
      }
      response = self.endpoint(query, variables)
      return json.dumps(response)

    def deleteStopByLabel(self, label):
      query='''
      mutation DeleteStopByLabel($label: String!) {
        delete_service_pattern_scheduled_stop_point(where: {label: {_eq: $label}}) {
          returning {
            scheduled_stop_point_id
            label
          }
        }
      }
      '''
      variables = {
        'label': str(label),
      }
      response = self.endpoint(query, variables)
      return json.dumps(response)
