/// @description Insert description here
// You can write your code in this editor

for (var k = 0; k < v_layers; k++)
{
	var lay_id = layer_get_id(v_data[k, 0]);
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
					inst.v_tileIndex[3] = v_data[k, 1];
				}
			}
		}
	}
}
