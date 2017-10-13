/// @description Insert description here
// You can write your code in this editor

if (v_alive)
{
	depth = oPlayer.depth - 50;
	v_alive = false;
	
	cpSplashNote("+ "+string(10),c_red,sHealthEffect,0,0.4);
}