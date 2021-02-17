### Description

In this case, the data (humidity and temperature) will be collected every minute, and the mean value of every 10 minutes will be sent to an IoT dataset of the Data Foundry via OOCSI service. The researchers of the project will receive notification every hour from the Data Foundry by the script through the TelegramBot of the Data Foundry.


### Physical setting

* Pre-setting for using the GPIO of Raspberry Pi: [check](https://learn.adafruit.com/circuitpython-on-raspberrypi-linux/installing-circuitpython-on-raspberry-pi)

* Physical settings
![](images/usecase-device-DHT11-In-Pi.jpeg)


### Data Foundry setting

* IoT dataset setting for uploading OOCSI: Channel name
![](images/usecase-project-DHT11-in-Pi.JPG)

* Script settings for dealing with incoming data: set Channel name and ENABLE it
![](images/usecase-script-DHT11-in-Pi.JPG)