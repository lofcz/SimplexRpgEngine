/// combatHandle()


x           = oPlayer.x;
y           = oPlayer.y;
image_speed = 0;


draw_text(oPlayer.x,oPlayer.y+60,oPlayer.vlastnost[vlastnost_vykresli_sprit]);
draw_text(oPlayer.x,oPlayer.y+80,oInventory.h_c);

if (instance_number(oPlayer) > 0)
{     
//sprite_index = oPlayer.vlastnost[vlastnost_vykresli_sprit];
sprite_index = sWeaponCollision;



sprite = oPlayer.draw_equ[id_Mec,0];
index  = oPlayer.draw_equ[id_Mec,1];

      
if (sprite != 0)
{
xx = oPlayer.x;
yy = oPlayer.y;


if (keyboard_check_pressed(vk_space))
   {
    if (!attack && oPlayer.last_stamina >= oPlayer.vlastnost[vlastnost_stamina_cost])
       {
        audio_play_sound(sndSword2,0,0);
        attack = 1;
        tick   = oPlayer.attack_interval;
        mode   = 1;
        sharp  = 1;
        untick = 1;
        k = 0;                                 //show_message("grrr!");
        can_damage = -1;
        oPlayer.vlastnost[vlastnost_stamina] -= oPlayer.vlastnost[vlastnost_stamina_cost];
       }
   }

if (tick > 0)
   {
    tick -= tick_rate;
   }   
   else {if (untick = 1) {attack = 0; untick = 0;}}

if (attack = 1)
   {
   k ++;
   
   if (oPlayer.last_dir = "d")
   {
    if (mode = 1)
       {
        if (temp_rot < 75) {temp_rot += 100;} else {mode = 0; }
       }
    if (mode = 0)
       {
        if (temp_rot > -100) {temp_rot -= 50+k;} else {mode = -1; temp_rot = -100; }
       }
    if (mode = -1)
       {
        if (temp_rot < 0) {temp_rot += 75+k;} else {mode = -2; temp_rot = 0;can_damage = -2;}
       }
    }
    
 if (oPlayer.last_dir = "a")
   {
    if (mode = 1)
       {
        if (temp_rot >-75 ) {temp_rot -= 100;} else {mode = 0; }
       }
    if (mode = 0)
       {
        if (temp_rot < 0) {temp_rot += 75+k;} else {mode = -1; temp_rot = +40; }
       }
    if (mode = -1)
       {
        if (temp_rot > 0) {temp_rot -= 75+k;} else {mode = -2; temp_rot = 0;can_damage = -2;}
       }
   }
   

   }   

if (oPlayer.last_dir = "d") 
   {
   rot = 0;   depth = -11; xx += 6; yy += 8;

   }
if (oPlayer.last_dir = "w") {rot = 90;  depth = -9;  yy -= 6; xx += 8;}
if (oPlayer.last_dir = "s") {rot = -90; depth = -11; yy+= 12; xx += 10;}
if (oPlayer.last_dir = "a") {rot = 180; depth = -11; xx -= 5; yy += 16}


draw_sprite_ext(sprite,image,xx+xxx,yy+yyy,scale,scale,rot+temp_rot+move_rot+dir_rot,color,alpha);
x = xx;
y = yy;


}
}

if (can_damage > 0) {can_damage--;} else {if (attack && can_damage > -2) {can_damage = -1;}}

x = oPlayer.x;
y = oPlayer.y;

if (oPlayer.last_dir = "d")
   {
    x-= 5;
    y-=12;
    image_index = 0;
   }
if (oPlayer.last_dir = "a")
   {
    x-= 30;
    y-=15;
    image_index = 2;
   }
if (oPlayer.last_dir = "w")
   {
    x-= 15;
    y-=32;
    image_index = 3;
   }
if (oPlayer.last_dir = "s")
   {
    x-= 32;
    y+=8;
    image_index = 1;
   }




//draw_self();
