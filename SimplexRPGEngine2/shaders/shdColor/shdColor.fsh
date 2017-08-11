//
// mask fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 f_ChannelMask;
void main()
{
    // The channel mask is a 4 point vector each holding 0 or 1.
    // This value multiples with the pixel colour and if 0 removes it, leaving only
    // those whose channel mask is set to 1
    gl_FragColor = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )) * f_ChannelMask;
}

