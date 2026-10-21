#include <LPC214x.h>
int main(void){
    PINSEL0 = 0x00000000;
    PINSEL1 = 0x00000000;
    PINSEL2 = 0x00000000;
    IO0DIR  = 0x00078000;
    IO1DIR  = 0x00FF0000;
    while(1){
        if(IO1PIN & 0x01000000){
            IO0PIN = 0x00008000;
            IO1PIN = 0x00060000;
        }
        else if(IO1PIN & 0x02000000){
            IO0PIN = 0x00010000;
            IO1PIN = 0x005B0000;
        }
        else{
            IO0PIN = 0x00000000;
            IO1PIN = 0x00000000;
        }
    }
    IO0CLR = 0x00078000;
}

/*
 Notes:
 PINSEL : selects the function of P_ to P_
 IODIR  : configures the direction of port pins
 Why buzzer port 0.10 : physically connected to P0.10 on the LPC2148 dev board
 7-segment has 4 digits/units
 IO0DIR = 0x00078000 : selects which digit/unit is active in the 7-segment
*/
