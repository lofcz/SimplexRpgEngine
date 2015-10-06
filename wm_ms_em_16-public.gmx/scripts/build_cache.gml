{
    surface_free(surfaceWork1);
    surfaceWork1 = surface_create(w,h);
    // Ambient Light
    var colorAmbient; colorAmbient = $000000;
    surface_clear(surfaceLightCache,colorAmbient,1);
    build_shadows_m(surfaceLightCache,objectLightStatic,true,0,0);
    surface_copy_part(surfaceCopy,0,0,surfaceLightCache,copyX,copyY,vw,vh);
    surface_free(surfaceWork1);
    surfaceWork1 = surface_create(vw,vh);
}