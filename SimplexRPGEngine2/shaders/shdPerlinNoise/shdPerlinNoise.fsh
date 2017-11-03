varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time; 
uniform vec2 iResolution;
uniform float strenght;

float random(float x) 
{
    return fract(sin(x) * 10000.);         
}

float noise(vec2 p) 
{
    return random(p.x + p.y * 10000.);           
}

vec2 sw(vec2 p) { return vec2(floor(p.x), floor(p.y)); }
vec2 se(vec2 p) { return vec2(ceil(p.x), floor(p.y)); }
vec2 nw(vec2 p) { return vec2(floor(p.x), ceil(p.y)); }
vec2 ne(vec2 p) { return vec2(ceil(p.x), ceil(p.y)); }

float smoothNoise(vec2 p) 
{
    vec2 interp = smoothstep(0., 1., fract(p));
    float s = mix(noise(sw(p)), noise(se(p)), interp.x);
    float n = mix(noise(nw(p)), noise(ne(p)), interp.x);
    return mix(s, n, interp.y);       
}

float fractalNoise(vec2 p) 
{
    float x = 0.;
    x += smoothNoise(p      );
    x += smoothNoise(p * 2. ) / 2.;
    x += smoothNoise(p * 4. ) / 4.;
    x += smoothNoise(p * 8. ) / 8.;
    x += smoothNoise(p * 16.) / 16.;
    x /= 1. + 1./2. + 1./4. + 1./8. + 1./16.;
    return x;          
}

float movingNoise(vec2 p) 
{
    float x = fractalNoise(p + time);
    float y = fractalNoise(p - time);
    return fractalNoise(p + vec2(x, y));    
}

float nestedNoise(vec2 p) 
{
    float x = movingNoise(p);
    float y = movingNoise(p + 100.);
    return movingNoise(p + vec2(x, y));   
}

void main()
{
    vec2 uv = v_vTexcoord.xy;
    float n = nestedNoise(uv * strenght);
    
    gl_FragColor = vec4(mix(vec3(.4, .6, 1.), vec3(.1, .2, 1.), n), 1.);
}

