with(parSolid){
    if(point_distance(x,y,other.x,other.y < abs(2*sprite_width*sprite_height))){
        if(!(zbottom >= argument3 || ztop <= argument2)){
            with(other){
                
                if(place_meeting(argument0,argument1,other)){
                    coll_name = object_get_name(other.object_index);
                    coll_id   = other.id;

                    return other.id;
                }
            }
        }
    }
}
return false