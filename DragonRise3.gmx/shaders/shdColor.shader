//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// mask fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 f_ChannelMask;
void main()
{
    // The channel mask is a 4 point vector each holding 0 or 1.
    // This value multiples with the pixel colour and if 0 removes it, leaving only
    // those whose channel mask is set to 1
    gl_FragColor = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )) * f_ChannelMask;
}


