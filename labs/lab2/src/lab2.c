// Martin Sander
// Jimmy Manely

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

// Estados de la maquina
#define LDPV 0
#define PV_blink 1
#define LDVD 2
#define LDPP 3
#define PP_blink 4
#define LDPD 5

int nxt_state;
int state;
int button;
int valid;
int delay = 60;  // 1 segundos
int count = 0; // contador
int blink;

void fsm();

int main(void)
{
  // CONFIGURACIÓN
  DDRB = 0xFB; // Puertos como salidas excepto PB2

  sei(); // para interrupcion global
  TCNT0 = 0;  // counter0 en 0
  TIMSK |= (1 << TOIE0); // timer0 overflow interrupt en ON

  // Interrupciones en delay configuracion
  TCCR0A = 0x00; // Registro de control para el contador/temporizador A
  TCCR0B = 0x00; // Registro de control para el contador/temporizador B
  TCCR0B |= (1 << CS02); // prescaler f/1024
  TCCR0B |= (1 << CS00);

  // Interrupciones en el flanco creciente
  //MCUCR |= (1 << ISC11)|(1 << ISC01)|(1 << ISC00); 
  GIMSK |= (1<<INT0)|(1<<INT1);  // interrupt INT0 e INT1
  // INT0 habilitado con flanco pos. y INT1 con flanco neg.
  MCUCR |= (1<<ISC01)|(1<<ISC10)|(1<<ISC11); 

  // START
  PORTB = 0x00;
  valid = 0;
  nxt_state = LDPV;
  button = 0;
  blink = 0;
  state = LDPV;  // INICIO PARA PASO DE VEHICULOS
  delay = 210;

  while(1){
      state = nxt_state;
      fsm();
    
  }
}



