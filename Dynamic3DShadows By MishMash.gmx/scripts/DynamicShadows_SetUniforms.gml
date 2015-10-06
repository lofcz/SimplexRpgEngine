//DynamicShadows_SetUniforms()
/*
    INTERNAL SCRIPT
*/
var shader;
if( Dyn_UseSoftShadows ){
    shader = sh_ShadowsPCF;
} else {
    shader = sh_Shadows;
}
Dyn_sampler_shadowMap   = shader_get_sampler_index( shader, "shadowMap");
Dyn_uniform_SunX        = shader_get_uniform( shader, "px" );
Dyn_uniform_SunY        = shader_get_uniform( shader, "py" );
Dyn_uniform_SunZ        = shader_get_uniform( shader, "pz" );
Dyn_uniform_SunDX       = shader_get_uniform( shader, "dx" );
Dyn_uniform_SunDY       = shader_get_uniform( shader, "dy" );
Dyn_uniform_SunDZ       = shader_get_uniform( shader, "dz" );
Dyn_uniform_SoftSize    = shader_get_uniform( shader, "SoftSize" );
Dyn_uniform_AmbientR    = shader_get_uniform( shader, "aR" );
Dyn_uniform_AmbientG    = shader_get_uniform( shader, "aG" );
Dyn_uniform_AmbientB    = shader_get_uniform( shader, "aB" );
Dyn_uniform_Brightness  = shader_get_uniform( shader, "MaxBrightness" );
Dyn_uniform_Darkness    = shader_get_uniform( shader, "MaxDarkness" );