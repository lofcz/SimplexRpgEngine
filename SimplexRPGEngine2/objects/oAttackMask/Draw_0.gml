/// @description Insert description here
// You can write your code in this editor

draw_self();
event_inherited();

var tmp_list;
tmp_list = instance_position_list(x, y, parGameObject);

if (tmp_list != noone)
{
	for (var i = 0; i < ds_list_size(tmp_list); i++)
	{
		if (tmp_list[| i] == id) {continue;}
		
		if (tmp_list[| i].v_canBeDamaged)
		{
			if (libUtilityCheckCollisionRect(v_collisionMain, tmp_list[| i].v_collisionMain)) 
			{
				if (!ds_list_contains(v_hitList, tmp_list[| i]) && tmp_list[|i].v_alive)
				{
					ds_list_add(v_hitList, tmp_list[| i]);
					tmp_list[| i].v_properties[e_inventoryProperties.valHp] -= 5;
					
					var tmp_d1, tmp_d2;
					if (sprite_index == sSwingRight) {tmp_d1 = 315; tmp_d2 = 405;}
					if (sprite_index == sSwingLeft) {tmp_d1 = 135; tmp_d2 = 225;}
					if (sprite_index == sSwingDown) {tmp_d1 = 225; tmp_d2 = 315;}
					if (sprite_index == sSwingUp) {tmp_d1 = 45; tmp_d2 = 135;}
					
					if (tmp_list[| i].v_isVivid)
					{
						cpGoreBlood(tmp_list[| i].x, tmp_list[| i].y, 5, c_red, tmp_d1, tmp_d2);
					}
					
					if (tmp_list[| i].v_dropShardsOnHit)
					{
						cpGoreShardsLong(tmp_list[| i].k, tmp_list[| i].image_index - 1, 32 + irandom(32), 4);	
					}
					
					cpSplashMessage(string(5), c_black, -1, 0, 0, tmp_list[| i].x, tmp_list[| i].y - 32);

					tmp_list[| i].v_mindState = "attack";
					tmp_list[| i].v_attackNote = 256;
					
					if (tmp_list[| i].v_properties[e_inventoryProperties.valHp] <= 0)
					{
						with(tmp_list[| i])
						{
							if (v_alive)
							{
								if (v_isVivid)
								{
									v_splitStartX = 32;
									v_splitStartY = 0;

									v_splitEndX = 32;
									v_splitEndY = 64;

									v_restX = x;
									v_restY = y;

									v_restStartX = v_restX;
									v_restStartY = v_restY;


									d_spriteList = sprite_divide(v_sprite,v_splitStartX,v_splitStartY,v_splitEndX,v_splitEndY);

									sprite_index = d_spriteList[| 1];
									v_spriteRest = d_spriteList[| 0];

									ds_list_destroy(d_spriteList);
									cpGoreBlood(tmp_list[| i].x, tmp_list[| i].y, 20, c_red, 0, 360);
								}	
								
								if (v_dropShardsOnHit)
								{
									v_sprite = sprite_duplicate(sprite_index);
									
									v_splitStartX = point1[0];
									v_splitStartY = point1[1] + irandom(8);

									v_splitEndX = point2[0];
									v_splitEndY = point2[1];

									v_restX = x;
									v_restY = y;

									v_restStartX = v_restX;
									v_restStartY = v_restY;


									d_spriteList = sprite_divide(v_sprite,v_splitStartX,v_splitStartY,v_splitEndX,v_splitEndY);

									kk = d_spriteList[| 1];
									v_spriteRest = d_spriteList[| 0];

									ds_list_destroy(d_spriteList);									
								}
								
								if (v_isMask)
								{
									// Delete tile
									for (var f = 0; f < v_currentTile; f++)
									{
										var data;
										data = tilemap_get(v_tileIndex[2, f], v_tileIndex[0, f], v_tileIndex[1, f]);
									
										var surf;
										surf = surface_create(32, 32);
										surface_set_target(surf);
									
										var index;
										index = tile_get_index(data);
									
										var tx, ty;
										tx = 32; 
										ty = 0;
									
										var w, ws;
										w = sprite_get_width(v_tileIndex[3, f]);
										ws = w div 32;

										//index = index div ws * ws;
										for (var g = 0; g < index; g++)
										{
											tx += 32;

											if (tx > w) {tx = 32; ty += 32;}
										}

										draw_sprite_part(v_tileIndex[3, f], 0, tx, max(ty, 0), 32, 32, 0, 0);
										surface_reset_target();
									
										var sprite;
										sprite = sprite_create_from_surface(surf, 0, 0, 32, 32, 0, 0, 0, 0);
									
										cpGoreShards(sprite, 0, 32, 4);

										surface_free(surf);
									
										data = tile_set_index(data, 0);				
										tilemap_set(v_tileIndex[2, f], data, v_tileIndex[0, f], v_tileIndex[1, f]);
									}
									
									instance_destroy(tmp_list[| i]);
								}
								
								v_alive = false;
								event_user(0);
							}
								}
							}
																	
						}	
					}				
				}
			}
		}



if (tmp_list != noone) {ds_list_destroy(tmp_list);}