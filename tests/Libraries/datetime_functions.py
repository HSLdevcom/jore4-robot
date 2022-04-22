import datetime
from random import randrange

def dateToday():
  today = datetime.datetime.now()
  return today

def dateTomorrow():
  tomorrow = datetime.datetime.now() + datetime.timedelta(days=1)
  return tomorrow

def dateAsMmddyyyy(date):
  return date.strftime("%m.%d.%Y")

def convertDateFormatToUtcYmd(date):
  dateUTC = date - datetime.timedelta(days=1)
  dateUTC = dateUTC.strftime("%Y-%m-%d")
  return dateUTC
