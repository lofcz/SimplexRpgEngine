/// scrTalentDraw(x, y, telentTree, talentID, lineX, lineY)

var xx, yy, tTree, tID, cA, c, c1;
xx    = x;
yy    = y;
tID   = 0;
tTree = talentEnum.treeThief;
cA    = 1;
c     = true;
c1    = true;

if (argument_count > 0) {xx    = argument[0];}
if (argument_count > 1) {yy    = argument[1];}
if (argument_count > 2) {tID   = argument[3];}
if (argument_count > 3) {tTree = argument[2];}

if (argument_count > 5)
{
 draw_line_width_colour(xx, yy, argument[4], argument[5], 3, c_black, c_gray);
}

if (tTree == talentEnum.treeThief) {if (telentThiefRegID[tID, 0] != -1) {if (telentLevel[tTree, telentThiefRegID[tID, 0]] < telentThiefRegLvl[tID, 0]) {c = false;}} if (telentThiefRegID[tID, 1] != -1) {if (telentLevel[tTree, telentThiefRegID[tID, 1]] < telentThiefRegLvl[tID, 1]) {c1 = false;}}}
//else if (tTree == talentEnum.treeWarrior) {draw_sprite(sTalentsWarrior, tID, xx, yy);}
//else if (tTree == talentEnum.treeMage) {draw_sprite(sTalentsMage, tID, xx, yy);}

if (!c || !c1) {cA = 0.5;}


if (telentLevel[tTree, tID] == telentLevelMax[tTree, tID])
    {
    if (global.shaders_enabled)
        {
        shader_set(shdColor);
        shader_set_uniform_f(channel_mask, 1, 1, 0, 1);
        
        if (tTree == talentEnum.treeThief) {draw_sprite_ext(sTalentsThief, tID, xx, yy, 1, 1 , 0, c_white, cA);}
        else if (tTree == talentEnum.treeWarrior) {draw_sprite_ext(sTalentsWarrior, tID, xx, yy, 1, 1 , 0, c_white, cA);}
        else if (tTree == talentEnum.treeMage) {draw_sprite_ext(sTalentsMage, tID, xx, yy, 1, 1 , 0, c_white, cA);}
                        
        shader_reset();
        }
        else {draw_self();}
     
    }
else 
{
if (tTree == talentEnum.treeThief) {draw_sprite_ext(sTalentsThief, tID, xx, yy, 1, 1 , 0, c_white, cA);}
else if (tTree == talentEnum.treeWarrior) {draw_sprite_ext(sTalentsWarrior, tID, xx, yy, 1, 1 , 0, c_white, cA);}
else if (tTree == talentEnum.treeMage) {draw_sprite_ext(sTalentsMage, tID, xx, yy, 1, 1 , 0, c_white, cA);}
}

if (telentLevel[tTree, tID] != 0 && telentLevel[tTree, tID] != telentLevelMax[tTree, tID])
{
alg("center", fntPixelSmall);
draw_text(xx + 16, yy - 8, string(telentLevel[tTree, tID]) + " / " + string(telentLevelMax[tTree, tID]))
alg();
}
if (telentLevel[tTree, tID] == telentLevelMax[tTree, tID])
{
alg("center", fntPixelSmall);
draw_text_colour(xx + 16, yy - 8, "Max (" + string(telentLevelMax[tTree, tID]) + ")", c_yellow, c_yellow, c_yellow, c_yellow, 1);
alg();
}

if (mouse_in(xx, xx + 32, yy, yy + 32))
    {
     hover = true;
     if (tTree == talentEnum.treeThief) {drawText = telentThiefText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentThiefTextTitle[tID]; if (!c) {drawText += "##" + scrColorflag(c_red) + "Nejprve potřebuješ talent " + string(telentThiefTextTitle[telentThiefRegID[tID, 0]]) + "#na úrovni " + string(telentThiefRegLvl[tID, 0]);} if (!c1) {drawText += "##" + scrColorflag(c_red) + "Nejprve potřebuješ talent " + string(telentThiefTextTitle[telentThiefRegID[tID, 1]]) + "#na úrovni " + string(telentThiefRegLvl[tID, 1]);}}
     if (tTree == talentEnum.treeWarrior) {drawText = telentWarriorText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentWarriorTextTitle[tID];}
     if (tTree == talentEnum.treeMage) {drawText = telentMageText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentMageTextTitle[tID];}
  
     if (mouse_check_button_pressed(mb_left))
        {
         if (oPlayer.talentPoints > 0 && c)
            {
             if (telentLevel[tTree, tID] < telentLevelMax[tTree, tID])
                {
                 telentLevel[tTree, tID]++;
                 oPlayer.talentPoints--;
                 effectTalentUp(xx + 16, yy + 16, 10);
                }
            }
        }
    }


