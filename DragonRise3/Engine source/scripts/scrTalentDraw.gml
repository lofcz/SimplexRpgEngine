/// scrTalentDraw(x, y, telentTree, talentID, lineX, lineY)

var xx, yy, tTree, tID;
xx    = x;
yy    = y;
tID   = 0;
tTree = talentEnum.treeThief;

if (argument_count > 0) {xx    = argument[0];}
if (argument_count > 1) {yy    = argument[1];}
if (argument_count > 2) {tID   = argument[2];}
if (argument_count > 3) {tTree = argument[3];}

if (argument_count > 5)
{
 draw_line_width_colour(xx, yy, argument[4], argument[5], 3, c_black, c_gray);
}

if (telentLevel[tTree, tID] == telentLevelMax[tTree, tID])
    {
    if (global.shaders_enabled)
        {
        shader_set(shdColor);
        shader_set_uniform_f(channel_mask, 1, 1, 0, 1);
        
        if (tTree == talentEnum.treeThief) {draw_sprite(sTalentsThief, tID, xx, yy);}
        else if (tTree == talentEnum.treeWarrior) {draw_sprite(sTalentsWarrior, tID, xx, yy);}
        else if (tTree == talentEnum.treeMage) {draw_sprite(sTalentsMage, tID, xx, yy);}
                        
        shader_reset();
        }
        else {draw_self();}
     
    }
else 
{
if (tTree == talentEnum.treeThief) {draw_sprite(sTalentsThief, tID, xx, yy);}
else if (tTree == talentEnum.treeWarrior) {draw_sprite(sTalentsWarrior, tID, xx, yy);}
else if (tTree == talentEnum.treeMage) {draw_sprite(sTalentsMage, tID, xx, yy);}
}

if (telentLevel[tTree, tID] != 0)
{
alg("center", fntPixelSmall);
draw_text(xx, yy, string(telentLevel[tTree, tID]) + " / " + string(telentLevelMax[tTree, tID]))
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
     if (tTree == talentEnum.treeThief) {drawText = telentThiefText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentThiefTextTitle[tID];}
     if (tTree == talentEnum.treeWarrior) {drawText = telentWarriorText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentWarriorTextTitle[tID];}
     if (tTree == talentEnum.treeMage) {drawText = telentMageText[tID, telentLevel[tTree, tID]]; drawTextTitle = telentMageTextTitle[tID];}
  
    
    }


