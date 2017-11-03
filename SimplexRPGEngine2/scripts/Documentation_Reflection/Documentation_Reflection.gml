/*

****************
Water Reflection
	-by matharoo
****************

**USAGE**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use refl_start() in a Create/Room Start or any one-time event to start off the reflections.

Arguments:
	
	Layer: This is the layer where the reflections will be drawn. Can be the "layer name" or the layer ID.
	Camera_Used: Use true if you're using a camera, false if you're not.
	
**WATER TILE LAYER**---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Use refl_water_layer() to assign a layer that contains the water tiles. Reflections will appear on the tiles.
Make sure the layer is invisible inside the room, because it will be drawn by the asset.

Arguments:

	Layer: The tile layer that contains the water.
	Water_Detection: Enable this if the tile layer contains BOTH water and land, so that the reflections appear only on the (blue) water.
	
If the tile layer has both water and land, then you will have to keep the layer visible but make sure it's BELOW the reflection layer specified in refl_start().

**WATER OBJECTS**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use refl_water_object(id) to add objects that behave as water. Reflections will appear on them.
These objects should be invisible as well.

**ENABLE REFLECTIONS FOR OBJECTS**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use refl_add_object(id) to add an object that should be reflected. It can be an instance ID or an object.

Example: Player, trees, etc.

Arguments:

	ID: The instance or object to add
	Offset: Vertical offset in pixels. Positive values move the reflection closer, negative values move it farther. Moving the reflection farther will distort it (realism, bro).

**ADDING SKY OBJECTS**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

You can make objects invisible, either by turning off the "Visible" checkbox in the object, or making their layer invisible. The reflections will still be visible if they have been enabled using refl_add_object().
This way, you can create invisible sky objects that are visible only in the reflections. It will look like the water is reflecting the sky. So you can add clouds, birds, sun, stars, etc.

**WATER REFLECTION PROPERTIES**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

You can customize the water reflections' appearance. To do so, open obj_waterrefl's Create event and change the variables there. Comments for the variables are there.

**IMPORTANT**---------------------------------------------------------------------------------------------------------------------------------------------------------------------

To make sure the reflection animation doesn't cut off to the sprite's edges, make sure there is enough empty space around the graphic in the sprite.
Also, open Tools > Texture Groups and make sure "Automatically Crop" is DISABLED.

-----
To make sure the reflections line up properly, make sure the graphic is at the bottom of the sprite, OR, adjust the offset.

**USAGE EXAMPLE**
*/
refl_start("Refl_Layer", true);			//Starts the reflection in layer "Refl_layer" with camera enabled.
refl_water_layer("Tiles_Water", true);	//Sets the layer "Tiles_Water" which contains the water tiles only, with water detection disabled.
//refl_water_object(obj_puddle);			//Adds obj_puddle as a water object.

//refl_add_object(obj_player, 0);			//Enables reflection for obj_player.
//refl_add_object(obj_tree, 8);			//Enables reflection for obj_tree, with an adjusted offset.
//refl_add_object(obj_cloud, -16);		//Enables reflection for obj_cloud, an invisible object, with -30 offset, to make it appear far away.
/*
*/