#include <Adafruit_NeoPixel.h>
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(1, 2, NEO_RGB + NEO_KHZ800);
#include <Wire.h>
#include <ADXL345.h>
ADXL345 adxl;
int x, y, z;
int t;
void setup() {
  t = 0;
  pixels.begin();
  Serial.begin(9600);//シリアル通信
  //  pinMode(2, OUTPUT);//スイッチ
  //  pinMode(3, INPUT_PULLUP);
  adxl.powerOn();
}
void loop() {
  adxl.readXYZ(&x, &y, &z);
  t = t + 1;
  if (t >= 100 ) {
    Serial.print(x);
    Serial.print(" ");
    Serial.print(y);
    Serial.print(" ");
    Serial.println(z);
    if (z > -20 || z < -70) { 
      Serial.println("c");//changecolorボールがバーにあたった時のように色変更
    }
    if (y > -35 || y < -50) { 
      Serial.println("c");//changecolorボールがバーにあたった時のように色変更
    }

    t = 0;
  }




  //  Serial.print(x);
  //  Serial.print(" ");
  //  Serial.print(y);
  //  Serial.print(" ");
  //  Serial.println(z);
  //  delay(10);
  //
  //
  //  //Arduino→Processing
  //  if (z > -20 || z < -70) { //←ここどうしよう
  //    Serial.println("c");//changecolorボールがバーにあたった時のように色変更
  //    delay(10);
  //  }


  //Processing→Arduino

  char a = Serial.read();
  if ( a == 'y' ) {//y(yellow)を受け取ったら
    pixels.setPixelColor(0, pixels.Color(255, 255, 0));//黄
    //pixels.setPixelColor(1, pixels.Color(255, 0, 0));//赤
    pixels.show();
    delay(10);
  } else if (a == 'r') { //r(red)を受け取ったら
    pixels.setPixelColor(0, pixels.Color(255, 0, 0));//赤
    //pixels.setPixelColor(1, pixels.Color(0, 255, 0));//緑
    pixels.show();
    delay(10);
  } else if (a == 'g') { //g(green)を受け取ったら
    pixels.setPixelColor(0, pixels.Color(0, 255, 0));//緑
    //pixels.setPixelColor(1, pixels.Color(0, 0, 255));//青
    pixels.show();
    delay(10);
  } else if (a == 'b') { //b(blue)を受け取ったら
    pixels.setPixelColor(0, pixels.Color(0, 0, 255));//青
    //pixels.setPixelColor(1, pixels.Color(255, 255, 0));//黄
    pixels.show();
    delay(10);
  }

  //pixels.show();
  delay(10);
}

//  if ( digitalRead(3) == LOW ) {
//    digitalWrite(2, HIGH);
//    pixels.setPixelColor(0, pixels.Color(0, 0, 255));//青
//    pixels.setPixelColor(1, pixels.Color(255, 0, 0));//赤
//    Serial.print('c');
//  } else {
//    digitalWrite(2, LOW);
//    pixels.setPixelColor(0, pixels.Color(255, 255, 0));//黄
//    pixels.setPixelColor(1, pixels.Color(255, 0, 0));//赤
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(0, pixels.Color(255, 0, 0));//赤
//    pixels.setPixelColor(1, pixels.Color(0, 255, 0));//緑
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(0, pixels.Color(0, 255, 0));//緑
//    pixels.setPixelColor(1, pixels.Color(0, 0, 255));//青
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(0, pixels.Color(0, 0, 255));//青
//    pixels.setPixelColor(1, pixels.Color(255, 255, 0));//黄


//    pixels.setPixelColor(1, pixels.Color(255, 0, 0));//赤
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(1, pixels.Color(0, 255, 0));//緑
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(1, pixels.Color(0, 0, 255));//青
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(1, pixels.Color(255, 255, 0));//黄色
//    delay(1000);
//    pixels.show();
//    pixels.setPixelColor(1, pixels.Color(255, 255, 255));//白
//    pixels.show();








//#include <Adafruit_NeoPixel.h>
//Adafruit_NeoPixel pixels = Adafruit_NeoPixel(2, 2, NEO_RGB + NEO_KHZ800);
//void setup() {
//  pixels.begin();
//  pinMode(2, OUTPUT);
//  pinMode(3, INPUT_PULLUP);
//}
//void loop() {
//
//  if ( digitalRead(3) == LOW ) {
//    digitalWrite(2, HIGH);
//    pixels.setPixelColor(0, pixels.Color(0, 0, 255));
//  } else {
//    digitalWrite(2, LOW);
//    pixels.setPixelColor(1, pixels.Color(255, 0, 0));
//  }
////  pixels.setPixelColor(0, pixels.Color(0, 0, 255));
////  pixels.setPixelColor(1, pixels.Color(255, 0, 0));
//
//  pixels.show();
//  delay(100);
//}

//
//void setup() {
//  // put your setup code here, to run once:
//  pinMode(2, OUTPUT);
//  pinMode(3, INPUT_PULLUP);
//}
//
//void loop() {
//  // put your main code here, to run repeatedly:
//  //  digitalWrite(2,HIGH);
//  //  delay(1000);
//  //  digitalWrite(2,LOW);
//  //  delay(1000);
//  if ( digitalRead(3) == LOW ) {
//    digitalWrite(2, HIGH);
//  } else {
//    digitalWrite(2, LOW);
//  } delay(1000);
//}


//void setup() {
//  Serial.begin(9600);
//} void loop() {
//  Serial.println("hello world");
//  delay(1000);
//}


//void setup() {
//  Serial.begin(9600);
//  pinMode(3, INPUT_PULLUP);
//} void loop() {
//  if (digitalRead(3) == false) {
//    Serial.print('b'); // Serial.write("b");でもOK
//  } delay(10);
//}



//void setup() {
//  Serial.begin(9600);
//  pinMode(2,  OUTPUT);
//} void loop() {
//  digitalWrite(2,  LOW);
//  while (Serial.available() > 0) {
//    if ( Serial.read() == 'd' ) {
//      digitalWrite(2,  HIGH);
//    }
//  } delay(10);
//}


//#include <Adafruit_NeoPixel.h>
//Adafruit_NeoPixel pixels = Adafruit_NeoPixel(1, 2, NEO_RGB + NEO_KHZ800);
//void setup() {
//  pixels.begin();
//} void loop() {
//  pixels.setPixelColor(0, pixels.Color(0, 0, 255));
//  pixels.show();
//  delay(100);
//}
