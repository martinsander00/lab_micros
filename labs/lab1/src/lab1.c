#include <pic14/pic12f675.h>


// Configuración de registro CONFIG 
typedef unsigned int word; 
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);  // WDT y MCLR OFF 


void msdelay(unsigned int time);
void print(unsigned int num);



void main()
{
    ANSEL  = 0x00;   
    CMCON  = 0x07;   
    VRCON  = 0x00;   
	TRISIO = 0b00001000;
	GPIO = 0x00; 

    unsigned int time=1;
    

    unsigned int k,j;
    unsigned int num1=0;
    unsigned int num2=0;
	unsigned int btn=0;
	unsigned int rand1=0;
	unsigned int rand2=0;
	unsigned int stop=0;




    while(1)
    {
        rand1+=1;
		rand2+=1;
        
        if (rand1>9){
            rand1=0;
        }
		if (rand2>9){
            rand2=0;
        }

		GP4=1;
        print(num1);
        msdelay(time);
        GP4=0;
        print(num2);
		rand2+=1;
        msdelay(time);

		if (GP3==1){

			btn=1;
			stop+=1;

			


			while (btn==1){
				num1=rand1;
				num2=rand2;

				if (GP3==1){
					btn=0;
				}
				
			}

			if (stop>=150){
				num1=9;
				num2=9;
			}
		}


    }


}


void print(unsigned int num)
{
        if (num==0){
			GPIO0=0;
			GPIO1=0;
			GPIO2=0;
			GPIO5=0;
	    }

        else if (num==1){
			GPIO0=1;
			GPIO1=0;
			GPIO2=0;
			GPIO5=0;
	    }

        else if (num==2){
			GPIO0=0;
			GPIO1=1;
			GPIO2=0;
			GPIO5=0;
	    }

        else if (num==3){
			GPIO0=1;
			GPIO1=1;
			GPIO2=0;
			GPIO5=0;
	    }

        else if (num==4){
			GPIO0=0;
			GPIO1=0;
			GPIO2=1;
			GPIO5=0;
	    }

        else if (num==5){
			GPIO0=1;
			GPIO1=0;
			GPIO2=1;
			GPIO5=0;
	    }

        else if (num==6){
			GPIO0=0;
			GPIO1=1;
			GPIO2=1;
			GPIO5=0;
	    }

        else if (num==7){
			GPIO0=1;
			GPIO1=1;
			GPIO2=1;
			GPIO5=0;
	    }

        else if (num==8){
			GPIO0=0;
			GPIO1=0;
			GPIO2=0;
			GPIO5=1;
	    }
		
        else if (num==9){
			GPIO0=1;
			GPIO1=0;
			GPIO2=0;
			GPIO5=1;
        }
}


void msdelay(unsigned int time)
{
    unsigned int i,j;
    for (i=0;i<time;i++)
        for (j=0;j<1275;j++);
}