varying vec3 vertPosition;
varying vec3 vertNormal;
varying vec2 vertTexcoord;
varying vec4 vertColour;

attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

void main() {
    vertPosition = (gm_Matrices[MATRIX_WORLD] * vec4(in_Position,1.0)).xyz; // Position in world
    vertNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0)).xyz; // Normal in world
    vertTexcoord = in_TextureCoord;
    vertColour = in_Colour;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~const float sqrt05 = 0.707106781;
const float pi = 3.141592653;
const float tau = pi * 2.0;

uniform vec3 lightPosition;
uniform float lightRange;
uniform vec3 lightColor;
uniform float worldAmbient;
uniform float shadowMapSize;
uniform sampler2D shadowMapXp;
uniform sampler2D shadowMapXn;
uniform sampler2D shadowMapYp;
uniform sampler2D shadowMapYn;
uniform sampler2D shadowMapZp;
uniform sampler2D shadowMapZn;

varying vec3 vertPosition;
varying vec3 vertNormal;
varying vec2 vertTexcoord;
varying vec4 vertColour;

float texelSize = 1.0 / shadowMapSize;

float ColorToFloat(vec4 c) {
    return (c.r + c.g / 256.0 + c.b / (256.0 * 256.0)) * lightRange;
}

vec2 convert3Dto2D(vec3 point, vec3 from, vec3 look) {
    // Converts a 3D point to a 2D point (point), depending on the
    // camera's position (from) and its direction (look).
    // The result is a vec2 with x and y between 0 and 1.
    // http://gmc.yoyogames.com/index.php?showtopic=416555 <- optimized version of this
    
    float tFOV = tan(pi / 4.0);
    vec3 u, v, toPoint = point - from;
    vec2 coord2D;
    
    // Prepare 3D to 2D conversion
    look /= sqrt(dot(look, look));
    u = vec3(-look.z * look.x, -look.z * look.y, 1.0 - look.z * look.z);
    u /= sqrt(dot(u, u));
    u *= tFOV; 
    v = vec3(u.y * look.z - look.y * u.z, u.z * look.x - look.z * u.x, u.x * look.y - look.x * u.y);
    
    // Convert
    toPoint /= dot(toPoint,look);
    coord2D.x = (dot(toPoint, v) / (tFOV * tFOV) + 1.0) / 2.0;
    coord2D.y = (1.0 - dot(toPoint, u) / (tFOV * tFOV)) / 2.0;
    
    return coord2D;
}

float getShadow(sampler2D shadowMap, vec3 look) {
    // Returns the shadow (1=Full shadow, 0=In light) of the pixel.
    // It convertes the pixel to a point on the given shadow map (X,-X,Y,-Y,Z or -Z).
    float shadow = 0.0;
    vec2 texCoord = convert3Dto2D(vertPosition, lightPosition, look);
    
    float myDepth = distance(vertPosition, lightPosition);
    float detail = 10.0; // Higher detail = more lag
    float sampleDistance = 0.1 + 2.5 * pow(1.0 - clamp(myDepth / lightRange, 0.0, 1.0), 2.0); // Higher distance = smoother shadows, more artifacts
    float bias = 0.02; // Higher bias = less artifacts, shadows seem to be floating ("Peter Panning")
    
    // Percentage Closer Filtering
    for (float i = 0.0; i < tau; i += tau / detail) {
        float sampleDepth = ColorToFloat(texture2D(shadowMap, texCoord + vec2(cos(i), sin(i)) * texelSize * sampleDistance)); // Grab samples from circle around texture position
        if (sampleDepth / myDepth < 1.0 - bias) shadow += 1.0 / detail;
    }
    shadow = sin(shadow * (pi / 2.0));

    return shadow;
}

void main() {
    vec3 toLight = vertPosition - lightPosition;
    vec4 lookDir = vec4( // Get the direction from the pixel to the light
        (toLight.x) / distance(vertPosition.xy, lightPosition.xy),
        (toLight.y) / distance(vertPosition.xy, lightPosition.xy),
        (toLight.z) / distance(vertPosition.xz, lightPosition.xz),
        (toLight.z) / distance(vertPosition.yz, lightPosition.yz)
    );
    vec3 N = normalize(vertNormal);
    vec3 L = normalize(-toLight);
    float shadow = 1.0; // Shadow factor
    float dif = max(0.0, dot(N, L)); // Diffuse factor
    float att = 1.0 - distance(vertPosition, lightPosition) / lightRange; // Attenuation factor
    
    if (att > 0.0) {
        // Check what shadow map we should use when sampling
        if (lookDir.z > sqrt05 && lookDir.w > sqrt05) shadow = getShadow(shadowMapZp, vec3(0.00001, 0.0, 1.0)); // Z+
        else if (lookDir.z < -sqrt05 && lookDir.w < -sqrt05) shadow = getShadow(shadowMapZn, vec3(0.00001, 0.0, -1.0)); // Z-
        else if (lookDir.x > sqrt05) shadow = getShadow(shadowMapXp, vec3(1.0, 0.0, 0.0)); // X+
        else if (lookDir.x < -sqrt05) shadow = getShadow(shadowMapXn, vec3(-1.0, 0.0, 0.0)); // X-
        else if (lookDir.y > sqrt05) shadow = getShadow(shadowMapYp, vec3(0.0, 1.0, 0.0)); // Y+
        else shadow = getShadow(shadowMapYn, vec3(0.0, -1.0, 0.0)); // Y-
    }
    
    float col = ((1.0 - shadow) * dif + worldAmbient) * att;
    
    gl_FragColor = vec4(lightColor * col, 1.0);
}
