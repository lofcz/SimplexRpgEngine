/// 24 bit Depth buffer shader by jsorgeagames

attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying float depth;
varying vec2 v_vTexcoord;

void main()
{
    vec4 objectSpacePos = vec4(in_Position,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * objectSpacePos;
    
    vec4 viewSpacePos = gm_Matrices[MATRIX_WORLD_VIEW] * objectSpacePos;
    
    depth = viewSpacePos.z / 1536.0;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~/// 24 bit Depth buffer shader by jsorgeagames

varying float depth;
varying vec2 v_vTexcoord;

vec3 floatToColor(float f)
{
    return vec3(floor(f*255.0)/255.0,fract(f*255.0),fract(f*255.0*255.0));
}

void main()
{
    vec4 CC = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(floatToColor(depth),1.0); //encode depth as 24 bits instead of 8 bits for more precision
    gl_FragColor.a = CC.a;
}
