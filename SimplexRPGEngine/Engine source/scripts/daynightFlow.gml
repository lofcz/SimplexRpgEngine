/// daynightFlow(secPerStep)

var secPerStep;
secPerStep = 10;

if (argument_count > 0) {secPerStep = argument[0];}

if (secPerStep > 60) {secPerStep = (secPerStep / 60); oDayNight.minu += secPerStep}
else {oDayNight.sec += secPerStep;}

if (oDayNight.sec   > 60) {oDayNight.sec  = 0;  oDayNight.minu++;} 
if (oDayNight.minu  > 59) {oDayNight.minu = 0;  oDayNight.hour++;} 
if (oDayNight.hour  > 23) {oDayNight.hour = 0;  oDayNight.day++;   with(oDayNight) {event_user(0);}}
if (oDayNight.day   >= 7) {oDayNight.day  = 0;  oDayNight.week++;  with(oDayNight) {event_user(1);}}
if (oDayNight.week  > 3)  {oDayNight.week = 0;  oDayNight.month++; with(oDayNight) {event_user(2);}}
if (oDayNight.month > 11) {oDayNight.month = 0; oDayNight.year++;  with(oDayNight) {event_user(3);}}

oDayNight.hh = (oDayNight.hour + (oDayNight.minu / 60));
oDayNight.to = -1;
oDayNight.fase = (12-oDayNight.hh)/12;

if (oDayNight.hour  > 12)   {oDayNight.hh    = (oDayNight.hour - 12) + (oDayNight.minu / 60); oDayNight.to = 1;}
if (oDayNight.to   == 1)    {oDayNight.fase  = (1 - ((12 - oDayNight.hh) / 12));}
if (oDayNight.to   == -1)   {oDayNight.fase *= 1.3;}
if (oDayNight.hour == 18)   {oDayNight.red   = ((oDayNight.minu) / 60) * 255;} 
if (oDayNight.hour == 19)   {oDayNight.red   = (255 - (((oDayNight.minu) / 60) * 255));}

oDayNight.night = false;

if (oDayNight.hour > 20 || oDayNight.hour < 5){night = true;}   
if (oDayNight.night) {if (oDayNight.alpha < 0.9) {oDayNight.alpha += 0.01;}}
else {if (oDayNight.alpha > 0) {oDayNight.alpha -= 0.01;}}
