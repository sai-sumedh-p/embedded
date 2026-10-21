#include<LPC214x.h>
void delay (int x);
int main (void)
{

IO0DIR=0X00000400;
PINSEL0=0x00000000;
 PINSEL1=0x00000000;
 PINSEL2=0x00000000;
 IODIR1=0x00FF0000;
 IOPIN1= 0x00000000;
 while (1)
 if(IOPIN1&0x01000000)
 {
  IOPIN0= 0x00000000;
  delay (1000);
  IOPIN0= 0x00000400;
  delay(1000);
  }

 }
 void delay (int x)
 {
  unsigned int y,z;
{
  for (y=x;y>0;y--)
for(z=0;z<x;z++);
 }
 }
