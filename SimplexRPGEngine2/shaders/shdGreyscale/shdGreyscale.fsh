varying vec2 vTc;
varying vec4 v_vColour;

void main() 
{
  vec4 irgba=texture2D(gm_BaseTexture,vTc);
  float luminance=dot(irgba.rgb,vec3(0.2125,0.7154,0.0721));
  gl_FragColor = v_vColour * vec4(luminance,luminance,luminance,irgba.a / 2.0);
}