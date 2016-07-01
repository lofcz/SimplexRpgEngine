attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
uniform vec2 resolution;
uniform float mass;
  
void main()
{
    vec4 base_colour = texture2D(gm_BaseTexture, v_texcoord);
    
    vec3 colours[3];
    colours[0] = vec3(0.0,0.0,1.0);
    colours[1] = vec3(1.0,1.0,0.0);
    colours[2] = vec3(1.0,0.0,0.0);
    
    float lum = (base_colour.r+base_colour.g+base_colour.b)/3.0;
    
    int ix=1;
    if (lum < 0.5) {ix = 0;}
    
    vec3 thermal = mix(colours[ix],colours[ix+1],(lum-float(ix)*0.5)/0.5);
    
 gl_FragColor = mix(vec4(thermal,base_colour.a),base_colour,mass+1.0); 
}
