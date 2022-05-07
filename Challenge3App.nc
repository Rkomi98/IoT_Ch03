#define NEW_PRINTF_SEMANTICS
#include "printf.h"

configuration Challenge3App
{
}
implementation
{
  components MainC, Challenge3, LedsC;  
  components new TimerMilliC() as Timer;
  components SerialPrintfC;
  components SerialStartC;
 
  Challenge3 -> MainC.Boot; 
  
  Challenge3.Timer -> Timer; // or TimerMilliC()
  Challenge3.Leds -> LedsC;
  //Challenge3.Boot -> MainC;
}
