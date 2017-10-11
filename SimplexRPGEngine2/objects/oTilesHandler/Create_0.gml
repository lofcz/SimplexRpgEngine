/// @description Insert description here
// You can write your code in this editor

/*
var data = layer_get_all_elements("Tiles_4");

for (var i = 0; i < array_length_1d(data); i++)
{
	if (!instance_place(tilemap_get_x(data[i]), tilemap_get_y(data[i]), oCollMaskNonsolid))
	{
		instance_create_depth(tilemap_get_x(data[i]), tilemap_get_y(data[i]), -900, oCollMaskNonsolid);
	}
}*/

var lay_id = layer_get_id("Tiles_4");
var map_id = layer_tilemap_get_id(lay_id);

for (var i = 0; i < room_height / 32; i++)
{
	for (var j = 0; j < room_width / 32; j++)
	{
		var data = tilemap_get(map_id, j, i);
		
		if (data != 0)
		{
			if (!place_meeting(j * 32, i * 32, oCollMaskNonsolid))
			{
				var inst = instance_create_depth(j * 32, i * 32, - 900, oCollMaskNonsolid);
				inst.v_tileIndex[0] = j;
				inst.v_tileIndex[1] = i;
				inst.v_tileIndex[2] = map_id;
			}
		}
	}
}
