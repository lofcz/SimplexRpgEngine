/*
Spheremapping vertex shader

Written by TheSnidr
www.thesnidr.com
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_Normal;                    // (x,y,z)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal, 0.0)).xyz).xy / 2.0 + 0.5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Spheremapping fragment shader

Written by TheSnidr
www.thesnidr.com
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
