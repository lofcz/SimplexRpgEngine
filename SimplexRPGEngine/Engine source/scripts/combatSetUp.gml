/// combatSetUp(type, attackKey)

var AttackKey,Type;

AttackKey = vk_space;
Type      = "melee";

if (argument_count > 0) {AttackKey = argument[0];}
if (argument_count > 1) {Type      = argument[1];}


instance_create(x, y, oPlayerCombatHelp);
type               = Type;
sprite             = sShortWeapons;
image              = 0;
xx                 = 0;
yy                 = 0;
scale              = 1;
rot                = 0;
color              = c_white;
alpha              = 1;
attack             = 0;
tick_rate          = 1;
sharp              = 0;
attack_key         = AttackKey;
tick               = 0;
mode               = 0;
temp_rot           = 0;
untick             = 0;
draw               = 1;
xxx                = 0;
yyy                = 0;
move_rot           = 0;
dir_rot            = 0;
can_damage         = 0;
attackMode         = "attack";
parryTimer         = 0;
parryTimerMax      = 10;
parryTimerSlowdown = 40;
chargeTimer        = 0;
charging           = false;
maxCharge          = 100;
chargeMode         = 0;
sprite_index       = sprite;
image_speed        = 0;
