/// DrawWindowBorder(_width,_height,_title)
//
//  Draw a very simple window frame. 
//  This could be constructed from sprite parts, and even fade on when moving/resizing is required
//
var w = argument0;
var h = argument1;
var title = argument2;

// colours based on current mouse selection
var window_col = normal_colour;
var close_col = close_button_colour;
var maximise_col = maximise_button_colour;
if( moving )        window_col=selected_colour;
if( closing_over )  close_col = close_button_colour_selected;
if( maximise_over ) maximise_col = maximise_button_colour_selected;




// set the window colour
draw_set_colour(window_col);


// title bar
draw_rectangle(0,0,w-1,titlebarheight-1,false);

// sides
draw_rectangle(0,0,thickness-1,h-1,false);          // left
draw_rectangle(w-(thickness),0,w-1,h-1,false);      // right
draw_rectangle(0,h-(thickness),w-1,h-1,false);      // bottom



// render title
var sw = string_width(title);
var sh = string_height(title);
var px = (w-sw)>>1;
var py = (titlebarheight-sh)>>1;
draw_set_colour(c_white);
draw_set_font(font0);
draw_text(px,py,title);



// close/maximise gadgets
var cx = w;
var cy = (titlebarheight-button_size)>>1;
  
// render close button - should really be a sprite
if( close_button ){
    // set the window colour
    draw_set_colour(close_col);
    cx = cx-button_size-thickness-1;
    draw_rectangle(cx,cy,cx+button_size,cy+button_size,false);    // simple close button "box"
}
// render maximise button - should really be a sprite
if( maximise_button ){
    // set the window colour
    draw_set_colour(maximise_col);
    var cx = cx-button_size-thickness-1;
    draw_rectangle(cx,cy,cx+button_size,cy+button_size,false);    // simple close button "box"
}


