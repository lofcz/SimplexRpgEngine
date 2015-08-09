//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour0;                   // (x,y,z)
attribute vec4 in_Colour1;                   // (x,y,z)
attribute vec4 in_TextureCoord;              // (u,v)

varying vec4 v_vColour1;
varying vec4 v_vColour2;
varying vec4 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0.5, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour1 = in_Colour0;
    v_vColour2 = in_Colour1;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// 2 texture lookup
//
varying vec4 v_vColour1;
varying vec4 v_vColour2;
varying vec4 v_vTexcoord;

uniform sampler2D second_texture;

void main()
{
    gl_FragColor = v_vColour1*texture2D( gm_BaseTexture, v_vTexcoord.xy ) + v_vColour2*texture2D( second_texture, v_vTexcoord.zw);}

