/// scrItemSetRarityPointsBased(junk, normal, rare, fine, mythic, legendary)

var j, n, r, f, u, l;
j = 0;
n = -1;
r = -1;
f = -1; 
u = -1;
l = -1;

if (argument_count > 0) {j = argument[0];}
if (argument_count > 1) {n = argument[1];}
if (argument_count > 2) {r = argument[2];}
if (argument_count > 3) {f = argument[3];}
if (argument_count > 4) {u = argument[4];}
if (argument_count > 5) {l = argument[5];}

if (l != -1 && points >= l)      {itm_effect = rarity_legendary;}
else if (u != -1 && points >= u) {itm_effect = rarity_mythic;}
else if (f != -1 && points >= f) {itm_effect = rarity_fine;}
else if (r != -1 && points >= r) {itm_effect = rarity_rare;}
else if (n != -1 && points >= n) {itm_effect = rarity_normal;}
else {itm_effect = rarity_junk;}

itm_info_color = itm_effect;
