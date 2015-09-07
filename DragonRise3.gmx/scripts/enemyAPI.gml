#define enemyAPI
/// EnemyApi()
/*

- scrEnemyIni(health,damage,defense,level,name)
  
  Initialise enemy instance stats. Use parametrs to customize
  stats like health or damage.
  
- scrEnemyGetPosition()
  
  Returns new direction for "idle" state of enemy.
  
- scrEnemyGetPositionAttack()
  
  Returns new direction for "attack" state of enemy.
  Algorithm finds best way to the player.
  
- scrEnemyLoot(item,number_min,number_max,physics,chance,repeat)
  
  Used to drop things from enemy after death. "physics" parametr (bool)
  indicates if use physics effect. Recommended for gold. 

- scrEnemyCollision(with)

  Returns parametred instance to previous position.
  Input self,other,all.  

  






#define scrEnemyIni
/// scrEnemyIni(health,damage,defense,levelname)

var t_hp,t_damage,t_defense,t_level,t_name;

t_hp         = 10;
t_damage     = 5;
t_defense    = 2;
t_level      = choose(1,1,2);
t_name       = "Enemy";

if (argument_count > 0) {t_hp       = argument[0];}
if (argument_count > 1) {t_damage   = argument[1];}
if (argument_count > 2) {t_defense  = argument[2];}
if (argument_count > 3) {t_level    = argument[3];}
if (argument_count > 4) {t_name     = argument[4];}

hp       = t_hp;
damage   = t_damage;
defense  = t_defense;
level    = t_level;
max_hp   = t_hp;
name     = t_name +string("("+string(level)+")");

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
l = random_range(chance,100);

if (l >= 50)
   {
   loot = instance_create(x-random(20)+random(20),y+random(20)-random(20),item);
   loot.itm_number = irandom_range(number_min,number_max);
   
   if (physics)
      {
       loot.direction   = random(359);
       loot.image_angle = loot.direction;
       loot.speed       = random_range(1,2);
       loot.spd_down    = random_range(0.02,0.05);
      }
   }
}
#define scrEnemyCollision
/// scrEnemyCollision(with)

var object;

object = self;

if (argument_count > 0) {object = argument[0];}

with(object)
                 {
                  x = xprevious;
                  y = yprevious;
                 }
