// Definir el número de pin que se utilizará para el LED de prueba (por ejemplo, 13)
const int ledPin = 13;

// Configurar la velocidad de la comunicación UART (9600 baudios)
const long baudRate = 9600;

unsigned long previousTime5s = 0;
unsigned long previousTime7s = 0;
unsigned long interval5s = 5000; // 5 segundos en milisegundos
unsigned long interval7s = 7000; // 7 segundos en milisegundos

void setup() {
  // Inicializar el pin del LED como una salida
  pinMode(ledPin, OUTPUT);
  
  // Inicializar la comunicación serial a 9600 baudios
  Serial.begin(baudRate);
}

void loop() {
  // Hacer oscilar el LED de prueba a 1 Hz (0.5 segundos encendido, 0.5 segundos apagado)
  digitalWrite(ledPin, HIGH);
  delay(500);
  digitalWrite(ledPin, LOW);
  delay(500);

  // Verificar si ha pasado el tiempo para enviar el mensaje "paso cada 5 segundos"
  unsigned long currentTime = millis();
  if (currentTime - previousTime5s >= interval5s) {
    // Enviar el mensaje a través de la comunicación UART
    Serial.println("paso cada 5 segundos");
    previousTime5s = currentTime;
  }

  // Verificar si ha pasado el tiempo para enviar el mensaje "paso cada 7 segundos"
  if (currentTime - previousTime7s >= interval7s) {
    // Enviar el mensaje a través de la comunicación UART
    Serial.println("paso cada 7 segundos");
    previousTime7s = currentTime;
  }
}
