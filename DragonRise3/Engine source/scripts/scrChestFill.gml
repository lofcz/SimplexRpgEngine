/// scrChestFill()

xx = x-slots_row*16;
yy = y-slots_row*32-24;
tar_x = xx+16;
tar_y = yy+16;

for (a = 0; a < slots; a++)
    {
     if (loot[a,ext_name] != -1)
     {
      
      b                 = instance_create(xx+16,yy+16,loot[a,ext_name])
      b.itm_number      = loot[a,ext_number];
      b.on_click        = 1;
      b.hover_info      = 1;
      b.xx              = tar_x;
      b.yy              = tar_y;
      b.loot            = 1;
      b.drop_id         = id;
      b.slot            = a;
      b.show_number     = 1;
      b.animateDrop     = 0;
      b.animateDropDir  = 0;
      b.animateDropForce          = 0;
      
      loot[a,ext_name]  = -1;
      fill[a]           = 1;
     }
     
     xx += 32;
       
       if (xx >= x+(slots_row*16))
             {
             yy += 32;
             xx = x-slots_row*16;
             }
             
      tar_x = xx+16;
      tar_y = yy+16;

    } 
