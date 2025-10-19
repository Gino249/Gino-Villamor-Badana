‎#include <WiFi.h>
‎#include <HTTPClient.h>
‎
//Developer: GINO, eme vibe coding la
‎const char* ssid = "Wokwi-GUEST";
‎const char* password = "";
‎const char* blynkToken = "KKgmfyR-Q4A6XbSqh0-PPBg2kC1b5yN2";
‎const char* blynkServer = "sgp1.blynk.cloud";
‎
‎const int ledPin = 2; // Onboard LED
‎int consecutiveHighStress = 0; // counter for 3 consecutive high stress readings
‎
‎void setup() {
‎  Serial.begin(115200);
‎  pinMode(ledPin, OUTPUT);
‎
‎  WiFi.begin(ssid, password);
‎  Serial.print("Connecting");
‎  while (WiFi.status() != WL_CONNECTED) {
‎    delay(500);
‎    Serial.print(".");
‎  }
‎  Serial.println("\n✅ WiFi Connected!");
‎}
‎
‎void loop() {
‎  if (WiFi.status() == WL_CONNECTED) {
‎    HTTPClient http;
‎
‎    //Simulate sensor reading with higher chance of stress
   // 60% chance for 75–100 range, 40% chance for 0–74
‎    int sensorValue;
‎    if (random(0, 100) < 60) { 
‎      sensorValue = random(75, 101); // more likely high stress
‎    } else {
‎      sensorValue = random(0, 75);   // normal/mild
‎    }
‎
‎    float data = sensorValue / 100.0; // 0-1 Value
‎
‎    //Send V1 (raw sensor value)
‎    String urlV1 = String("http://") + blynkServer +
‎                   "/external/api/update?token=" + blynkToken +
‎                   "&V1=" + String(sensorValue);
‎    http.begin(urlV1);
‎    int code1 = http.GET();
‎    Serial.printf("📤 Sent V1=%d | Response: %d\n", sensorValue, code1);
‎    http.end();
‎
‎    //Condition for Stress
‎    String stressText;
‎
‎    if (data < 0.5) {
‎      stressText = "NORMAL";
‎      consecutiveHighStress = 0;
‎    } 
‎    else if (data >= 0.5 && data <= 0.75) {
‎      stressText = "MILD TENSION";
‎      consecutiveHighStress = 0;
‎    } 
‎    else {
‎      stressText = "HIGH STRESS DETECTED";
‎      consecutiveHighStress++;
‎    }
‎
‎    //LED control (3 consecutive ≥ 0.75)
‎    bool ledOn = (consecutiveHighStress >= 3);
‎    digitalWrite(ledPin, ledOn ? HIGH : LOW);
‎
‎    //Send LED state to Blynk (V0)
‎    String urlV0 = String("http://") + blynkServer +
‎                   "/external/api/update?token=" + blynkToken +
‎                   "&V0=" + (ledOn ? "1" : "0");
‎    http.begin(urlV0);
‎    int code2 = http.GET();
‎    Serial.printf("💡 LED (V0) = %s | Response: %d | Consecutive High = %d\n", 
‎                  ledOn ? "ON" : "OFF", code2, consecutiveHighStress);
‎    http.end();
‎
‎    //Update Text Display (V2)
‎    stressText.replace(" ", "%20"); // URL-safe
‎    String urlV2 = String("http://") + blynkServer +
‎                   "/external/api/update?token=" + blynkToken +
‎                   "&V2=" + stressText;
‎    http.begin(urlV2);
‎    int code3 = http.GET();
‎    Serial.printf("📝 Display (V2) = %s | Response: %d\n", stressText.c_str(), code3);
‎    http.end();
‎
‎    //Show normalized value (V3 = 0 to 1)
‎    String urlV3 = String("http://") + blynkServer +
‎                   "/external/api/update?token=" + blynkToken +
‎                   "&V3=" + String(data, 2);
‎    http.begin(urlV3);
‎    int code4 = http.GET();
‎    Serial.printf("📊 Value Display (V3) = %.2f | Response: %d\n", data, code4);
‎    http.end();
‎
‎  } else {
‎    Serial.println("⚠️ Reconnecting WiFi...");
‎    WiFi.begin(ssid, password);
‎  }
‎
‎  delay(5000);
‎}