/// scrMinimapIni(height, width, actionKey)

var iHeight, iWidth, iActionKey;
iHeight    = 100;
iWidth     = 100;
iActionKey = "M";

if (argument_count > 0) {iHeight     = real(argument[0]);}
if (argument_count > 1) {iWidth      = real(argument[1]);}
if (argument_count > 2) {iActionKey  = string(argument[2]);}

iActionKey      = string_upper(iActionKey);
minimapZoom = 200;
x1              = 0 - minimapZoom;
y1              = 0 - minimapZoom;
x2              = 0 + view_wview + minimapZoom;
y2              = 0 + view_hview + minimapZoom;
height          = iHeight;
width           = iWidth;
lenx            = x2-x1;
leny            = y2-y1;
sizex           = width/lenx;
sizey           = height/leny;
draw            = 0;
alpha           = 0;
zoom_x          = room_width;
zoom_y          = room_height;
zoom_level      = 1;
m_alpha         = 1;
action_key      = iActionKey;
draw            = true;
pointList       = ds_list_create();
pointListText   = ds_list_create();
pointListX      = ds_list_create();
pointListY      = ds_list_create();
pointListSymbol = ds_list_create();
pointListColor  = ds_list_create();
pointListSprite = ds_list_create();
pointListMap    = ds_list_create();
pointListAuto   = ds_list_create();
hoverAlpha      = 0;
lastI           = -1;
drawMode        = 0;
r               = 100;

alarm[0]       = 1;
