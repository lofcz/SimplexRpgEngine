#define enemyAPI


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
while(dd)
{
dir = choose(dir_right,dir_left,dir_up,dir_down);

 if (dir = dir_right) {if (place_empty(x+32,y)) {dd = 0;}}
 if (dir = dir_left) {if (place_empty(x-32,y)) {dd = 0;}}
 if (dir = dir_up) {if (place_empty(x,y-32)) {dd = 0;}}
 if (dir = dir_down) {if (place_empty(x,y+32)) {dd = 0;}}

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

