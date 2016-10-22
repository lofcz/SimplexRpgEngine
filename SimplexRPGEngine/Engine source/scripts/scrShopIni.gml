/// scrShopIni()

isShop      = true;
slotsPerRow = 3;
rows        = 3;
pages       = 1;
shopActive  = false;
open        = false;

slots       = 15;
thumbnailImage = -1;
thumbnailPrice = -1;
thumbnailCount = -1;
thumbnailOriginalPrice = -1;
hoverSlot = 0;
shopText = "";

for (i = 0; i < slots; i++)
    {     
     item[i] = 0;
     slot[i, 0] = -1; // Item to be sold (id)
     slot[i, 1] = 0;  // Item price
     slot[i, 2] = 1;  // Item quantity
     slot[i, 3] = 0;  // % Discount      
     slotFlag[i] = "";  
    }
    
for (a = 0; a < slots; a++)
    {
     loot[a, ext_name]   = -1;
     loot[a, ext_number] =  1;           
     fill[a]             = 0;  
    }
