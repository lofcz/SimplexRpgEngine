///aStar_close()
/*
 * Shuts down the pathfinder. Must be re-initialized if it should be used again.
 *
 * Returns: None
*/

if(instance_exists(obj_pathfinder))
{
    with(obj_pathfinder)
    {
        ds_grid_destroy(cells);
        instance_destroy();
    }
}

