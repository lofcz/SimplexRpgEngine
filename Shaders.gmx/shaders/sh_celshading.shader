/*
Cel shading vertex shader

Written by TheSnidr
www.thesnidr.com
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float dp;

uniform vec3 lightPos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    dp = (1.0 - dot((normalize(gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0))).xyz, normalize((gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.0)).xyz - lightPos))) / 2.0;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Cel shading fragment shader

Written by TheSnidr
www.thesnidr.com
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float dp;

uniform sampler2D celShadingSample;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * texture2D( celShadingSample, vec2(dp, 0.0));
}
