/// scrShaderDrawColor()

if (global.shaders_enabled)
{
    shader_set(shdColor);
    shader_set_uniform_f(channel_mask, s_r, s_g, s_b, s_a);
    draw_sprite(sprite_index,image_index,x, y);                
    shader_reset();
}
else {draw_self();}
