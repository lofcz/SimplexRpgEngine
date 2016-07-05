/// scrTalentUpgradeDB(tree, id, level)

var tree, talent, level;
tree   = talentEnum.treeThief;
talent = 0;
level  = 1;

if (argument_count > 0) {tree   = argument[0];}
if (argument_count > 1) {talent = argument[1];}
if (argument_count > 2) {level  = argument[2];}


// Zloděj
if (tree == talentEnum.treeThief)
    {
     // Dobrodruh
     if (talent == 0)  
        {
         if (level == 1)
            {
             oPlayer.vlastnost[vlastnost_max_zivot] += 2;
             oPlayer.vlastnost[vlastnost_zivot] += 2;
             oPlayer.vlastnost[vlastnost_max_stamina] += 2;
             oPlayer.vlastnost[vlastnost_stamina] += 2;
             oPlayer.vlastnost[vlastnost_zrucnost] += 1;
            }
        }
    }

// Mág
if (tree == talentEnum.treeMage)
    {
     if (talent == 0)  
        {
         if (level == 1)
            {
            
            }
        }
    }

// Válečník    
if (tree == talentEnum.treeWarrior)
    {
     if (talent == 0)  
        {
         if (level == 1)
            {
            
            }
        }
    }
