Texture2D FirstTexture;
float amt = 0;

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
  float uni = (c.r + c.g + c.b) / 3;

  n.r = lerp(n.r, uni, amt);
  n.g = lerp(n.g, uni, amt);
  n.b = lerp(n.b, uni, amt);

  return n;
}

technique Technique1
{
    pass Pass1
    {
        PixelShader = compile ps_4_0_level_9_3 displace();
    }
}
