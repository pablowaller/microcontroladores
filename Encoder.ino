#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 20, 4);

#define ENCODER_CLK 2
#define ENCODER_DT  3
#define ENCODER_SW  4

int counter = 0;

void setup() {
  // Initialize LCD
  lcd.init();
  lcd.backlight();

  // Initialize encoder pins
  pinMode(ENCODER_CLK, INPUT);
  pinMode(ENCODER_DT, INPUT);
  pinMode(ENCODER_SW, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(ENCODER_CLK), readEncoder, FALLING);
}

void readEncoder() {
  int dtValue = digitalRead(ENCODER_DT);
  if (dtValue == HIGH) {
    counter++; // Clockwise
  }
  if (dtValue == LOW) {
    counter--; // Counterclockwise
  }
}

// Get the counter value, disabling interrupts.
// This make sure readEncoder() doesn't change the value
// while we're reading it.
int getCounter() {
  int result;
  noInterrupts();
  result = counter;
  interrupts();
  return result;
}

void resetCounter() {
  noInterrupts();
  counter = 0;
  interrupts();
}

void loop() {
  lcd.setCursor(3, 0);
  lcd.print("Counter:");
  lcd.setCursor(7, 1);
  lcd.print(getCounter());
  lcd.print("        ");

  if (digitalRead(ENCODER_SW) == LOW) {
    resetCounter();
  }
}


#define ENCODER_CLK 4
#define ENCODER_DT 5
int derecha = 0;
int izquierda = 0;

void setup() {
  pinMode(ENCODER_CLK, INPUT);
  pinMode(ENCODER_DT, INPUT);
  attachInterrupt(digitalPinToInterrupt(ENCODER_CLK), readEncoder, FALLING);
  Serial.begin(9600);
}

void Encoder() {
  int dato_dig = digitalRead(ENCODER_DT);
  if (dato_dig == HIGH) {
    derecha++;
  }
  if (dato_dig == LOW) {
    izquierda++;
  }
}

void loop() {
  // Realiza acciones en función de la dirección del giro
  if (derecha > 0) {
    Serial.print("Girando a la derecha: ");
    Serial.println(derecha);
    derecha = 0;  // Reinicia la variable
  }
  if (izquierda > 0) {
    Serial.print("Girando a la izquierda: ");
    Serial.println(izquierda);
    izquierda = 0;  // Reinicia la variable
  }
}
