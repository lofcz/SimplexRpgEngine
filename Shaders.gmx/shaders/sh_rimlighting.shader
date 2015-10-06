/*
Rim lighting vertex shader

Written by TheSnidr
www.thesnidr.com
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_Normal;                    // (x,y,z)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float dp;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    vec3 wvPosition = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Position, 1.0)).xyz);
    vec3 wvNormal = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal, 0.0)).xyz);
    float power = 1.0; //Increase to reduce the effect or decrease to increase the effect
    dp = pow(dot(wvPosition, wvNormal) + 1.0, power);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Rim lighting fragment shader

Written by TheSnidr
www.thesnidr.com
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float dp;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) + dp;
}
