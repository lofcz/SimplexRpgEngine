attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
uniform float strength;

void main()
{ 
    vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
    vec3 sepia = vec3(0.0);
    sepia.r = dot(colour.rgb, vec3(0.393,0.769,0.189));
    sepia.g = dot(colour.rgb, vec3(0.349,0.686,0.168));
    sepia.b = dot(colour.rgb, vec3(0.272,0.534,0.131));
    gl_FragColor.rgb = mix(colour.rgb,sepia.rgb, strength);
    gl_FragColor.a = colour.a;
}
