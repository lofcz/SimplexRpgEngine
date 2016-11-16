/// itemRarityEffect(rarity, isSmall)

var color, is;
index = 0;
is    = false;

if (argument_count > 0) {color = argument[0];}
if (argument_count > 1) {is    = argument[1];}

if (!is)
{
if (color == rarity_normal)
   {
    index = 1;
   } 
if (color == rarity_fine)
   {
    index = 2;
   } 
if (color == rarity_rare)
   {
    index = 3;
   }
if (color == rarity_quest)
   {
    index = 10;
   }  
if (color == rarity_legendary)
   {
    index = 4;
   } 
if (color == rarity_mythic)
   {
    index = 12;
   }
}
else
{
if (color == rarity_normal)
   {
    index = 1;
   } 
if (color == rarity_fine)
   {
    index = 7;
   } 
if (color == rarity_rare)
   {
    index = 8;
   }
if (color == rarity_legendary)
   {
    index = 9;
   }
if (color == rarity_mythic)
   {
    index = 12;
   }
}

return (index);
