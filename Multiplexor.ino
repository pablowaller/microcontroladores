int s0 = 2;
int s1 = 3;
int s2 = 4;

int f = 6;

void setup() {
  pinMode(s0, INPUT);
  pinMode(s1, INPUT);
  pinMode(s2, INPUT);
  pinMode(f, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  int seleccion = digitalRead(s0) + digitalRead(s1) * 2 + digitalRead(s2) * 4;

  Serial.print("El Valor de la llave s0 es: ");
  Serial.println(digitalRead(s0));

  Serial.print("El Valor de la llave s1 es: ");
  Serial.println(digitalRead(s1));

  Serial.print("El Valor de la llave s2 es: ");
  Serial.println(digitalRead(s2));

  switch (seleccion) {
    case 0:
      digitalWrite(f, HIGH);
      break;
    case 1:
      digitalWrite(f, LOW);
      break;
    case 2:
      digitalWrite(f, HIGH);
      break;
    case 3:
      digitalWrite(f, LOW);
      break;
    case 4:
      digitalWrite(f, HIGH);
      break;
    case 5:
      digitalWrite(f, LOW);
      break;
    case 6:
      digitalWrite(f, HIGH);
      break;
    case 7:
      digitalWrite(f, LOW);
      break;
  }
}
