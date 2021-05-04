/**************************************************************************************************
  Author:           I-Tang (Eden) Chiang <i.chiang@tue.nl>
  Date:             Feb. 16, 2021
  Platform:         Arduino Nano 33 IoT
  Description:      Example of the Arduino Nano 33 IoT connecting to WiFi and sending data to an IoT 
                    dataset on the Data Foundry with the DFDatset library. This works only with an 
                    existing account, project and dataset on the Data Foundry (https://data.id.tue.nl)
  Code References:  
  https://github.com/iddi/oocsi-esp/blob/master/dist/oocsi/examples/DataFoundry/IoT_dataset/IoT_dataset.ino
 **************************************************************************************************/

#include "DFDataset.h"

#define LED_BUILTIN = 13;
// SSID of your Wifi network, the library currently does not support WPA2 Enterprise networks
const char* ssid = "SSID";
// Password of your Wifi network.
const char* password = "12345678";

// put the address of Data Foundry here
const char* datafoundry = "data.id.tue.nl";
// put the id and the API-tokens of the dataset
long dsId = 929;
char* tokens = "HR+JUpq+VXjBSQzy3nZsErIz2fySD/MaAKdQPm48S13NBxViNAzViQ3cEOn1LkKx";

// create connection to dataset with server address, dataset id, and the access token
DFDataset iot = DFDataset(datafoundry, dsId, tokens);


// put your setup code here, to run once:
void setup() {
  Serial.begin(115200);

  // establish Wifi connection
  WiFi.begin(ssid, password);
  Serial.println("Connecting to WiFi..");
  while (WiFi.status() != WL_CONNECTED) {
    delay(3000);
    Serial.print('.');
  }

  Serial.println("Connected to the WiFi network");

  // you can also already set the device and activity here,
  // if they don't change throughout the program execution
  //  iot.device("mydevice");
  //  iot.activity("idle");
  // specify device, can be empty
//  iot.device("refId_of_device");
}

void loop() {
Serial.println("numericalTimingData");
Serial.println(millis());
  
  // specify activity, can be empty
  iot.activity("idle");

  // fill in some data for the item (very similar to OOCSI)
  iot.addInt("numericalTimingData", millis());
  iot.addBool("yesno", true);
  iot.addString("stringData", "a long, long, long, long, long string - not really, but you get the point.");

  // log the item data to the dataset
  iot.logItem();

  delay(2000);
}
