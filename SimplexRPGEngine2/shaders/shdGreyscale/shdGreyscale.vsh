attribute vec4 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 vTc;
attribute vec4 in_Colour;                    // (r,g,b,a)
varying vec4 v_vColour;

void main() 
{
  gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
  vTc = in_TextureCoord;
  v_vColour = in_Colour;
}