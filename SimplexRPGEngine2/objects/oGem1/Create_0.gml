/// @description Insert description here
// You can write your code in this editor

/// @desc [Simplex description line]

cpItemIni(e_items.valPearlGreen, false, 1, "Green gem", "Smells like a freakshow. Can be attached into weapons.", 5, 0.1, 0, 0, true);
cpItemSetProperty(e_inventoryProperties.valDamage, 4);

cpItemAddOption("Attach");

if (!_static())
{
	cpItemSetAtribute(e_inventoryAtributes.valLerpColor, choose(c_lime, c_red, c_white, c_yellow));
}

cpItemFinalize(true);