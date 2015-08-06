with(argument0)
    {
    image_xscale = other.zoom_cur / 2;
    image_yscale = other.zoom_cur / 2;
    if !place_free(x - image_xscale, y) && !place_free(x + image_xscale, y - 2)
        { 
        other.zoom_cur = other.zoom_prev;
        image_xscale = other.zoom_cur / 2;
        image_yscale = other.zoom_cur / 2;
        view_hview[0] = other.zoom_cur * other.base_h;
        view_wview[0] = view_hview[0] * other.ratio;
        }
    jump_h = image_xscale * 5;
    view_xview[0] = max(0, x - (view_wview[0] / 2));
    view_yview[0] = max(0, y - (200 * image_xscale) - (view_hview[0] / 2));
    }