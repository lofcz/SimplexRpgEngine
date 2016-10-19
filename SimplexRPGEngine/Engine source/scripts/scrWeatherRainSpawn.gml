/// scrWeatherRainSpawn(number, edge)

var n,e;
n = 40;
e = 200;

if (argument_count > 0) {n = argument[0];}
if (argument_count > 1) {e = argument[1];}

repeat(n)
{
    instance_create(view_xview-e+random(view_wview+e*2),view_yview-e+random(view_hview+e*2),oRain);
}
