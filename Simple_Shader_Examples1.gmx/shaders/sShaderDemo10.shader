//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = object_space_pos.xy;          // x,y is a screen space coordinate.
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 v_MaskParams;      // x,y=position, z=radius, 

void main()
{
    vec2 v = v_MaskParams.xy - v_vPosition.xy;
    float dist = (v.x*v.x) + (v.y*v.y);
    float RadSq = v_MaskParams.z*v_MaskParams.z;
    if( dist>RadSq  ){
        discard;    // throw pixel away if it's out of range
    }else{
        gl_FragColor = gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    }
}

