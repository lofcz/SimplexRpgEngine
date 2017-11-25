/// @description Insert description here
// You can write your code in this editor

if (alarm[1] == -1) {cpParticlesFireballTrail();}

speed = lerp(speed, v_speedT, 0.1);

if (distance_to_object(oPlayer) > 600) {if (alarm[1] == -1) {alarm[1] = 60;}}