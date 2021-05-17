## Implementation for some use-cases of the Data Foundry and some other ways for collecting data with the Data Foundry


### Data Foundry

[Data Foundry](https://data.id.tue.nl) is a data infrastructure for prototyping and designing with data for the ID department of TU/e. In addition, the site serves as a Design Research Data Management system.



### Raspberry Pi 3b (in Python)

* [DHT11 in Pi](examples/DHT11_in_Pi/)

	Get humidity and temperature periodically with DHT11 module and receive notifications from the TelegramBot of the Data Foundry

	References: [Use-case: Data-enabled design II (informed step)](https://data.id.tue.nl/documentation/usecase-ded-2)



### ESP32 / ESP8266 / Arduino Nano 33 IoT (board with WiFi)

* [ESP32 with OOCSI](examples/ESP_with_OOCSI)

	Get light data for the environment and send to the Data Foundry via OOCSI upload stream with ESP32, ESP8266, or Arduino Nano 33 IoT, and observing the data with received information from download OOCSI stream
	
	References: [Use-case: Smart Things](https://data.id.tue.nl/documentation/usecase-smart-things)



### Arduino boards / Teensy 3.2 (non-WiFi board)

* [Teensy 3.2 / Arduino UNO with Processing](examples/Teensy_ArduinoUNO_with_Processing)

	An alternative way to upload data to the Data Foundry via OOCSI with non-WiFi boards.
	
	In this case, the Arduino part will send (print) the sensor data to the serial port it's using, and the Processing part will read the data from the serial port with processing.serial library, then the data will be sent to the Data Foundry via OOCSI in Processing.
	


### Processing 

* [Collect data with Processing via OOCSI service](examples/Processing_with_OOCSI)

	Sample code to demostrate sending / receiving interaction data to / from the Data Foundry by Processing app via OOCSI service

