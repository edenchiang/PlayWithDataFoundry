/****************************************************************************
   Example of the OOCSI-ESP library connecting to WiFi and receiving messages
   over OOCSI. Designed to work with the Processing OOCSI sender example
   that is provided in the same directory
 ****************************************************************************/

#include "OOCSI.h"

// use this if you want the OOCSI-ESP library to manage the connection to the Wifi
// SSID of your Wifi network, the library currently does not support WPA2 Enterprise networks
const char* ssid = "SSID";
// Password of your Wifi network.
const char* password = "PASSWORD_FOR_SSID";

// name for connecting with OOCSI (unique handle)
const char* OOCSIName = "ESP_OOCSI_CLIENT_RECEIVER_####";
// put the adress of your OOCSI server here, can be URL or IP address string
const char* hostserver = "SERVER_IP_OR_DOMAIN_NAME";

// OOCSI reference for the entire sketch
OOCSI oocsi = OOCSI();

// put your setup code here, to run once:
void setup() {
  Serial.begin(115200);

  // output OOCSI activity on the built-in LED
  pinMode(LED_BUILTIN, OUTPUT);
  oocsi.setActivityLEDPin(LED_BUILTIN);

  // use this to switch off logging to Serial
  // oocsi.setLogging(false);

  // setting up OOCSI. processOOCSI is the name of the fucntion to call when receiving messages, can be a random function name
  // connect wifi and OOCSI to the server
  oocsi.connect(OOCSIName, hostserver, ssid, password, processOOCSI);

  // subscribe to a channel
  Serial.println("subscribing to CHANNEL-TO-SUBSCRIBE");
  oocsi.subscribe("CHANNEL-TO-SUBSCRIBE");
}

void loop() {
  // put your main code here, to run repeatedly:
  // ...

  // let OOCSI check for incoming data
  // use keepAlive() if you do NOT need to receive data
  oocsi.check();
  delay(500);
}

// function which OOCSI calls when an OOCSI message is received
void processOOCSI() {

  // printing the output of different variables of the message; standard call is get<data type>(key, standard value)
  // the standard value -200 will be returned when the key is not included in the OOCSI message
  Serial.print("activity: ");
  Serial.println(oocsi.getString("activity", "??"));
  Serial.print("text_input: ");
  Serial.println(oocsi.getJsonObject("data")["text_input"].as<String>());

  // use this to print out the raw message that was received
  // oocsi.printMessage();
}
