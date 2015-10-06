/// DynamicShadows_SetUseSoftShadows( enable )
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
    DynamicShadows_SetUseSoftShadows( enable );
        enable - true/false whether to enable soft shadows or not.
*/
Dyn_UseSoftShadows = argument0;
// Update uniforms
DynamicShadows_SetUniforms();