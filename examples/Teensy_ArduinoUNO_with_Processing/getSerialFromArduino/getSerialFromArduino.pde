/**************************************************************************************************
* Author:       I-Tang(Eden) Chiang <i.chiang@tue.nl>
* Date:         Mar. 18, 2021
* Description:  Sample code for sending data, which is fetched via the serial port and sent by 
*               Arduino devices, to the Data Foundry
**************************************************************************************************/
import processing.serial.*;

// Create object from Serial class
Serial myPort;

//  Data received from the serial port
String val;

void setup()
{
  // this is the list of ports, not the exact port number, so try to change the index 0 to 1 or 2 etc. 
  // to match the port of the machine if it replies the error message for missing port.
  String portName = Serial.list()[0];
  // print(portName);
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  // If data is available, read it and store it in val
  if ( myPort.available() > 0) {  
    val = myPort.readStringUntil('\n');
  }

  println(val); //print it out in the console
}
