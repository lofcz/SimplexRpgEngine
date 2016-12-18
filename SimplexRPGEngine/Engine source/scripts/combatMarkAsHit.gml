/// combatMarkAsHit(hit)

var h;
h = true;

if (argument_count > 0) {h = argument[0];}

if (h) {ds_list_add(oPlayerCombat.hitList, id); return true}

ds_list_delete(oPlayerCombat.hitList, ds_list_find_index(oPlayerCombat.hitList, id));
return true;
