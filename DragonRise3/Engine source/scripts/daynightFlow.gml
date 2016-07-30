/// daynightFlow(secPerStep)

var secPerStep;

secPerStep = 10;

if (argument_count > 0) {secPerStep = argument[0];}

if (secPerStep > 60) {secPerStep = secPerStep / 60; minu += secPerStep}
else
    {
    sec += secPerStep;
    }

if (sec > 60)
 {
  sec = 0;
  minu += 1;
 }
 
if (minu > 59)
 {
  minu = 0;
  hour += 1;
 }
 
if (hour > 23)
  {
  hour = 0;
  day++;
  event_user(0);
  }

if (day >= 7)
  {
   day = 0; 
   week++;
   event_user(1);
  }

if (week > 3)
    {
     month++;
     week = 0;
     event_user(2);
    }
if (month > 11)
    {
     month = 0;
     year++;
     event_user(3);
    }

hh = hour+minu/60;
to = -1;

if (hour > 12)
 {
  hh = (hour-12)+(minu/60);
  to = 1;
 }

fase = (12-hh)/12;

if (to = 1)
   {
   fase = 1-((12-hh)/12);
   }

if (to = -1)
   {
   fase*=1.3;
   }


if (hour = 18)
 {
  red = ((minu)/60)*255;
 }
 
if (hour = 19)
 {
  red = 255-(((minu)/60)*255);
 }


night = 0;

if (hour > 20 || hour < 5)
   {
    night = 1;
   }
   
if (night)
    {
     if (alpha < 0.9) {alpha += 0.01;}
    }
else
    {
     if (alpha > 0) {alpha -= 0.01;}
    }
