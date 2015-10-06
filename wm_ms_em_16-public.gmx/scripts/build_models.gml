{
    //  VX,VY   vertices in worldspace
    //  EU,EV   environment map
    //  PX,PY   vertices in perspective

    var zShadow,zWall,i;
    if (global.modelShadow != -1) d3d_model_destroy(global.modelShadow);
    if (global.modelLight != -1) d3d_model_destroy(global.modelLight);
    if (global.modelTexture != -1) d3d_model_destroy(global.modelTexture);

    //  Shadow
    zShadow = 50;
    global.modelShadow = d3d_model_create();
    ds_grid_copy(global.gridPX,global.gridVX);
    ds_grid_copy(global.gridPY,global.gridVY);
    ds_grid_multiply_region(global.gridPX,0, 0, 1, global.gridSize, zShadow+1);
    ds_grid_multiply_region(global.gridPY,0, 0, 1, global.gridSize, zShadow+1);
 
    for (i=0; i<global.gridSize; i+=1) {
    
        d3d_model_primitive_begin(global.modelShadow,pr_trianglestrip);
        
        d3d_model_vertex(global.modelShadow,
            ds_grid_get(global.gridVX,0,i), 
            ds_grid_get(global.gridVY,0,i),0);
            
        d3d_model_vertex(global.modelShadow,
            ds_grid_get(global.gridVX,1,i), 
            ds_grid_get(global.gridVY,1,i),0);
            
        d3d_model_vertex(global.modelShadow,
            ds_grid_get(global.gridPX,0,i),
            ds_grid_get(global.gridPY,0,i),zShadow);
    
        d3d_model_vertex(global.modelShadow,
            ds_grid_get(global.gridPX,1,i), 
            ds_grid_get(global.gridPY,1,i),zShadow);
            
        d3d_model_primitive_end(global.modelShadow);
    }

        
    //
    //  Global Model: Lighting    
    //

    
    zWall = global.iz-1;
    global.modelLight = d3d_model_create();
    ds_grid_copy(global.gridPX,global.gridVX);
    ds_grid_copy(global.gridPY,global.gridVY);
    ds_grid_multiply_region(global.gridPX,0, 0, 1, global.gridSize, zWall+1);
    ds_grid_multiply_region(global.gridPY,0, 0, 1, global.gridSize, zWall+1);

    for (i=0; i<global.gridSize; i+=1) {        

        d3d_model_primitive_begin(global.modelLight,pr_trianglestrip);
        
        d3d_model_vertex_texture(global.modelLight,
            ds_grid_get(global.gridVX,0,i), 
            ds_grid_get(global.gridVY,0,i),0,
            ds_grid_get(global.gridEU,0,i),
            ds_grid_get(global.gridEV,0,i));
            
        d3d_model_vertex_texture(global.modelLight,
            ds_grid_get(global.gridVX,1,i), 
            ds_grid_get(global.gridVY,1,i),0,
            ds_grid_get(global.gridEU,1,i),
            ds_grid_get(global.gridEV,1,i));
            
        d3d_model_vertex_texture(global.modelLight,
            ds_grid_get(global.gridPX,0,i),
            ds_grid_get(global.gridPY,0,i),global.wallHeight,
            ds_grid_get(global.gridEU,0,i),
            ds_grid_get(global.gridEV,0,i));
    
        d3d_model_vertex_texture(global.modelLight,
            ds_grid_get(global.gridPX,1,i), 
            ds_grid_get(global.gridPY,1,i),global.wallHeight,
            ds_grid_get(global.gridEU,1,i),
            ds_grid_get(global.gridEV,1,i));
            
        d3d_model_primitive_end(global.modelLight);
            
    }
    
    //
    //  Global Model: Texture
    //
    var u0,u1,v0,v1;
    
    global.modelTexture = d3d_model_create();
    
    for (i=0; i<global.gridSize; i+=1) {   
    
        u0 = 0;
        u1 = point_distance(ds_grid_get(global.gridVX,0,i),ds_grid_get(global.gridVY,0,i),ds_grid_get(global.gridVX,1,i),ds_grid_get(global.gridVY,1,i))/128;
        v0 = 0;
        v1 = 2;

        d3d_model_primitive_begin(global.modelTexture,pr_trianglestrip);
        
        d3d_model_vertex_texture(global.modelTexture,
            ds_grid_get(global.gridVX,0,i), 
            ds_grid_get(global.gridVY,0,i),0,u1,v1);
            
        d3d_model_vertex_texture(global.modelTexture,
            ds_grid_get(global.gridVX,1,i), 
            ds_grid_get(global.gridVY,1,i),0,u0,v1);
            
        d3d_model_vertex_texture(global.modelTexture,
            ds_grid_get(global.gridPX,0,i),
            ds_grid_get(global.gridPY,0,i),global.wallHeight,u1,v0);
    
        d3d_model_vertex_texture(global.modelTexture,
            ds_grid_get(global.gridPX,1,i), 
            ds_grid_get(global.gridPY,1,i),global.wallHeight,u0,v0);
            
        d3d_model_primitive_end(global.modelTexture);
    }
    
    return 0;
}