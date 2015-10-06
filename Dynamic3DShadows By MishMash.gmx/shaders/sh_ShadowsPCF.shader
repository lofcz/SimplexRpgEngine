/*
    ------------------------------------------------
    Dynamic soft shadows Shader
    for GameMaker
    
    Written by Michael Parkin-White (GMC: MishMash)
    Version: 0.10
    
    If you have any questions please feel free to contact me: Michaelpw11@hotmail.com
    
    Free to use in both freeware and commercial games. Redistributions of this source
    must reference original copy. Thankyou!
    Credit is not required, but is greatly appreciated!
    ------------------------------------------------
    Additional credits to:
        Jsorgeagames - 24 bit depth buffer.
    ------------------------------------------------
    This shader allows the user to create dynamic soft shadows in 3D.
    
*/
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 ShadowCoord;

uniform float px;
uniform float py;
uniform float pz;
uniform float dx;
uniform float dy;
uniform float dz;


mat4 LookAt(vec3 eye,vec3 target,vec3 up)
{
    vec3 zaxis = normalize(target - eye);    // The "look-at" vector.
    vec3 xaxis = normalize(cross(up, zaxis));// The "right" vector.
    vec3 yaxis = cross(zaxis, xaxis);     // The "up" vector.
 
    mat4 view = mat4(
        xaxis.x, xaxis.y, xaxis.z,-dot(xaxis, eye),
        yaxis.x, yaxis.y, yaxis.z,-dot(yaxis, eye),
        zaxis.x, zaxis.y, zaxis.z,-dot(zaxis, eye),
         0,     0,      0,      1.0
    );
    return (view );
}

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    ShadowCoord = (gm_Matrices[MATRIX_PROJECTION]* LookAt(vec3(px, py, pz), vec3(px+dx, py+dy, pz+dz), vec3(0.0,0.0,1.0)) *gm_Matrices[ MATRIX_WORLD])* object_space_pos;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
    ------------------------------------------------
    Dynamic soft shadows Shader
    for GameMaker
    
    Written by Michael Parkin-White (GMC: MishMash)
    Version: 0.10
    
    If you have any questions please feel free to contact me: Michaelpw11@hotmail.com
    
    Free to use in both freeware and commercial games. Redistributions of this source
    must reference original copy. Thankyou!
    Credit is not required, but is greatly appreciated!
    ------------------------------------------------
    Additional credits to:
        Jsorgeagames - 24 bit depth buffer.
    ------------------------------------------------
    This shader allows the user to create dynamic soft shadows in 3D.
    
*/
//////////////////////////////////
#define Samples 24.0 // Change this to increase / decrease quality of soft shadows
/////////////////////////////////
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 ShadowCoord;

uniform sampler2D shadowMap;
uniform float SoftSize;

uniform float MaxBrightness;
uniform float MaxDarkness;

// Ambient Light
uniform float aR;
uniform float aG;
uniform float aB;

vec3 floatToColor(float f)
{
    return vec3(floor(f*255.0)/255.0,fract(f*255.0),fract(f*255.0*255.0));
}

float ColorToFloat(vec3 c)
{
    return float((c.r)+(c.g/255.0)+(c.b/(255.0*255.0)));
}

float ShadowGetDarkness(){
    float visibility = 1.0;
    float TexelSizeX = SoftSize / 1920.0;
    float TexelSizeY = SoftSize / 1080.0;
    
    // Samples
    float   angle       = 0.0;
    float   d2          = ShadowCoord.z;
    float   VALUE_A     = 1536.0*ColorToFloat(texture2D( shadowMap, vec2( ((ShadowCoord.x / (ShadowCoord.z)) + 1.0) / 2.0,
                                         1.0 - ((ShadowCoord.y / (ShadowCoord.z)) + 1.0) / 2.0) ).rgb);
    visibility -= (max(1.0-MaxBrightness, min( (d2 - VALUE_A), 1.0-MaxDarkness)))/Samples;
    float dist = 1.0;
    
    for( float i = 0.0; i <= Samples; i+=1.0 ){
        VALUE_A =  1536.0*ColorToFloat(texture2D( shadowMap, vec2( ((ShadowCoord.x / (ShadowCoord.z)) + 1.0) / 2.0,
                                         1.0 - ((ShadowCoord.y / (ShadowCoord.z)) + 1.0) / 2.0) 
                                         + vec2( cos(angle) * TexelSizeX * dist, sin(angle) * TexelSizeY * dist)).rgb);
        visibility -= (max(1.0-MaxBrightness, min( (d2 - VALUE_A), 1.0-MaxDarkness)))/Samples;
        // Increase angle
        angle += 1.047;
        if(mod(i, 6.0)==0.0){
            dist += 1.00;
        }
    }
    return visibility;
}
void main()
{
    // If you wish to stack things with the shadows simply add them here
    
    // Regular Texture Data
    vec4 BaseColour =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Shadow stuff
    vec4 AmbientLightColour = vec4( aR/255.0, aG/255.0, aB/255.0, 1.0) * ShadowGetDarkness();
    
    // Setting
    gl_FragColor    = BaseColour * AmbientLightColour;
    gl_FragColor.a  = BaseColour.a;
}

