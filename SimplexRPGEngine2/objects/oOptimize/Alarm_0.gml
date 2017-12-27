/// @description Insert description here
// You can write your code in this editor
alarm[0] = 5;
 

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

instance_activate_all();
instance_deactivate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, false, true);

instance_activate_object(oCamera);
instance_activate_object(oSplashMessage);
instance_activate_object(oInventory);
instance_activate_object(oHUD);
instance_activate_object(oAttackMask);
instance_activate_object(oStateLog);
instance_activate_object(oStatusMenu);
instance_activate_object(oSplashNote);
instance_activate_object(oSpellBase);
instance_activate_object(oDrawHelperAbove);
instance_activate_object(oTilesHandler);
instance_activate_object(oTreeController);
instance_activate_object(oOptimize);
instance_activate_object(oPlayer);
instance_activate_object(oChest);	
instance_activate_object(obj_waterrefl);
