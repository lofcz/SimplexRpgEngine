/*
Normal map vertex shader
This shader is very crude. It's basically just an experiment gone wrong

Written by TheSnidr
www.thesnidr.com
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_Normal;                    // (x,y,z)

varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;
varying mat3 v_vMatrix;

uniform vec3 lightPos;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
    v_vColour = in_Colour;
    v_vPosition = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Position, 1.0)).xyz);
    v_vTexcoord = in_TextureCoord;
    
    vec3 Normal = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal, 0.0)).xyz);
    vec3 Side = normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal.y, -in_Normal.x, 0.0, 0.0)).xyz);
    vec3 Up = cross(Side, Normal);
    v_vMatrix = mat3 (Side, Up, Normal);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Normal map fragment shader
This shader is very crude. It's basically just an experiment gone wrong

Written by TheSnidr
www.thesnidr.com
*/
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;
varying mat3 v_vMatrix;

uniform sampler2D s_normalmap;

void main()
{
    vec3 col = (texture2D( s_normalmap, v_vTexcoord)).xyz * 2.0 - 1.0;
    vec3 normal =  normalize(vec3(col.r, col.g, col.b) * v_vMatrix);//(texture2D( s_normalmap, v_vTexcoord)).zxy; 
    float dp = pow(1.0 + dot(normal, v_vPosition), 2.0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord) + vec4(dp, dp, dp, 1.0);
}
