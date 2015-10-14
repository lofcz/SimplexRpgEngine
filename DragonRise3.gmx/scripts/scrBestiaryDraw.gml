/// scrBestiaryDraw()

clicked = 0;

if (activated)  {if (activated_x > -256) {activated_x -= activated_speed;  if (activated_speed < 7) {activated_speed += 0.2;}}}
if (!activated) {if (activated_x < 0) {activated_x += activated_speed} else {activated_speed = 2;}}

if (activated_x < -256 && activated) {activated_x = -256;}

v_x  = view_xview+800+activated_x;
v_y  = view_yview+155;  
pass = 0;

draw_sprite(sBestiar,0,v_x,v_y);

draw_set_alpha(1);   
draw_sprite_ext(sBestiar,2,v_x,v_y,1,1,0,c_white,1);
draw_set_colour(c_white);
draw_set_font(fntPixelHuge);
scrCenterText();
draw_text_colour(v_x+128,v_y+20,title[page],c_white,c_white,c_white,c_white,1);
scrCenterText(0);

for (a = 0; a < 4; a++)
{
f = page*4+a;

if (item_selected = -1) {yy[a] = v_y + 48+a*68;}
else 
     {
     if (mode = 0)
     {
     yy[a] = v_y + 48+a*68;
     
     if (a = item_selected) {yy[a] =  v_y + 48+a*68 - real_spd;}
     yyy[a] = v_y + 48+a*68;
     if (spd < spd_max) {spd += 0.01;} 
     if(!pass) {real_spd += spd;}
     if (yy[a] < v_y+48) {yy[a] = v_y+48; pass = 1;} else {pass = 0;}
     
     
     if (a != item_selected && mode = 0) {if (i_alpha[a] > 0) {i_alpha[a] -= 0.05;}}
     }
     }

  
draw_set_font(fntPixel);

draw_set_alpha(i_alpha[a]);



if (unlocked[f])
{
draw_sprite_ext(sBestiar,1,v_x,yy[a],1,1,0,c_white,i_alpha[a]);
draw_sprite_ext(monster[a,bestiary_monster_sprite],0,v_x+32,yy[a]+32,1,1,0,c_white,i_alpha[a]);
draw_text(v_x+70,yy[a]+5,monster[a,bestiary_monster_title]);
draw_text_colour(v_x+70,yy[a]+20,monster[a,bestiary_monster_race],c_ltgray,c_ltgray,c_ltgray,c_ltgray,i_alpha[a]);

draw_set_font(fntPixelTiny);
draw_text_colour(v_x+70,yy[a]+42,"Poraženo: " + string(monster[a,bestiary_monster_killed]),c_black,c_black,c_black,c_black,i_alpha[a]);
draw_set_font(fntPixel);

draw_set_alpha(1);

if (mouse_in(v_x,v_x+256,yy[a],yy[a]+68) && item_selected = -1 && mode = 0)
   {
   draw_sprite_ext(sBestiar,1,v_x,yy[a],1,1,0,c_red,alpha[page,a]);
     
     if (mouse_check_button_pressed(mb_left))
        {
         item_selected = a;
         clicked = 1;
         detail_alpha = 0;
        }
   }
}   
else
    {
    draw_sprite_ext(sBestiar,1,v_x,yy[a],1,1,0,c_white,i_alpha[a]);
    draw_text(v_x+70,yy[a]+5,"?????");
    draw_text_colour(v_x+70,yy[a]+20,"?????",c_ltgray,c_ltgray,c_ltgray,c_ltgray,i_alpha[a]);
   
    
    if (mouse_in(v_x,v_x+256,yy[a],yy[a]+68) && item_selected = -1 && mode = 0)
   {
   draw_sprite_ext(sBestiar,1,v_x,yy[a],1,1,0,c_red,alpha[page,a]);
   }
   
    }
  
}

q = 0;
if (item_selected != -1)
{
if (yy[item_selected] <= v_y+48)
   {
    q = 1;
   }
}
   
 if (pass || q) 
    {
    draw_set_alpha(1);
    pass2 = 0;
    
     if (rec_height < 315-48-64 && mode = 0) {if (spd2 < spd_max2) {spd2 += 0.2;} rec_height += spd2;} 
     else {pass2 = 1;}    
     if (mode = 0) {rec_height = min(rec_height,315-48-64);}
     
     draw_set_color(c_white);
     draw_sprite_part(sBestiar,5,0,100,256,rec_height,v_x,v_y+48+64);
    
 yy[0] =  v_y + 48;  
      
   if (mouse_in(v_x,v_x+256,yy[0],yy[0]+68) && item_selected != -1)
   {
   draw_sprite_ext(sBestiar,1,v_x,yy[0],1,1,0,c_red,1);
   
   if (mouse_check_button_pressed(mb_left) && clicked = 0)
      {
      if (mode = 0) {mode = 1;}
      }
   }
    }

if (pass2 && mode != 1)
   {    
    if (detail_alpha < 1 && mode = 0 && item_selected != -1) {detail_alpha += 0.05;}
    
    draw_set_font(fntPixel);    
    draw_set_alpha(detail_alpha);
    draw_text_colored(v_x+11,v_y+70+48,monster[active,bestiary_monster_details]);
    draw_set_alpha(1);
   }

if (mode = 1)
{
   if (rec_height > 0) {rec_height -= spd2;}
   if (detail_alpha > 0) {detail_alpha -= 0.05;}

   if (rec_height <= 0)
{   

for (a = 0; a < 4; a++)
{
     if (yy[a] < v_y + 48+a*68 && a = item_selected) {yy[a] += spd; pass3 = 1;} else {pass3 = 0;}          
     if (a != item_selected) {if (i_alpha[a] < 1) {i_alpha[a] += 0.05;} else {pass = 1;}}
     
      if (item_selected = 0) {if (i_alpha[1] >= 1) {pass3 = 0;} else {pass3 = 1;}}
      
     if (pass3 = 0 && a = item_selected)
        {        
        item_selected = -1; 
        mode = 0; 
        real_spd = 0; 
        spd2 = 0; 
        spd = 0;
        details_alpha = 0;
        detail_alpha = 0;
        pass2 = 0;
        
        }

}

}

}

clr();

