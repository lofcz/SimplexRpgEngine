/// scrGameWorldSpawnerSpawnCutscene(spawnerID, objectToSpawn, spawnTimes, playerQuote)

var s, o, S, t, p;
s = "";
o = oEnemySlime;
S = 1;
t = -1;
p = "";

if (argument_count > 0) {s = argument[0];}
if (argument_count > 1) {o = argument[1];}
if (argument_count > 2) {S = argument[2];}
if (argument_count > 3) {p = argument[3];}

// Find correct spawner
if (instance_number(oEnemySpawner) == 0) {show_message(""); return false;}
global.tempValue = s;
global.tempID    = -1;
global.tempInst  = o;
with(oEnemySpawner) {if (spawnerID == global.tempValue) {global.tempID = (id);}}
if (global.tempID != -1) 
   {
    t = (global.tempID);
   }
if (t == -1) {return false;}

with(t)
{
repeat (S)
      {
       var i = instance_create(x - random(32) + random(32), y - random(32) + random(32), global.tempInst);
       effectSpawnEnemy(i.x, i.y);
       i.isHunter = true;
       global.tempI = i;
      }
}

oPlayer.can_move2 = false;
oCamera.target = global.tempI.id;
(global.tempI.id).slowdown = 1;
oCamera.flashOnTarget = true;
oCamera.backTarget = oPlayer;
oCamera.playerQuote = p;
