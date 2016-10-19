/// scrTalentCreate(tree, index, level, maxLevel, name, x, y, reqID1, reqLvl1, reqID2, reqLvl2)

var tree, index, level, maxLevel, name, xx, yy, rID1, rLvl1, rID2, rLvl2;
tree     = talentEnum.treeThief;
index    = 0;
level    = 0;
maxLevel = 1;
name     = "Talent name text [UNSET]";
xx       = x;
yy       = y;
rID1     = -1;
rID2     = -1;
rLvl1    = -1;
rLvl2    = -1;


if (argument_count > 0) {tree      = argument[0];} 
if (argument_count > 1) {index     = argument[1];} 
if (argument_count > 2) {level     = argument[2];} 
if (argument_count > 3) {maxLevel  = argument[3];} 
if (argument_count > 4) {name      = argument[4];} 
if (argument_count > 5) {xx        = argument[5];} 
if (argument_count > 6) {yy        = argument[6];} 
if (argument_count > 7) {rID1      = argument[7];}
if (argument_count > 8) {rLvl1     = argument[8];}
if (argument_count > 9) {rID2      = argument[9];}
if (argument_count > 10) {rLvl2    = argument[10];}

telentLevel[tree, index]    = level;
telentLevelMax[tree, index] = maxLevel;
telentX[tree, index]        = xx;
telentY[tree, index]        = yy;

if (tree = talentEnum.treeThief)
    {
     telentThiefTextTitle[index] = name;
     telentThiefRegID[index, 0]  = rID1;
     telentThiefRegID[index, 1]  = rID2;
     telentThiefRegLvl[index, 0] = rLvl1;
     telentThiefRegLvl[index, 1] = rLvl2;
    }
if (tree = talentEnum.treeMage)
    {
     telentMageTextTitle[index] = name;
     telentMageRegID[index, 0]  = rID1;
     telentMageRegID[index, 1]  = rID2;
     telentMageRegLvl[index, 0] = rLvl1;
     telentMageRegLvl[index, 1] = rLvl2;
    }
if (tree = talentEnum.treeWarrior)
    {
     telentWarriorTextTitle[index] = name;
     telentWarriorRegID[index, 0]  = rID1;
     telentWarriorRegID[index, 1]  = rID2;
     telentWarriorRegLvl[index, 0] = rLvl1;
     telentWarriorRegLvl[index, 1] = rLvl2;
    }


tempTree  = tree;
tempIndex = index;
tempLevel = 0;
