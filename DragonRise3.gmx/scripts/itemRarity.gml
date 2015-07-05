/// inventoryRarity()

value = itm_info_color;
text  = itm_info_head;

if (value = rarity_junk)      {text += "[junk]"}
if (value = rarity_fine)      {text += "[fine]"}
if (value = rarity_normal)    {text += "[normal]"}


itm_info_head = text;