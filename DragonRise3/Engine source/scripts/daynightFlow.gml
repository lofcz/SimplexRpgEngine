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
