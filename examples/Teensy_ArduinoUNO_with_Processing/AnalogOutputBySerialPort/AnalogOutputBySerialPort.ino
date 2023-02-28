/**************************************************************************************************
  Author:         I-Tang (Eden) Chiang <i.chiang@tue.nl>
  Date:           Mar. 18, 2021
  Description:    In this code, data will be send out through serial port, and can be checked 
                  by the Serial monitor of the Arduino IDE
  Platform:       Teensy 3.2 / Arduino Uno
  Module(s):      Light sensor * 1, 10K resistor * 1
  Code reference: http://www.pjrc.com/teensy/tutorial4.html
 **************************************************************************************************/

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(A0);
  Serial.print(val);
  Serial.print(":");
  val = (val / 4) - 50;
  Serial.println(val);
  delay(1000);
}
