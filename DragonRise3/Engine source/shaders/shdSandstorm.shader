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
uniform float iGlobalTime;
uniform sampler2D noiseTex;

void main()
{
    vec2 uv = v_vTexcoord.xy;
    vec3 sceneColor = texture2D( gm_BaseTexture, uv ).rgb;
    vec3 noiseColor = texture2D( noiseTex, uv * 4.0 + vec2(iGlobalTime * 2.0, 0) ).rgb;
    vec3 noiseColor1 = texture2D( noiseTex, uv * 2.0 + vec2(iGlobalTime * 2.0, 0) ).rgb;
    vec3 noiseColor2 = texture2D( noiseTex, uv * 1.0 + vec2(iGlobalTime * 2.0, 0) ).rgb;
    gl_FragColor.a = 1.0;
    float t = max( max(dot( noiseColor, vec3(0.34)), dot( noiseColor1, vec3(0.34))), dot( noiseColor2, vec3(0.34)));
    t *= 1.5; //blowout 
    gl_FragColor.rgb = mix(sceneColor, vec3(0.7, 0.4, 0.0), t * (0.5 + 0.5*sin(iGlobalTime)));
}



