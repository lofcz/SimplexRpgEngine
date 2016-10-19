/// scrItemSetUp(animationSpeed, showNumber, id, canBeQuickUsed)

var in, canBeQuickUsed;
animate        = 0;
show_number    = 0;
points         = 0;
in             = false;
canBeQuickUsed = false;

if (argument_count > 0) {animate          = argument[0];}
if (argument_count > 1) {show_number      = argument[1];}
if (argument_count > 2) {in               = argument[2];}
if (argument_count > 3) {canBeQuickUsed   = argument[3];}

image_speed                           = animate;
sprite_index                          = sTestItem;
scrItemBasic(in);
vlastnost[vlastnost_canBeFastEquiped] = canBeQuickUsed;


