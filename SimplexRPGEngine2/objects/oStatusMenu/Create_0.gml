/// @description Insert description here
// You can write your code in this editor

v_formAlpha = 1;
v_selectionDone = false;
v_menuReady = true;
v_menuAlpha = 0;
v_drawForm = false;

v_menuItems[0, 0] = "Status";
v_menuItems[0, 1] = 1;
v_menuItems[0, 2] = 0;
v_menuItems[0, 3] = 0;

v_menuItems[1, 0] = "Spells";
v_menuItems[1, 1] = 1;
v_menuItems[1, 2] = 0;
v_menuItems[1, 3] = 0;

v_menuItems[2, 0] = "Talents";
v_menuItems[2, 1] = 1;
v_menuItems[2, 2] = 0;
v_menuItems[2, 3] = 0;

v_menuItems[3, 0] = "Traits";
v_menuItems[3, 1] = 1;
v_menuItems[3, 2] = 0;
v_menuItems[3, 3] = 0;

v_menuItems[4, 0] = "Quests";
v_menuItems[4, 1] = 1;
v_menuItems[4, 2] = 0;
v_menuItems[4, 3] = 0;

v_menuItems[5, 0] = "Collection";
v_menuItems[5, 1] = 1;
v_menuItems[5, 2] = 0;
v_menuItems[5, 3] = 0;

v_menuItems[6, 0] = "Achievements";
v_menuItems[6, 1] = 1;
v_menuItems[6, 2] = 0;
v_menuItems[6, 3] = 0;

v_layoutW = 230;
v_layoutH = 210;
v_layoutMode = 0;
v_selectedIndex = -1;
v_currentAbility = 0;
v_lastSelectedIndex = v_selectedIndex;

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_propertyTemp[i] = 0;	
}


v_statusAttributes[0] = e_inventoryProperties.valStrenght;
v_statusAttributes[1] = e_inventoryProperties.valEndurance;
v_statusAttributes[2] = e_inventoryProperties.valFortitude;
v_statusAttributes[3] = e_inventoryProperties.valDexterity;
v_statusAttributes[4] = e_inventoryProperties.valIntellect;
v_statusAttributes[5] = e_inventoryProperties.valCharisma;
v_statusAttributes[6] = e_inventoryProperties.valPsyche;
v_statusAttributes[7] = e_inventoryProperties.valResolve;
v_statusAttributes[8] = e_inventoryProperties.valPerception;
v_statusAttributes[9] = e_inventoryProperties.valFate;

v_statusAbility[0] = "Oratory";
v_statusAbility[1] = "Martial";
v_statusAbility[2] = "Craft";
v_statusAbility[3] = "Thievery";


v_statusAbilitySub[0, 0] = e_inventoryProperties.valPersuasion;
v_statusAbilitySub[0, 1] = e_inventoryProperties.valIntimidation;
v_statusAbilitySub[0, 2] = e_inventoryProperties.valTrustfulness;
v_statusAbilitySub[0, 3] = e_inventoryProperties.valBargaining;

v_statusAbilitySub[1, 0] = e_inventoryProperties.valMasterySwords;
v_statusAbilitySub[1, 1] = e_inventoryProperties.valMasteryAxes;
v_statusAbilitySub[1, 2] = e_inventoryProperties.valMasteryMaces;
v_statusAbilitySub[1, 3] = e_inventoryProperties.valMasteryDaggers;
v_statusAbilitySub[1, 4] = e_inventoryProperties.valMasterySpears;
v_statusAbilitySub[1, 5] = e_inventoryProperties.valMasteryBows;
v_statusAbilitySub[1, 6] = e_inventoryProperties.valMasteryShields;


v_statusStatictics[0] = e_inventoryProperties.valDamage;
v_statusStatictics[1] = e_inventoryProperties.valMagicMultiplier;
v_statusStatictics[2] = e_inventoryProperties.valDefense;
v_statusStatictics[3] = e_inventoryProperties.valDefenseMagic;
v_statusStatictics[4] = e_inventoryProperties.valCriticalChance;
v_statusStatictics[5] = e_inventoryProperties.valCriticalDamage;
v_statusStatictics[6] = e_inventoryProperties.valTrapDetection;
v_statusStatictics[7] = e_inventoryProperties.valLuck;
