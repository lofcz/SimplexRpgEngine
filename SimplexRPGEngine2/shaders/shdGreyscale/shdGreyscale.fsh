varying vec2 vTc;
void main() 
{
  vec4 irgba=texture2D(gm_BaseTexture,vTc);
  float luminance=dot(irgba.rgb,vec3(0.2125,0.7154,0.0721));
  gl_FragColor=vec4(luminance,luminance,luminance,irgba.a / 2.0);
}