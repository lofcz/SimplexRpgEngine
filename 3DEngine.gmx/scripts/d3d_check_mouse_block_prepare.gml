var a;

_xf=argument0
_yf=argument1
_zf=argument2
_a=argument9
_v=argument10

_dx=argument3-_xf
_dy=argument4-_yf
_dz=argument5-_zf

a=sqrt(_dx*_dx+_dy*_dy+_dz*_dz)
_dx/=a
_dy/=a
_dz/=a

a=argument6*_dx+argument7*_dy+argument8*_dz
_ux=argument6-a*_dx
_uy=argument7-a*_dy
_uz=argument8-a*_dz

a=sqrt(_ux*_ux+_uy*_uy+_uz*_uz)
_ux/=a
_uy/=a
_uz/=a

a=tan(_a*pi/360)
_ux*=a
_uy*=a
_uz*=a

_vx=(_uy*_dz-_uz*_dy)*(view_wview[_v]/view_hview[_v])
_vy=(_uz*_dx-_ux*_dz)*(view_wview[_v]/view_hview[_v])
_vz=(_ux*_dy-_uy*_dx)*(view_wview[_v]/view_hview[_v])