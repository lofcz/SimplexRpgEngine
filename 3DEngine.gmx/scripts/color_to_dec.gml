/// color_to_dec(color)
 
var color,dec;

color = argument0;
dec = (color & 16711680) >> 16 | (color & 65280) | (color & 255) << 16;

return (dec);