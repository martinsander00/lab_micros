#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR(INT1_vect)
{
    //PORTB = 0x00; 
    //_delay_ms(500);
    
    PORTB = 0x08; 
    _delay_ms(50000);
    
    PORTB = 0x00;// para dejarlo apagado
}

int main(void)
{

  sei();
  DDRB = 0x08; //Configuracion del puerto

  //Habilita la interrupcion por INT1
  GIMSK |= (1 << INT1);
  
  //Parpadear
  while (1) {
  //Habilita la interrupcion por INT1
  //GIMSK |= (1 << INT1);
    //PORTB = 0x00; 
    //_delay_ms(500);
    
    //PORTB = 0x08; 
    //_delay_ms(500);
  }
}
