/*
Authors:        I-Tang (Eden) Chiang
Date:           Feb. 22, 2021
Description:    Implementation for the usecase of the DataFoundry --- SMART THINGS
                In addition, observing the data sent by itself
References:     https://data.id.tue.nl/documentation/usecase-smart-things
Platform:       ESP32 DevKit V1
Language:       Arduino
Module:         light sensor, 1 * 10K resistor
*/

#include <OOCSI.h>
#include <ArduinoJson.h>

// SSID of your Wifi network, the library currently does not support WPA2 Enterprise networks
const char* ssid = "WIFI_SSID";
// Password of your Wifi network.
const char* password = "WIFI_PASSWORD";

// name for connecting with OOCSI (unique handle)
const char* OOCSIName = "UNIQUE_HANDLER_NAME";
// put the adress of your OOCSI server here, can be URL or IP address string
// host for the Data Foundry: oocsi.id.tue.nl
const char* hostserver = "URL_or_IP_Address_string";
// channel for IoT dataset of the Data Foundry for downloading data
const char* subscribeChannel = "CHANNEL_NAME_for_downloading";
// channel for IoT dataset of the Data Foundry for uploading data
const char* uploadChannel = "CHANNEL_NAME_for_uploading";

// pin number for input data
const int INPUT_PIN = 34;
// led pin response for sending operation
const int LED_PIN = 2;
// analog input by light sensor with a 10K pulldown resistor
int inputValue;

// OOCSI reference for the entire sketch
// To connect to an OOCSI network, that is, a running OOCSI server, you first need to create an OOCSI reference:
OOCSI oocsi = OOCSI();

 
void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(115200);

  // initialize the digital pin as an output.
  pinMode(LED_PIN, OUTPUT);
  
  // connect to OOCSI server
  oocsi.connect(OOCSIName, hostserver, ssid, password, processOOCSI);
  // observe response from downloading channel
  oocsi.subscribe(subscribeChannel);
}
 
void loop(void) {
  // read data
  inputValue = analogRead(INPUT_PIN);
  LEDReadInput();
  
  Serial.print("Analog reading = ");
  Serial.println(inputValue);

  sendMessage2OOCSI();

 delay(1000);
}

void sendMessage2OOCSI() {
  Serial.print("input value = ");
  Serial.println(inputValue);
 // make OOCSI message ready. Insert DF channel here
  oocsi.newMessage(uploadChannel);

  // replace DEVICE_RefId with the RefId of your device
  oocsi.addString("device_id", "DEVICE_RefId");
  
  // optional activity marker
  oocsi.addString("activity", "environment light record");

  // add data (primitive data types int, float, long, string)
  // the labels such as "count" or "timestamp" are completely free to choose
  oocsi.addInt("light", inputValue);
  oocsi.addLong("time", (long) millis());

  // this command will send the message; don't forget to call this after creating a message
  oocsi.sendMessage();
  
  // prints out the raw message (how it is sent to the OOCSI server)
  // oocsi.printSendMessage();
  // needs to be checked in order for OOCSI to process incoming data.
  oocsi.check();
}

void LEDReadInput() {
  digitalWrite(LED_PIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(200);               // wait for a second
  digitalWrite(LED_PIN, LOW);    // turn the LED off by making the voltage LOW
}

void processOOCSI() {
  // if message comes from specific channel, do something
  if (oocsi.getRecipient() == subscribeChannel) {
    if (oocsi.has("data")) {
      
      // handle json document
      char echo[255];
      oocsi.getString("data", "no data").toCharArray(echo, 255);
      DynamicJsonDocument echoJson(1024);
      // Deserialize the JSON document
      DeserializationError error = deserializeJson(echoJson, echo);

      // if fail to deserialize the JSON document, then quit
      if (error) {
        Serial.print(F("deserializeJson() failed: "));
        Serial.println(error.f_str());
        return;
      }

      // if the JSON object has the node "light", print it out
      if (echoJson["light"]) {
        Serial.print("light = ");
        int light = echoJson["light"];
        Serial.println(light);
      }
    }
    
    Serial.println("====================");
  }

  // use this to print out the raw message that was received
  //  oocsi.printMessage();
}