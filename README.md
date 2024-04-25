Implementation for some use-cases of the Data Foundry and some other ways for collecting data with the Data Foundry
<br>

## **Data Foundry**

[Data Foundry](https://data.id.tue.nl) is a data infrastructure for prototyping and designing with data for the ID department of TU/e. In addition, the site serves as a Design Research Data Management system.
<br><br>

## **Boards with WiFi chip built-in**

### **Raspberry Pi 3b (in Python)**

* [DHT11 in Pi](examples/DHT11_in_Pi/)
  - Get humidity and temperature periodically with DHT11 module and receive notifications from the TelegramBot of the Data Foundry
  - References: [Use-case: Data-enabled design II (informed step)](https://data.id.tue.nl/documentation/usecase-ded-2)
  - *#Script_Dataset, #Raspberry_Pi, #OOCSI, #Python*
	


### **ESP32 / ESP8266 / Arduino Nano 33 IoT / Arduino Uno R4 WiFi**

* [ESP32 with OOCSI](examples/ESP_with_OOCSI)
	- Get light data for the environment and send to the Data Foundry via OOCSI upload stream with ESP32, ESP8266, or Arduino Nano 33 IoT, and observing the data with received information from download OOCSI stream
	- References: [Use-case: Smart Things](https://data.id.tue.nl/documentation/usecase-smart-things)
    - *#ESP32, #ESP8266, #Arduino_Nano_33_IoT, #Arduino_Uno_R4_WiFi, #OOCSI*


### **ESP32 in MicroPython**

* [ESP32 in MicroPython](examples/ESP32_to_Pyboard)
  - How to act ESP32 / ESP8266 as a pyboard in MicroPython with OOCSI or Data Foundry?
  - *#ESP32, #ESP8266, #Micro_Python, #OOCSI*
<br><br>

## **Boards without WiFi chip built-in**

### **Arduino boards / Teensy 3.2**

* [Teensy 3.2 / Arduino UNO with Processing](examples/Teensy_ArduinoUNO_with_Processing)
	- An alternative way to upload data to the Data Foundry via OOCSI with non-WiFi boards.
	- In this case, the Arduino part will send (print) the sensor data to the serial port it's using, and the Processing part will read the data from the serial port with processing.serial library, then the data will be sent to the Data Foundry via OOCSI in Processing.
	- *#Teensy, #Arduino_Uno, #Processing, #OOCSI*
<br><br>

## **Software only**

### **Processing** 

* [Collect data with Processing via OOCSI service](examples/Processing_with_OOCSI)
	- Sample code to demostrate sending / receiving interaction data to / from the Data Foundry by Processing app via OOCSI service
	- *#Processing, #OOCSI*


### **Home page of Data Foundry project**
* [Host web page for Data Foundry project](examples/WWW_host_by_DF)
	- Use a Complete dataset of the Data Foundry as a simple host for general web site or the home page for the project where the Complete dataset belongs to.
	- *#Existing_Dataset, #HTML, #CSS, #JavaScript*


### **Questionnaire form**
* [Questionnaire by Form dataset of Data Foundry](examples/Questionnaire_Form)
	- Collect data in questionnaire format host by Data Foundry, all you need to know is how to put your questions in Markdown language.
	- *#Form_Dataset, #Markdown*


### **Telegram bot of Data Foundry**

* [Collect data from participants in **questionnaire structured conversation** with Telegram bot of Data Foundry](examples/Collect_questionnaire_data_with_DF_bot/)
  - Researchers can easily collect data from participants with [Data Foundry Telegram bot](https://t.me/datafoundrybot)
  - *#Script_Dataset, #Telegram_bot, #OOCSI*

### **Access data in Entity dataset with Script and IoT dataset**
* [Script for passing IoT data to Entity dataset](examples/Script_for_passing_IoT_data_to_Entity)
	- Access data in Entity dataset by operating data from OOCSI with script.
	- *#Entity_Dataset, #OOCSI, #IoT_device*

<br>

## **Other appliences**

### **Telegram bot with Arduino**

* [Arduino with Telegram](examples/Arduino_with_Telegram)
	- To receive Telegram messages from the Arduino boards with Wi-Fi connection through a Telegram bot
	- *#IoT, #Telegram_bot*


### **Rapberry Pi RP2040**

* [Raspberry Pi Pico with ESP-12S](examples/RPi-Pico_with_ESP-12S)
	- Work in Micropython with a powerful budget choice.
	- This practice shows how to connect Pico to the Internet with ESP-12S WiFi module but not work with OOCSI library yet.
	- *#RP2040, #ESP-12S, #OOCSI*


### **Apple Health & Google Fit**

* [Sync Apple Health data with Google Fit](examples/Apple_to_GoogleFit/)
	- Showing the process to sync Apple Health data with Google Fit app (or other compatible apps).
	- *#GoogleFit, #Fitbit*


### **Check data passed through OOCSI channel**

* [Check incoming data of OOCSI channel](examples/Check_incoming_data_of_OOCSI/)
  * #OOCSI

### Collect photo taken by ESP32-Cam via POST request through Data Foundry API

* [ESP32-Cam POST photo to Data Foundry via Data Foundry API](examples/ESP32-Cam_POST_image_to_DF)
  * To take a photo with ESP32-Cam and send it to Data Foundry with POST request via Data Foundry API as some specific input is coming from serial monitor
  * #ESP32-Cam, #Media_Dataset, #POST_request, #HTTPS_protocol, #photo

<br />