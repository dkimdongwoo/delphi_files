#include <BluetoothSerial.h>
#include <Wire.h>
#include "DHTesp.h"
#define DHTpin 15

const int ledPin = 2;
BluetoothSerial SerialBT;
DHTesp dht;

void setup() {  
  SerialBT.begin("ESP32_curso");
  pinMode (ledPin, OUTPUT);  
  dht.setup(DHTpin, DHTesp::DHT11); 
}

void loop() {  
  byte dado;  
  while (SerialBT.available() > 0){
    dado = SerialBT.read();    
    if (dado == 1) {
      digitalWrite (ledPin, HIGH);
      int humidity = dht.getHumidity();   
      SerialBT.print(String(humidity));
    }else if (dado == 0) {
      digitalWrite (ledPin, LOW);
      SerialBT.print(String("curso"));
    }    
  }
}
