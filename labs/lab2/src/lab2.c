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

void fsm(){
    switch (state)
    {
    case PV_blink:
        delay = 30;  // Parpadeo intermitente
        button = 0;
        if (valid){
            PORTB ^= (1 << PB3);
        }
        if (blink == 6){       // 6 blinks
            nxt_state = LDVD;
            count = 0;
            blink = 0;
        }
        break;
    case LDVD:      // STOP vehicular
        delay = 61;
        PORTB &= ~(1 << PB3);
        PORTB |= (1 << PB1);
        if (blink == 1){
            count = 0;
            blink = 0;
            nxt_state = LDPP;
        }
        break;
    case LDPV:      // Paso vehicular
        PORTB |= (1 << PB3);
        PORTB |= (1 << PB5)|(1 << PB7); // LDPD ON
        PORTB &= ~(1 << PB1);  // LDVD OFF
        delay = 610;
        if (button == 1 && blink > 0){
            nxt_state = PV_blink;
            count = 0;
            blink = 0;
        } 
        break;
    case LDPP:      // Paso peatonal
        delay = 610;
        PORTB |= (1 << PB4)|(1 << PB6);
        PORTB &= ~(1 << PB5);
        PORTB &= ~(1 << PB7);  // LDPD OFF
        if (blink == 1){
            nxt_state = PP_blink;
            count = 0;
            blink = 0;
        }
        break;
    case LDPD:
        delay = 70;
        PORTB &= ~(1 << PB4);
        PORTB &= ~(1 << PB6);
        PORTB |= (1 << PB5)|(1 << PB7); // Luz peaton en rojo
        if (blink == 1){
            nxt_state = LDPV;
            count = 0;
            blink = 0;
        }
        break;
    case PP_blink:      // paso peatones apunto de terminar
        delay = 30;
        if (valid){
            PORTB ^= (1 << PB4);
            PORTB ^= (1 << PB6);
        }
        if (blink == 6){
            nxt_state = LDPD;
            count = 0;
            blink = 0;
        }
        break;
    default:
        break;
    }
}
ISR(TIMER0_OVF_vect){
    if(count == delay){
        valid = 1;  // pasó tiempo necesario y se puede cambiar luz
        blink++;   // cantidad de cambios de luz ++
        count = 0;
    } else{
        count++;
        valid = 0;  // no cambiar luz
    }
}
ISR(INT0_vect){
    if (state == LDPV){
        button = 1;
    }
}
ISR(INT1_vect){
    if (state == LDPV){
        button = 1;
    }
}

