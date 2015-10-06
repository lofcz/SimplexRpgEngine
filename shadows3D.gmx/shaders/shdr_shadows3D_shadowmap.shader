varying vec3 vertPosition;

attribute vec3 in_Position;

void main() {
    vertPosition = (gm_Matrices[MATRIX_WORLD] * vec4(in_Position,1.0)).xyz;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform vec3 lightPosition;
uniform float lightRange;

varying vec3 vertPosition;

vec4 FloatToColor(float f) {
    return vec4(floor(f * 256.0) / 256.0, fract(f * 256.0), fract(f * 256.0 * 256.0), 1.0);
}

void main() {
    // Store the distance from the pixel to the light (0-1) as a color.
    gl_FragColor = FloatToColor(distance(vertPosition, lightPosition) / lightRange);
}
