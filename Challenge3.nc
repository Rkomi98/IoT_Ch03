
#include "Timer.h"
#include "printf.h"	

module Challenge3 @safe()
{
  uses interface Timer<TMilli> as Timer;
  uses interface Leds;
  uses interface Boot;
}
implementation
{
  //bool locked = FALSE;
  uint32_t ID = 10562546;
  uint16_t n;
  uint16_t r = 0;
  uint16_t g = 0;
  uint16_t b = 0;
  event void Boot.booted()
  {
  	call Timer.startPeriodic(30000);
  }

  event void Timer.fired(){
  	n=ID%3;
  	if(ID>0){
  		//n=ID%3;    
  		//ID=ID/3;
  		if (n==0){
  			if(r==0){
  				r=1;
  				}
  			else{
  				r=0;
  			}
  			dbg("BlinkC", "Timer fired @ %s.\n", sim_time_string());
  			call Leds.led0Toggle();
  		}
  		//printf("%d,%d,%d\n",r,g,b);
  		//printfflush();
  		if (n==1){
  			if(g==0){
  				g=1;
  				}
  			else{
  				g=0;
  			}
  			dbg("BlinkC", "Timer fired @ %s.\n", sim_time_string());
  			call Leds.led1Toggle();
  		}
  		//printf("%d,%d,%d\n",r,g,b);
  		//printfflush();
  		if (n==2){
  			if(b==0){
  				b=1;
  				}
  			else{
  				b=0;
  			}
  			dbg("BlinkC", "Timer fired @ %s.\n", sim_time_string());
  			call Leds.led2Toggle();
  		}
  		printf("%d,%d,%d\n",r,g,b);
		//printf("%d\n",n);
		printfflush();
  	}
  	ID=ID/3;
  }
}

