/// @description Insert description here
// You can write your code in this editor

timeVal += 0.02;

shader_set(shdPerlinNoise);
shader_set_uniform_f(resolution, surface_get_width(application_surface), surface_get_width(application_surface));
shader_set_uniform_f(time, timeVal + timeOffset);
shader_set_uniform_f(strenght, strenghtVal);

draw_self();
shader_reset();
