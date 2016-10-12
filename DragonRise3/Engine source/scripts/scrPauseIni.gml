/// scrPauseIni(pauseSpeed, maxBlur)

screen = screen_save("temp.dr3");
instance_deactivate_all(1);
if (global.temp != -1) {instance_activate_object(global.temp);}

s                   = sprite_add("temp.dr3",0,0,0,0,0);
activated           = 0;
alarm[0]            = 1;
uni_resolution_hoz  = shader_get_uniform(shdGaussHor,"resolution");
uni_resolution_vert = shader_get_uniform(shdGaussVer,"resolution");
var_resolution_x    = view_wview;
var_resolution_y    = view_hview;
shader_enabled      = true;
final_surface       = surface_create(var_resolution_x,var_resolution_y);
mass                = 0;
uni_mass_h          = shader_get_uniform(shdGaussHor,"mass");
uni_mass_v          = shader_get_uniform(shdGaussVer,"mass");
pauseSpeed          = 0.04;
maxBlur             = 1;
bacAlpha            = 0;

vignetteSettings      = shader_get_uniform(shdVignette, "u_settings");
vignetteSettingsM     = shader_get_uniform(shdVignette, "u_vignette_m");
vignetteSettingsP     = shader_get_uniform(shdVignette, "u_vignette_p");
vignetteSettingsColor = shader_get_uniform(shdVignette, "u_vignette_colour");

if (argument_count > 0) {pauseSpeed = argument[0];}
if (argument_count > 1) {maxBlur    = argument[1];}

pauseText[0] = "Pokračovat";
pauseText[1] = "Nastavení";
pauseText[2] = "Uložit";
pauseText[3] = "Načíst";
pauseText[4] = "Konec";

pauseItemSelected = 0;
