/// scrItemSetRarityDistributionBased(junk%, normal%, rare%, fine%, mythic%, legendary%, [junkPrice], [normalPrice], [rarePrice], [finePrice], [mythicPrice], [legendaryPrice])

var j, n, r, f, u, l, z, jp, np, rp, fp, up, lp;
j  = 0;
n  = -1;
r  = -1;
f  = -1; 
u  = -1;
l  = -1;
jp = -1;
np = -1;
rp = -1;
fp = -1;
up = -1;
lp = -1;

if (argument_count > 0)  {j  = argument[0];}
if (argument_count > 1)  {n  = argument[1];}
if (argument_count > 2)  {r  = argument[2];}
if (argument_count > 3)  {f  = argument[3];}
if (argument_count > 4)  {u  = argument[4];}
if (argument_count > 5)  {l  = argument[5];}
if (argument_count > 6)  {jp = argument[6];}
if (argument_count > 7)  {np = argument[7];}
if (argument_count > 8)  {rp = argument[8];}
if (argument_count > 9)  {fp = argument[9];}
if (argument_count > 10) {up = argument[10];}
if (argument_count > 11) {lp = argument[11];}

// kawaii
jj = j; nn = n; rr = r; ff = f; uu = u; ll = l;

j = jj;
n = jj + nn;
r = jj + nn + rr;
f = jj + nn + rr + ff;
u = jj + nn + rr + ff + uu;
l = jj + nn + rr + ff + uu + ll;

z = random(100);

if (z <= j)               {itm_effect = rarity_junk;      if (jp != -1) {scrItemSetProperty(vlastnost_cena, jp);}}
else if (z > j && z <= n) {itm_effect = rarity_normal;    if (np != -1) {scrItemSetProperty(vlastnost_cena, np);}}
else if (z > n && z <= r) {itm_effect = rarity_rare;      if (rp != -1) {scrItemSetProperty(vlastnost_cena, rp);}}
else if (z > r && z <= f) {itm_effect = rarity_fine;      if (fp != -1) {scrItemSetProperty(vlastnost_cena, fp);}}
else if (z > f && z <= u) {itm_effect = rarity_mythic;    if (up != -1) {scrItemSetProperty(vlastnost_cena, up);}}
else if (z > u && z <= l) {itm_effect = rarity_legendary; if (lp != -1) {scrItemSetProperty(vlastnost_cena, lp);}}

itm_info_color = itm_effect;


