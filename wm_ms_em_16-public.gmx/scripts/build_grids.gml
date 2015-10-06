{
    global.gridSize = argument0;
    with (objectWallBlock) {
    
        var u0, u1, v0, v1, s;

        u0 = bb_l;
        u1 = bb_r;
        v0 = bb_t;
        v1 = bb_b;
        s = 2;
        
        switch (vis[3]<<3|vis[2]<<2|vis[1]<<1|vis[0])
        {
            case 0:  break;
            case 1:  v0 -= s; break;
            case 2:  u1 += s; break;
            case 3:  v0 -= s; u1 += s; break;
            case 4:  v1 += s; break;
            case 5:  v0 -= s; v1 += s; break;
            case 6:  u1 += s; v1 += s; break;
            case 7:  u1 += s; v0 -= s; v1 += s; break;
            case 8:  u0 -= s; break;
            case 9:  u0 -= s; v0 -= s; break;
            case 10: u0 -= s; u1 += s; break;
            case 11: u0 -= s; u1 += s; v0 -= s; break;
            case 12: u0 -= s; v1 += s; break;
            case 13: u0 -= s; v0 -= s; v1 += s; break;
            case 14: u0 -= s; u1 += s; v1 += s; break;
            case 15: u0 -= s; u1 += s; v0 -= s; v1 += s; break;
        }
        
        u0 /= objectBackground.w;
        u1 /= objectBackground.w;
        v0 /= objectBackground.h;
        v1 /= objectBackground.h;
    
        if (vis[0]) {
            ds_grid_set(global.gridFace, 0, global.gridSize, 0);
            ds_grid_set(global.gridVX, 0, global.gridSize, bb_l);
            ds_grid_set(global.gridVY, 0, global.gridSize, bb_t);
            ds_grid_set(global.gridVX, 1, global.gridSize, bb_r);
            ds_grid_set(global.gridVY, 1, global.gridSize, bb_t);
            ds_grid_set(global.gridEU, 0, global.gridSize, u0);
            ds_grid_set(global.gridEV, 0, global.gridSize, v0);
            ds_grid_set(global.gridEU, 1, global.gridSize, u1);
            ds_grid_set(global.gridEV, 1, global.gridSize, v0);
            face[0] = global.gridSize;
            global.gridSize += 1;
        }
        if (vis[1]) {
            ds_grid_set(global.gridFace, 0, global.gridSize, 1);
            ds_grid_set(global.gridVX, 0, global.gridSize, bb_r);
            ds_grid_set(global.gridVY, 0, global.gridSize, bb_t);
            ds_grid_set(global.gridVX, 1, global.gridSize, bb_r);
            ds_grid_set(global.gridVY, 1, global.gridSize, bb_b);
            ds_grid_set(global.gridEU, 0, global.gridSize, u1);
            ds_grid_set(global.gridEV, 0, global.gridSize, v0);
            ds_grid_set(global.gridEU, 1, global.gridSize, u1);
            ds_grid_set(global.gridEV, 1, global.gridSize, v1);
            face[1] = global.gridSize;
            global.gridSize += 1;
        }
        if (vis[2]) {
            ds_grid_set(global.gridFace, 0, global.gridSize, 2);
            ds_grid_set(global.gridVX, 0, global.gridSize, bb_r);
            ds_grid_set(global.gridVY, 0, global.gridSize, bb_b);
            ds_grid_set(global.gridVX, 1, global.gridSize, bb_l);
            ds_grid_set(global.gridVY, 1, global.gridSize, bb_b);
            ds_grid_set(global.gridEU, 0, global.gridSize, u1);
            ds_grid_set(global.gridEV, 0, global.gridSize, v1);
            ds_grid_set(global.gridEU, 1, global.gridSize, u0);
            ds_grid_set(global.gridEV, 1, global.gridSize, v1);
            face[2] = global.gridSize;
            global.gridSize += 1;
        }
        if (vis[3]) {
            ds_grid_set(global.gridFace, 0, global.gridSize, 3);
            ds_grid_set(global.gridVX, 0, global.gridSize, bb_l);
            ds_grid_set(global.gridVY, 0, global.gridSize, bb_b);
            ds_grid_set(global.gridVX, 1, global.gridSize, bb_l);
            ds_grid_set(global.gridVY, 1, global.gridSize, bb_t);
            ds_grid_set(global.gridEU, 0, global.gridSize, u0);
            ds_grid_set(global.gridEV, 0, global.gridSize, v1);
            ds_grid_set(global.gridEU, 1, global.gridSize, u0);
            ds_grid_set(global.gridEV, 1, global.gridSize, v0);
            face[3] = global.gridSize;
            global.gridSize += 1;
        }
    }
    
    with (objectWallPillar) {
    
        var x0, y0, x1, y1, u0, u1, v0, v1, s;

        s = 2;
        
        var cx,cy,step,r,i;
        r = sprite_width/2;
        cx = x+r;
        cy = y+r;
        step = 30;
        for (i=0; i<360; i+=step) {
            u0 = lengthdir_x(1,i+step);
            v0 = lengthdir_y(1,i+step);
            u1 = lengthdir_x(1,i);
            v1 = lengthdir_y(1,i);
            x0 = u0 * r + cx;
            y0 = v0 * r + cy;
            x1 = u1 * r + cx;
            y1 = v1 * r + cy;
            u0 *= s;
            v0 *= s;
            u1 *= s;
            v1 *= s;
            u0 += x0;
            v0 += y0;
            u1 += x1;
            v1 += y1;
            u0 /= objectBackground.w;
            v0 /= objectBackground.h;
            u1 /= objectBackground.w;
            v1 /= objectBackground.h;            
            
            ds_grid_set(global.gridFace, 0, global.gridSize, 0);
            ds_grid_set(global.gridVX, 0, global.gridSize, x0);
            ds_grid_set(global.gridVY, 0, global.gridSize, y0);
            ds_grid_set(global.gridVX, 1, global.gridSize, x1);
            ds_grid_set(global.gridVY, 1, global.gridSize, y1);
            ds_grid_set(global.gridEU, 0, global.gridSize, u0);
            ds_grid_set(global.gridEV, 0, global.gridSize, v0);
            ds_grid_set(global.gridEU, 1, global.gridSize, u1);
            ds_grid_set(global.gridEV, 1, global.gridSize, v1);

            face[0] = global.gridSize;
            global.gridSize += 1;
        
        }
    }
}