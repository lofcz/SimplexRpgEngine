/// scrMinimapRemoveWaypoint(id)

var in, pos;
in = 0;

if (argument_count > 0) {in = argument[0];}

pos = ds_list_find_index(oMinimap.pointList, in);

ds_list_delete(oMinimap.pointList,       pos);
ds_list_delete(oMinimap.pointListText,   pos);
ds_list_delete(oMinimap.pointListX,      pos);
ds_list_delete(oMinimap.pointListY,      pos);
ds_list_delete(oMinimap.pointListSymbol, pos);
ds_list_delete(oMinimap.pointListColor,  pos);
ds_list_delete(oMinimap.pointListSprite, pos);
ds_list_delete(oMinimap.pointListMap,    pos);
ds_list_delete(oMinimap.pointListAuto,   pos);

