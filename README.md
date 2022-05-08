# IoT_Ch03
In this repository we put all the code for the challenge N° 3 of the POLIMI course of IoT

To solve the challenge, we chose the person code: 10562546. To covert this person code in ternary we wrote a code in TinyOS, in Challenge3.nc file, which in order to be executed needs the application file Challenge3App.nc.

 The code converts all the digits of the person code, and every converted digit toggles a corresponding LED:
* If the number converted is 0 Led0 is toggled.
* If the number converted is 1 Led1 is toggled.
* If the number converted is 2 Led2 is toggled.
The total of LEDs is three: red, green, blue.

We started a periodic timer of 1 minute which converted in milliseconds it is equal to 60000 milliseconds. To do this we used: 
```
call Timer.startPeriodic(60000)
```
After making the application with the command: 
```
make telosb
```
from the terminal, we created a new simulation in **cooja** and we put a sky mote connected to the main.exe file.

We got, in this way, 15 messages each with three digits separated with comma, e.g. _1,0,0 when Led0 is toggled for the first time_.

As a next step, we started a serial socket and read from **Node-Red** the LEDs status.
![node-red](https://user-images.githubusercontent.com/72648197/167299714-256279cf-e455-4469-876f-bb61e07506ba.png)


At the function node of the flow, we wrote a code to take each digit of one message and put it in three different columns. With the mqtt node we sent to ThingSpeak at each field the corresponding value of the column:
* Column 1 has the values of Led0 that are sent to field 1.
* Column 2 has the values of Led1 that are sent to field 2.
* Column 3 has the values of Led2 that are sent to field 3.

Each message is sent on ThingSpeak every 1 minute. At each field we created a chart to present the data.


To visualize data, you have to go to this website:
https://thingspeak.com/channels/1727269
