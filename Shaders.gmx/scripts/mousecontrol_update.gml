//mousecontrol_update()
windowWidth = max(window_get_width() / 2, 1)
windowHeight = max(window_get_height() / 2, 1)
windowX = window_get_x() + 3
windowY = window_get_y() + 25
mouseX2D = display_mouse_get_x() - windowX
mouseY2D = display_mouse_get_y() - windowY