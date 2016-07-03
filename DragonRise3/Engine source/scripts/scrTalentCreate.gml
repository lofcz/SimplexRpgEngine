/// scrTalentCreate(tree, index, level, maxLevel, name, x, y)

var tree, index, level, maxLevel, name, xx, yy;
tree     = talentEnum.treeThief;
index    = 0;
level    = 0;
maxLevel = 1;
name     = "Talent name text [UNSET]";
xx       = x;
yy       = y;

if (argument_count > 0) {tree     = argument[0];} 
if (argument_count > 1) {index    = argument[1];} 
if (argument_count > 2) {level    = argument[2];} 
if (argument_count > 3) {maxLevel = argument[3];} 
if (argument_count > 4) {name     = argument[4];} 
if (argument_count > 5) {xx       = argument[5];} 
if (argument_count > 6) {yy       = argument[6];} 

telentLevel[tree, index]    = level;
telentLevelMax[tree, index] = maxLevel;
telentX[tree, index]        = xx;
telentY[tree, index]        = yy;

if (tree = talentEnum.treeThief)
    {
     telentThiefTextTitle[index] = name;
    }
if (tree = talentEnum.treeMage)
    {
     telentMageTextTitle[index] = name;
    }
if (tree = talentEnum.treeWarrior)
    {
     telentWarriorTextTitle[index] = name;
    }
