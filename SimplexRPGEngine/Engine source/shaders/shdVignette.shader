attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 var_texcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    
    v_vColour = in_Colour;
    var_texcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 var_texcoord;
varying vec4 v_vColour;
uniform vec4 u_settings;
uniform vec3 u_vignette_colour;

float random(vec3 _scale, float _seed)
{
    return fract(sin(dot(vec3(var_texcoord, 1.0)+_seed, _scale))*43758.5453+_seed);
}

void main()
{
    vec4 base = texture2D( gm_BaseTexture, var_texcoord );

    float vignette = distance( vec2(0.4, 0.4), var_texcoord );
    vignette = u_settings.x - vignette * u_settings.y;
    vec3 vignette_colour = (u_vignette_colour / 255.0) * vignette;

    float noise_strength = u_settings.z;
    float noise = noise_strength * ( 0.5 - random( vec3( 1.0 ), length( vec2(var_texcoord.x/var_texcoord.y, var_texcoord.y)) ) );
    if (u_settings.w == 1.0) {vignette_colour += noise;}

    gl_FragColor =  v_vColour * vec4(base.rgb * vignette_colour, base.a);
}

