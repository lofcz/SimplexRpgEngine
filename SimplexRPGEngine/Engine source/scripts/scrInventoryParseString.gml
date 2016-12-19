#define scrInventoryParseString
/// scrInventoryParseString()

var a;
a = 0;

if (argument_count > 0) {a = argument[0];}

if (a != inv_item_info_head && a != inv_item_info_text && a != inv_options && a !=inv_item_equip_slot) {return true;}
return false;

#define scrInventoryPropertyIsUpgradable
/// (scrInventoryPropertyIsUpgradable(property)

var i;
i = 0;

if (argument_count > 0) {i = argument[0];}

if (i != vlastnost_reinforcementCostBase && 
    i != vlastnost_reinforcementCostInc  && 
    i != vlastnost_reinforcementCostIncM && 
    i != vlastnost_reinforcementIs       && 
    i != vlastnost_reinforcementLevel    && 
    i != vlastnost_bodyCanvasIndex       && 
    i != vlastnost_bodyCanvasSprite      && 
    i != vlastnost_bodyCanvasSlashSprite && 
    i != vlastnost_stamina_cost          && 
    i != vlastnost_upgradeSloty          && 
    i != vlastnost_maxUpgrade            && 
    i != vlastnost_upgradeMaterial1      && 
    i != vlastnost_upgradeMaterial2      && 
    i != vlastnost_upgradeMaterial3      && 
    i != vlastnost_upgradeSprite1        && 
    i != vlastnost_upgradeSprite2        && 
    i != vlastnost_upgradeSprite3        && 
    i != vlastnost_upgradeText1          && 
    i != vlastnost_upgradeText2          && 
    i != vlastnost_upgradeText3          && 
    i != vlastnost_upgradeID1            && 
    i != vlastnost_upgradeID2            && 
    i != vlastnost_upgradeID3            && 
    i != vlastnost_upgradeBaked1         && 
    i != vlastnost_upgradeBaked2         && 
    i != vlastnost_upgradeBaked3         && 
    i != vlastnost_parry_cost
    )
   {
    return true;
   }
return false;
