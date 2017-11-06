//lerp_ease(a,b,amt,v1,v2,...,vn);

var pp,amt,num,a,b;
amt=argument2;
num=argument_count-2;
pp[0]=0;
pp[num]=1;

for (a=1; a<num; a+=1)
pp[a]=argument[a+2];

for (a=num; a>0; a-=1)
for (b=0; b<a; b+=1)
pp[b]+=(pp[b+1]-pp[b])*amt;

return argument0+(argument1-argument0)*pp[0];

/*
lerp_ease(a,b,amt)  //Linear
lerp_ease(a,b,amt,0)  //In Sine
lerp_ease(a,b,amt,1)  //Out Sine
lerp_ease(a,b,amt,0,1)  //InOut Sine
lerp_ease(a,b,amt,0,0)  //In Cubic
lerp_ease(a,b,amt,0,0,0)  //In Quart
lerp_ease(a,b,amt,0,-0.5)  //In Back
lerp_ease(a,b,amt,1.5,1)  //Out Back
lerp_ease(a,b,amt,0,-0.5,1.5,1)  //InOut Back
lerp_ease(a,b,amt,1,5,-3,0.88,3,0,1.07,1.07,0.99)  //elsestic
*/