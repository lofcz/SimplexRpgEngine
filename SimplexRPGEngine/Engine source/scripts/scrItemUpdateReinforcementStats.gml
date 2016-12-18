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
         if (i != vlastnost_reinforcementCostBase && i != vlastnost_reinforcementCostInc && i != vlastnost_reinforcementCostIncM && i != vlastnost_reinforcementIs && i != vlastnost_reinforcementLevel && i != vlastnost_bodyCanvasIndex && i != vlastnost_bodyCanvasSprite && i != vlastnost_bodyCanvasSlashSprite && i != vlastnost_stamina_cost)
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
         if (i != vlastnost_reinforcementCostBase && i != vlastnost_reinforcementCostInc && i != vlastnost_reinforcementCostIncM && i != vlastnost_reinforcementIs && i != vlastnost_reinforcementLevel && i != vlastnost_bodyCanvasIndex && i != vlastnost_bodyCanvasSprite && i != vlastnost_bodyCanvasSlashSprite && i != vlastnost_stamina_cost)
            { 
             oInventory.slot_vlastnosti[s, i] = round((oInventory.slot_vlastnosti[s, i] / 100) * m);
            }
        }
    }    
    }
