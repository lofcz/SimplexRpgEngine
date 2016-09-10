/// scrSpellIni()

channel_mask  = shader_get_uniform(shdColor, "f_ChannelMask");
bacAlpha      = 0;
mode          = "";
drawTextTitle = "";
drawText      = "";
extAlpha      = 0;
draw          = 0;
Sname         = part_system_create();
fromSpell     = -1;
drawType      = "spells";
setSpell      = 0;
upgradeMode   = -1;
upgradeSpell  = -1;
upgradeAlpha  = 0;
hoverAlpha    = 0;
spellList     = ds_list_create();
spellListAlpha = ds_list_create();
choosenSpell  = -1;
choosenSpellScale = 1;
realVerticles = 0;
