/// scrItemUpdateReinforcementStats([slot])

var s, xx;
s  = -1;

if (argument_count > 0) {s = argument[0];}

// Item is not in the inventory
if (s == -1)
   {
    if (vlastnost[vlastnost_reinforcementLevel] >= 1)
    {
    xx = vlastnost[vlastnost_reinforcementLevel];
    m = ((((power(xx, 1)) + (log10(xx))) * 1) + 111.5); 
    for (var i = 0; i < celkem_vlastnosti; i++)
        {
         if (i != vlastnost_reinforcementCostBase && i != vlastnost_reinforcementCostInc && i != vlastnost_reinforcementCostIncM && i != vlastnost_reinforcementIs && i != vlastnost_reinforcementLevel && i != vlastnost_bodyCanvasIndex && i != vlastnost_bodyCanvasSprite && i != vlastnost_bodyCanvasSlashSprite && i != vlastnost_stamina_cost && i != vlastnost_upgradeSloty && i != vlastnost_maxUpgrade && i != vlastnost_upgradeMaterial1 && i != vlastnost_upgradeMaterial2 && i != vlastnost_upgradeMaterial3 && i != vlastnost_upgradeSprite1 && i != vlastnost_upgradeSprite2 && i != vlastnost_upgradeSprite3 && i != vlastnost_upgradeText1 && i != vlastnost_upgradeText2 && i != vlastnost_upgradeText3 && i != vlastnost_upgradeID1 && i != vlastnost_upgradeID2 && i != vlastnost_upgradeID3 && i != vlastnost_upgradeBaked1 && i != vlastnost_upgradeBaked2 && i != vlastnost_upgradeBaked3 && i != vlastnost_parry_cost)
            { 
             vlastnost[i] = round((vlastnost[i] / 100) * m);
            }
        }
    }
   }
else
    {
    if (oInventory.slot_vlastnosti[s, vlastnost_reinforcementLevel] >= 1)
    {
    xx = oInventory.slot_vlastnosti[s, vlastnost_reinforcementLevel];
    m = ((((power(xx, 1)) + (log10(xx))) * 1) + 111.5); 
    for (var i = 0; i < celkem_vlastnosti; i++)
        {
         if (i != vlastnost_reinforcementCostBase && i != vlastnost_reinforcementCostInc && i != vlastnost_reinforcementCostIncM && i != vlastnost_reinforcementIs && i != vlastnost_reinforcementLevel && i != vlastnost_bodyCanvasIndex && i != vlastnost_bodyCanvasSprite && i != vlastnost_bodyCanvasSlashSprite && i != vlastnost_stamina_cost && i != vlastnost_upgradeSloty && i != vlastnost_maxUpgrade && i != vlastnost_upgradeMaterial1 && i != vlastnost_upgradeMaterial2 && i != vlastnost_upgradeMaterial3 && i != vlastnost_upgradeSprite1 && i != vlastnost_upgradeSprite2 && i != vlastnost_upgradeSprite3 && i != vlastnost_upgradeText1 && i != vlastnost_upgradeText2 && i != vlastnost_upgradeText3 && i != vlastnost_upgradeID1 && i != vlastnost_upgradeID2 && i != vlastnost_upgradeID3 && i != vlastnost_upgradeBaked1 && i != vlastnost_upgradeBaked2 && i != vlastnost_upgradeBaked3 && i != vlastnost_parry_cost)
            { 
             oInventory.slot_vlastnosti[s, i] = round((oInventory.slot_vlastnosti[s, i] / 100) * m);
            }
        }
    }    
    }
