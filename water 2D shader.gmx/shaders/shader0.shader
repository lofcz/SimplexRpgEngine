attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_texcoord;
varying vec4 v_color;


uniform sampler2D s_multitex;
uniform sampler2D s_reftex;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_color = in_Colour;
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_color;


uniform sampler2D s_multitex;
uniform sampler2D s_reftex;

uniform vec2 TexSize;
uniform vec2 Offset;
uniform vec2 WaveSize;
uniform vec2 NormalScale;
uniform vec2 TextureScale;
uniform vec2 ReflectionScale;
uniform vec3 LightDir;
uniform float Shadow;
uniform float Spec;
uniform float Shine;
uniform float Reflection;



vec4 BumpRefractReflectColor( sampler2D texture, sampler2D normalmap, sampler2D reflectionmap, vec4 colour, vec2 size, vec2 texsize, vec2 offset, vec2 normalscale, vec2 coordscale, vec2 reflectcoordscale, vec3 lightdir, float shadow, float spec, float shine )
{
if( texsize.x <= 0.0 ) return( colour );
vec3 eye = vec3( 0.0, 0.0, 1.0 );

vec4 bump = normalize( texture2D( normalmap, ( v_texcoord.xy + offset ) * normalscale ) * vec4( 2.0 ) - vec4( 1.0 ) );
bump.y = -bump.y;
vec3 temp = vec3( 0.0 );
temp.xy = bump.xy;
temp = vec3( dot( temp, temp ) );
bump.z = sqrt( 1.0 - temp.z );

vec2 refract = v_texcoord.xy + ( bump.xy * vec2( size.x / texsize.x, size.y / texsize.y ) );

vec4 source = texture2D( texture, refract * coordscale ) * colour;
float alpha = source.w;
vec4 reflect = texture2D( reflectionmap, refract * reflectcoordscale ) * colour;
source = source * vec4( 1.0 - Reflection ) + reflect * vec4( Reflection );
source.w = alpha;

vec3 light = normalize( lightdir );

float att = 1.0 - ( pow(abs( 1.0 - max( 0.0, light.z )), 2.0 ) );

float diffint = dot( light, bump.xyz );

float specint = pow( abs(dot( normalize( light + eye ), bump.xyz )), shine );

return( ( ( source * vec4( 1.0 - shadow ) ) + ( source * vec4( diffint * att * shadow ) ) ) + ( colour * vec4( specint * spec * alpha ) ) );
}



void main()
{
  gl_FragColor = BumpRefractReflectColor( gm_BaseTexture, s_multitex, s_reftex, v_color, WaveSize, TexSize, Offset, NormalScale, TextureScale, ReflectionScale, LightDir, Shadow, Spec, Shine );

}


