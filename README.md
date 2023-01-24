Implementation for some use-cases of the Data Foundry and some other ways for collecting data with the Data Foundry
<br>

### Data Foundry
***
[Data Foundry](https://data.id.tue.nl) is a data infrastructure for prototyping and designing with data for the ID department of TU/e. In addition, the site serves as a Design Research Data Management system.


<br><br>
### Boards with WiFi chip built-in
***
#### Raspberry Pi 3b (in Python)

* [DHT11 in Pi](examples/DHT11_in_Pi/)
	Get humidity and temperature periodically with DHT11 module and receive notifications from the TelegramBot of the Data Foundry

	References: [Use-case: Data-enabled design II (informed step)](https://data.id.tue.nl/documentation/usecase-ded-2)



#### ESP32 / ESP8266 / Arduino Nano 33 IoT

* [ESP32 with OOCSI](examples/ESP_with_OOCSI)
	Get light data for the environment and send to the Data Foundry via OOCSI upload stream with ESP32, ESP8266, or Arduino Nano 33 IoT, and observing the data with received information from download OOCSI stream
	
	References: [Use-case: Smart Things](https://data.id.tue.nl/documentation/usecase-smart-things)


#### ESP32 in MicroPython

* [ESP32 in MicroPython](examples/ESP32_to_Pyboard)
	How to act ESP32 / ESP8266 as a pyboard in MicroPython with OOCSI or Data Foundry?


<br><br>
### Boards without WiFi chip built-in
***
#### Arduino boards / Teensy 3.2 

* [Teensy 3.2 / Arduino UNO with Processing](examples/Teensy_ArduinoUNO_with_Processing)
	An alternative way to upload data to the Data Foundry via OOCSI with non-WiFi boards.
	In this case, the Arduino part will send (print) the sensor data to the serial port it's using, and the Processing part will read the data from the serial port with processing.serial library, then the data will be sent to the Data Foundry via OOCSI in Processing.


<br><br>
### Software only
***
#### Processing 

* [Collect data with Processing via OOCSI service](examples/Processing_with_OOCSI)
	Sample code to demostrate sending / receiving interaction data to / from the Data Foundry by Processing app via OOCSI service


#### Hosting simple web page for the project
* [Hosting by Data Foundry](examples/WWW_host_by_DF)
	Use a Complete dataset of the Data Foundry as a simple host for general web site or the home page for the project where the Complete dataset belongs to.


#### Telegram
* [Collecting data from participants with the Data Foundry Telegram bot]()
	Researchers can easily collect data from participants with [Data Foundry Telegram bot](https://t.me/datafoundrybot)


<br><br>
### Other appliences
***
#### Telegram

* [Arduino with Telegram](examples/Arduino_with_Telegram)
	To receive Telegram messages from the Arduino boards with Wi-Fi connection through a Telegram bot


#### Rapberry Pi Pico

* [Raspberry Pi Pico with ESP-12S](examples/RPi-Pico_with_ESP-12S)
	Work in Micropython with a powerful budget choice.
	This practice shows how to connect Pico to the Internet with ESP-12S WiFi module but not work with OOCSI library yet.


#### Apple Health & Google Fit

* [Sync Apple Health data with Google Fit](examples/Apple_to_GoogleFit/)
	Showing the process to sync Apple Health data with Google Fit app (or other compatible apps).