/// scrTalentIni()

channel_mask  = shader_get_uniform(shdColor, "f_ChannelMask");
bacAlpha      = 0;
mode          = "";
drawTextTitle = "";
drawText      = "";
extAlpha      = 0;
draw          = 0;
Sname         = part_system_create();
drawType      = "talents";
setSpell      = 0;
treeName[0]   = "Zloděj";
treeName[1]   = "Válečník";
treeName[2]   = "Mág";
selectedTree  = 0;

for (i = 0; i < 10; i++)
    {
    for (j = 0; j < 10; j++)
        {
        telentThiefText[i, j]    = "";   
        telentMageText[i, j]     = "";    
        telentWarriorText[i, j]  = "";    
        }
    }

