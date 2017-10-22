/// @description Insert description here
// You can write your code in this editor


if (v_alive)
{
	depth = oPlayer.depth - 50;
	v_alive = false;

	cpSplashMessage("+ " + string(5) + " Xp", c_lime, -1, 0, 0.4, x, y - 32);
	oHUD.v_playerProperty[e_inventoryProperties.valXp] += 5;
}