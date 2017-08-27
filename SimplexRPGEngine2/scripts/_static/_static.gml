/// @function _static()
/// @desc Checks if object is marked as static (random parameters generation is off)

if (variable_instance_exists(id, "v_staticItem")) {return true;}
return false;