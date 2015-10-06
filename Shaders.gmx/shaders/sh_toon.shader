/*
Toon vertex shader

Written by TheSnidr
www.thesnidr.com
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColor;
varying float dp;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
    v_vColor = vec4(1.0, 1.0, 1.0, 1.0);
    
    vec3 vNormal = normalize((in_Colour.xyz) * 2.0 - 1.0);
    vec3 wvNormal = (gm_Matrices[MATRIX_WORLD_VIEW] * vec4(vNormal, 0.0)).xyz;
    float normalLength = length(wvNormal);
    
    if (dot(normalize((gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Position, 1.0)).xyz), wvNormal / normalLength) >= 0.0)
    {
        v_vColor = vec4(0.0, 0.0, 0.0, 1.0);
        gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position + in_Normal / normalLength * gl_Position.z / 100.0, 1.0);
    }
    else
    {
        dp = (1.0 - dot((normalize(gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal, 0.0))).xyz, normalize(vec3(1.0, -1.0, 1.0)))) / 2.0;
    }
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Toon fragment shader

Written by TheSnidr
www.thesnidr.com
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColor;
varying float dp;

uniform sampler2D celShadingSample;

void main()
{
    gl_FragColor = v_vColor * texture2D(gm_BaseTexture, v_vTexcoord) * texture2D(celShadingSample, vec2(dp, 0.0));
}

