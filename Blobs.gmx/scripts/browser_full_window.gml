///browser_full_window()

// fill full browser window with room in proper aspect ratio

// © TomBen 2014


var ratio,size_x,size_y;

ratio=max(room_width/browser_width,room_height/browser_height);
size_x=room_width/ratio;
size_y=room_height/ratio;
x=browser_width-size_x;
y=browser_height-size_y;

if os_browser != browser_not_a_browser
{
ratio=max(room_width/browser_width,room_height/browser_height); //compute ratio    room_size : window size
size_x=room_width/ratio;    //horizontal aspect
size_y=room_height/ratio;   //vertical aspect
x=browser_width-size_x;     //if browser has different aspect ratio than room some difference appears in x,y 
y=browser_height-size_y;    //own position is used ( object is invisible )

window_set_rectangle(x/2,y/2,size_x,size_y); //if there is a border in any direction, window is centered 
}

return(0);