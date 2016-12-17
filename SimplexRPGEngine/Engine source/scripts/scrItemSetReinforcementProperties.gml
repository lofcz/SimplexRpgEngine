/// scrItemSetReinforcementProperties(rLevel, rLevelBaseCost, rLevelIncCost, rLevelIncMCost)

var rl, rlbc, rlic, rlimc
rl    = 0;
rlbc  = 1;
rlic  = 1;
rlimc = 0;

if (argument_count > 0) {rl    = argument[0];}
if (argument_count > 1) {rlbc  = argument[1];}
if (argument_count > 2) {rlic  = argument[2];}
if (argument_count > 3) {rlimc = argument[3];}

vlastnost[vlastnost_reinforcementIs]       = true;
vlastnost[vlastnost_reinforcementLevel]    = rl;
vlastnost[vlastnost_reinforcementCostBase] = rlbc;
vlastnost[vlastnost_reinforcementCostInc]  = rlic;
vlastnost[vlastnost_reinforcementCostIncM] = rlimc;

scrItemUpdateReinforcementName();
scrItemUpdateReinforcementStats();

