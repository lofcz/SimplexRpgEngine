attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 v_texcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_vColour;
uniform float f_Amount;

void main()
{     
    vec4 col   = texture2D(gm_BaseTexture,v_texcoord);
    float gray = dot(col.rgb,vec3(0.299, 0.587, 0.114));
        
    gl_FragColor = vec4(mix(v_vColour*col,vec4(gray,gray,gray,col.a),f_Amount));
}
