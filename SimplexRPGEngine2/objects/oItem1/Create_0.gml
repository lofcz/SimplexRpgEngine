/// @desc [Simplex description line]

cpItemIni(e_items.valSwordWooden, false, 1, "Wooden sword", "Simple weapon", 20, 2, 30, 30, true);
cpItemSetWearable(e_equipmentSlots.valWeaponRight, sBodyCanvasWeapon5, 0, sBodyCanvasAttackWeapon3);
cpItemSetProperty(e_inventoryProperties.valDamage, 4);
//cpItemSetReq(e_inventoryProperties.valLevel, 2);
cpItemAddOption("First option", "Second option", "Third option");

if (!_static())
{
	cpItemSetAtribute(e_inventoryAtributes.valLerpColor, choose(c_lime, c_red, c_white, c_yellow), e_inventoryAtributes.valIdentified, choose(true, false));
}