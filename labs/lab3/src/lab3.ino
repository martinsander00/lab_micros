#define T_OP A0
#define HUMEDAD A2
#define Ki 5               // Reduccion del error serial
#define ROOM_T 298.15      // Temp en Kelvin
#define BETA 3455          // Parametro "BETA" de termómetro
#define Kd 1               // Mas tiempo de respuesta
#include <PID_v1.h>        // PID
#define RESIST_SERIE 10000
#define TERMO A1
#define R_ROOM 9980.47      // Termómetro en 25° C
#define Kp 2               // gGanancia 

#include <math.h>

// Liberías para controlar PCD8544
#include <Adafruit_GFX.h>
#include <Adafruit_PCD8544.h>
#include <SPI.h>


// Poner los pines de PCD a arduino en: SCLK = 7, DIN = 6, D/C = 5, CS = 4, RST = 3
Adafruit_PCD8544 display = Adafruit_PCD8544(7, 6, 5, 4, 3);

float vr;
float r_termo;
int t_op;


// PID
double setPoint, temp, salida;  // Lazo realimentado del PID -> variables
PID incubadora(&temp, &salida, &setPoint, Kp, Ki, Kd, DIRECT);  


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(8, OUTPUT);
  // INICIALIZAR VARIABLES DE PID
  int t_op = analogRead(T_OP);
  setPoint = map(t_op, 0, 1023, 0, 80);  // Mapeo de temperatura de operacion desde senal del potenciometro
 
  // Temperatura termistor
  vr = analogRead(TERMO)*5.0/1023.0;
  r_termo = vr*RESIST_SERIE/(5-vr);
  float temp_trans = 1.0/ROOM_T + (1.0/BETA)*log(r_termo/R_ROOM);
  temp_trans = 1/temp_trans;
  temp = temp_trans - 273.15;

  // PID ON
  incubadora.SetMode(AUTOMATIC);

  // Display ON
  display.begin();

 
}


// Funcion que loopea por los datos y controla el funcionamiento de alertas,
// resistencias, sensores e imprime resultados.
void loop() {

  Serial.println("loop");  // Orden de datos Python
  
  t_op = analogRead(T_OP); // Temperatura de operación
  setPoint = map(t_op, 0, 1023, 0, 80);
  Serial.println(setPoint);
  delay(500);

  int humid = analogRead(HUMEDAD);   // Sensor humedad
  humid = map(humid, 0, 1023, 0, 100);
  Serial.println(humid);
  delay(500);

  vr = analogRead(TERMO)*5.0/1023.0; // Resistencia termistor
  r_termo = vr*RESIST_SERIE/(5-vr);
  delay(500);
 
  // Ec. Steinhard
  float temp = 1.0/ROOM_T + (1.0/BETA)*log(r_termo/R_ROOM);
  temp = 1/temp;
  temperatura = temp - 273.15;
  Serial.println(temperatura);
  delay(500);

  // PID
  incubadora.Compute();
  Serial.println(salida);
  delay(300);

  // Imprimir en el LCD
  display.clearDisplay(); // Resetea la pantalla
  display.setCursor(0,0);
  display.print("T op.: ");
  display.println(setPoint);
  display.print("Control: ");
  display.println(salida);
  display.print("T sensed: ");
  display.println(temperatura);
  display.print("Humedad: ");
  display.println(humid);
  display.display();

  // LEDs
  if (temperatura <= 30){
    digitalWrite(2, HIGH);
  } else {digitalWrite(2, LOW);}
  if (temperatura >= 42){
    digitalWrite(8, HIGH);
  } else {digitalWrite(8, LOW);}

  // OFF/ON communicación serial
  if (digitalRead(A4) == HIGH){
    Serial.end();
  }
}