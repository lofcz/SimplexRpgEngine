//mousecontrol_restrain_mouse()
if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)
{
    savedMouseX2D = mouseX2D
    savedMouseY2D = mouseY2D
    mouseDx = 0
    mouseDy = 0
    display_mouse_set(windowX + windowWidth, windowY + windowHeight)
}
if mouse_check_button_released(mb_left) or mouse_check_button_released(mb_right)
{
    display_mouse_set(windowX + savedMouseX2D, windowY + savedMouseY2D)
}
mousecontrol_update()
if mouse_check_button(mb_left) or mouse_check_button(mb_right)
{
    mouseDx = mouseX2D - windowWidth
    mouseDy = mouseY2D - windowHeight
    display_mouse_set(windowX + windowWidth, windowY + windowHeight)
    mousecontrol_update()
    return 1;
}
return 0;