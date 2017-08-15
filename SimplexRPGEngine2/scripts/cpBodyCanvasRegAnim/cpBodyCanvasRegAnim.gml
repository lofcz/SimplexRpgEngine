/// @function cpBodyCanvasRegAnim(animIndex, lBody, lHair, lArmor, lShoulders, lHead, lLegs, lBelt, lShoes, lHands, lRing, lNecklace, lWeapon1, lWeapon2)
/// @arg {e_animations} animIndex animationIndex
/// @arg {sprite} lBody body layer sprite
/// @arg {sprite} lHair  head layer sprite
/// @arg {sprite} lArmor armor layer sprite
/// @arg {sprite} lShoulders shoulders layer sprite
/// @arg {sprite} lHead head layer sprite
/// @arg {sprite} lLegs legs layer sprite
/// @arg {sprite} lBelt belt layer sprite
/// @arg {sprite} lShoes shoes layer sprite
/// @arg {sprite} lHands hands layer sprite
/// @arg {sprite} lRing ring layer sprite
/// @arg {sprite} lNecklace necklace layer sprite
/// @arg {sprite} lWeapon1 right hand weapon layer sprite
/// @arg {sprite} lWeapon2 left hand wepon layer sprite

for (var i = 1; i < 16; i++)
{
	if (argument_count > i) {v_bci[argument[0], i - 1] = argument[i]; v_bciDef[argument[0], i - 1] = argument[i];} 
}

