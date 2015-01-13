#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

using namespace std;

int pwm1=0;
int pwm2=0;
int pwm3=0;
int pwm4=0;

int i=0;

char serialPortFilename[] = "/dev/ttyACM0"; //Selecting port 

int main()
{

FILE *serPort=fopen(serialPortFilename,"w");

cout<< "PWM1 value:";
cin>> pwm1;
cout<< "PWM2 value:";
cin>> pwm2;
cout<< "PWM3 value:";
cin>> pwm3;
cout<< "PWM4 value:";
cin>> pwm4;

while(1)
  {
  if(serPort == NULL)
    {
      printf("ERROR");
      return 0;
    }

    char writeBuffer[16];
    sprintf(writeBuffer, "g;%02d;%02d;%02d;%02d;", pwm1, pwm2, pwm3, pwm4);
    fwrite(writeBuffer, sizeof(char), sizeof(writeBuffer), serPort);
    cout<<"Buffer:" << writeBuffer << endl;
    sleep(0.0001);
    }	
    fclose(serPort);
}
