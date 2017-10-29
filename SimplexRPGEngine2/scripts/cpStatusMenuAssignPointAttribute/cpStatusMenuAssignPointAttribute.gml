/// cpStatusMenuAssignPointAttribute(propertyIndex, doAssign)

enum e_attributeLevel
{
	valNormal,
	valSpecial,
	valDecade
}

var tmp_index, tmp_really, tmp_rule;
tmp_index = argument[0];
tmp_really = argument[1];
tmp_rule = e_attributeLevel.valNormal;

#region Logic
if ((oHUD.v_playerPropertyTotal[tmp_index] + 1) % 5 == 0) {tmp_rule = e_attributeLevel.valSpecial;}
if ((oHUD.v_playerPropertyTotal[tmp_index] + 1) % 10 == 0) {tmp_rule = e_attributeLevel.valDecade;}

if (tmp_really)
{
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		oHUD.v_playerProperty[i] += oStatusMenu.v_propertyTemp[i];	
	}
	
	return 1;
}
#endregion

// Point assign database
// **************************************************************************
#region Strenght
if (tmp_index == e_inventoryProperties.valStrenght)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDamage] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 2;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 2;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDamage] += 3;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDamage] += 4;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valCriticalDamage] += 0.02;		
	}
}
#endregion
#region Endurance
if (tmp_index == e_inventoryProperties.valEndurance)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 3;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 3;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxSp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valSp] += 1;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 4;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 4;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDamage] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 6;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 6;		
	}
}
#endregion
#region Fortitude
if (tmp_index == e_inventoryProperties.valFortitude)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDefense] += 1;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistAir] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistEarth] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistFire] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistWater] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDefense] += 3;			
	}
}
#endregion
#region Dexterity
if (tmp_index == e_inventoryProperties.valDexterity)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valSp] += 2;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxSp] += 2;
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valSp] += 3;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxSp] += 3;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valCriticalChance] += 1;
		
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valSp] += 3;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxSp] += 3;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valCriticalChance] += 2;			
	}
}
#endregion
#region Intellect
if (tmp_index == e_inventoryProperties.valIntellect)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 3;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 3;
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 5;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 5;		
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 5;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 5;	
		
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistAir] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistEarth] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistFire] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistWater] += 1;
	}
}
#endregion
#region Charisma
if (tmp_index == e_inventoryProperties.valCharisma)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxHp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valHp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxSp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valSp] += 1;		
	}
}
#endregion
#region Psyche
if (tmp_index == e_inventoryProperties.valPsyche)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMagicMultiplier] += 0.02;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMagicMultiplier] += 0.04;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMagicMultiplier] += 0.05;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMaxMp] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valMp] += 1;		
	}
}
#endregion
#region Resolve
if (tmp_index == e_inventoryProperties.valResolve)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDefenseMagic] += 1;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistAir] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistEarth] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistFire] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistWater] += 1;
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valDefenseMagic] += 3;			
	}
}
#endregion
#region Perception
if (tmp_index == e_inventoryProperties.valPerception)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valTrapDetection] += 1;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valTrapDetection] += 2;	
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valTrapDetection] += 3;		
	}
}
#endregion
#region Fate
if (tmp_index == e_inventoryProperties.valFate)
{
	if (tmp_rule == e_attributeLevel.valNormal)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valLuck] += 1;	
	}
	
	if (tmp_rule == e_attributeLevel.valSpecial)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valLuck] += 2;	
	}
	
	if (tmp_rule == e_attributeLevel.valDecade)
	{
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valLuck] += 2;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistAir] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistEarth] += 1;	
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistFire] += 1;
		oStatusMenu.v_propertyTemp[e_inventoryProperties.valResistWater] += 1;		
	}
}
#endregion