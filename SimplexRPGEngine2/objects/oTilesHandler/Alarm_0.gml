/// @description Insert description here
// You can write your code in this editor

for (var k = 0; k < v_layers; k++)
{
	var lay_id = layer_get_id(v_data[k, 0]);
	var map_id = layer_tilemap_get_id(lay_id);
	var layerData = v_data[k, 2];
	
	for (var i = 0; i < room_height / 32; i++)
	{
		for (var j = 0; j < room_width / 32; j++)
		{
			var data = tilemap_get(map_id, j, i);
			
			if (!layerData[e_layerOptions.maskSolid])
			{
				if (data != 0)
				{
				
					if (!place_meeting(j * 32, i * 32, oCollMaskNonsolid) && !place_meeting(j * 32, i * 32, oCollMaskSolid))
					{
						var inst = instance_create_depth(j * 32, i * 32, - 900, oCollMaskNonsolid);
						inst.v_tileIndex[0, 0] = j;
						inst.v_tileIndex[1, 0] = i;
						inst.v_tileIndex[2, 0] = map_id;
						inst.v_tileIndex[3, 0] = v_data[k, 1];
						inst.v_currentTile++;
					}
					else
					{
						var inst = instance_place(j * 32, i * 32, oCollMaskNonsolid);
						if (inst == noone) {inst = instance_place(j * 32, i * 32, oCollMaskSolid);}
					
						inst.v_tileIndex[0, inst.v_currentTile] = j;
						inst.v_tileIndex[1, inst.v_currentTile] = i;
						inst.v_tileIndex[2, inst.v_currentTile] = map_id;
						inst.v_tileIndex[3, inst.v_currentTile] = v_data[k, 1];	
						inst.v_currentTile++;
					}
				}
			}
			else
			{	
				if (data != 0)
				{
					if (!place_meeting(j * 32, i * 32, oCollMaskBasic))
					{
						var inst = instance_create_depth(j * 32, i * 32, - 900, oCollMaskBasic);
					}	
				}
			}
		}
	}
}
