attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;

void main()
{ 
    float gray = dot(texture2D(gm_BaseTexture,v_texcoord).rgb, vec3(0.21, 0.71, 0.07));

    gl_FragColor = vec4(vec3(gray), texture2D(gm_BaseTexture,v_texcoord).a);
}
