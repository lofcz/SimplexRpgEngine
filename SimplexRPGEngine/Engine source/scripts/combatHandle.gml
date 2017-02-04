/// combatHandle()

if (instance_number(oPlayer) > 0)
{     
sprite_index = sWeaponCollision;
image_index  = 0;

if (oPlayer.last_dir == "d") {x = oPlayer.x + 16; y = oPlayer.y - 16;}
if (oPlayer.last_dir == "a") {x = oPlayer.x - 64; y = oPlayer.y - 16;}
if (oPlayer.last_dir == "w") {x = oPlayer.x - 24; y = oPlayer.y - 64;}
if (oPlayer.last_dir == "s") {x = oPlayer.x - 24; y = oPlayer.y + 32;}
      
if (sprite != 0)
{
xx = oPlayer.x;
yy = oPlayer.y;

if (charging && chargeTimer < maxCharge) {chargeTimer++;}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("N")))
    {
     charging      = true;
     oPlayer.speed = 0;
     oPlayer.image_speed = 0;
     with(oPlayer) {apiPlayerMoveStand();}
    }

if (keyboard_check_pressed(vk_alt)) {chargeMode = !chargeMode;}

if ((keyboard_check_released(vk_space) && chargeMode) || (keyboard_check_pressed(vk_space) && !chargeMode))
   {   
    if (!attack && apiPlayerGetPropertyValue(vlastnost_stamina, false, true) >= apiPlayerGetPropertyValue(vlastnost_stamina_cost, false, true) && !animating && oPlayer.weapon_type != "")
       {
        tick   = oPlayer.attack_interval;
        mode   = 1;
        sharp  = 1;
        untick = 1;
        k = 0;  
        can_damage = -1;
        oPlayer.vlastnost[vlastnost_stamina] -= apiPlayerGetPropertyValue(vlastnost_stamina_cost, false, true);
        animating = true;

        attackMode = "attack";
        if (oPlayer.weaponType == "melee") 
           {
            oPlayer.currentAnimation = animationEnum.slash;
            ss = instance_create(xx, yy, oSwordSwing);
            ss.dir = oPlayer.last_dir;    
            audio_play_sound(choose(sndSwing1, sndSwing2, sndSwing3), 0, 0);  
            attack = true;
            oPlayer.sprite_index = oPlayer.bci[1, 0];       
            if (oPlayer.bci[0, 8] != 0)
            {
             if (oInventory.equiped_vlastnost[0, vlastnost_reinforcementLevel] >= 3) {with(oPlayer) {effectWearP3(oPlayerCombat.x + 24, oPlayerCombat.y + 24, 10);}}
            }                                   
           }
        if (oPlayer.weaponType == "spear") 
           {
            oPlayer.currentAnimation = animationEnum.thrust;
            ss = instance_create(xx, yy, oSwordSwing);
            ss.dir = oPlayer.last_dir;    
            audio_play_sound(choose(sndSwing1, sndSwing2, sndSwing3), 0, 0);  
            attack = true;
            oPlayer.sprite_index = oPlayer.bci[animationEnum.thrust, 0];                                       
           }           
        if (oPlayer.weaponType == "bow" && oInventory.equiped[5])      
           {     
            if (oInventory.equiped_stats[5, inv_number] > 0)
               {
                oPlayer.currentAnimation = animationEnum.fire; 
                oPlayer.sprite_index     = oPlayer.bci[2, 0];                
               }
            else {apiPlayerSay("Nemám šípy!");}
            
            if (oInventory.equiped_stats[5, inv_number] == 1)
               {
                oInventory.equiped_image[5,0] = sFreeSlot;
                oInventory.equiped_image[5,1] = 0;
                oInventory.equiped[5]         = false; 
                apiPlayerSay("Můj poslední šíp");
               }  
           }
        else if (oPlayer.weaponType == "bow")
            {
             apiPlayerSay("Nemám šípy");
            }
        
        
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
             oPlayer.image_index = 6;
            }                         
         }
        oPlayer.speed = 0;
        oPlayer.image_speed = 0;
        charging    = false;
        chargeTimer = 0;
   }

if (keyboard_check_released(ord("N")))
   {   
    if (!attack && !animating)
       {
        tick   = oPlayer.attack_interval;
        mode   = 1;
        sharp  = 1;
        untick = 1;
        k = 0;  
        can_damage = -1;
        oPlayer.vlastnost[vlastnost_stamina] -= apiPlayerGetPropertyValue(vlastnost_stamina_cost, false, true);
        animating = true;
        if (oPlayer.weaponType2 == "shield") 
           {
            oPlayer.currentAnimation = animationEnum.bash;  
            sfx(sndBash);  
            oPlayer.sprite_index = oPlayer.bci[animationEnum.bash, 0];                                        
           }
                              
         }
        oPlayer.speed = 0;
        oPlayer.image_speed = 0;
        oPlayer.image_index = 0;
        charging    = false;
        chargeTimer = 0;
   }

if (tick > 0)
   {
    tick -= tick_rate;
   }   
   else {if (untick) {animating = false attack = false; untick = false; ds_list_clear(hitList);}}
}
}

if (can_damage > 0) {can_damage--;} else {if (attack && can_damage > -2) {can_damage = -1;}}
