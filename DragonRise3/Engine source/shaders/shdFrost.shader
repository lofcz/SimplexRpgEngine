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


#define FROSTYNESS 1.0
#define COLORIZE   1.0
#define COLOR_RGB  0.7,1.0,1.0

float rand(vec2 uv) {
 
    float a = dot(uv, vec2(92., 80.));
    float b = dot(uv, vec2(41., 62.));
    
    float x = sin(a) + cos(b) * 51.;
    return fract(x);
}

void main()
{
	vec2 uv = v_vTexcoord.xy;
 vec4 d = texture2D(gm_BaseTexture, uv);
	vec2 rnd = vec2(rand(uv+d.r*.05), rand(uv+d.b*.05));
    
    //vignette
    const vec2 lensRadius 	= vec2(0.65*1.5, 0.05);
    float dist = distance(uv.xy, vec2(0.5,0.5));
    float vigfin = pow(1.-smoothstep(lensRadius.x, lensRadius.y, dist),2.);
   
    rnd *= .025*vigfin+d.rg*FROSTYNESS*vigfin;
    uv += rnd;
    gl_FragColor = mix(texture2D(gm_BaseTexture, uv),vec4(COLOR_RGB,1.0),COLORIZE*vec4(rnd.r));
}
