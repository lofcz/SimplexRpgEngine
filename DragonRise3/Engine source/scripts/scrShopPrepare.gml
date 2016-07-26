
var xx, yy, tar_x, tar_y;
xx = (x - (((slotsPerRow / 2) * 36) - 16));
yy = (y - (rows * 36 + 16));
tar_x = xx + 16;
tar_y = yy + 16;

for (a = 0; a < slots; a++)
    {
  //    if (a!= 0) {tar_x = xx + 32;}
    //  tar_y = yy + 16;
      
     if (loot[a,ext_name] != -1)
     {
      
      b                 = instance_create(xx,yy,loot[a,ext_name])
      b.itm_number      = loot[a,ext_number];
      b.on_click        = 1;
      b.hover_info      = 1;
      b.xx               = tar_x;
      b.yy               = tar_y;
      b.x                = xx + (4 * a);
      b.y                = yy;
      b.loot            = 2;
      b.drop_id         = id;
      b.slot            = a;
      b.show_number     = 1;
      b.animateDrop     = 0;
      b.animateDropDir  = 0;
      b.animateDropForce = 0;
      b.depth           = -8;
      b.vlastnost[vlastnost_cena] = 10;
      
      loot[a,ext_name]  = -1;
      fill[a]           = 1;
     }
     
     xx += 32;  
       
       if (xx >= (x + ((slotsPerRow / 2 * 36) - 16)))
             {
             yy += 32;
             xx  = (x - (((slotsPerRow / 2) * 36) - 16));
             }      
       tar_x = xx + 16;
       tar_y = yy + 16;      
       
     //  show_message(tar_x);

    } 
