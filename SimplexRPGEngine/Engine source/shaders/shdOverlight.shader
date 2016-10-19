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
uniform vec2 iResolution;

float length2(vec2 p) { return dot(p, p); }

float noise(vec2 p){
return fract(sin(fract(sin(p.x) * (4313.13311)) + p.y) * 3131.0011);
}

float worley(vec2 p) {
float d = 1e30;
for (int xo = -1; xo <= 1; ++xo)
for (int yo = -1; yo <= 1; ++yo) {
vec2 tp = floor(p) + vec2(xo, yo);
d = min(d, length2(p - tp - vec2(noise(tp))));
}
return 3.*exp(-4.*abs(2.*d - 1.));
}

float fworley(vec2 p) {
return sqrt(sqrt(sqrt(pow(worley(p + iGlobalTime), 2.) * worley(p*2. + 1.3 + iGlobalTime*.5) * 1.0)));
}

void main()
{
    vec2 uv = v_vTexcoord.xy;
    float mt = fworley(uv * iResolution.xy * 2. / 600.);
    
    gl_FragColor = vec4(mt * vec3(1.8, 1.8*mt, .1 + pow(mt, 2.-mt)), 0.2);
}

