/// DynamicShadows_CreateShadowMap( Width, Height )
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
    DynamicShadows_CreateShadowMap( Width, Height )
        Creates a shadow map surface with specified width and height.
        Width   - Pixels
        Hieght  - Pixels
        returns ID of surface, incase you want to use it.
*/
Dyn_ShadowMap_W = argument0;
Dyn_ShadowMap_H = argument1;
if( surface_exists(Dyn_ShadowMap) ){
    surface_free( Dyn_ShadowMap );
    Dyn_ShadowMap = -1;
}  
if( !surface_exists(Dyn_ShadowMap) ){
    Dyn_ShadowMap = surface_create( Dyn_ShadowMap_W, Dyn_ShadowMap_H );
}    
return Dyn_ShadowMap;