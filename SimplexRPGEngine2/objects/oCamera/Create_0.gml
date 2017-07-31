/// @desc Set hooks

entityIni();

v_viewSizeX = 800;
v_viewSizeY = 600;
v_nullPosX  = 0;
v_nullPosY  = 0;

v_cameraID = camera_create_view(0, 0, v_viewSizeX, v_viewSizeY, 0, -1, 0, 0, 0, 0);
view_camera[0] = v_cameraID;

v_n = 10;
v_target = oPlayer;