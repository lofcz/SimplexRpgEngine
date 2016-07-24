/// scrMinimapIni(height, width, actionKey)

var iHeight, iWidth, iActionKey;
iHeight    = 100;
iWidth     = 100;
iActionKey = "M";

if (argument_count > 0) {iHeight     = real(argument[0]);}
if (argument_count > 1) {iWidth      = real(argument[1]);}
if (argument_count > 2) {iActionKey  = string(argument[2]);}

iActionKey     = string_upper(iActionKey);
x1             = 0;
y1             = 0;
x2             = room_width;
y2             = room_height;
height         = iHeight;
width          = iWidth;
lenx           = x2-x1;
leny           = y2-y1;
sizex          = width/lenx;
sizey          = height/leny;
draw           = 0;
alpha          = 0;
zoom_x         = room_width;
zoom_y         = room_height;
zoom_level     = 1;
m_alpha        = 1;
action_key     = iActionKey;
draw           = true;
pointList      = ds_list_create();
pointListText  = ds_list_create();
pointListX     = ds_list_create();
pointListY     = ds_list_create();
pointListSymbol = ds_list_create();
pointListColor = ds_list_create();
hoverAlpha    = 0;
lastI          = -1;

alarm[0]       = 1;
