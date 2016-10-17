/// daynightInitialise(hours)

var TempHours;
TempHours = 12;

if (argument_count > 0) {TempHours = argument[0];}

night = false;
hour  = TempHours;
minu  = 0;
sec   = 0;
fase  = 0;
to    = 1;
color = c_black;
col   = 0;
red   = 0;
day   = 0;
week  = 0;
month = 0;
year  = 0;
alpha = 0.8;
surf  = surface_create(view_wview, view_hview);
