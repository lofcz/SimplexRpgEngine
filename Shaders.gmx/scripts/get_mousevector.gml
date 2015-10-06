//get_mousevector(xto, yto, zto, xup, yup, zup, angle, aspect)
var _x,_y;
argument6 = tan(argument6 * pi / 360)
_x = (1 - mouseX2D / windowWidth) * argument6 * argument7
_y = (1 - mouseY2D / windowHeight) * argument6
normalize(
argument0 + (argument1 * argument5 - argument4 * argument2) * _x + argument3 * _y,
argument1 + (argument2 * argument3 - argument5 * argument0) * _x + argument4 * _y,
argument2 + (argument0 * argument4 - argument3 * argument1) * _x + argument5 * _y)