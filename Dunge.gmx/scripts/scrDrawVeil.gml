var dark
dark=1-light

if argument0<1{
dark=min(dark,0.5)
}

draw_set_color(c_black)
draw_set_alpha(dark)
draw_rectangle(800,0,1499,599,false)
draw_set_alpha(1)