## Description

This practice shows how to upload photo taken with ESP32-CAM via POST request as the "photo" string is input by user through serial monitor.

<br>

## Preperation

### Hardware

* Physical setting for uploading to ESP32-CAM: 
    - With [ESP32-CAM AI-Thinker MB Programmer (by randomnerdtutorials.com)](https://randomnerdtutorials.com/upload-code-esp32-cam-mb-usb/), or
    - With USB to UART module by [randomnerdtutorials.com](https://randomnerdtutorials.com/program-upload-code-esp32-cam/), or
    - With any USB to UART module, just make sure the pins are connected correctly:
        | ESP32-CAM | USB to UART module |
        | --------- | ------------------ |
        | U0T | Rx |
        | U0R | Tx |
        | GND | GND |
        | 5V | 5V |
        
      Check [tutorial](https://randomnerdtutorials.com/program-upload-code-esp32-cam/) by randomnerdtutorials.com
        
      
- **Only for "UPLOADING" process: On ESP32-CAM, the (GP)IO 0 has to be connected to GND!!**
- ESP32-CAM pinout reference by randomnerdtutorials.com <br />
  
    ![](https://i0.wp.com/randomnerdtutorials.com/wp-content/uploads/2020/03/ESP32-CAM-pinout-new.png?quality=100&strip=all&ssl=1)

### Software

* Install ESP32 boards for [Arduino IDE](https://www.arduino.cc/en/software) : [randomnerdtutorials.com](https://randomnerdtutorials.com/installing-the-esp32-board-in-arduino-ide-windows-instructions/)
* Requirement for code: 
    * X-API-Token: can be generated on Profile page of Data Foundry
    * ID of an ACTIVE Media dataset

### Data Foundry setting

* Requirement: 
    - A project with an **ACTIVE Media dataset**

<br>

## Execute

1. Serial monitor of Arduino IDE: input "photo" with **New Line** character on **115200** baud rate <br />

    ![](images/ESP32-Cam_POST_to_DF.png)
2. As serial monitor shows the following message, check the Media dataset on Data Foundry.
    ```
    {"result":"Uploading finished."}
    ```

<br>

## FAQ

* Q. What is the whole process to upload with USB-to-UART module? \
    A. The process is : \
        -> On ESP32-Cam, connect IO0 to GND \
        -> Press RESET button of ESP32-Cam \
        -> Press Upload button on Arduino IDE \
        -> The uploading might take some time, which depends on the Wi-Fi signal and the loading of Data Foundry at the moment, but usually it should be finished in seconds \
        -> As uploading is finished, disconnect IO0 and GND on ESP32-Cam \
        -> Press RESET button of ESP32-Cam \
        -> Done! Check serial monitor if you expect something to show up

* Q. Why does my photos look like to be taken with green filter or something else? \
    A. The camera will take some time to warm up, you can check after 5 to 10 minutes (the time is various), I think the filter will be gone.

## Source

All screenshot(s) are sourced from [Data Foundry](https://data.id.tue.nl/)

[Data Foundry API V2](https://data.id.tue.nl/api/v2/docs/datafoundry.html)