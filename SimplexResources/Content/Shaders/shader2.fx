Texture2D FirstTexture;
float amt = 0;

#define THRESHOLD 0.001
#define GRANULARITY 20
#define STEPS (GRANULARITY * 2 + 1)

SamplerState FirstSampler
{
  Texture = <FirstTexture>;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
	AddressU = Wrap;
	AddressV = Wrap;
};

float4 displace(float4 pos : SV_POSITION, float4 color : COLOR0, float2 texCoord : TEXCOORD0) : SV_TARGET0
{
  float4 c = FirstTexture.Sample(FirstSampler, texCoord);
	float4 n =  c * color;

  return n;
}

technique Technique1
{
    pass Pass1
    {
        PixelShader = compile ps_4_0_level_9_3 displace();
    }
}
