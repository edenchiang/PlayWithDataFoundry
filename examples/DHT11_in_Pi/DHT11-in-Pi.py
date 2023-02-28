"""
Author:         I-Tang (Eden) Chiang <i.chiang@tue.nl>
Date:           Feb. 16, 2021
Description:    Implementation for the usecase of the DataFoundry --- DATA-ENABLED DESIGN II (INFORMED STEP)
                Replace the input from participants by Raspberry Pi with DHT11 module
References:     https://data.id.tue.nl/documentation/usecase-ded-2
Platform:       Raspberry Pi 3b
Language:       Python
Module(s):      DHT11
"""
import sys
import Adafruit_DHT
import time
import datetime
from oocsi import OOCSI


# connect to OOCSI
# replace the 'unique_handler_name' as something unique
# OOCSI host for the Data Foundry: oocsi.id.tue.nl
oocsi = OOCSI('unique_handler_name', 'url_or_ip_address_of_host')

mins = 0
arr = []


def sendLog(humidity, temperature):
    """
    Send humidity and temperature to DataFoundry via OOCSI every 10 records
    and send notification to researchers by telegramBOt every 6 messages
    """
    
    current = datetime.datetime.now()
    global mins
    if mins == 60:
        sendMsg = True
        mins = 0
    else:
        sendMsg = False
    
    print("sendLog:" + str(sendMsg))
    # create and send data to the specific channel
    oocsi.send('OOCSI_channel_name_for_uploading_stream',
        {
            'device_id': 'refId_of_device',
            'humidity': humidity,
            'temperature': temperature,
            'sendMsg': sendMsg
        }
    )


def findMeans():
    """
    find means of humidity and temperature of past 10 mins
    """
    sumHumidity = 0
    sumTemperature = 0
    for humidity, temperature in arr:
        sumHumidity += humidity
        sumTemperature += temperature
    
    sendLog(round((sumHumidity / len(arr)), 4), round((sumTemperature / len(arr)), 4))


def recordByMinute():
    """
    get humidity and temperature data every minute and keep in arr[]
    """
    humidity, temperature = Adafruit_DHT.read_retry(11, 4)

    # print message for checking
    print(str(datetime.datetime.now()) + "      humidity: " + str(humidity) + "       temperature: " + str(temperature))
    return [humidity, temperature]

tStart = 0.0

while True:
    tEnd = time.time()
    if ((tEnd - tStart) >= 60):
        tStart = tEnd
        data = recordByMinute()
        
        if data[0] and data[1]:
            arr.append(data)
            
        mins += 1
        
        if mins % 10 == 0:
            findMeans()
            arr = []
    
    
