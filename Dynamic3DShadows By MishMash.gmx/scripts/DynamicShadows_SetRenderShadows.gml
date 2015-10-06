/// DynamicShadows_SetRenderShadows();
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
    DynamicShadows_SetRenderShadows()
        Initialises the shader responsible for rendering the shadows
*/
if( Dyn_UseSoftShadows ){
    shader_set( sh_ShadowsPCF );
} else {
    shader_set( sh_Shadows );
}
// Set depth texture
texture_set_stage(Dyn_sampler_shadowMap, surface_get_texture(Dyn_ShadowMap));

// Set Uniforms - Sun position
shader_set_uniform_f( Dyn_uniform_SunX, Dyn_SunX );
shader_set_uniform_f( Dyn_uniform_SunY, Dyn_SunY );
shader_set_uniform_f( Dyn_uniform_SunZ, Dyn_SunZ );
shader_set_uniform_f( Dyn_uniform_SunDX, Dyn_SunDX );
shader_set_uniform_f( Dyn_uniform_SunDY, Dyn_SunDY );
shader_set_uniform_f( Dyn_uniform_SunDZ, Dyn_SunDZ );

// Set Uniforms - Sun Colour
shader_set_uniform_f( Dyn_uniform_AmbientR, color_get_red(      Dyn_Sun_AmbientColor ));
shader_set_uniform_f( Dyn_uniform_AmbientG, color_get_green(    Dyn_Sun_AmbientColor ));
shader_set_uniform_f( Dyn_uniform_AmbientB, color_get_blue(     Dyn_Sun_AmbientColor ));

// Set Uniforms - Soft shadows
if( Dyn_UseSoftShadows ){
    shader_set_uniform_f( Dyn_uniform_SoftSize, Dyn_Soft_Radius );
}

// Set Uniforms - Brightness / Darkness
shader_set_uniform_f( Dyn_uniform_Brightness, Dyn_Sun_MaxBrightness );
shader_set_uniform_f( Dyn_uniform_Darkness,     Dyn_Sun_MaxDarkness );