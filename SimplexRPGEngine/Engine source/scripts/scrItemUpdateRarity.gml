#define scrItemUpdateRarity
/// scrItemUpdateRarity(newRarity, updateStats, [slot])

var nr, us, s, oR;
nr = rarity_normal;
us = true;
s  = -1

if (argument_count > 0) {nr = argument[0];}
if (argument_count > 1) {us = argument[1];}
if (argument_count > 2) {s  = argument[2];}

// In inventory
if (s != -1)
   {
    oR = oInventory.slot[s, inv_item_effect];
    oInventory.slot[s, inv_item_effect]     = nr;
    oInventory.slot[s, inv_item_info_color] = nr;
 
    if (us)
       {
       rd = scrItemUpdateRarityGetClassAmt(oR, nr);
 
       // Now multiply values by % of rd
       for (i = 0; i < celkem_vlastnosti; i++)
           {
            if (scrInventoryPropertyIsUpgradable(i))  
               {
                oInventory.slot_vlastnosti[s, i] *= 1 + (rd / 10);  
                oInventory.slot_vlastnosti[s, i] = round(oInventory.slot_vlastnosti[s, i]);  
               }          
            }
       }
   }

#define scrItemUpdateRarityGetClassAmt
/// scrItemUpdateRarityGetClassAmt(oldRarity, newRarity)

var r, rd, i;
r[0] = rarity_junk;
r[1] = rarity_normal;

if (argument_count > 0) {r[0] = argument[0];}
if (argument_count > 1) {r[1] = argument[1];}

for (i = 0; i < 2; i++)
    {
     if (r[i] == rarity_junk)      {r[i] = 0;}
     if (r[i] == rarity_normal)    {r[i] = 1;}
     if (r[i] == rarity_fine)      {r[i] = 2;}
     if (r[i] == rarity_rare)      {r[i] = 4;}
     if (r[i] == rarity_mythic)    {r[i] = 6;}                    
     if (r[i] == rarity_legendary) {r[i] = 8;}                    
    }

rd = (r[1] - r[0]); // Delta r
return rd;