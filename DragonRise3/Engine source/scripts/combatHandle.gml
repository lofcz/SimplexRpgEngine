/// combatHandle()


x           = oPlayer.x;
y           = oPlayer.y;
image_speed = 0;

if (instance_number(oPlayer) > 0)
{     
sprite_index = sWeaponCollision;

sprite = oPlayer.draw_equ[id_Mec,0];
index  = oPlayer.draw_equ[id_Mec,1];
      
if (sprite != 0)
{
xx = oPlayer.x;
yy = oPlayer.y;


if (keyboard_check_pressed(vk_space))
   {
    if (!attack && oPlayer.vlastnost[vlastnost_stamina] >= oPlayer.vlastnost[vlastnost_stamina_cost] && attackMode == "attack")
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
        ss = instance_create(x, y, oSwordSwing);
        ss.dir = oPlayer.last_dir;
        attackMode = "attack";
        oPlayer.currentAnimation = animationEnum.slash;
        oPlayer.sprite_index = oPlayer.bci[1, 0];
        
        
         if (oPlayer.last_dir == "s" || oPlayer.last_dir == "")
            {
             oPlayer.image_index = 12;
            }
         if (oPlayer.last_dir == "d")
            {
             oPlayer.image_index = 18;
            } 
         if (oPlayer.last_dir == "w")
            {
             oPlayer.image_index = 0;
            }   
         if (oPlayer.last_dir == "a")
            {
             oPlayer.image_index = 18;
            }                         
         }
        oPlayer.speed = 0;
        oPlayer.image_speed = 0;
   }

if (tick > 0)
   {
    tick -= tick_rate;
   }   
   else {if (untick = 1) {attack = 0; untick = 0;}}

   
if (oPlayer.last_dir = "w") {rot = 90;  depth = -9;  yy -= 6; xx += 8;}
if (oPlayer.last_dir = "s") {rot = -90; depth = -11; yy+= 12; xx += 10;}
if (oPlayer.last_dir = "a") {rot = 180; depth = -11; xx -= 5; yy += 16}


}
}

if (can_damage > 0) {can_damage--;} else {if (attack && can_damage > -2) {can_damage = -1;}}

x = oPlayer.x;
y = oPlayer.y;

if (oPlayer.last_dir = "d")
   {
    x+= 15;
    y-=12;
    image_index = 0;
   }
if (oPlayer.last_dir = "a")
   {
    x-=60;
    y-=15;
    image_index = 2;
   }
if (oPlayer.last_dir = "w")
   {
    x-=20;
    y-=60;
    image_index = 3;
   }
if (oPlayer.last_dir = "s")
   {
    x-= 25;
    y+=30;
    image_index = 1;
   }




//draw_self();
