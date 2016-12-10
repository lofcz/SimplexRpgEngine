//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
vec2 uv = v_vTexcoord.xy;
    uv = uv*2.0-1.0;
//    uv.x += 0.7;
    float l = length(uv);
    if(l < 1.0)
        l = 1.0;
    else
        l = 0.0;
    vec3 col = vec3(1.0,0.0,1.0);

    gl_FragColor = vec4(v_vColour.r, v_vColour.g, v_vColour.b, l) * texture2D( gm_BaseTexture, v_vTexcoord );
}


