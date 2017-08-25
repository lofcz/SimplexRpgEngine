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
		
	case e_inventoryProperties.valLevel:
	{
		tmp_output = "Level";
		tmp_group  = 1;
		break;
	}		
}

tmp_array[0] = tmp_output;
tmp_array[1] = tmp_group;
return tmp_array;