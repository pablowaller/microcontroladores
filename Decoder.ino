// Definir pines para los canales A y B del encoder
const int pinA = 2;
const int pinB = 3;

// Variables para contar pulsos en sentido horario y antihorario
int pulsosHorario = 0;
int pulsosAntihorario = 0;

// Variables para almacenar el estado anterior de los canales A y B
int estadoA;
int estadoB;

void setup() {
  // Inicializar pines como entradas
  pinMode(pinA, INPUT);
  pinMode(pinB, INPUT);

  // Inicializar estados iniciales
  estadoA = digitalRead(pinA);
  estadoB = digitalRead(pinB);

  // Attach interrupts para detectar cambios en los pines A y B
  attachInterrupt(digitalPinToInterrupt(pinA), actualizarEncoder, CHANGE);
  attachInterrupt(digitalPinToInterrupt(pinB), actualizarEncoder, CHANGE);
}

void loop() {
  // Tu código principal va aquí
}

void actualizarEncoder() {
  int nuevoEstadoA = digitalRead(pinA);
  int nuevoEstadoB = digitalRead(pinB);

  // Verificar la secuencia para determinar la dirección del giro
  if (estadoA == LOW && estadoB == LOW && nuevoEstadoA == HIGH && nuevoEstadoB == LOW) {
    pulsosHorario++;
  } else if (estadoA == HIGH && estadoB == LOW && nuevoEstadoA == HIGH && nuevoEstadoB == HIGH) {
    pulsosHorario++;
  } else if (estadoA == HIGH && estadoB == HIGH && nuevoEstadoA == LOW && nuevoEstadoB == HIGH) {
    pulsosHorario++;
  } else if (estadoA == LOW && estadoB == HIGH && nuevoEstadoA == LOW && nuevoEstadoB == LOW) {
    pulsosHorario++;
  } else if (estadoA == LOW && estadoB == HIGH && nuevoEstadoA == HIGH && nuevoEstadoB == HIGH) {
    pulsosAntihorario++;
  } else if (estadoA == HIGH && estadoB == HIGH && nuevoEstadoA == HIGH && nuevoEstadoB == LOW) {
    pulsosAntihorario++;
  } else if (estadoA == HIGH && estadoB == LOW && nuevoEstadoA == LOW && nuevoEstadoB == LOW) {
    pulsosAntihorario++;
  } else if (estadoA == LOW && estadoB == LOW && nuevoEstadoA == LOW && nuevoEstadoB == HIGH) {
    pulsosAntihorario++;

  // Actualizar estados para la próxima iteración
  estadoA = nuevoEstadoA;
  estadoB = nuevoEstadoB;
}
