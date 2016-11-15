#define enemyAPI
/// EnemyApi([information])                                                                 -
/*

- scrEnemyIni(health[real],damage[real],defense[real],level[int],name[string])
  
  Initialise enemy instance stats. Use parametrs to customize
  stats like health or damage.
  
- scrEnemyGetPosition()
  
  Returns new direction for "idle" state of enemy.
  
- scrEnemyGetPositionAttack()
  
  Returns new direction for "attack" state of enemy.
  Algorithm finds best way to the player.
  
- scrEnemyLoot(item[int],number_min[int],number_max[int],physics[bool],chance[real],repeat[int])
  
  Used to drop things from enemy after death. "physics" parametr (bool)
  indicates if use physics effect. Recommended for gold. 

- scrEnemyCollision(with[object])

  Returns parametred instance to previous position.
  Input self,other,all.  

- scrEnemyDamage(object[object],cooldown[real])

  Delivers damage to target obhect, cooldowns secures 
  multiple hitting.   

- scrEnemyGetDamage()

  Handles damage deliver from player. 
  
- scrEnemyDie(blood)

   Changes enemy state to "dying", you can specify, if 
   you wish to use blood effect.




#define scrEnemyIni
/// scrEnemyIni(health, damage, defense, level,name, bestiary_name, coloredName)

var t_hp,t_damage,t_defense,t_level,t_name,t_bestiary,t_cName;

t_hp         = 10;
t_damage     = 5;
t_defense    = 2;
t_level      = choose(1,1,2);
t_name       = "Enemy";
t_bestiary   = bestiaryEnemySlime;
t_cName      = scrColorflag(c_red) + "Enemy" + scrEndColorflag();

if (argument_count > 0) {t_hp       = argument[0];}
if (argument_count > 1) {t_damage   = argument[1];}
if (argument_count > 2) {t_defense  = argument[2];}
if (argument_count > 3) {t_level    = argument[3];}
if (argument_count > 4) {t_name     = argument[4];}
if (argument_count > 5) {t_bestiary = argument[5];}
if (argument_count > 6) {t_cName    = argument[6];}

hp           = t_hp;
damage       = t_damage;
defense      = t_defense;
level        = t_level;
max_hp       = t_hp;
name         = t_name + string(" ("+string(level)+")");
bestiary     = t_bestiary;
coloredName  = t_cName
dmg          = 0;
forcedX      = 0;
forcedY      = 0;
forcedBaseX  = 0;
forcedBaseY  = 0;
forcedHelp   = 0;
can_move     = true;
followMouse  = false;

#define scrEnemyGetPosition
/// scrEnemyGetPosition()

randomize();
dd = 1;
try = 0;
while(dd)
{
try++;
dir = choose(dir_right,dir_left,dir_up,dir_down);

 if (dir = dir_right) {if (place_empty(x+32,y)) {dd = 0;}}
 if (dir = dir_left) {if (place_empty(x-32,y)) {dd = 0;}}
 if (dir = dir_up) {if (place_empty(x,y-32)) {dd = 0;}}
 if (dir = dir_down) {if (place_empty(x,y+32)) {dd = 0;}}

 if (try > 20) {dir = choose(dir_right,dir_left,dir_up,dir_down); dd = 0;}

}

#define scrEnemyGetPositionAttack
/// scrEnemyGetPositionAttack()

randomize();
dd = 1;
try = 0;

dif_x = abs(x - oPlayer.x);
dif_y = abs(y - oPlayer.y);

while(dd)
{
dir = choose(dir_right,dir_left,dir_up,dir_down);
try++;

 if (dir = dir_right) {if (oPlayer.x > x && dif_x > 3) {dd = 0;}}
 else if (dir = dir_left) {if (oPlayer.x < x ) {dd = 0;}}
 else if (dir = dir_up) {if (oPlayer.y < y && dif_y > 3) {dd = 0;}}
 else if (dir = dir_down) {if (oPlayer.y > y) {dd = 0;}}

if (try > 20) {dir = choose(dir_right,dir_left,dir_up,dir_down); dd = 0;}
}

#define scrEnemyLoot
/// scrEnemyLoot(item,number_min,number_max,physics,chance,repeat)

randomize();

var item,physics,number_min,mnumber_max,chance;     
item        = oGold;
physics     = 1;
number_min  = 5;
number_max  = 10;
chance      = 100;
rep         = 1;

if (argument_count > 0) {item                             = argument[0];}
if (argument_count > 1) {number_min                       = argument[1];}
if (argument_count > 2) {number_max                       = argument[2];}
if (argument_count > 3) {physics                          = argument[3];}
if (argument_count > 4) {chance                           = argument[4];}
if (argument_count > 5) {rep                              = argument[5];}

repeat(rep)
{
randomize();

if (chance >= random(100))
   {
   var ix, iy, ip;
   ip = 0;
   
   do
   {
   ix = x + random(64) - random(64);
   iy = y + random(64) - random(64);
   ip++;
   }
   until(place_free(ix, iy) && ip < 40);
   
   
   loot = instance_create(ix,iy,item);
   loot.itm_number = irandom_range(number_min,number_max);
   
   if (physics)
      {
       loot.drawDrop  = true;
       loot.direction = random(360);
       loot.speed     = random_range(2, 4);
       loot.friction  = 0.15;
      }
   }
}

#define scrEnemyCollision
/// scrEnemyCollision(with)

var object;
object = self;

if (argument_count > 0) {object = argument[0];}

with (object)
     {
      x = xprevious;
      y = yprevious;
     }

#define scrEnemyDamage
/// scrEnemyDamage(object, cooldown, stateLog)

var object, cd, sL;

object = -1;
cd     = 15;
sL     = "";

if (argument_count > 0) {object = argument[0];}
if (argument_count > 1) {cd     = argument[1];}
if (argument_count > 2) {sL     = argument[2];}


if (can_damage = -1 && object != -1)
{
dmg                                = damage + bonus_damage;
object.vlastnost[vlastnost_zivot] -= dmg;
dmg                               += choose(-1, -2, 0, 1, 2); 

scrGoreFull(object.x,object.y);
scrEnemyGetPosition();
scrLog(dmg,c_black,-1,0,0,object.x,object.y-48,fntPixelHuge);
can_damage = cd;
if (sL != "") 
    {
    if (string_count("[flagDamage]", sL) != 0)
        {
         sL = string_replace(sL, "[flagDamage]", scrColorflag(c_red) + string(dmg) + scrEndColorflag());
        }
    if (string_count("[flagPoints]", sL) != 0)
        {
         sL = string_replace(sL, "[flagPoints]", scrInflect("bod", dmg));
        }
    stateAddEntry(sL);
    }
return true;
}

return false;


#define scrEnemyGetDamage
/// scrEnemyGetDamage()


if (other.attack && other.can_damage = -1) 
{
//forcedBaseX = 50;
//forcedX = 50;


text = choose("Ve jménu Demacie!", "Odporná zhoubo!", "Prolomím jejich řady!", "Nemějte slitování!", "Přímo do černého!", "Překvapení, jsem zpátky!", "Za krále a Demacii!", "Valore, na ně!");
apiPlayerSay(text);
apiPlayerSayNext();


dmg = 0;
if (scrAffectsGetStacks("flash") != -1) {dmg += (scrAffectsGetStacks("flash") * scrAffectsGetStacks("flash")); scrAffectsRemove("flash", -1);}

if (combatGetCriticalHit( oPlayer.vlastnost[vlastnost_kriticka_sance]))
   {
    dmg += (oPlayer.vlastnost[vlastnost_poskozeni] * oPlayer.vlastnost[vlastnost_kriticka_nasobic]);   
   }
else
    {
     dmg += oPlayer.vlastnost[vlastnost_poskozeni];   
    }
dmg += (oPlayer.vlastnost[vlastnost_sila] / 2);
dmg += random_range(-2, 2);
dmg += (random_range(-(oPlayer.vlastnost[vlastnost_obratnost] / 2), oPlayer.vlastnost[vlastnost_obratnost]) / 2);
dmg = round(dmg);
hp -= dmg;
scrLog(dmg,c_white,-1,0,0.2,x,y-32,oController.fontDamage,"combat");

scale = 1.4;
scrGoreFull(x,y,3,c_aqua);
audio_play_sound(sndSlime1,0,0);
other.can_damage = -2;
}


#define scrEnemyDie
/// scrEnemyDie(blood)

var blood;
blod = true;

if (argument_count > 0) {blood = argument[0];}

mood = "dying";
drop = 0;
sprite_index = noone;

if (blood)
   {
   scrGoreExplode();
   }
   
if (instance_number(oBestiar) > 0) 
   {
   oBestiar.monster[bestiary,bestiary_monster_killed]++;
   oBestiar.unlocked[bestiary] = 1;    
   } 

#define scrEnemyApplyAffect
/// scrEnemyApplyAffect(affect, time, imageIndex, color, stackNumber, chance%, resetTime, addTime, addOnlyOnHit)

var affect, time, iI, c, sN, chance, rT, aOOH;
affect = "poison";
time   = 60;
iI     = 0;
color  = c_lime;
sN     = 1;
chance = 100;
rT     = true;
aT     = 0;
aOOH   = true;

if (argument_count > 0) {affect = argument[0];}
if (argument_count > 1) {time   = argument[1];}
if (argument_count > 2) {iI     = argument[2];}
if (argument_count > 3) {c      = argument[3];}
if (argument_count > 4) {sN     = argument[4];}
if (argument_count > 5) {chance = argument[5];}
if (argument_count > 6) {rT     = argument[6];}
if (argument_count > 7) {aT     = argument[7];}
if (argument_count > 7) {aOOH   = argument[8];}

if (chance / random(100) > 0.5 && (can_damage = -1 || !aOOH)) 
    {
     scrAffecstAdd(affect, time, iI, c, sN);
     if (rT) {scrAffecstAddTime(affect, aT, true, true);}
     return true;
    }
return false;