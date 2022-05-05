import datetime
from random import randrange

def dateToday():
  today = datetime.datetime.now()
  return today

def dateAsMmddyyyy(date):
  return date.strftime("%m.%d.%Y")

def convertStartDateString(dateString):
  date = datetime.datetime.strptime(dateString, '%m%d%Y')
  dateUTC = date - datetime.timedelta(days=1)
  dateUTC = dateUTC.strftime("%Y-%m-%d")
  return dateUTC

def convertEndDateString(dateString):
  date = datetime.datetime.strptime(dateString, '%m%d%Y')
  dateUTC = date.strftime("%Y-%m-%d")
  return dateUTC

def convertDateFormatToUtcYmd(date):
  dateUTC = date - datetime.timedelta(days=1)
  dateUTC = dateUTC.strftime("%Y-%m-%d")
  return dateUTC
