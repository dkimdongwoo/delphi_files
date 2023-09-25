#include <BluetoothSerial.h>
#include <Wire.h>

const int ledPin = 2;
BluetoothSerial SerialBT;

void setup() {  
  SerialBT.begin("ESP32_curso");
  pinMode (ledPin, OUTPUT);
}

void loop() {  
  byte dado;
  int dado2;
  while (SerialBT.available() > 0){
    dado = SerialBT.read();
    dado2 = dado;
    if ((dado == 1) or (dado == '1') or (dado2 == 49)) {
      digitalWrite (ledPin, HIGH);  
      SerialBT.print(String("28"));
    }else if ((dado == 0) or (dado == '0')) {
      digitalWrite (ledPin, LOW);
      SerialBT.print(String("curso"));
    }
  }
}
