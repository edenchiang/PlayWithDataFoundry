/***************************************************************************
  Authors:        I-Tang (Eden) Chiang
  Date:           Mar. 18, 2021
  Description:    In this code, the data will be send out with the serial 
                  port, and can be checked by the Serial monitor of the 
                  Aarduino IDE
  Platform:       Arduino Uno / Teensy 3.2
  Language:       Arduino
  Module:         light sensor, 1 * 10K resistor
  Code reference: http://www.pjrc.com/teensy/tutorial4.html
 ***************************************************************************/

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(0);
  Serial.println(val);
  delay(200);
}
