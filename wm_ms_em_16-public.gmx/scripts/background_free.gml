{
    surface_free(surfaceBackground);
    surface_free(surfaceCopy);
    surface_free(surfaceWork1);
    surface_free(surfaceWork2);
    surface_free(surfaceLightCache);
    surface_free(surfacePropShadow);
    
    ds_grid_destroy(global.gridVX);
    ds_grid_destroy(global.gridVY);
    ds_grid_destroy(global.gridPX);
    ds_grid_destroy(global.gridPY);
    ds_grid_destroy(global.gridEU);
    ds_grid_destroy(global.gridEV);
    ds_grid_destroy(global.gridFace);
    ds_grid_destroy(global.gridU);
    ds_grid_destroy(global.gridV);
    
    if (global.modelLight != -1) d3d_model_destroy(global.modelLight);
    if (global.modelShadow != -1) d3d_model_destroy(global.modelShadow);
    if (global.modelTexture != -1) d3d_model_destroy(global.modelTexture);
}