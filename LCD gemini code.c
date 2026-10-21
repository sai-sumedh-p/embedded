#include <lpc214x.h>
#include <stdio.h>

#define RS 0x10000
#define RW 0x20000
#define EN 0x40000

/* Added missing function prototype */
void delay(unsigned int n);
void lcd_cmd (unsigned char);
void lcd_data (unsigned char);
void lcd_initialize (void);
void lcd_display (void);
void LCD4_Convert(unsigned char);

const unsigned char cmd[4] = {0x28,0x0c,0x06,0x01};
unsigned char msg[] = {" ARE "};
unsigned char msg1[]= {" III YEAR "};

int main(void)
{
    PINSEL1 = 0;
    IODIR0 = 0xFF << 16;
    lcd_initialize();
    lcd_display();
    while(1);
}

void delay(unsigned int n)
{
    unsigned int i,j;
    for(i=0;i<n;i++)
        for(j=0;j<12000;j++);
}

void lcd_cmd(unsigned char data)
{
    /* Changed |= to = for proper IOSET/IOCLR operation */
    IOCLR0 = RS;
    IOCLR0 = RW;
    LCD4_Convert(data);
}

void lcd_initialize(void)
{
    int i;
    for(i=0;i<4;i++)
    {
        IOCLR0 = 0xF << 19;
        lcd_cmd(cmd[i]);
        delay(15);
    }
}

void lcd_data (unsigned char data)
{
    /* Changed |= to = */
    IOSET0 = RS;
    IOCLR0 = RW;
    LCD4_Convert(data);
}

void LCD4_Convert(unsigned char c)
{
    if(c & 0x80) IOSET0 = 1 << 22; else IOCLR0 = 1 << 22;
    if(c & 0x40) IOSET0 = 1 << 21; else IOCLR0 = 1 << 21;
    if(c & 0x20) IOSET0 = 1 << 20; else IOCLR0 = 1 << 20;
    if(c & 0x10) IOSET0 = 1 << 19; else IOCLR0 = 1 << 19;

    IOSET0 = EN;
    delay(8);
    IOCLR0 = EN;

    if(c & 0x08) IOSET0 = 1 << 22; else IOCLR0 = 1 << 22;
    if(c & 0x04) IOSET0 = 1 << 21; else IOCLR0 = 1 << 21;
    if(c & 0x02) IOSET0 = 1 << 20; else IOCLR0 = 1 << 20;
    if(c & 0x01) IOSET0 = 1 << 19; else IOCLR0 = 1 << 19;

    IOSET0 = EN;
    delay(8);
    IOCLR0 = EN;
}

void lcd_display (void)
{
    char i;

    /* Fixed syntax error in comment */
    /* first line message */
    lcd_cmd(0x80);
    delay(15);
    i=0;
    while(msg[i]!='\0')
    {
        delay(5);
        lcd_data(msg[i]);
        i++;
    }

    delay(15);

    /* Fixed syntax error in comment */
    /* second line message */
    lcd_cmd(0xc0);
    delay(15);
    i=0;
    while(msg1[i]!='\0')
    {
        delay(5);
        lcd_data(msg1[i]);
        i++;
    }
    delay(15);
}
