/// scrItemSetReinforcementProperties(rLevel, rLevelBaseCost, rLevelIncCost, rLevelIncMCost, rUpgradeBaseSkill, rUpgradeIncSkill)

var rl, rlbc, rlic, rlimc, rubs, ruis
rl    = 0;
rlbc  = 1;
rlic  = 1;
rlimc = 0;
rubs  = 0;
ruis  = 0;

if (argument_count > 0) {rl    = argument[0];}
if (argument_count > 1) {rlbc  = argument[1];}
if (argument_count > 2) {rlic  = argument[2];}
if (argument_count > 3) {rlimc = argument[3];}
if (argument_count > 4) {rubs  = argument[4];}
if (argument_count > 5) {ruis  = argument[5];}

vlastnost[vlastnost_reinforcementIs]                = true;
vlastnost[vlastnost_reinforcementLevel]             = rl;
vlastnost[vlastnost_reinforcementCostBase]          = rlbc;
vlastnost[vlastnost_reinforcementCostInc]           = rlic;
vlastnost[vlastnost_reinforcementCostIncM]          = rlimc;
vlastnost[vlastnost_reinforcementUpgradeBaseSkill]  = rubs;
vlastnost[vlastnost_reinforcementUpgradeIncSkill]   = ruis;

scrItemUpdateReinforcementName();
scrItemUpdateReinforcementStats();

