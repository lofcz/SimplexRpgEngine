/// @function libPlayerDraw()
/// @desc Renders player to the canvas

for (var i = 0; i < 14; i++)
{
	if (v_bci[v_currentAnimation, i] != sCatchError && v_bci[v_currentAnimation, i] != 0) 
	{
		draw_sprite(v_bci[v_currentAnimation, i], image_index, x, y);
	}
}