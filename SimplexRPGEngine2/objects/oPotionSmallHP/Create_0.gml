/// @description Insert description here
// You can write your code in this editor

cpItemIni(e_items.valElixirHP, true, 20, "Small potion of HP", "Even a little bottle is able to recover a part of your physical health. Continue onslaught!", 6, 0.1, -1, -1, true);
cpItemSetProperty(e_inventoryProperties.valHp, 20);
cpItemAddOption("Use");

if (!_static())
{
	cpItemSetAtribute(e_inventoryAtributes.valRarity, e_rarities.valCommon);
}