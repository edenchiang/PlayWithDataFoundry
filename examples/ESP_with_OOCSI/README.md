### Description

This Arduino code uses the [oocsi-esp library](https://github.com/iddi/oocsi-esp#readme), and a light sensor with a 10K pulldown resistor to detect the light value and send it to the Data Foundry via OOCSI service, also, try to get the echo data from the Data Foundry via OOCSI output stream service.

Both of the OOCSI library and DFDataset library can work for ESP32, ESP8266, and also Arduino Nano 33 IoT platforms. The main difference between the libraries is that users have to connect to the WiFi manually with code if using the DFDataset library instead of simply providing the SSID and password of the SSID of WiFi to connect to.

* Tested WiFi platforms:
  - ESP32 DevKit V1
  - ESP32 PICO-KIT
  - Adafruit Huzzah ESP8266
  - Lolin S3
  - Lolin D1 mini
  - seeed studio XIAO ESP32C3
  - Arduino Nano 33 IoT
  - Arduino Uno R4 Wi-Fi
  - Arduino Nano RP2040 CONNECT

### Physical setting

* Pre-setting for using the GPIO of ESP32 DevKit V1: [check](https://randomnerdtutorials.com/esp32-adc-analog-read-arduino-ide/)

* Physical settings: GPIO34(pin 34) for data tranfering, power supply with 3.3V pin, and the GND pin
![](images/esp32-lightSensor-OOCSI.jpg)



### Data Foundry setting

* IoT dataset setting for uploading OOCSI stream: monitoring the channel and storing incoming data to the dataset
![](images/usecase-esp32-OOCSI-upload.jpg)

* IoT dataset setting for downloading OOCSI stream: sending out all the data coming into this dataset
![](images/usecase-esp32-OOCSI-download.png)



### ESP32 Installation

* Install ESP32 for Arduino IDE: [check](https://randomnerdtutorials.com/installing-the-esp32-board-in-arduino-ide-windows-instructions/)

* Install driver for CP21XX chip of ESP32: [check](https://techexplorations.com/guides/esp32/begin/cp21xxx/)

* ESP32 Dev Kit v1 pinout: [view chart](https://www.mischianti.org/wp-content/uploads/2020/11/ESP32-DOIT-DEV-KIT-v1-pinout-mischianti.png)


### ESP8266 Installation

* Install ESP8266 for Arduino IDE: [check](https://randomnerdtutorials.com/how-to-install-esp8266-board-arduino-ide/)

* Pinout of adafruit Huzzah ESP8266: [view chart](https://learn.adafruit.com/assets/46249)


### Arduino Nano 33 IoT Installation

* Install Arduino Nano 33 IoT for Arduino IDE: [check](https://www.arduino.cc/en/Guide/NANO33IoT)

* Arduino Nano 33 IoT pinout: [view chart](https://content.arduino.cc/assets/Pinout-NANO33IoT_latest.png)


### JSON content handling

* References: [ArduinoJson](https://arduinojson.org/)

<br />

## Source

All screenshot(s) are sourced from [Data Foundry](https://data.id.tue.nl/)