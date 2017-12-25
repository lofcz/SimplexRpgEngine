/// @function cpTalentsRegister(branch, index, name, desc, imageIndex, level, maxLevel, talentPoinsPrice, row, cell, req1, req2, req3, lvl1, lvl2, lvl3)
/// @desc Adds new talent to the system
/// @arg {e_talentBranches} branch ID of branch
/// @arg {e_talents} index Talent ID
/// @arg {string} name Talent name
/// @arg {string} desc Talent description
/// @arg {int} imageIndex Image index of the talent
/// @arg {int} level Starting talent level
/// @arg {int} maxLevel End talent level
/// @arg {int} talentPoinsPrice How much points it costs to upgrade talent
/// @arg {int} row Row index
/// @arg {int} cell Cell index in row
/// @arg {e_talents} req1 Index of first requirement
/// @arg {e_talents} req2 Index of second requirement
/// @arg {e_talents} req3 Index of third requirement
/// @arg {int} lvl1 Min level of first req
/// @arg {int} lvl2 Min level of second req
/// @arg {int} lvl3 Min level of third req

var tmp_b, tmp_i, tmp_n, tmp_d, tmp_I, tmp_l, tmp_L, tmp_t, tmp_r, tmp_c, tmp_r1, tmp_r2, tmp_r3, tmp_rl1, tmp_rl2, tmp_rl3, tmp_s;
tmp_b   = e_talentBranches.valWarrior;
tmp_i   = e_talents.valCrafting;
tmp_n   = "Sample name";
tmp_d   = "Sample description";
tmp_I   = 0;
tmp_l   = 0;
tmp_L   = 5;
tmp_t   = 1;
tmp_r   = 0;
tmp_c   = 0;
tmp_r1  = -1;
tmp_r2  = -1;
tmp_r3  = -1;
tmp_rl1 = 0;
tmp_rl2 = 0;
tmp_rl3 = 0;
tmp_s   = oHUD.v_talentIndexInternal[tmp_b];

if (argument_count > 0)  {tmp_b   = argument[0];}
if (argument_count > 1)  {tmp_i   = argument[1];}
if (argument_count > 2)  {tmp_n   = argument[2];}
if (argument_count > 3)  {tmp_d   = argument[3];}
if (argument_count > 4)  {tmp_I   = argument[4];}
if (argument_count > 5)  {tmp_l   = argument[5];}
if (argument_count > 6)  {tmp_L   = argument[6];}
if (argument_count > 7)  {tmp_t   = argument[7];}
if (argument_count > 8)  {tmp_r   = argument[8];}
if (argument_count > 9)  {tmp_c   = argument[9];}
if (argument_count > 10) {tmp_r1  = argument[10];}
if (argument_count > 11) {tmp_r2  = argument[11];}
if (argument_count > 12) {tmp_r3  = argument[12];}
if (argument_count > 13) {tmp_rl1 = argument[13];}
if (argument_count > 14) {tmp_rl2 = argument[14];}
if (argument_count > 15) {tmp_rl3 = argument[15];}

oHUD.v_playerTalent[tmp_b, tmp_s + 0]  = tmp_i;
oHUD.v_playerTalent[tmp_b, tmp_s + 1]  = tmp_n;
oHUD.v_playerTalent[tmp_b, tmp_s + 2]  = tmp_d;
oHUD.v_playerTalent[tmp_b, tmp_s + 3]  = tmp_I;
oHUD.v_playerTalent[tmp_b, tmp_s + 4]  = tmp_l;
oHUD.v_playerTalent[tmp_b, tmp_s + 5]  = tmp_L;
oHUD.v_playerTalent[tmp_b, tmp_s + 6]  = tmp_t;
oHUD.v_playerTalent[tmp_b, tmp_s + 7]  = tmp_r;
oHUD.v_playerTalent[tmp_b, tmp_s + 8]  = tmp_c;
oHUD.v_playerTalent[tmp_b, tmp_s + 9]  = tmp_r1;
oHUD.v_playerTalent[tmp_b, tmp_s + 10] = tmp_r2;
oHUD.v_playerTalent[tmp_b, tmp_s + 11] = tmp_r3
oHUD.v_playerTalent[tmp_b, tmp_s + 12] = tmp_rl1;
oHUD.v_playerTalent[tmp_b, tmp_s + 13] = tmp_rl2;
oHUD.v_playerTalent[tmp_b, tmp_s + 14] = tmp_rl3;


oHUD.v_talentIndexInternal[tmp_b] += mcTalentLenght;