
if room = room0 // terc v level 1
{
 global.rychlostTerc = 13;
 global.casVytvoreni = 70;
}
else if room = room2 // terc v level 2
{
 global.rychlostTerc = 20;
 global.casVytvoreni = 40;
}
else if room = room3 // terc v level 3
{
 global.rychlostTerc = 17;
 global.casVytvoreni = 30;
}

 
 // pohyb terče
if (room = room0) // level 1
{
path_start(level1,global.rychlostTerc,3,true);
}
else if (room = room2) // level 2
{
path_start(level_medium,global.rychlostTerc, 1, true);
}
else if (room = room3) // level 3
{
path_start(level_dif, global.rychlostTerc, 1, true);
}