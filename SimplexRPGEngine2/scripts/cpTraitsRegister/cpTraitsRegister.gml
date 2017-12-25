/// @function cpTraitsRegister(name, desc, color)
/// @desc Adds new trait to the list
/// @arg {string} name Trait name
/// @arg {string} desc Trait description
/// @arg {color} color Trait name color

var tmp_n, tmp_d, tmp_c;
tmp_n = "Sample trait";
tmp_d = "Sample description";
tmp_c = c_black;

if (argument_count > 0) {tmp_n = argument[0];}
if (argument_count > 1) {tmp_d = argument[1];}
if (argument_count > 2) {tmp_c = argument[2];}

ds_list_add(oHUD.v_playerTraitList, tmp_n, tmp_d, tmp_c);
return 1;
