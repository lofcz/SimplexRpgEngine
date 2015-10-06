//matrix_create_from_quat(qw,qx,qy,qz)
quat_normalize(argument0,argument1,argument2,argument3)
normalize((qz*qx-qw*qy)*2, (qz*qy+qw*qx)*2, sqr(qw)-sqr(qx)-sqr(qy)+sqr(qz))
returnXup = returnX
returnYup = returnY
returnZup = returnZ
normalize(sqr(qw)+sqr(qx)-sqr(qy)-sqr(qz), (qx*qy-qw*qz)*2, (qx*qz+qw*qy)*2)
returnXto = returnX
returnYto = returnY
returnZto = returnZ