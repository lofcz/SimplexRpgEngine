/// combatCanBeHit()

var z = ds_list_find_index(oPlayerCombat.hitList, id);
if (z == -1) {return true;}
return false;
