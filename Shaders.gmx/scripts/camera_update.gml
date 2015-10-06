if mousecontrol_restrain_mouse()    //
{
    rotate_point(xto, yto, zto, -mouseDx / 400, xup, yup, zup)
    rotate_point(returnX, returnY, returnZ, -mouseDy / 400, xsi, ysi, zsi)
    normalize(returnX, returnY, returnZ)
    xto = returnX   yto = returnY   zto = returnZ
    orthogonalize(xto, yto, zto, xup, yup, zup)
    xup = returnX   yup = returnY   zup = returnZ
    cross_product(xup, yup, zup, xto, yto, zto)
    xsi = returnX   ysi = returnY   zsi = returnZ
}

targetRadius *= 1 + (mouse_wheel_down() - mouse_wheel_up()) / 20
x = targetX - xto * targetRadius
y = targetY - yto * targetRadius
z = targetZ - zto * targetRadius