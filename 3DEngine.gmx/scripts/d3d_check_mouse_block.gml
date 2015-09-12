var x1,y1,z1,x2,y2,z2;
var a,b,c,l,w,h,px,py,pz,tx,ty,mx,my;
var px2d,py2d,px3d,py3d,pz3d;

x1=argument0
y1=argument1
z1=argument2
x2=argument3
y2=argument4
z2=argument5

mx=mouse_x
my=mouse_y

if (x2<x1) {a=x2; x2=x1; x1=a}
if (y2<y1) {a=y2; y2=y1; y1=a}
if (z2<z1) {a=z2; z2=z1; z1=a}

l=x2-x1
w=y2-y1
h=z2-z1

for (a=0 a<8 a+=1) {
    px3d[a]=x1+(a mod 2)*l
    py3d[a]=y1+((a div 2) mod 2)*w
    pz3d[a]=z1+(a div 4)*h
    
    px=px3d[a]-_xf
    py=py3d[a]-_yf
    pz=pz3d[a]-_zf
    
    b=max(0.001,px*_dx+py*_dy+pz*_dz)
    px/=b
    py/=b
    pz/=b
    
    b=tan(_a*pi/360)
    c=(px*_vx+py*_vy+pz*_vz)/sqr((view_wview[_v]/view_hview[_v])*b)
    px2d[a]=(c+1)/2*view_wview[_v]
    c=(px*_ux+py*_uy+pz*_uz)/sqr(b)
    py2d[a]=(1-c)/2*view_hview[_v]
}

for (a=0 a<6 a+=1) {
    if (a=0) {
        if (_xf<x1+l) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[(b+1)*2-1]; ty[b]=py2d[(b+1)*2-1]}
    }
    if (a=1) {
        if (_xf>x1) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[b*2]; ty[b]=py2d[b*2]}
    }
    if (a=2) {
        if (_yf<y1+w) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[b+2+2*(b>1)]; ty[b]=py2d[b+2+2*(b>1)]}
    }
    if (a=3) {
        if (_yf>y1) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[b+2*(b>1)]; ty[b]=py2d[b+2*(b>1)]}
    }
    if (a=4) {
        if (_zf<z1+h) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[b+4]; ty[b]=py2d[b+4]}
    }
    if (a=5) {
        if (_zf>z1) continue
        for (b=0 b<4 b+=1) {tx[b]=px2d[b]; ty[b]=py2d[b]}
    }
    
    b = sign((tx[0]-mx)*(ty[1]-my)-(tx[1]-mx)*(ty[0]-my))
      + sign((tx[1]-mx)*(ty[2]-my)-(tx[2]-mx)*(ty[1]-my))
      + sign((tx[2]-mx)*(ty[0]-my)-(tx[0]-mx)*(ty[2]-my))
    c = sign((tx[1]-mx)*(ty[2]-my)-(tx[2]-mx)*(ty[1]-my))
      + sign((tx[2]-mx)*(ty[3]-my)-(tx[3]-mx)*(ty[2]-my))
      + sign((tx[3]-mx)*(ty[1]-my)-(tx[1]-mx)*(ty[3]-my))
    if (abs(b)=3 || abs(c)=3) return a+1
}