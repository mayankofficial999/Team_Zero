#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <Servo.h>
int readVal=5;//d1
float count =1;
int servoPin = 4;//d2
int servoInitialPos = 0;
int servoFinalPos = 180;
int laser = 16;//do
int ldr = A0; 
int buzz1 = 2; //d4 
Servo myServo;
// Set these to run example.
#define FIREBASE_HOST "grocery-shop-system-data-default-rtdb.asia-southeast1.firebasedatabase.app" //firebase host
#define FIREBASE_AUTH "WzpuEXNjHxCqAaFUUGEpWli1Vg1LpfrgRld6BcYW"//Authentication
#define WIFI_SSID "BsrQ-UmVkbWk1QQ"
#define WIFI_PASSWORD "Himanshu"

void setup() {
  pinMode(readVal,INPUT);
  pinMode(servoPin,OUTPUT);
  pinMode(laser,OUTPUT);
  pinMode(ldr,INPUT);
  pinMode(buzz1,OUTPUT);
  Serial.begin(115200);
  
  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  myServo.attach(servoPin);
  myServo.write(servoInitialPos);
  Firebase.setString("Shop ID", "412409.124");
}

int n = 0;

void loop() {
  if(digitalRead(readVal)==0){
  Serial.print("Count is:");
  Serial.println(count);
  count = count +1;
  delay(500);
  if(count==5.00){
myServo.write(servoFinalPos);
}
}
  digitalWrite(laser,HIGH);
  if (analogRead(ldr)>50){
    digitalWrite(buzz1,HIGH);
    delay(100);
    digitalWrite(buzz1,LOW);
    delay(100);
  }
  else{
    //Customer is standing at proper position
    digitalWrite(buzz1,LOW);
  }
  
  // set value
  
  Firebase.setFloat("Customers", count);
  // handle error
  if (Firebase.failed()) {
      Serial.print("setting /number failed:");
      Serial.println(Firebase.error());  
      return;
  }
  delay(1000);
  
  
}
