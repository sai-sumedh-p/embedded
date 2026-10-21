PWM

#include <lpc214x.h>
#define PLOCK 0x00000400

void initPWM(void);
void initClocks(void);
void setupPLL0(void);
void feedSeq(void);
void connectPLL0(void);
int main(void)
{
initClocks();
initPWM();
while(1)
{ ; }
}
void initPWM(void)
{
/Assuming that PLL0 has been setup with CCLK = 60Mhz and PCLK also = 60Mhz./
/This is a per the Setup & Init Sequence given in the tutorial/
PINSEL0 = ( 1<< 17) | ( 1<< 19);
PWMPR = 0x02;
PWMMCR = (1<<1);
PWMMR0 = 2000000;
PWMMR4 = 500000;
PWMMR6 = 1500000;
PWMLER = 0x51;
PWMPCR = 0x5000;
PWMTCR = (1<<1);
PWMTCR = (1<<0) | (1<<3);
}

void initClocks(void)
{
setupPLL0();
feedSeq();
connectPLL0();
feedSeq();
VPBDIV = 0x01;
}
void setupPLL0(void)
{
PLL0CON = 0x01;

PLL0CFG = 0x24;
}
void feedSeq(void)
{
PLL0FEED = 0xAA;
PLL0FEED = 0x55;
}
void connectPLL0(void)
{

while( !( PLL0STAT & PLOCK ));

PLL0CON = 0x03;
}
