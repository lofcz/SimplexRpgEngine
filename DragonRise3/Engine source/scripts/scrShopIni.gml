/// scrShopIni()

isShop      = true;
slotsPerRow = 3;
rows        = 3;
pages       = 1;
shopActive  = false;
open        = false;

slots       = 15;

for (i = 0; i < slots; i++)
    {
     slot[i, 0] = -1; // Item to be sold (id)
     slot[i, 1] = 0;  // Item price
     slot[i, 2] = 1;  // Item quantity
     slot[i, 3] = 0;  // % Discount        
    }
    
for (a = 0; a < slots; a++)
    {
     loot[a,ext_name]   = -1;
     loot[a,ext_number] =  1;      
     
     fill[a] = 0;  
    }
