//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec2 in_TextureCoord2;             // (u,v)

varying vec2 v_vTexcoord;
varying vec2 v_vTexcoord2;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
    v_vTexcoord2 = in_TextureCoord2;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// 2 texture lookup
//
varying vec2 v_vTexcoord;
varying vec2 v_vTexcoord2;

uniform sampler2D second_texture;

void main()
{
    gl_FragColor =  texture2D( gm_BaseTexture, v_vTexcoord ) * texture2D( second_texture, v_vTexcoord2);
}

