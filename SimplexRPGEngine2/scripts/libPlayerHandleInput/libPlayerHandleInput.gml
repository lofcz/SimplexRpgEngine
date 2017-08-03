/// @function libPlayerHandleInput()
/// @desc Handles basic input

var tmp_canMove = !mathArrayContains(v_canMove, 0);
var tmp_finalSpeed = v_speed;

var lay_id = layer_get_id("tIce");
var map_id = layer_tilemap_get_id(lay_id);
var data = tilemap_get_at_pixel(map_id, x, y);

if (tmp_canMove)
{
	if (v_currentAnimation == e_animations.valWalk)
	{
	
		var tmp_keyW = keyboard_check(ord("W"));
		var tmp_keyS = keyboard_check(ord("S"));
		var tmp_keyA = keyboard_check(ord("A"));
		var tmp_keyD = keyboard_check(ord("D"));
		var tmp_keyAny = (tmp_keyW || tmp_keyS || tmp_keyA || tmp_keyD);
		
		
		if (tmp_keyAny)
		{
			if (tmp_keyW) {v_dir = e_dirs.valW; direction = 90;}
			if (tmp_keyS) {v_dir = e_dirs.valS; direction = 270;}
			if (tmp_keyA) {v_dir = e_dirs.valA; direction = 180;}
			if (tmp_keyD) {v_dir = e_dirs.valD; direction = 0;}
			
			v_lastDir = v_dir;
			v_speedReal = lerp(v_speedReal, tmp_finalSpeed, 0.25);
			
			image_speed = 0.25 + (tmp_finalSpeed / 100);
			speed = v_speedReal;
		}
		else
		{
			image_speed = 0;
			speed = v_speedReal;
			image_index = 12;
			v_speedReal = lerp(v_speedReal, 0, 0.30);
		}
		
	}
}

if (v_currentAnimation != e_animations.valBash)
{  
	if (v_dir == e_dirs.valW) {if (image_index < 0  || image_index > 5.9)  {image_index = 0;}}
	if (v_dir == e_dirs.valS) {if (image_index < 12 || image_index > 17.9) {image_index = 12;}}    
	if (v_dir == e_dirs.valA) {if (image_index < 6  || image_index > 11.9) {image_index = 6;}}    
	if (v_dir == e_dirs.valD) {if (image_index < 18 || image_index > 23.9) {image_index = 18;}}        
}    

