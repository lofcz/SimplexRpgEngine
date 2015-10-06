/// DynamicShadows_Init()
/*
    --------------------------------------------------------------------------------------------
    Created by Michael Parkin-White ( MishMash )
    http://www.mich.pw/  | http://www.MantaGames.net
    
    If you use these scripts, credit would be appreciated but is not required. 
    Code is free to use in both commercial and freeware projects. Redistributions of the code
    must accredit original version.

    LAST UPDATED:   24th December 2013.
    VERSION:        0.10
    --------------------------------------------------------------------------------------------
    DynamicShadows_Init()
        Initialises all variables which deal with the shaders
*/
// Get shader Uniforms
globalvar Dyn_sampler_shadowMap;
globalvar Dyn_uniform_SunX, Dyn_uniform_SunY, Dyn_uniform_SunZ;
globalvar Dyn_uniform_SunDX, Dyn_uniform_SunDY, Dyn_uniform_SunDZ;
globalvar Dyn_uniform_Brightness, Dyn_uniform_Darkness;
globalvar Dyn_uniform_SoftSize, Dyn_uniform_Samples;
globalvar Dyn_uniform_AmbientR, Dyn_uniform_AmbientG, Dyn_uniform_AmbientB;

// Set default valeus - sun
globalvar Dyn_SunX, Dyn_SynY, Dyn_SunZ, Dyn_SunDX, Dyn_SunDY, Dyn_SunDZ;
Dyn_SunX    = 0;
Dyn_SunY    = 0;
Dyn_SunZ    = 0;
Dyn_SunDX   = 0;
Dyn_SunDY   = 0;
Dyn_SunDZ   = 0;

// Set default values
globalvar Dyn_Sun_AmbientColor, Dyn_Soft_Samples, Dyn_Soft_Radius, Dyn_Sun_MaxBrightness, Dyn_Sun_MaxDarkness;
Dyn_Sun_AmbientColor    = c_white;
Dyn_Soft_Samples        = 8.0;
Dyn_Soft_Radius         = 0.50;
Dyn_Sun_MaxBrightness   = 1.25;
Dyn_Sun_MaxDarkness     = 0.50;

// Set default shadow map
globalvar Dyn_ShadowMap_W, Dyn_ShadowMapH;
globalvar Dyn_ShadowMap, Dyn_UseSoftShadows;
Dyn_ShadowMap       = -1
Dyn_ShadowMap_W     = 1920;
Dyn_ShadowMap_H     = 1080;
Dyn_UseSoftShadows  = false;

// Get Uniform Values
DynamicShadows_SetUniforms();