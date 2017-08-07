//
// lerp to colour fragment shader
//
uniform vec4 f_Colour1;         // rgb=colour, a=0 to 1 lerp value
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    col.rgb = mix(col.rgb,f_Colour1.rgb, f_Colour1.a);
    gl_FragColor = v_vColour * col;
}

