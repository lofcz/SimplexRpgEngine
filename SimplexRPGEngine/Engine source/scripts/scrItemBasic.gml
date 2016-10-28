/// scrItemBasic(itemID)

itm_stackable             = 0;
itm_id                    = 0;
itm_number                = 1;
itm_sprite_number         = 0;
itm_sprite                = sTestItem;
itm_info_text             = "Unassigned item [INFO TEXT]";
itm_info_head             = "Unassigned item [INFO HEAD]";
itm_info_color            = c_black;
itm_materialType          = materialEnum.materialNone;
on_click                  = 0;
hover_info                = 0;
loot                      = 0;
p                         = 1;
itm_effect                = 0;
o                         = 0;
itm_sound                 = 0;
itm_equip_slot            = "";
spd_down                  = 0;
animateDrop               = 0;
animateDropDir            = 0;
animateDropForce          = 0;
stav                      = "idle";
mode                      = 0;
m1                        = choose(0,1);
secure_pickup             = 15;
drawDrop                  = false;
z                         = irandom_range(20, 40);
zspeed                    = irandom_range(1, 2);
zgravity                  = -random_range(0.3, 0.4);
shadowAlpha               = 1;
spd_down                  = 0;
mode                      = choose(0,1);
isDrop                    = false;

for(a = 0; a < 10; a++)                  {itm_options[a] = "";}
for(a = 0; a < celkem_vlastnosti; a++)   {vlastnost[a]   = 0;}

if (argument_count > 0) {itm_id = argument[0]}

scrItemImageIndex(itm_id - 1)
realIndex = image_index;
