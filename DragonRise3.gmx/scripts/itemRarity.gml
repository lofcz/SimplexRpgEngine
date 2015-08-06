/// inventoryRarity()

value = itm_info_color;
text  = itm_info_head;

if (value = rarity_junk)      {text += " (odpad)"}
if (value = rarity_fine)      {text += " (vzácné)"}
if (value = rarity_normal)    {text += " (normální)"}

itm_effect    = value;
itm_info_head = text;