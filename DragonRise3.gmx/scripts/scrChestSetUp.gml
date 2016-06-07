/// scrChestSetUp(slots, slotsPerRow, unlocked, lockedMessage, activeDis, openDis, animateSpeed)

slots          = 9;
slots_row      = 3;
unlocked       = 1;
open_key       = "E";
active_dis     = 64;
open_dis       = 32;
animate_speed  = 0.3;
locked_message = "Tak tahle truhlička je zavřená, hóšo.";
s_r = 1;
s_g = 1;
s_b = 1;
s_a = 1;

if (argument_count > 0) { slots           = argument[0]; }
if (argument_count > 1) { slots_row       = argument[1]; }
if (argument_count > 2) { unlocked        = argument[2]; }
if (argument_count > 3) { locked_message  = argument[3]; }
if (argument_count > 4) { active_dis      = argument[4]; }
if (argument_count > 5) { open_dis        = argument[5]; }
if (argument_count > 6) { animate_speed   = argument[6]; }

scrChestIni();





