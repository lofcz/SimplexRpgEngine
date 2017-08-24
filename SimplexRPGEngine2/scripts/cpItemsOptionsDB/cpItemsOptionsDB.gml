/// @fucntion cpItemsOptionsDB(itemID, optionID)
/// @desc Holds database for items options
/// @arg {e_items} itemID ID of item 
/// @arg {int} optionID ID of option

var tmp_item, tmp_option;
tmp_item = e_items.valNONE;
tmp_option = 0;

if (argument_count > 0) {tmp_item = argument[0];}
if (argument_count > 1) {tmp_option = argument[1];}

switch (tmp_item)
{
	case e_items.valSwordWooden:
	{
		if (tmp_option == 0) 
		{
			show_message("Test");
		}
		break;
	}
}
