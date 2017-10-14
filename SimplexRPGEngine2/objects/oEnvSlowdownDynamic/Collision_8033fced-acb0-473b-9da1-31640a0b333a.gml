/// @description Insert description here
// You can write your code in this editor

if (libUtilityCollisionInCollision(v_collisionMain, other.v_collisionLegs) && !libUtilityCollisionInCollision(v_collisionMain, other.v_collisionHead))
{
	depth = oPlayer.depth - 90;
	other.v_speedReal /= 2;
}
else
{
	depth = oPlayer.depth + 90;	
}