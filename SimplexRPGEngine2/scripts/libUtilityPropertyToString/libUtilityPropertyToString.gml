/// @function libUtilityPropertyToString(property)
/// @desc Returns target atribute as string
/// @arg {e_inventoryProperties} atribute Atribute to convert

var tmp_index, tmp_output, tmp_array, tmp_group;
tmp_index = e_inventoryProperties.valDamage;
tmp_output = "";
tmp_group = 0;

if (argument_count > 0) {tmp_index = argument[0];}

switch(tmp_index)
{
	case e_inventoryProperties.valDamage:
	{
		tmp_output = "Damage";
		break;
	}
	
	case e_inventoryProperties.valMasteryAxes:
	{
		tmp_output = "Axes";
		break;
	}	
	
	case e_inventoryProperties.valMasteryBows:
	{
		tmp_output = "Bows";
		break;
	}	
	
	case e_inventoryProperties.valMasteryDaggers:
	{
		tmp_output = "Daggers";
		break;
	}	
	
	case e_inventoryProperties.valMasteryMaces:
	{
		tmp_output = "Maces";
		break;
	}	
	
	case e_inventoryProperties.valMasteryShields:
	{
		tmp_output = "Shields";
		break;
	}	
	
	case e_inventoryProperties.valMasterySpears:
	{
		tmp_output = "Spears";
		break;
	}	
	
	case e_inventoryProperties.valMasterySwords:
	{
		tmp_output = "Swords";
		break;
	}	
	
	case e_inventoryProperties.valMagicMultiplier:
	{
		tmp_output = "Willpower";
		break;
	}
	
	case e_inventoryProperties.valDefenseMagic:
	{
		tmp_output = "Magic resist";
		break;
	}	
	
	case e_inventoryProperties.valTrapDetection:
	{
		tmp_output = "Trap detection";
		break;
	}
	
	case e_inventoryProperties.valLuck:
	{
		tmp_output = "Luck";
		break;
	}	
	
	case e_inventoryProperties.valCharisma:
	{
		tmp_output = "Charisma";
		break;
	}
	
	case e_inventoryProperties.valFate:
	{
		tmp_output = "Fate";
		break;
	}
	
	case e_inventoryProperties.valFortitude:
	{
		tmp_output = "Fortitude";
		break;
	}
	
	case e_inventoryProperties.valIntellect:
	{
		tmp_output = "Intellect";
		break;
	}
	
	case e_inventoryProperties.valPsyche:
	{
		tmp_output = "Psyche";
		break;
	}
	
	case e_inventoryProperties.valResolve:
	{
		tmp_output = "Resolve";
		break;
	}	
	
	case e_inventoryProperties.valAccuray:
	{
		tmp_output = "Accuray";
		break;
	}
	
	case e_inventoryProperties.valDexterity:
	{
		tmp_output = "Dexterity";
		break;
	}		
	
	case e_inventoryProperties.valEndurance:
	{
		tmp_output = "Endurance";
		break;
	}	
	
	case e_inventoryProperties.valStrenght:
	{
		tmp_output = "Strenght";
		break;
	}	
	
	case e_inventoryProperties.valSwiftness:
	{
		tmp_output = "Swiftness";
		break;
	}	

	case e_inventoryProperties.valMaxHp:
	{
		tmp_output = "Health";
		break;
	}	
	
	case e_inventoryProperties.valHp:
	{
		tmp_output = "Recovers health";
		break;
	}
	
	case e_inventoryProperties.valMp:
	{
		tmp_output = "Recovers mana";
		break;
	}	
	
	case e_inventoryProperties.valSp:
	{
		tmp_output = "Recovers stamina";
		break;
	}	
	
	case e_inventoryProperties.valLevel:
	{
		tmp_output = "Level";
		tmp_group  = 1;
		break;
	}		
	
	case e_inventoryProperties.valPerception:
	{
		tmp_output = "Perception";
		break;
	}
	
	case e_inventoryProperties.valPersuasion:
	{
		tmp_output = "Persuasion";
		break;
	}
	
	case e_inventoryProperties.valIntimidation:
	{
		tmp_output = "Intimidation";
		break;
	}	

	case e_inventoryProperties.valBargaining:
	{
		tmp_output = "Bargaining";
		break;
	}
	
	case e_inventoryProperties.valTrustfulness:
	{
		tmp_output = "Trustfulness";
		break;
	}

	case e_inventoryProperties.valDefense:
	{
		tmp_output = "Defense";
		break;
	}
	
	case e_inventoryProperties.valCriticalChance:
	{
		tmp_output = "Critical";
		break;
	}
	
	case e_inventoryProperties.valCriticalDamage:
	{
		tmp_output = "Crit damage";
		break;
	}
}

tmp_array[0] = tmp_output;
tmp_array[1] = tmp_group;
return tmp_array;