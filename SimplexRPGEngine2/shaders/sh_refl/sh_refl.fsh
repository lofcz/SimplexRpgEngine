//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//unis
uniform vec4 uvs;
uniform vec2 texel;

//sin
uniform float time;
//convert to unis later
uniform float slow;// = 100.0;
uniform float amount;// = 4.0;
uniform float waves;// = 20.0;

uniform float y_amount;// = 2.0;
uniform float y_waves;

uniform float offset;

uniform float detect;
uniform float blur;
//uniform sampler2D dest_surf;
//uniform vec2 dest_pos;
//uniform vec2 spr_size;
//uniform vec2 surf_size;

uniform float blur_radius;

float blur_quality = 16.0;
float blur_dirs = 8.0;

void main()
{
	//Vars
	float _amount = amount * texel.x;
	float _y_amount = y_amount * texel.y;
	
	//Normalize
	vec2 Texcoord = v_vTexcoord;
	
	Texcoord = vec2((Texcoord-uvs.rg) * (1.0/uvs.ba));
	
	//fade
	//float alpha;
	//if (fade!=0.0){
	//	alpha = Texcoord.y;
	//}
	
	//reverse y texcoord
	Texcoord.y = abs(Texcoord.y-1.0);
	
	//dest pixel
	//vec2 dest_pixel_coord = (dest_pos + (Texcoord*spr_size))/surf_size;
	
	//vec4 dest_pixel = texture2D(dest_surf, dest_pixel_coord);
	
	////detect land
	//bool is_land = dest_pixel.g > dest_pixel.b;
	
	//if (detect==0.0) is_land = false;
	
	//offset
	float _offset = abs(min(0.0, offset));
	
	Texcoord.y += _offset;
	
	//Wave x
	float wave_x = sin(time/slow + Texcoord.y*waves) * _amount * Texcoord.y;
	
	//Wave y
	float wave_y = sin(time/slow + Texcoord.y*y_waves) * _y_amount * Texcoord.y;
	
	//Apply
	vec2 finalCoord = v_vTexcoord + vec2(wave_x, wave_y);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, finalCoord);
	
	//Discard if less alpha, out of bounds or land
	bool out_bound = finalCoord.x < uvs.r || finalCoord.x > uvs.r+uvs.b || finalCoord.y < uvs.g || finalCoord.y > uvs.g+uvs.a;
	
	if (gl_FragColor.a<1.0 || out_bound) discard;
	
	//Blur
	float pii = 3.14159265359;
	
	if (blur!=0.0 && Texcoord.y>0.0){
		for(float i=1.0/blur_quality; i<1.0; i+=1.0/blur_quality){
			for(float d=0.0; d<=pii*2.0; d+=(pii*2.0)/blur_dirs){
				vec2 datCoord = finalCoord + vec2(cos(d)*texel.x, sin(d)*texel.y)*blur_radius*i*Texcoord.y;
				vec4 datPixel = v_vColour * texture2D(gm_BaseTexture, datCoord);
				
				bool dat_out = datCoord.x < uvs.r || datCoord.x > uvs.r+uvs.b || datCoord.y < uvs.g || datCoord.y > uvs.g+uvs.a;
				
				if (!dat_out) gl_FragColor += datPixel;
			}
		}
		gl_FragColor /= blur_quality*blur_dirs+1.0;
	}
	
	//debug
	//gl_FragColor.a = Texcoord.y
}
