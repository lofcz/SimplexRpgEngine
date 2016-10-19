/// scrTalentSetText(tree, index, level, text)

var tree, index, level, text;
tree  = talentEnum.treeThief;
index = 0;
level = 0;
text  = "[UNDEFINED TEXT]";

if (argument_count > 0) {tree  = argument[0];}
if (argument_count > 1) {index = argument[1];}
if (argument_count > 2) {level = argument[2];}
if (argument_count > 3) {text  = argument[3];}

if (is_real(tree))
{
if (tree = talentEnum.treeThief)
    {
    telentThiefText[index, level] = text;
    }
if (tree = talentEnum.treeMage)
    {
    telentMageText[index, level] = text;
    }
if (tree = talentEnum.treeWarrior)
    {
    telentWarriorText[index, level] = text;
    }
}
else
{
if (tempTree = talentEnum.treeThief)
    {
    telentThiefText[tempIndex, tempLevel] = tree;
    }
if (tempTree = talentEnum.treeMage)
    {
    telentMageText[tempIndex, tempLevel] = tree;
    }
if (tempTree = talentEnum.treeWarrior)
    {
    telentWarriorText[tempIndex, tempLevel] = tree;
    }
tempLevel++;
}
