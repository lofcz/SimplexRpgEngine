/// @function libUtilityDirToVal(dir)
/// @desc Coverts e_dirs to degrees value
/// @arg {e_dirs} dir Direction to convert

var tmp_dir;
tmp_dir = e_dirs.valA;

if (argument_count > 0) {tmp_dir = argument[0];}

if (tmp_dir == e_dirs.valA) {return 180;}
if (tmp_dir == e_dirs.valD) {return 0;}
if (tmp_dir == e_dirs.valW) {return 90;}
if (tmp_dir == e_dirs.valS) {return 270;}
