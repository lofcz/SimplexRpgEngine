#define playerAPI
/// playerAPI()
/*

- apiPlayermove()

  Used to control player movement
  
- apiPlayerMoveStand()

  Stops the player animation when needed

#define apiPlayerMove
/// apiPlayerMove()

math_set_epsilon(0.0000001);
apiPlayerRegenerate()

if (can_move && can_move2 && can_move3 && can_move4 && can_move5) 
    {  
     if (currentAnimation == animationEnum.walk)
     { 
    if (keyboard_check(ord("W"))) 
        {
        a1 = 0
        dir = "w";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 90;
        speed = temp_rychlost;
        apiPlayerSprint();
        
        } 
    
    if (keyboard_check(ord("S"))) 
        {
        a1 = 0
        dir = "s";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 270;
        speed = temp_rychlost;
        apiPlayerSprint();

        
          oPlayerCombat.dir_rot = -20;
        
        if (m1 = 0)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5  oPlayerCombat.move_rot -= 10;} else {m1 = 1;}
           }
         if (m1 = 1)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5 oPlayerCombat.move_rot += 20;} else {m1 = 0; oPlayerCombat.move_rot = 0;}
           }

        } 
        
    if (keyboard_check(ord("A"))) 
        {
        //if (dir != "a") {oPlayerCombat.xxx = 0; oPlayerCombat.yyy = 0; oPlayerCombat.move_rot = 0;} 
        a1 = 0
        dir = "a";        
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 180;
        speed = temp_rychlost;
        apiPlayerSprint();

       
       oPlayerCombat.dir_rot = +25;
        
        if (m2 = 0)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5  oPlayerCombat.move_rot -= 15;} else {m2 = 1;}
           }
      
            if (m2 = 1)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5 oPlayerCombat.move_rot += 10;} else {m2 = 0; oPlayerCombat.move_rot = 0;}
           }

      
        
        }  
        
    if (keyboard_check(ord("D")))
        {
        a1 = 0
        dir = "d";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 360;
        speed = temp_rychlost;
        apiPlayerSprint();
        tempN += 15;
        z = lerp(z, 30, 0.3);

        
       oPlayerCombat.dir_rot = -20;
        
        if (m1 = 0)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5  oPlayerCombat.move_rot -= 10;} else {m1 = 1;}
           }
         if (m1 = 1)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5 oPlayerCombat.move_rot += 20;} else {m1 = 0; oPlayerCombat.move_rot = 0;}
           }
        text = string(sin(degtorad(tempN)));
        if (image_index > 8 && image_index < 9) {oPlayerCombat.xxx = 1; oPlayerCombat.move_rot += z; }
        else if (image_index > 10 && image_index < 11) {oPlayerCombat.xxx = -1; oPlayerCombat.move_rot -= 10;}
        else {oPlayerCombat.xxx = 0; oPlayerCombat.move_rot = 0; tempN = 0; z = 0; }                
        }  
        
        if (keyboard_check_pressed(ord("N")))
            {
             if (oPlayerCombat.attack = 0 &&  oPlayerCombat.attackMode == "attack" && oPlayer.vlastnost[vlastnost_stamina] >= oPlayer.vlastnost[vlastnost_parry_cost])
                {
                 oPlayerCombat.attackMode = "parry";
                 oPlayerCombat.parryTimer = oPlayerCombat.parryTimerMax;
                 oPlayer.vlastnost[vlastnost_stamina] -= oPlayer.vlastnost[vlastnost_parry_cost];
                 oPlayer.parrySlowdown = oPlayerCombat.parryTimerSlowdown;
                 oPlayerCombat.parryAngle = 0;
                }
            }
            
        if (oPlayerCombat.parryTimer > 0)
            {
             oPlayerCombat.parryTimer--;
             if (oPlayerCombat.parryTimer <= 0) {oPlayerCombat.attackMode = "attack"; oPlayer.parrySlowdown = 100;}
            }
        
        
        
    if ((!keyboard_check(ord("W")) && !keyboard_check(ord("S"))  && !keyboard_check(ord("A"))  && !keyboard_check(ord("D"))) && a1 = 0)
        {
        a1 = 1;
        alarm[0] = 3;
        dir = "";
        image_speed = 0;
        speed = 0;
        image_index = 12;
        }
    } 
    
    
if (!can_move && currentAnimation = animationEnum.walk)
    {
    dir = "s" 
    image_index = 12;
    }    
if (dir = "w")
    {
     if (image_index < 0 || image_index > 5.9)
            {
            image_index = 0;
            } 
    }
if (dir = "s")
    {
     if (image_index < 12 || image_index > 17.9)
            {
            image_index = 12;
            } 
    }    
if (dir = "a")
    {
     if (image_index < 6 || image_index > 11.9)
            {
            image_index = 6;
            } 
    }    
if (dir = "d")
    {
     if (image_index < 18 || image_index > 23.9)
            {
            image_index = 18;
            } 
    }            
}    


#define apiPlayerMoveStand
/// apiPlayerMoveStand()

math_set_epsilon(0.0001);

if (currentAnimation == animationEnum.walk)
{
     if (image_index > 12 && image_index < 17.99)
            {
            image_index = 12;
            } 


     if (image_index > 0 && image_index < 5.99)
            {
            image_index = 0;
            } 
   

     if (image_index > 6 && image_index < 11.99)
            {
            image_index = 6;
            } 
    

     if (image_index > 18 && image_index < 23.99)
            {
            image_index = 18;
            } 
}

#define apiPlayerSprint
/// apiPlayerSprint()
  if (keyboard_check(vk_shift))       
           {
            if (vlastnost[vlastnost_stamina] > 0) {vlastnost[vlastnost_stamina] -= 0.1; speed += 1; sprinting = 1; effectSprint();}
             else {sprinting = 0;} 
           }
           else {sprinting = 0;}


#define apiPlayerRegenerate
/// apiPlayerRegenerate()

if (stamina_tick > 0 && !sprinting) {stamina_tick --;}
   else
       {
        if (!sprinting)
        {
        stamina_tick = vlastnost[vlastnost_tick_stamina];
        vlastnost[vlastnost_stamina] += vlastnost[vlastnost_tick_stamina_add];
        }
       }
#define apiPlayerDraw
/// apiPlayerDraw()

// Draw body canvas
for (i = 0; i < 15; i++)
    {
     if (bci[i] != 0) {draw_sprite(bci[currentAnimation, i], image_index, x, y);}     
    }

if (currentAnimation != animationEnum.walk)
{
 image_speed = 0.4;
 
 if (currentAnimation == animationEnum.slash)
    {
     draw_sprite(sBodyCanvasAttackWeapon1, image_index, x, y);
    }
 
 
 if (last_dir == "s" || last_dir == "")
    {
     if (image_index > 17) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 12; image_speed = 0;}
    }
 if (last_dir == "d")
    {
     if (image_index >= 23) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 18; image_speed = 0;}
    }
 if (last_dir == "a")
    {
     if (image_index >= 11) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 6; image_speed = 0;}
    }
 if (last_dir == "w")
    {
     if (image_index >= 5) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 0; image_speed = 0;}
    }
}




// Update vars
stamina_dif = abs(last_stamina - vlastnost[vlastnost_stamina]);
health_dif  = abs(last_hp - vlastnost[vlastnost_zivot]);

if (stamina_dif <= 5) {stamina_bar = 0.1;}
if (health_dif <= 5)  {health_bar = 0.1;}
else {health_bar = 1;} 

      
if (last_hp < vlastnost[vlastnost_zivot]) {last_hp = lerp(last_hp, vlastnost[vlastnost_zivot], 0.1);}
if (last_hp > vlastnost[vlastnost_zivot]) {last_hp = lerp(last_hp, vlastnost[vlastnost_zivot], 0.1);}

if (last_stit < vlastnost[vlastnost_stit]) {last_stit++;}
if (last_stit > vlastnost[vlastnost_stit]) {last_stit--;}

if (last_mana < vlastnost[vlastnost_mana]) {last_mana++;}
if (last_mana > vlastnost[vlastnost_mana]) {last_mana--;}

if (last_stamina < vlastnost[vlastnost_stamina]) {last_stamina += stamina_bar;}
if (last_stamina > vlastnost[vlastnost_stamina]) {last_stamina -= stamina_bar;}

if (last_xp < vlastnost[vlastnost_zkusenosti]) {last_xp++;}
if (last_xp > vlastnost[vlastnost_zkusenosti]) {last_xp--;}

if (last_hp <= 0 && last_hp != 0) {last_hp = 0; scrGoreExplode(10,10);}

#define apiPlayerUnstuck
/// apiPlayerUnstuck()

with(oPlayer)
{
if (!place_empty(x, y))
{
tX = x;
tY = y;

// Get distances
while(!place_empty(tX, tY)) {tX--;}
dis[0] = abs(x - tX);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tX++;}
dis[1] = abs(x - tX);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tY++;}
dis[2] = abs(y - tY);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tY--;}
dis[3] = abs(y - tY);

// Get min distance and prioritize last direction
minDistance   = min(dis[0], dis[1], dis[2], dis[3]);
deltaDistance = 0;

if (last_dir == "s") {deltaDistance = dis[2];}
if (last_dir == "w") {deltaDistance = dis[3];}
if (last_dir == "d") {deltaDistance = dis[1];}
if (last_dir == "a") {deltaDistance = dis[0];}

difDistance = abs(deltaDistance - minDistance);

if (difDistance < 3) 
    {
     if (last_dir == "s") {y += dis[2];}
     if (last_dir == "w") {y -= dis[3];}
     if (last_dir == "d") {x += dis[1];}
     if (last_dir == "a") {x -= dis[0];}     
    }
else
    {
     for (i = 0; i < 3; i++)
        {
         if (minDistance == dis[i])
            {
             if (i == 0) {x -= dis[i];}
             if (i == 1) {x += dis[i];}
             if (i == 2) {y += dis[i];}
             if (i == 3) {y -= dis[i];}             
            }
        }
    }
}
}
#define apiPlayerGetProperty
/// apiPlayerGetProperty(index)

var index, text, cbu, hint, ut;
index = 0;
text  = "";
cbu   = true;
hint  = "";
ut    = 0;

if (argument_count > 0) {index = argument[0];}

 switch(index)
                    {
                    case(vlastnost_bonusove_poskozeni_vuci_zviratum):
                         {
                           text = "Poškození vůči zvířatům";
                           cbu  = false;
                           ut   = 1000;
                           break;                                                                   
                         }
                    case(vlastnost_stackSezehnuti):
                         {
                           text = "Šance na sežehnutí při zásahu";
                           cbu  = false;
                           ut   = 1000;
                           break;                                                                   
                         }
                     case(vlastnost_poskozeni):
                         {
                           text = "Poškození";
                           cbu  = false;
                           break;                                                                   
                         }
                     case(vlastnost_max_zivot):
                         {
                           text = "Život";
                           cbu  = false;
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           text = "Stamina za úder";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           text = "Mana"; 
                           cbu  = false;                          
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           text = "Síla";
                           hint = "Síla zvyšuje tvé fyzické poškození.";
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           text = "Obratnost";
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           text = "Kovářství";
                           ut   = 1;
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           text = "Těžařství";
                           ut   = 1;
                           break;                                                                   
                         }    
                    case(vlastnost_alchymie):
                         {
                           text = "Alchymie";
                           ut   = 1;
                           break;                                                                   
                         }                 
                    case(vlastnost_odolnost):
                         {
                           text = "Odolnost";
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           text = "Vytrvalost";
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           text = "Přesnost";
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           text = "Rychlost";
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           text = "Odolnost";
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           text = "Svádění";
                           ut   = 2;
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           text = "Zastrašování";
                           ut   = 2;
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           text = "Důstojnost";
                           ut   = 2;
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           text = "Výřečnost";
                           ut   = 2;
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           text = "Elegance";
                           ut   = 2;
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           text = "Čest";
                           ut   = 4;
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           text = "Kapsářství";
                           ut   = 4;
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           text = "Páčení zámků";
                           ut   = 4;
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           text = "Vůle";
                           ut   = 3;
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           text = "Inteligence";
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           text = "Rituály";
                           ut   = 3;
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           text = "Tradiční magie";
                           ut   = 3;
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           text = "Astrální vidění";
                           ut   = 3;
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           text = "Meče";
                           ut   = 5
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           text = "Dýky";
                           ut   = 5;
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           text = "Lukostřelba";
                           ut   = 5;
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           text = "Kopí";
                           ut   = 5;
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           text = "Jednoruční zbraně";
                           ut   = 5;
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           text = "Dvojruční zbraně";
                           ut   = 5;
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           text = "Štíty";
                           ut   = 5;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           text = "Obecná ochrana vůči poškození";
                           cbu  = false;
                           ut   = 667;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           text = "Země";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           text = "Oheň";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           text = "Voda";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           text = "Temnota";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           text = "Světlo";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           text = "Vítr";
                           cbu  = false;
                           ut   = 666;
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           text = "Zdraví";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           text = "Mana";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           text = "Stamina";
                           cbu  = false;
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           text = "Stamina";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           text = "Šance na kritický úder";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           text = "Násobitel kritického úderu";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           text = "Štít";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           text = "Štít";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_zkusenosti):
                         {
                           text = "Zkušenosti";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_max_zkusenosti):
                         {
                           text = "Zkušenosti potřebné k dosažení další úrovně";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_level):
                         {
                           text = "Úroveň hrdiny";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           text = "Rychlost regenerace staminy";
                           cbu  = false;
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           text = "Množství obnovené staminy";
                           cbu  = false;
                           break;                                                                   
                         }
                         
                    
}

returnedArray[0] = text;
returnedArray[1] = cbu;
returnedArray[2] = ut;
returnedArray[3] = hint;

if (returnedArray[0] != "") {return true;} else {return false;}
#define apiPlayerUpdateProperties
/// apiPlayerUpdateProperties()

oPlayer.vlastnost[vlastnost_zivot]   = clamp(oPlayer.vlastnost[vlastnost_zivot],   0, oPlayer.vlastnost[vlastnost_max_zivot]);
oPlayer.vlastnost[vlastnost_mana]    = clamp(oPlayer.vlastnost[vlastnost_mana],    0, oPlayer.vlastnost[vlastnost_max_mana]);
oPlayer.vlastnost[vlastnost_stamina] = clamp(oPlayer.vlastnost[vlastnost_stamina], 0, oPlayer.vlastnost[vlastnost_max_stamina]);
oPlayer.vlastnost[vlastnost_stit]    = clamp(oPlayer.vlastnost[vlastnost_stit],    0, oPlayer.vlastnost[vlastnost_max_stit]);

if (oPlayer.last_hp < 0) {oPlayer.last_hp = 0;}
#define apiPlayerGetXP
/// apiPlayerGetXP(value, allowBonusXP)

var value, abxp;
value = 0;
abxp  = true;

if (argument_count > 0) {value = argument[0];}
if (argument_count > 1) {abxp  = argument[1];}

if (abxp) {value = value + (value * (oPlayer.vlastnost[vlastnost_bonusoveZkusenosti] / 100));}
oPlayer.vlastnost[vlastnost_zkusenosti] += value;

return(round(value));