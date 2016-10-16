#define playerAPI
/// playerAPI()

/*

- apiPlayermove()

  Used to control player movement
  
- apiPlayerMoveStand()

  Stops the player animation when needed

#define apiPlayerMove
/// apiPlayerMove()

apiPlayerRegenerate()

// If nothing blocks player movement ability
if (can_move && can_move2 && can_move3 && can_move4 && can_move5 && can_move6 && !oPlayerCombat.charging) 
    {  
     if (currentAnimation == animationEnum.walk)
        { 
         // Handle IO input
         if (keyboard_check(ord("W"))) {dir = "w"; direction = 90;}     
         if (keyboard_check(ord("S"))) {dir = "s"; direction = 270;}         
         if (keyboard_check(ord("A"))) {dir = "a"; direction = 180;}          
         if (keyboard_check(testKey))  {dir = "d"; direction = 360;}  
        
         // Parry / block ability
         if (keyboard_check_pressed(ord("N")))
            {
             if (oPlayerCombat.attack = 0 &&  oPlayerCombat.attackMode == "attack" && oPlayer.vlastnost[vlastnost_stamina] >= oPlayer.vlastnost[vlastnost_parry_cost])
                {
                 oPlayerCombat.attackMode              = "parry";
                 oPlayerCombat.parryTimer              = oPlayerCombat.parryTimerMax;
                 oPlayer.vlastnost[vlastnost_stamina] -= oPlayer.vlastnost[vlastnost_parry_cost];
                 oPlayer.parrySlowdown                 = oPlayerCombat.parryTimerSlowdown;
                 oPlayerCombat.parryAngle              = 0;
                }
            }
            
        if (oPlayerCombat.parryTimer > 0)
            {
             oPlayerCombat.parryTimer--;
             if (oPlayerCombat.parryTimer <= 0) {oPlayerCombat.attackMode = "attack"; oPlayer.parrySlowdown = 100;}
            }   
         
        // In case of movement do the common stuff   
        if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D")))
            {
             a1          = 0
             last_dir    = dir;
             image_speed = (0.25 + (temp_rychlost / 100));
             speed       = temp_rychlost;
             apiPlayerSprint();            
            }      
        
        // In the other case prepare for reseting the animation
        if ((!keyboard_check(ord("W")) && !keyboard_check(ord("S"))  && !keyboard_check(ord("A"))  && !keyboard_check(ord("D"))) && a1 == 0)
            {
             a1           = 1;
             alarm[0]     = 3;
             dir          = "";
             image_speed  = 0;
             speed        = 0;
             image_index  = 12;
            }
    } 
    
    // Stop animation when cutscene starts
    if (!can_move && currentAnimation == animationEnum.walk)
        {
         dir = "s" 
         image_index = 12;
        }
     
    // Adjust animation phase cycle       
    if (dir == "w") {if (image_index < 0  || image_index > 5.9)  {image_index = 0;}}
    if (dir == "s") {if (image_index < 12 || image_index > 17.9) {image_index = 12;}}    
    if (dir == "a") {if (image_index < 6  || image_index > 11.9) {image_index = 6;}}    
    if (dir == "d") {if (image_index < 18 || image_index > 23.9) {image_index = 18;}}            
    }    


#define apiPlayerMoveStand
/// apiPlayerMoveStand()

math_set_epsilon(0.0001);

// Choose idle frame from the animation based on direction
if (currentAnimation == animationEnum.walk)
    {
     if (image_index > 12 && image_index < 17.99) {image_index = 12;} 
     if (image_index > 0  && image_index < 5.99)  {image_index = 0;} 
     if (image_index > 6  && image_index < 11.99) {image_index = 6;}     
     if (image_index > 18 && image_index < 23.99) {image_index = 18;} 
    }

#define apiPlayerSprint
/// apiPlayerSprint()

// Drain stamina and spawn particles. Also stop sprinting in case of insufficient stamina.
if (keyboard_check(vk_shift))       
    {
     if (vlastnost[vlastnost_stamina] > 0) {vlastnost[vlastnost_stamina] -= 0.1; speed += 1; sprinting = 1; effectSprint();}
     else {sprinting = 0;} 
    }
else 
    {
     sprinting = 0;
    }


#define apiPlayerRegenerate
/// apiPlayerRegenerate()

// Handle timer and heal on tick
if (stamina_tick > 0 && !sprinting) {stamina_tick --;}
else
    {
    if (!sprinting)
        {
         stamina_tick                  = vlastnost[vlastnost_tick_stamina];
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

// In case of attack, spell cast or other special action flow the animation    
if (currentAnimation != animationEnum.walk)
    {
     image_speed = 0.4;
 
     if (currentAnimation == animationEnum.slash)
        {
         draw_sprite(sBodyCanvasAttackWeapon2, image_index, x, y);
        }
  
     if (last_dir == "s" || last_dir == "") {if (image_index > 17) {sprite_index  = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 12; image_speed = 0;}}
     if (last_dir == "d")                   {if (image_index >= 23) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 18; image_speed = 0;}}
     if (last_dir == "a")                   {if (image_index >= 11) {sprite_index = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 6;  image_speed = 0;}}
     if (last_dir == "w")                   {if (image_index >= 5) {sprite_index  = bci[0, 0]; currentAnimation = animationEnum.walk; image_index = 0;  image_speed = 0;}}
    }

// Update vars - lineary interpolate to real values
stamina_dif = abs(last_stamina - vlastnost[vlastnost_stamina]);
health_dif  = abs(last_hp - vlastnost[vlastnost_zivot]);

if (stamina_dif <= 5) {stamina_bar = 0.1;}
if (health_dif  <= 5) {health_bar = 0.1;}
else {health_bar = 1;} 

      
last_hp      = lerp(last_hp,       vlastnost[vlastnost_zivot],      0.1);
last_stit    = lerp(last_stit,     vlastnost[vlastnost_stit],       0.1);
last_mana    = lerp(last_mana,     vlastnost[vlastnost_mana],       0.1);
last_mana    = lerp(last_mana,     vlastnost[vlastnost_mana],       0.1);
last_stamina = lerp(last_stamina,  vlastnost[vlastnost_stamina],    0.1);
last_xp      = round(lerp(last_xp, vlastnost[vlastnost_zkusenosti], 0.1));

if (last_hp <= 0.4) {last_hp = 0; scrGoreExplode(10,10);}

// Handle speech queue
if (ds_queue_size(speechQueue) > 0)
    {
     if (!speechIn)
        {
         speechCurrentText = ds_queue_dequeue(speechQueue);
         speechIn = true;         
        }
    }
    
if (speechIn)
    {
     if (speechMode == 0) {speechAlpha = lerp(speechAlpha, 1.1, 0.1); if (speechAlpha >= 1) {speechMode = 1; speechTimer = 100;}}
     if (speechMode == 1) {speechTimer--; if (speechTimer <= 0) {speechMode = 2;}}
     if (speechMode == 2) {speechAlpha = lerp(speechAlpha, -0.1, 0.1); if (speechAlpha <= 0) {speechMode = 0; speechIn = false; speechTimer = 100;}}
     
     fnt();
     clr (c_black, speechAlpha / 2);
     draw_roundrect_colour_ext(x - string_width(speechCurrentText) / 2 - 10,y - 48,x + string_width(speechCurrentText) / 2+10,y+string_height(speechCurrentText)+2-48,20,20,c_black,c_black,0);
     clr(c_white, speechAlpha);
     draw_text(x - string_width(speechCurrentText) / 2, y - 48, speechCurrentText);
     clr();
     
     if (speechSkip)
        {
         if (ds_queue_size(speechQueue) > 0) {speechSkip = false; speechIn = false;}
        }
     }


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
#define apiPlayerReverseState
/// apiPlayerReverseState()

if (oPlayer.last_dir == "a") {oPlayer.image_index = 6;}
if (oPlayer.last_dir == "d") {oPlayer.image_index = 18;}
if (oPlayer.last_dir == "w") {oPlayer.image_index = 0;}
if (oPlayer.last_dir == "s") {oPlayer.image_index = 12;}

#define apiPlayerSay
/// apiPlayerSay(text)

var t;
t = "Sample text";

if (argument_count > 0) {t = argument[0];}

ds_queue_enqueue(oPlayer.speechQueue, t);

#define apiPlayerSayNext
/// apiPlayerSayNext()

if (ds_queue_size(oPlayer.speechQueue) > 0)
    {
     oPlayer.speechSkip = true;
    }
#define apiPlayerGetRankName
/// apiPlayerGetRankName()

return oPlayer.rankName[oPlayer.vlastnost[vlastnost_level]];
#define apiPlayerGetDamage
/// apiPlayerGetDamage(damage, damageType, elementType, goreSound, destroySelf, logDmg, stateLog)

var d, t, e, deltaD, q, modQ, minQ, g, s, l, z;
d = 0;
t = damageEnum.damageNormal;
e = elementEnum.elementNone;
g = sndPoo;
s = false;
l = true;
z = "";

if (argument_count > 0) {d = argument[0];}
if (argument_count > 1) {t = argument[1];}
if (argument_count > 2) {d = argument[2];}
if (argument_count > 3) {g = argument[3];}
if (argument_count > 4) {s = argument[4];}
if (argument_count > 5) {l = argument[5];}
if (argument_count > 6) {z = argument[6];}
d = dmg;

// Decrese dmg by def 
/* To fully cover dmg we need (dmg * 3) armor
   In that case, pass 1 + {0, r(dmg / 5)) dmg
*/
deltaD = (d - round(d - (oPlayer.vlastnost[vlastnost_odolnost] / 3)));
if (deltaD >= d)
    {
   //  d = irandom_range(1, irandom(d / 5));
    } 
else
    {
   //  d -= deltaD;
    }

// Compute max shield absorbtion
q    = oPlayer.vlastnost[vlastnost_stit];
maxQ = 0; // Max dmg amount to be absorbed
modQ = 0; // Rest of dmg

if (t == damageEnum.damagePhysical)         {maxQ = d;            modQ = 0;}
else if (t == damageEnum.damageNormal)      {maxQ = round(d / 2); modQ = maxQ;}
else if (t == damageEnum.damagePenetration) {maxQ = round(d / 4); modQ = (maxQ * 3);}
else if (t == damageEnum.damageTrue)        {maxQ = 0;            modQ = d;}

// If we don't have enough shield to fully absorb dmg
if (q < maxQ)
    {
     if (q >= 1)
     {
     maxQ -= q;
     modQ += q;
     }
     else 
     {
     maxQ = 0;
     modQ = d;
     }
    }

// Finally decrease stats
oPlayer.vlastnost[vlastnost_zivot] -= modQ;
oPlayer.vlastnost[vlastnost_stit]  -= maxQ;

// Spawn blood
//   - gore
if (modQ > 0)
{
scrGoreMed(oPlayer.x, oPlayer.y, irandom_range(2, 3));
audio_play_sound(g, 0, false);

} 

//   - armor shards
if (maxQ > 0)
{
audio_play_sound(choose(sndArmor1, sndArmor2, sndArmor3, sndArmor4), 0, false);
}

// Log
if (l) {scrLog(string(dmg),c_black,-1,0,0,oPlayer.x,oPlayer.y-48,fntPixelHuge);}
if (z != "") {stateAddEntry(z);}

// Destroy self
if (s) {instance_destroy();}

#define apiPlayerGetMana
/// apiPlayerGetMana(value)

var v;
v = 0;

if (argument_count > 0) {v = argument[0];}

oPlayer.vlastnost[vlastnost_mana] +=  v;

return(v);

#define apiPlayerGetShield
/// apiPlayerGetShield(value)

var v;
v = 0;

if (argument_count > 0) {v = argument[0];}

oPlayer.vlastnost[vlastnost_stit] +=  v;

return(v);
#define apiPlayerGetSpeechSize
/// apiPlayerGetSpeechSize()

return ds_queue_size(oPlayer.speechQueue);