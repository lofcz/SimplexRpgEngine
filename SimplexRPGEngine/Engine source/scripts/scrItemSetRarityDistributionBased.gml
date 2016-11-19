/// scrItemSetRarityDistributionBased(junk%, normal%, rare%, fine%, mythic%, legendary%)

var j, n, r, f, u, l, z;
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

// kawaii
jj = j; nn = n; rr = r; ff = f; uu = u; ll = l;

j = jj;
n = jj + nn;
r = jj + nn + rr;
f = jj + nn + rr + ff;
u = jj + nn + rr + ff + uu;
l = jj + nn + rr + ff + uu + ll;

z = random(100);

if (z <= j)               {itm_effect = rarity_junk;}
else if (z > j && z <= n) {itm_effect = rarity_normal;}
else if (z > n && z <= r) {itm_effect = rarity_rare;}
else if (z > r && z <= f) {itm_effect = rarity_fine;}
else if (z > f && z <= u) {itm_effect = rarity_mythic;}
else if (z > u && z <= l) {itm_effect = rarity_legendary;}

itm_info_color = itm_effect;


