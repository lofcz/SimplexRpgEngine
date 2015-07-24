itm_stackable             = 0;
itm_id                    = 0;
itm_number                = 1;
itm_sprite_number         = 0;
itm_sprite                = sTestItem;
itm_info_text             = "Unassigned item [INFO TEXT]";
itm_info_head             = "Unassigned item [INFO HEAD]";
itm_info_color            = c_black;
on_click                  = 0;
hover_info                = 0;
loot                      = 0;
p                         = 1;
itm_effect                = 0;
o                         = 0;

for(a=0 a<10 a++)         {itm_options[a] = "";}

if (argument_count > 0) {itm_id = argument[0]}