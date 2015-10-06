{
    surface_copy(surfaceLightCache,copyX,copyY,surfaceCopy);
    copyX = view_xview[0];
    copyY = view_yview[0];
    surface_copy_part(surfaceCopy,0,0,surfaceLightCache,copyX,copyY,vw,vh);

    surface_copy(surfaceBackground,0,0,surfaceCopy);
    build_shadows_m(surfaceBackground,objectLightDynamic,false,copyX,copyY);
    // Blur
    repeat (blur)
    {
        surface_blur(surfaceBackground,1);
    }
    surface_copy(surfaceLightCache,copyX,copyY,surfaceBackground);
    
    surface_clear(surfacePropShadow,c_black,0);
    build_shadows_p(surfacePropShadow,objectLightDynamic,objectProp,false,copyX,copyY);
    
    // Blur
    repeat (blur/2)
    {
        surface_blur(surfacePropShadow,1);
    }
}