
var xx, yy, tar_x, tar_y;
xx = x + 32;
yy = y - 80;
tar_x = xx + 16;
tar_y = yy + 16;
tX = 0;
tY = 0;

for (a = 0; a < 5 * 3; a++)
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
      b.x                = xx + tX;
      b.y                = yy + tY;
      b.loot            = 2;
      b.drop_id         = (id);
      b.slot            = a;
      b.show_number     = 1;
      b.animateDrop     = 0;
      b.animateDropDir  = 0;
      b.animateDropForce = 0;
      b.vlastnost[vlastnost_cena] = 10;
      b.vlastnost[vlastnost_originalniCena] = b.vlastnost[vlastnost_cena];

      item[a] = (b.id);
      
      loot[a,ext_name]  = -1;
      fill[a]           = 1;
     }
     
     tX += 24;
     if (tX >= 120) {tX = 0; tY += 24;}     
       tar_x = xx + 16 + tX;
       tar_y = yy + 16 + tY;      
       
     //  show_message(tar_x);

    } 
