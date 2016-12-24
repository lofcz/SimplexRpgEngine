/// scrGameWorldSpawnersSpawnAll(objectToSpawn, spawnTimes)

var o, s;
s = "";
o = oEnemySlime;

if (argument_count > 0) {o = argument[0];}
if (argument_count > 1) {s = argument[1];}

global.tempValue = o;
with(oEnemySpawner)
{
repeat (S)
      {
       var i = instance_create(x - random(32) + random(32), y - random(32) + random(32), global.tempValue);
       effectSpawnEnemy(i.x, i.y);
      }
}

