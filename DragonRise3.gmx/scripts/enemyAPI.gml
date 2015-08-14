#define enemyAPI
/// EnemyApi()
/*

- scrEnemyIni(health,damage,defense)
  
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

  

  






#define scrEnemyIni
/// scrEnemyIni(health,damage,defense)

hp       = argument0;
damage   = argument1;
defense  = argument2;
max_hp   = hp;

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
if (argument_count > 3) {chance                           = argument[3];}
if (argument_count > 4) {rep                              = argument[4];}

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

