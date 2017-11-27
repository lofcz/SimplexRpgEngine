#define live_preinit_api
// Generated at 2017-11-19 01:01:34 (8813ms)
gml_func_add("min(...values:number)",live_script_get_index("__lnc__lf"));
gml_func_add("max(...values:number)",live_script_get_index("__lnc__lf1"));
gml_func_add("choose(...values)",live_script_get_index("__lnc__lf2"));
gml_func_add("script_execute(script:index, ...values)",live_script_get_index("__lnc__lf3"));
gml_func_add("instance_destroy(...values)",live_script_get_index("__lnc__lf4"));
gml_func_add("gml_pragma(setting, ...)",live_script_get_index("__lnc__lf5"));
var l_gmlFuncs="";
var l_gmlVars="";
l_gmlFuncs="0=is_real(val)#:\r\n1=is_string(val)#:\r\n2=is_array(val)#:\r\n3=is_undefined(val)#:\r\n4=is_int32(val)#:\r\n5=is_int64(val)#:\r\n6=is_ptr(val)#:\r\n7=is_vec3(val)#:\r\n8=is_vec4(val)#:\r\n9=is_matrix(val)#:\r\n10=is_bool(val)#:\r\n11=typeof(val)#:\r\n12=variable_global_exists(name):\r\n13=variable_global_get(name):\r\n14=variable_global_set(name,val)\r\n15=variable_instance_exists(id,name):\r\n16=variable_instance_get(id,name):\r\n17=variable_instance_set(id,name,val)\r\n18=variable_instance_get_names(id):\r\n19=array_length_1d(value):\r\n20=array_length_2d(value, index:number):\r\n21=array_height_2d(value):\r\n22=array_equals(one, two):\r\n23=array_create(size:number):\r\n24=array_copy(dest,dest_index,src,src_index,length)\r\n25=random(x:number):\r\n26=random_range(:number,:number):\r\n27=irandom(x:number):\r\n28=irandom_range(:number,:number):\r\n29=random_set_seed(seed)\r\n30=random_get_seed():\r\n31=randomize():\r\n32=randomise()£\r\n33=abs(x:number)#:\r\n34=round(x:number)#:\r\n35=floor(x:number)#:\r\n36=ceil(x:number)#:\r\n37=sign(x:number)#:\r\n38=frac(x:number)#:\r\n39=sqrt(x:number)#:\r\n40=sqr(x:number)#:\r\n41=exp(x:number)#:\r\n42=ln(x:number)#:\r\n43=log2(x:number)#:\r\n44=log10(x:number)#:\r\n45=sin(radian_angle:number)#:\r\n46=cos(radian_angle:number)#:\r\n47=tan(radian_angle:number)#:\r\n48=arcsin(x:number)#:\r\n49=arccos(x:number)#:\r\n50=arctan(x:number)#:\r\n51=arctan2(y:number, x:number)#:\r\n52=dsin(degree_angle:number)#:\r\n53=dcos(degree_angle:number)#:\r\n54=dtan(degree_angle:number)#:\r\n55=darcsin(x:number)#:\r\n56=darccos(x:number)#:\r\n57=darctan(x:number)#:\r\n58=darctan2(y:number, x:number)#:\r\n59=degtorad(x:number)#:\r\n60=radtodeg(x:number)#:\r\n61=power(x:number, n:number)#:\r\n62=logn(n:number, x:number)#:\r\n63=mean(...)#:\r\n64=median(...)#:\r\n65=clamp(val:number, min:number, max:number)#:\r\n66=lerp(val1:number, val2:number, amount:number)#:\r\n67=dot_product(x1:number, y1:number, x2:number, y2:number)#:\r\n68=dot_product_3d(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:\r\n69=dot_product_normalised(x1:number, y1:number, x2:number, y2:number)£#:\r\n70=dot_product_3d_normalised(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)£#:\r\n71=dot_product_normalized(x1:number, y1:number, x2:number, y2:number)$#:\r\n72=dot_product_3d_normalized(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)$#:\r\n73=math_set_epsilon(new_epsilon)\r\n74=math_get_epsilon():\r\n75=angle_difference(src:number, dest:number)#:\r\n76=point_distance_3d(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:\r\n77=point_distance(x1:number, y1:number, x2:number, y2:number)#:\r\n78=point_direction(x1:number, y1:number, x2:number, y2:number)#:\r\n79=lengthdir_x(len:number, dir:number)#:\r\n80=lengthdir_y(len:number, dir:number)#:\r\n81=real(val)#:\r\n82=string(val)#:\r\n83=int64(val)#:\r\n84=ptr(val):\r\n85=string_format(val:number,total:number,dec:number)#:\r\n86=chr(val)#:\r\n87=ansi_char(val)#:\r\n88=ord(char)#:\r\n89=string_length(str:string)#:\r\n90=string_byte_length(str:string)#:\r\n91=string_pos(substr:string, str:string)#:\r\n92=string_copy(str:string, index:number, count:number)#:\r\n93=string_char_at(str:string, index:number)#:\r\n94=string_ord_at(str:string, index:number)#:\r\n95=string_byte_at(str:string, index:number)#:\r\n96=string_set_byte_at(str:string, index:number, val:number)#:\r\n97=string_delete(str:string, index:number, count:number)#:\r\n98=string_insert(substr:string, str:string, index:number)#:\r\n99=string_lower(str:string)#:\r\n100=string_upper(str:string)#:\r\n101=string_repeat(str:string, count:number)#:\r\n102=string_letters(str:string)#:\r\n103=string_digits(str:string)#:\r\n104=string_lettersdigits(str:string)#:\r\n105=string_replace(str:string, substr:string, newstr:string)#:\r\n106=string_replace_all(str:string, substr:string, newstr:string)#:\r\n107=string_count(substr:string, str:string)#:\r\n108=string_hash_to_newline(string)#:\r\n109=clipboard_has_text():\r\n110=clipboard_set_text(str)\r\n111=clipboard_get_text():\r\n112=date_current_datetime():\r\n113=date_create_datetime(year,month,day,hour,minute,second):\r\n114=date_valid_datetime(year,month,day,hour,minute,second):\r\n115=date_inc_year(date,amount):\r\n116=date_inc_month(date,amount):\r\n117=date_inc_week(date,amount):\r\n118=date_inc_day(date,amount):\r\n119=date_inc_hour(date,amount):\r\n120=date_inc_minute(date,amount):\r\n121=date_inc_second(date,amount):\r\n122=date_get_year(date):\r\n123=date_get_month(date):\r\n124=date_get_week(date):\r\n125=date_get_day(date):\r\n126=date_get_hour(date):\r\n127=date_get_minute(date):\r\n128=date_get_second(date):\r\n129=date_get_weekday(date):\r\n130=date_get_day_of_year(date):\r\n131=date_get_hour_of_year(date):\r\n132=date_get_minute_of_year(date):\r\n133=date_get_second_of_year(date):\r\n134=date_year_span(date1,date2):\r\n135=date_month_span(date1,date2):\r\n136=date_week_span(date1,date2):\r\n137=date_day_span(date1,date2):\r\n138=date_hour_span(date1,date2):\r\n139=date_minute_span(date1,date2):\r\n140=date_second_span(date1,date2):\r\n141=date_compare_datetime(date1,date2):\r\n142=date_compare_date(date1,date2):\r\n143=date_compare_time(date1,date2):\r\n144=date_date_of(date):\r\n145=date_time_of(date):\r\n146=date_datetime_string(date):\r\n147=date_date_string(date):\r\n148=date_time_string(date):\r\n149=date_days_in_month(date):\r\n150=date_days_in_year(date):\r\n151=date_leap_year(date):\r\n152=date_is_today(date):\r\n153=date_set_timezone(timezone)\r\n154=date_get_timezone():\r\n155=game_set_speed(value,type)\r\n156=game_get_speed(type):\r\n157=:motion_set(dir:number, speed:number)\r\n158=:motion_add(dir:number, speed:number)\r\n159=:place_free(x:number, y:number):\r\n160=:place_empty(x:number, y:number):\r\n161=:place_meeting(x:number, y:number, obj:index):\r\n162=:place_snapped(hsnap:number, vsnap:number):\r\n163=:move_random(hsnap:number, vsnap:number)\r\n164=:move_snap(hsnap:number, vsnap:number)\r\n165=:move_towards_point(x:number, y:number, sp:number)\r\n166=:move_contact_solid(dir:number, maxdist:number)\r\n167=:move_contact_all(dir:number, maxdist:number)\r\n168=:move_outside_solid(dir:number, maxdist:number)\r\n169=:move_outside_all(dir:number, maxdist:number)\r\n170=:move_bounce_solid(advanced:bool)\r\n171=:move_bounce_all(advanced:bool)\r\n172=:move_wrap(hor:bool, vert:bool, margin:number)\r\n173=:distance_to_point(x:number, y:number):\r\n174=:distance_to_object(obj:index):\r\n175=:position_empty(x:number, y:number):\r\n176=:position_meeting(x:number, y:number, obj:index):\r\n177=:path_start(path,speed,endaction,absolute)\r\n178=:path_end()\r\n179=:mp_linear_step(x:number,y:number,speed:number,checkall:bool):\r\n180=:mp_potential_step(x:number,y:number,speed:number,checkall:bool):\r\n181=:mp_linear_step_object(x:number,y:number,speed:number,obj:index):\r\n182=:mp_potential_step_object(x:number,y:number,speed:number,obj:index):\r\n183=:mp_potential_settings(maxrot,rotstep,ahead,onspot)\r\n184=:mp_linear_path(path:index,x:number,y:number,step:number,checkall:bool):\r\n185=:mp_potential_path(path:index,x:number,y:number,step:number,factor:number,checkall:bool):\r\n186=:mp_linear_path_object(path:index,x:number,y:number,step:number,obj:index):\r\n187=:mp_potential_path_object(path:index,x:number,y:number,step:number,factor:number,obj:index):\r\n188=mp_grid_create(left,top,hcells,vcells,cellwidth,cellheight):\r\n189=mp_grid_destroy(id)\r\n190=mp_grid_clear_all(id)\r\n191=mp_grid_clear_cell(id,h,v)\r\n192=mp_grid_clear_rectangle(id,left,top,right,bottom)\r\n193=mp_grid_add_cell(id,h,v)\r\n194=mp_grid_get_cell(id,h,v):\r\n195=mp_grid_add_rectangle(id,left,top,right,bottom)\r\n196=:mp_grid_add_instances(id,obj,prec)\r\n197=:mp_grid_path(:index,path:index,xstart:number,ystart:number,xgoal:number,ygoal:number,allowdiag:bool):\r\n198=mp_grid_draw(id)\r\n199=mp_grid_to_ds_grid(src,dest)\r\n200=:collision_point(x:number, y:number, obj:index, prec:bool, notme:bool):\r\n201=:collision_rectangle(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\r\n202=:collision_circle(x1:number, y1:number, radius, obj:index, prec, notme):\r\n203=:collision_ellipse(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\r\n204=:collision_line(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):\r\n205=point_in_rectangle(px, py, x1:number, y1:number, x2:number, y2:number):\r\n206=point_in_triangle(px, py, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):\r\n207=point_in_circle(px, py, cx, cy, rad):\r\n208=rectangle_in_rectangle(sx1:number, sy1:number, sx2:number, sy2:number, dx1:number, dy1:number, dx2:number, dy2:number):\r\n209=rectangle_in_triangle(sx1:number, sy1:number, sx2:number, sy2:number, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):\r\n210=rectangle_in_circle(sx1:number, sy1:number, sx2:number, sy2:number, cx:number, cy:number, rad:number):\r\n211=instance_find(obj:index, n:index):\r\n212=instance_exists(obj:index):\r\n213=instance_number(obj:index):\r\n214=instance_position(x:number, y:number, obj:index):\r\n215=:instance_nearest(x:number, y:number, obj:index):\r\n216=:instance_furthest(x:number, y:number, obj:index):\r\n217=:instance_place(x:number, y:number, obj:index):\r\n218=instance_create_depth(x,y,depth,obj):\r\n219=instance_create_layer(x,y,layer_id_or_name,obj):\r\n220=:instance_copy(performevent:bool):\r\n221=:instance_change(obj,performevents)\r\n222=:position_destroy(x,y)\r\n223=:position_change(x,y,obj,performevents)\r\n224=instance_id_get(index):\r\n225=:instance_deactivate_all(notme)\r\n226=:instance_deactivate_object(obj)\r\n227=:instance_deactivate_region(left,top,width,height,inside,notme)\r\n228=:instance_activate_all()\r\n229=:instance_activate_object(obj)\r\n230=:instance_activate_region(left,top,width,height,inside)\r\n231=room_goto(numb)\r\n232=room_goto_previous()\r\n233=room_goto_next()\r\n234=room_previous(numb):\r\n235=room_next(numb):\r\n236=room_restart()\r\n237=game_end()\r\n238=game_restart()\r\n239=game_load(filename):\r\n240=game_save(filename)\r\n241=game_save_buffer(buffer)\r\n242=game_load_buffer(buffer):\r\n243=:event_perform(type,numb)\r\n244=:event_user(numb)\r\n245=:event_perform_object(obj,type,numb)\r\n246=:event_inherited()\r\n247=show_debug_message(str)\r\n248=show_debug_overlay(enable)\r\n249=debug_event(str)\r\n250=debug_get_callstack():\r\n251=:alarm_get(:index):\r\n252=:alarm_set(:index, value:number)\r\n253=keyboard_set_map(key1,key2)\r\n254=keyboard_get_map(key):\r\n255=keyboard_unset_map()\r\n256=keyboard_check(key:index):\r\n257=keyboard_check_pressed(key:index):\r\n258=keyboard_check_released(key:index):\r\n259=keyboard_check_direct(key:index):\r\n260=keyboard_get_numlock():\r\n261=keyboard_set_numlock(on)\r\n262=keyboard_key_press(key)\r\n263=keyboard_key_release(key)\r\n264=keyboard_clear(key:index)\r\n265=io_clear()\r\n266=mouse_check_button(button:index):\r\n267=mouse_check_button_pressed(button:index):\r\n268=mouse_check_button_released(button:index):\r\n269=mouse_wheel_up():\r\n270=mouse_wheel_down():\r\n271=mouse_clear(button)\r\n272=:draw_self()\r\n273=:draw_sprite(sprite,subimg,x,y)\r\n274=:draw_sprite_pos(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,alpha)\r\n275=:draw_sprite_ext(sprite,subimg,x,y,xscale,yscale,rot,col,alpha)\r\n276=:draw_sprite_stretched(sprite,subimg,x,y,w,h)\r\n277=:draw_sprite_stretched_ext(sprite,subimg,x,y,w,h,col,alpha)\r\n278=:draw_sprite_tiled(sprite,subimg,x,y)\r\n279=:draw_sprite_tiled_ext(sprite,subimg,x,y,xscale,yscale,col,alpha)\r\n280=:draw_sprite_part(sprite,subimg,left,top,width,height,x,y)\r\n281=:draw_sprite_part_ext(sprite,subimg,left,top,width,height,x,y,xscale,yscale,col,alpha)\r\n282=:draw_sprite_general(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)\r\n283=draw_clear(col)\r\n284=draw_clear_alpha(col,alpha)\r\n285=draw_point(x,y)\r\n286=draw_line(x1,y1,x2,y2)\r\n287=draw_line_width(x1,y1,x2,y2,w)\r\n288=draw_rectangle(x1,y1,x2,y2,outline)\r\n289=draw_roundrect(x1,y1,x2,y2,outline)\r\n290=draw_roundrect_ext(x1,y1,x2,y2,radiusx,radiusy,outline)\r\n291=draw_triangle(x1,y1,x2,y2,x3,y3,outline)\r\n292=draw_circle(x,y,r,outline)\r\n293=draw_ellipse(x1,y1,x2,y2,outline)\r\n294=draw_set_circle_precision(precision)\r\n295=draw_arrow(x1,y1,x2,y2,size)\r\n296=draw_button(x1,y1,x2,y2,up)\r\n297=draw_path(path,x,y,absolute)\r\n298=draw_healthbar(x1,y1,x2,y2,amount,backcol,mincol,maxcol,direction,showback,showborder)\r\n299=draw_getpixel(x,y):\r\n300=draw_getpixel_ext(x,y):\r\n301=draw_set_colour(:color)\r\n302=draw_set_color(:color)\r\n303=draw_set_alpha(alpha:number)\r\n304=draw_get_colour():\r\n305=draw_get_color():\r\n306=draw_get_alpha():\r\n307=merge_colour(col1, col2, amount:number)#:\r\n308=make_colour_rgb(red:number, green:number, blue:number)#:\r\n309=make_colour_hsv(hue:number, saturation:number, value:number)#:\r\n310=colour_get_red(col)#:\r\n311=colour_get_green(col)#:\r\n312=colour_get_blue(col)#:\r\n313=colour_get_hue(col)#:\r\n314=colour_get_saturation(col)#:\r\n315=colour_get_value(col)#:\r\n316=merge_colour(col1,col2,amount)$\r\n317=make_color_rgb(red:number, green:number, blue:number)#:\r\n318=make_color_hsv(hue:number, saturation:number, value:number)#:\r\n319=color_get_red(col)#:\r\n320=color_get_green(col)#:\r\n321=color_get_blue(col)#:\r\n322=color_get_hue(col)#:\r\n323=color_get_saturation(col)#:\r\n324=color_get_value(col)#:\r\n325=merge_color(col1, col2, amount:number)#:\r\n326=screen_save(fname)\r\n327=screen_save_part(fname,x,y,w,h)\r\n328=draw_set_font(:font)\r\n329=draw_set_halign(halign:int)\r\n330=draw_set_valign(valign:int)\r\n331=draw_text(x,y,string)\r\n332=draw_text_ext(x,y,string,sep,w)\r\n333=string_width(:string):\r\n334=string_height(:string):\r\n335=string_width_ext(string:string, sep:number, w:number):\r\n336=string_height_ext(string:string, sep:number, w:number):\r\n337=draw_text_transformed(x,y,string,xscale,yscale,angle)\r\n338=draw_text_ext_transformed(x,y,string,sep,w,xscale,yscale,angle)\r\n339=draw_text_colour(x,y,string,c1,c2,c3,c4,alpha)£\r\n340=draw_text_ext_colour(x,y,string,sep,w,c1,c2,c3,c4,alpha)£\r\n341=draw_text_transformed_colour(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)£\r\n342=draw_text_ext_transformed_colour(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)£\r\n343=draw_text_color(x,y,string,c1,c2,c3,c4,alpha)$\r\n344=draw_text_ext_color(x,y,string,sep,w,c1,c2,c3,c4,alpha)$\r\n345=draw_text_transformed_color(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)$\r\n346=draw_text_ext_transformed_color(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)$\r\n347=draw_point_colour(x,y,col1)£\r\n348=draw_line_colour(x1,y1,x2,y2,col1,col2)£\r\n349=draw_line_width_colour(x1,y1,x2,y2,w,col1,col2)£\r\n350=draw_rectangle_colour(x1,y1,x2,y2,col1,col2,col3,col4,outline)£\r\n351=draw_roundrect_colour(x1,y1,x2,y2,col1,col2,outline)£\r\n352=draw_roundrect_colour_ext(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)£\r\n353=draw_triangle_colour(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)£\r\n354=draw_circle_colour(x,y,r,col1,col2,outline)£\r\n355=draw_ellipse_colour(x1,y1,x2,y2,col1,col2,outline)£\r\n356=draw_point_color(x,y,col1)$\r\n357=draw_line_color(x1,y1,x2,y2,col1,col2)$\r\n358=draw_line_width_color(x1,y1,x2,y2,w,col1,col2)$\r\n359=draw_rectangle_color(x1,y1,x2,y2,col1,col2,col3,col4,outline)$\r\n360=draw_roundrect_color(x1,y1,x2,y2,col1,col2,outline)$\r\n361=draw_roundrect_color_ext(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)$\r\n362=draw_triangle_color(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)$\r\n363=draw_circle_color(x,y,r,col1,col2,outline)$\r\n364=draw_ellipse_color(x1,y1,x2,y2,col1,col2,outline)$\r\n365=draw_primitive_begin(kind)\r\n366=draw_vertex(x,y)\r\n367=draw_vertex_colour(x,y,col,alpha)£\r\n368=draw_vertex_color(x,y,col,alpha)$\r\n369=draw_primitive_end()\r\n370=sprite_get_uvs(spr:index, subimg:number):\r\n371=font_get_uvs(font:index):\r\n372=sprite_get_texture(spr:index, subimg:number):\r\n373=font_get_texture(font:index):\r\n374=texture_get_width(texid):\r\n375=texture_get_height(texid):\r\n376=texture_get_uvs(texid):\r\n377=draw_primitive_begin_texture(kind,texid)\r\n378=draw_vertex_texture(x,y,xtex,ytex)\r\n379=draw_vertex_texture_colour(x,y,xtex,ytex,col,alpha)£\r\n380=draw_vertex_texture_color(x,y,xtex,ytex,col,alpha)$\r\n381=texture_global_scale(pow2integer)\r\n382=surface_create(w,h):\r\n383=surface_create_ext(name,w,h):\r\n384=surface_resize(id,width,height)\r\n385=surface_free(id)\r\n386=surface_exists(id):\r\n387=surface_get_width(id):\r\n388=surface_get_height(id):\r\n389=surface_get_texture(id):\r\n390=surface_set_target(id)\r\n391=surface_set_target_ext(index,id)\r\n392=surface_reset_target()\r\n393=draw_surface(id,x,y)\r\n394=draw_surface_stretched(id,x,y,w,h)\r\n395=draw_surface_tiled(id,x,y)\r\n396=draw_surface_part(id,left,top,width,height,x,y)\r\n397=draw_surface_ext(id,x,y,xscale,yscale,rot,col,alpha)\r\n398=draw_surface_stretched_ext(id,x,y,w,h,col,alpha)\r\n399=draw_surface_tiled_ext(id,x,y,xscale,yscale,col,alpha)\r\n400=draw_surface_part_ext(id,left,top,width,height,x,y,xscale,yscale,col,alpha)\r\n401=draw_surface_general(id,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)\r\n402=surface_getpixel(id,x,y):\r\n403=surface_getpixel_ext(id,x,y):\r\n404=surface_save(id,fname)\r\n405=surface_save_part(id,fname,x,y,w,h)\r\n406=surface_copy(destination,x,y,source)\r\n407=surface_copy_part(destination,x,y,source,xs,ys,ws,hs)\r\n408=application_surface_draw_enable(on_off)\r\n409=application_get_position():\r\n410=application_surface_enable(enable)\r\n411=application_surface_is_enabled():\r\n412=display_get_width():\r\n413=display_get_height():\r\n414=display_get_orientation():\r\n415=display_get_gui_width():\r\n416=display_get_gui_height():\r\n417=display_reset(aa, vsync):\r\n418=display_mouse_get_x():\r\n419=display_mouse_get_y():\r\n420=display_mouse_set(x,y)\r\n421=window_set_fullscreen(full)\r\n422=window_get_fullscreen():\r\n423=window_set_caption(caption)\r\n424=window_set_min_width(minwidth)\r\n425=window_set_max_width(maxwidth)\r\n426=window_set_min_height(minheight)\r\n427=window_set_max_height(maxheight)\r\n428=window_get_visible_rects(startx,starty,endx,endy):\r\n429=window_get_caption():\r\n430=window_set_cursor(curs)\r\n431=window_get_cursor():\r\n432=window_set_colour(colour)£\r\n433=window_get_colour()£:\r\n434=window_set_color(color)$\r\n435=window_get_color()$:\r\n436=window_set_position(x,y)\r\n437=window_set_size(w,h)\r\n438=window_set_rectangle(x,y,w,h)\r\n439=window_center()\r\n440=window_get_x():\r\n441=window_get_y():\r\n442=window_get_width():\r\n443=window_get_height():\r\n444=window_mouse_get_x():\r\n445=window_mouse_get_y():\r\n446=window_mouse_set(x,y)\r\n447=window_view_mouse_get_x(id):\r\n448=window_view_mouse_get_y(id):\r\n449=window_views_mouse_get_x():\r\n450=window_views_mouse_get_y():\r\n451=audio_listener_position(x,y,z)\r\n452=audio_listener_velocity(vx,vy,vz)\r\n453=audio_listener_orientation(lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)\r\n454=audio_emitter_position(emitterid,x,y,z)\r\n455=audio_emitter_create():\r\n456=audio_emitter_free(emitterid)\r\n457=audio_emitter_exists(emitterid):\r\n458=audio_emitter_pitch(emitterid,pitch)\r\n459=audio_emitter_velocity(emitterid,vx,vy,vz)\r\n460=audio_emitter_falloff(emitterid, falloff_ref_dist,falloff_max_dist,falloff_factor)\r\n461=audio_emitter_gain(emitterid,gain)\r\n462=audio_play_sound(soundid:index,priority:number,loops:bool):\r\n463=audio_play_sound_on(em:index,soundid:index,priority:number,loops:bool):\r\n464=audio_play_sound_at(soundid:index,x:number,y:number,z:number, falloff_ref_dist:number,falloff_max_dist:number,falloff_factor:number,loops:bool, priority:number):\r\n465=audio_stop_sound(soundid)\r\n466=audio_resume_sound(soundid)\r\n467=audio_pause_sound(soundid)\r\n468=audio_channel_num(numchannels)\r\n469=audio_sound_length(sound:index):\r\n470=audio_get_type(soundid):\r\n471=audio_falloff_set_model(falloffmode)\r\n472=audio_master_gain(gain)\r\n473=audio_sound_gain(index,level,time)\r\n474=audio_sound_pitch(index,pitch)\r\n475=audio_stop_all()\r\n476=audio_resume_all()\r\n477=audio_pause_all()\r\n478=audio_is_playing(soundid):\r\n479=audio_is_paused(soundid):\r\n480=audio_exists(soundid):\r\n481=audio_emitter_get_gain(emitterid):\r\n482=audio_emitter_get_pitch(emitterid):\r\n483=audio_emitter_get_x(emitterid):\r\n484=audio_emitter_get_y(emitterid):\r\n485=audio_emitter_get_z(emitterid):\r\n486=audio_emitter_get_vx(emitterid):\r\n487=audio_emitter_get_vy(emitterid):\r\n488=audio_emitter_get_vz(emitterid):\r\n489=audio_listener_set_position(index, x,y,z)\r\n490=audio_listener_set_velocity(index, vx,vy,vz)\r\n491=audio_listener_set_orientation(index, lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)\r\n492=audio_listener_get_data(index):\r\n493=audio_set_master_gain(listenerIndex, gain)\r\n494=audio_get_master_gain(listenerIndex):\r\n495=audio_sound_get_gain(index):\r\n496=audio_sound_get_pitch(index):\r\n497=audio_get_name(index):\r\n498=audio_sound_set_track_position(index, time)\r\n499=audio_sound_get_track_position(index):\r\n500=audio_create_stream(filename)!:\r\n501=audio_destroy_stream(stream_sound_id)!\r\n502=audio_create_sync_group(looping):\r\n503=audio_destroy_sync_group(sync_group_id)\r\n504=audio_play_in_sync_group(sync:index, snd:index):\r\n505=audio_start_sync_group(sync_group_id)\r\n506=audio_stop_sync_group(sync_group_id)\r\n507=audio_pause_sync_group(sync_group_id)\r\n508=audio_resume_sync_group(sync_group_id)\r\n509=audio_sync_group_get_track_pos(sync_group_id):\r\n510=audio_sync_group_debug(sync_group_id)\r\n511=audio_sync_group_is_playing(sync_group_id):\r\n512=audio_debug(enable)\r\n513=audio_group_load(groupId):\r\n514=audio_group_unload(groupId)\r\n515=audio_group_is_loaded(groupId):\r\n516=audio_group_load_progress(groupId):\r\n517=audio_group_name(group:index):\r\n518=audio_group_stop_all(groupId)\r\n519=audio_group_set_gain(groupId, volume, time)\r\n520=audio_create_buffer_sound(bufferId, format, rate, offset, length, channels)!:\r\n521=audio_free_buffer_sound(soundId)!\r\n522=audio_create_play_queue(bufferFormat, sampleRate, channels)!:\r\n523=audio_free_play_queue(queueId)!\r\n524=audio_queue_sound(queueId, buffer_id, offset, length)!\r\n525=audio_get_recorder_count():\r\n526=audio_get_recorder_info(recorder_num):\r\n527=audio_start_recording(rec:number):\r\n528=audio_stop_recording(channel_index)\r\n529=audio_sound_get_listener_mask(soundid):\r\n530=audio_emitter_get_listener_mask(emitterid):\r\n531=audio_get_listener_mask():\r\n532=audio_sound_set_listener_mask(soundid,mask)\r\n533=audio_emitter_set_listener_mask(emitterid,mask)\r\n534=audio_set_listener_mask(mask)\r\n535=audio_get_listener_count():\r\n536=audio_get_listener_info(index):\r\n537=show_message(str)\r\n538=show_message_async(str)\r\n539=clickable_add(x,y,spritetpe,URL,target,params):\r\n540=clickable_add_ext(x,y,spritetpe,URL,target,params,scale,alpha):\r\n541=clickable_change(buttonid,spritetpe,x,y)\r\n542=clickable_change_ext(buttonid,spritetpe,x,y,scale,alpha)\r\n543=clickable_delete(buttonid)\r\n544=clickable_exists(index):\r\n545=clickable_set_style(buttonid,map)\r\n546=show_question(str:string):\r\n547=show_question_async(:string):\r\n548=get_integer(:string,:number):\r\n549=get_string(:string,:string):\r\n550=get_integer_async(:string,:number):\r\n551=get_string_async(:string,:string):\r\n552=get_login_async(:string,:string):\r\n553=get_open_filename(:string,:string):\r\n554=get_save_filename(:string,:string):\r\n555=get_open_filename_ext(:string,:string,:string,:string):\r\n556=get_save_filename_ext(:string,:string,:string,:string):\r\n557=show_error(str,abort)\r\n558=highscore_clear()\r\n559=highscore_add(str,numb)\r\n560=highscore_value(:index):\r\n561=highscore_name(:index):\r\n562=draw_highscore(x1,y1,x2,y2)\r\n563=sprite_exists(ind):\r\n564=sprite_get_name(ind):\r\n565=sprite_get_number(ind):\r\n566=sprite_get_width(ind):\r\n567=sprite_get_height(ind):\r\n568=sprite_get_xoffset(ind):\r\n569=sprite_get_yoffset(ind):\r\n570=sprite_get_bbox_left(ind):\r\n571=sprite_get_bbox_right(ind):\r\n572=sprite_get_bbox_top(ind):\r\n573=sprite_get_bbox_bottom(ind):\r\n574=sprite_save(ind,subimg,fname)\r\n575=sprite_save_strip(ind,fname)\r\n576=sprite_set_cache_size(ind, max)\r\n577=sprite_set_cache_size_ext(ind, image, max)\r\n578=sprite_get_tpe(index,subindex):\r\n579=sprite_prefetch(ind)\r\n580=sprite_prefetch_multi(indarray)\r\n581=sprite_flush(ind)\r\n582=sprite_flush_multi(indarray)\r\n583=sprite_set_speed(ind,speed,type)\r\n584=sprite_get_speed_type(ind):\r\n585=sprite_get_speed(ind):\r\n586=font_exists(ind):\r\n587=font_get_name(ind):\r\n588=font_get_fontname(ind):\r\n589=font_get_bold(ind):\r\n590=font_get_italic(ind):\r\n591=font_get_first(ind):\r\n592=font_get_last(ind):\r\n593=font_get_size(ind):\r\n594=font_set_cache_size(font,max)\r\n595=path_exists(ind):\r\n596=path_get_name(ind):\r\n597=path_get_length(ind):\r\n598=path_get_time(ind,speed):\r\n599=path_get_kind(ind):\r\n600=path_get_closed(ind):\r\n601=path_get_precision(ind):\r\n602=path_get_number(ind):\r\n603=path_get_point_x(ind,n):\r\n604=path_get_point_y(ind,n):\r\n605=path_get_point_speed(ind,n):\r\n606=path_get_x(ind,pos):\r\n607=path_get_y(ind,pos):\r\n608=path_get_speed(ind,pos):\r\n609=script_exists(ind):\r\n610=script_get_name(ind):\r\n611=timeline_add()!:\r\n612=timeline_delete(ind)!\r\n613=timeline_clear(ind)\r\n614=timeline_exists(ind):\r\n615=timeline_get_name(ind):\r\n616=timeline_moment_clear(ind,step)\r\n617=timeline_moment_add_script(ind,step,script)\r\n618=timeline_size(ind):\r\n619=timeline_max_moment(:index):\r\n620=object_exists(ind):\r\n621=object_get_name(ind):\r\n622=object_get_sprite(ind):\r\n623=object_get_solid(ind):\r\n624=object_get_visible(ind):\r\n625=object_get_persistent(ind):\r\n626=object_get_mask(ind):\r\n627=object_get_parent(ind):\r\n628=object_get_physics(ind):\r\n629=object_is_ancestor(ind_child,ind_parent):\r\n630=room_exists(ind):\r\n631=room_get_name(ind):\r\n632=sprite_set_offset(ind,xoff,yoff)\r\n633=sprite_duplicate(:index):\r\n634=sprite_assign(ind,source)\r\n635=sprite_merge(ind1,ind2)\r\n636=sprite_add(fname:string,imgnumb:int,removeback:bool,smooth:bool,xorig:number,yorig:number)!:\r\n637=sprite_replace(ind,fname,imgnumb,removeback,smooth,xorig,yorig)!\r\n638=sprite_create_from_surface(:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool,xorig:number,yorig:number)!:\r\n639=sprite_add_from_surface(ind:index,id:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool)!:\r\n640=sprite_delete(ind)!\r\n641=sprite_set_alpha_from_sprite(ind,spr)\r\n642=sprite_collision_mask(ind,sepmasks,bboxmode,bbleft,bbright,bbtop,bbbottom,kind,tolerance)\r\n643=font_add(:string,:number,:bool,:bool,:int,:int)!:\r\n644=font_add_sprite(spr:index,first:int,prop:bool,sep:number)!:\r\n645=font_add_sprite_ext(spr:index,:string,:bool,:number)!:\r\n646=font_replace_sprite(ind,spr,first,prop,sep)!\r\n647=font_replace_sprite_ext(font,spr,string_map,prop,sep)!\r\n648=font_delete(ind)!\r\n649=path_set_kind(ind,kind)\r\n650=path_set_closed(ind,closed)\r\n651=path_set_precision(ind,prec)\r\n652=path_add()!:\r\n653=path_assign(ind,path)\r\n654=path_duplicate(:index)!:\r\n655=path_append(ind,path)\r\n656=path_delete(ind)\r\n657=path_add_point(ind,x,y,speed)\r\n658=path_insert_point(ind,n,x,y,speed)\r\n659=path_change_point(ind,n,x,y,speed)\r\n660=path_delete_point(ind,n)!\r\n661=path_clear_points(ind)\r\n662=path_reverse(ind)\r\n663=path_mirror(ind)\r\n664=path_flip(ind)\r\n665=path_rotate(ind,angle)\r\n666=path_rescale(ind,xscale,yscale)\r\n667=path_shift(ind,xshift,yshift)\r\n668=object_set_sprite(ind,spr)\r\n669=object_set_solid(ind,solid)\r\n670=object_set_visible(ind,vis)\r\n671=object_set_persistent(ind,pers)\r\n672=object_set_mask(ind,spr)\r\n673=room_set_width(ind,w)\r\n674=room_set_height(ind,h)\r\n675=room_set_persistent(ind,pers)\r\n676=room_set_background_colour(ind,col,show)£\r\n677=room_set_background_color(ind,col,show)$\r\n678=room_set_viewport(ind,vind,vis,xport,yport,wport,hport)\r\n679=room_get_viewport(ind,vind):\r\n680=room_set_view_enabled(ind,val)\r\n681=room_add()!:\r\n682=room_duplicate(:index)!:\r\n683=room_assign(ind,source)\r\n684=room_instance_add(:index,:number,:number,:index):\r\n685=room_instance_clear(ind)\r\n686=room_get_camera(ind,vind):\r\n687=room_set_camera(ind,vind,camera)\r\n688=asset_get_index(name):\r\n689=asset_get_type(name):\r\n690=file_text_open_from_string(:string):\r\n691=file_text_open_read(fname):\r\n692=file_text_open_write(:string):\r\n693=file_text_open_append(:string):\r\n694=file_text_close(file)\r\n695=file_text_write_string(file,str)\r\n696=file_text_write_real(file,val)\r\n697=file_text_writeln(file)\r\n698=file_text_read_string(file):\r\n699=file_text_read_real(file):\r\n700=file_text_readln(file):\r\n701=file_text_eof(:index):\r\n702=file_text_eoln(:index):\r\n703=file_exists(fname):\r\n704=file_delete(fname)\r\n705=file_rename(oldname,newname)\r\n706=file_copy(fname,newname)\r\n707=directory_exists(dname):\r\n708=directory_create(dname):\r\n709=directory_destroy(dname)\r\n710=file_find_first(mask,attr):\r\n711=file_find_next():\r\n712=file_find_close():\r\n713=file_attributes(:string,:int):\r\n714=filename_name(:string):\r\n715=filename_path(:string):\r\n716=filename_dir(:string):\r\n717=filename_drive(:string):\r\n718=filename_ext(:string):\r\n719=filename_change_ext(:string,:string):\r\n720=file_bin_open(:string,mode):\r\n721=file_bin_rewrite(file)\r\n722=file_bin_close(file)\r\n723=file_bin_position(:index):\r\n724=file_bin_size(file):\r\n725=file_bin_seek(file,pos)\r\n726=file_bin_write_byte(file,byte)\r\n727=file_bin_read_byte(file):\r\n728=parameter_count():\r\n729=parameter_string(:index):\r\n730=environment_get_variable(name):\r\n731=ini_open_from_string(content)\r\n732=ini_open(fname)\r\n733=ini_close():\r\n734=ini_read_string(section,key,default):\r\n735=ini_read_real(section,key,default):\r\n736=ini_write_string(section,key,str)\r\n737=ini_write_real(section,key,value)\r\n738=ini_key_exists(section,key):\r\n739=ini_section_exists(section):\r\n740=ini_key_delete(section,key)\r\n741=ini_section_delete(section)\r\n742=ds_set_precision(prec)\r\n743=ds_exists(id, type):\r\n744=ds_stack_create():\r\n745=ds_stack_destroy(id)\r\n746=ds_stack_clear(id)\r\n747=ds_stack_copy(id,source)\r\n748=ds_stack_size(id):\r\n749=ds_stack_empty(id)\r\n750=ds_stack_push(id,value,...)\r\n751=ds_stack_pop(id)\r\n752=ds_stack_top(:index):\r\n753=ds_stack_write(:index):\r\n754=ds_stack_read(:index,:string,?legacy):\r\n755=ds_queue_create():\r\n756=ds_queue_destroy(id)\r\n757=ds_queue_clear(id)\r\n758=ds_queue_copy(id,source)\r\n759=ds_queue_size(id):\r\n760=ds_queue_empty(:index):\r\n761=ds_queue_enqueue(id,value,...)\r\n762=ds_queue_dequeue(id)\r\n763=ds_queue_head(:index):\r\n764=ds_queue_tail(:index):\r\n765=ds_queue_write(:index):\r\n766=ds_queue_read(:index,:string,?legacy):\r\n767=ds_list_create():\r\n768=ds_list_destroy(id)\r\n769=ds_list_clear(id)\r\n770=ds_list_copy(id,source)\r\n771=ds_list_size(id):\r\n772=ds_list_empty(:index):\r\n773=ds_list_add(id,value,...)\r\n774=ds_list_insert(id,pos,value)\r\n775=ds_list_replace(id,pos,value)\r\n776=ds_list_delete(id,pos)\r\n777=ds_list_find_index(id,value):\r\n778=ds_list_find_value(id,pos):\r\n779=ds_list_mark_as_list(id,pos)\r\n780=ds_list_mark_as_map(id,pos)\r\n781=ds_list_sort(id,ascending)\r\n782=ds_list_shuffle(id)\r\n783=ds_list_write(:index):\r\n784=ds_list_read(:index,:string,?legacy):\r\n785=ds_list_set(id,pos,value)\r\n786=ds_map_create():\r\n787=ds_map_destroy(id)\r\n788=ds_map_clear(id)\r\n789=ds_map_copy(id,source)\r\n790=ds_map_size(id):\r\n791=ds_map_empty(map:index):\r\n792=ds_map_add(id,key,value)\r\n793=ds_map_add_list(id,key,value)\r\n794=ds_map_add_map(id,key,value)\r\n795=ds_map_replace(id,key,value)\r\n796=ds_map_replace_map(id,key,value)\r\n797=ds_map_replace_list(id,key,value)\r\n798=ds_map_delete(id,key)\r\n799=ds_map_exists(id,key):\r\n800=ds_map_find_value(id,key):\r\n801=ds_map_find_previous(id,key):\r\n802=ds_map_find_next(id,key):\r\n803=ds_map_find_first(id):\r\n804=ds_map_find_last(id):\r\n805=ds_map_write(:index):\r\n806=ds_map_read(:index,:string,?legacy):\r\n807=ds_map_secure_save(id, filename)\r\n808=ds_map_secure_load(filename):\r\n809=ds_map_secure_load_buffer(buffer):\r\n810=ds_map_secure_save_buffer(id,buffer)\r\n811=ds_map_set(id,key,value)\r\n812=ds_priority_create():\r\n813=ds_priority_destroy(id)\r\n814=ds_priority_clear(id)\r\n815=ds_priority_copy(id,source)\r\n816=ds_priority_size(id):\r\n817=ds_priority_empty(:index):\r\n818=ds_priority_add(id,value,priority)\r\n819=ds_priority_change_priority(id,value,priority)\r\n820=ds_priority_find_priority(id,value):\r\n821=ds_priority_delete_value(id,value)\r\n822=ds_priority_delete_min(:index):\r\n823=ds_priority_find_min(:index):\r\n824=ds_priority_delete_max(:index):\r\n825=ds_priority_find_max(:index):\r\n826=ds_priority_write(:index):\r\n827=ds_priority_read(:index,:string,?legacy):\r\n828=ds_grid_create(w,h):\r\n829=ds_grid_destroy(id)\r\n830=ds_grid_copy(id,source)\r\n831=ds_grid_resize(id,w,h)\r\n832=ds_grid_width(:index):\r\n833=ds_grid_height(:index):\r\n834=ds_grid_clear(id,val)\r\n835=ds_grid_set(id,x,y,val)\r\n836=ds_grid_add(id,x,y,val)\r\n837=ds_grid_multiply(id,x,y,val)\r\n838=ds_grid_set_region(id,x1,y1,x2,y2,val)\r\n839=ds_grid_add_region(id,x1,y1,x2,y2,val)\r\n840=ds_grid_multiply_region(id,x1,y1,x2,y2,val)\r\n841=ds_grid_set_disk(id,xm,ym,r,val)\r\n842=ds_grid_add_disk(id,xm,ym,r,val)\r\n843=ds_grid_multiply_disk(id,xm,ym,r,val)\r\n844=ds_grid_set_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)\r\n845=ds_grid_add_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)\r\n846=ds_grid_multiply_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)\r\n847=ds_grid_get(id,x,y):\r\n848=ds_grid_get_sum(id,x1,y1,x2,y2):\r\n849=ds_grid_get_max(id,x1,y1,x2,y2):\r\n850=ds_grid_get_min(id,x1,y1,x2,y2):\r\n851=ds_grid_get_mean(id,x1,y1,x2,y2):\r\n852=ds_grid_get_disk_sum(id,xm,ym,r):\r\n853=ds_grid_get_disk_min(id,xm,ym,r):\r\n854=ds_grid_get_disk_max(id,xm,ym,r):\r\n855=ds_grid_get_disk_mean(id,xm,ym,r):\r\n856=ds_grid_value_exists(id,x1,y1,x2,y2,val):\r\n857=ds_grid_value_x(:index,x1:number,y1:number,x2:number,y2:number,val):\r\n858=ds_grid_value_y(:index,x1:number,y1:number,x2:number,y2:number,val):\r\n859=ds_grid_value_disk_exists(id,xm,ym,r,val):\r\n860=ds_grid_value_disk_x(:index,xm:number,ym:number,r:number,val):\r\n861=ds_grid_value_disk_y(:index,xm:number,ym:number,r:number,val):\r\n862=ds_grid_shuffle(id)\r\n863=ds_grid_write(:index):\r\n864=ds_grid_read(:index,:string,?legacy):\r\n865=ds_grid_sort(id,column,ascending)\r\n866=ds_grid_set(id,x,y,value)\r\n867=ds_grid_get(id,x,y):\r\n868=effect_create_below(kind,x,y,size,col):\r\n869=effect_create_above(kind,x,y,size,col):\r\n870=effect_clear()\r\n871=part_type_create():\r\n872=part_type_destroy(ind)\r\n873=part_type_exists(ind):\r\n874=part_type_clear(ind)\r\n875=part_type_shape(ind,shape)\r\n876=part_type_sprite(ind,sprite,animat,stretch,random)\r\n877=part_type_size(ind,size_min,size_max,size_incr,size_wiggle):\r\n878=part_type_scale(ind,xscale,yscale)\r\n879=part_type_orientation(ind,ang_min,ang_max,ang_incr,ang_wiggle,ang_relative)\r\n880=part_type_life(ind,life_min,life_max)\r\n881=part_type_step(ind,step_number,step_type)\r\n882=part_type_death(ind,death_number,death_type)\r\n883=part_type_speed(ind,speed_min,speed_max,speed_incr,speed_wiggle)\r\n884=part_type_direction(ind,dir_min,dir_max,dir_incr,dir_wiggle)\r\n885=part_type_gravity(ind,grav_amount,grav_dir)\r\n886=part_type_colour1(ind,colour1)£\r\n887=part_type_colour2(ind,colour1,colour2)£\r\n888=part_type_colour3(ind,colour1,colour2,colour3)£\r\n889=part_type_colour_mix(ind,colour1,colour2)£\r\n890=part_type_colour_rgb(ind,rmin,rmax,gmin,gmax,bmin,bmax)£\r\n891=part_type_colour_hsv(ind,hmin,hmax,smin,smax,vmin,vmax)£\r\n892=part_type_color1(ind,color1)$\r\n893=part_type_color2(ind,color1,color2)$\r\n894=part_type_color3(ind,color1,color2,color3)$\r\n895=part_type_color_mix(ind,color1,color2)$\r\n896=part_type_color_rgb(ind,rmin,rmax,gmin,gmax,bmin,bmax)$\r\n897=part_type_color_hsv(ind,hmin,hmax,smin,smax,vmin,vmax)$\r\n898=part_type_alpha1(ind,alpha1)\r\n899=part_type_alpha2(ind,alpha1,alpha2)\r\n900=part_type_alpha3(ind,alpha1,alpha2,alpha3)\r\n901=part_type_blend(ind,additive)\r\n902=part_system_create():\r\n903=part_system_create_layer(layer,persistent):\r\n904=part_system_destroy(ind)\r\n905=part_system_exists(ind):\r\n906=part_system_clear(ind)\r\n907=part_system_draw_order(ind,oldtonew)\r\n908=part_system_depth(ind,depth)\r\n909=part_system_position(ind,x,y)\r\n910=part_system_automatic_update(ind,automatic)\r\n911=part_system_automatic_draw(ind,draw)\r\n912=part_system_update(ind)\r\n913=part_system_drawit(ind)\r\n914=part_system_get_layer(ind):\r\n915=part_system_layer(ind,layer)\r\n916=part_particles_create(ind,x,y,parttype,number):\r\n917=part_particles_create_colour(ind,x,y,parttype,colour,number)£:\r\n918=part_particles_create_color(ind,x,y,parttype,color,number)$:\r\n919=part_particles_clear(ind)\r\n920=part_particles_count(ind)\r\n921=part_emitter_create(ps):\r\n922=part_emitter_destroy(ps,ind)\r\n923=part_emitter_destroy_all(ps)\r\n924=part_emitter_exists(ps,ind):\r\n925=part_emitter_clear(ps,ind)\r\n926=part_emitter_region(ps,ind,xmin,xmax,ymin,ymax,shape,distribution)\r\n927=part_emitter_burst(ps,ind,parttype,number)\r\n928=part_emitter_stream(ps,ind,parttype,number)\r\n929=window_handle():\r\n930=window_device():\r\n931=matrix_get(type):\r\n932=matrix_set(type,matrix)\r\n933=matrix_build_identity():\r\n934=matrix_build(x,y,z,xrotation,yrotation,zrotation,xscale,yscale,zscale):\r\n935=matrix_build_lookat(xfrom,yfrom,zfrom,xto,yto,zto,xup,yup,zup):\r\n936=matrix_build_projection_ortho(width,height,znear,zfar):\r\n937=matrix_build_projection_perspective(width,height,znear,zfar):\r\n938=matrix_build_projection_perspective_fov(fov_y,aspect,znear,zfar):\r\n939=matrix_multiply(a, b):\r\n940=matrix_transform_vertex(matrix, x, y, z):\r\n941=matrix_stack_push(...)\r\n942=matrix_stack_pop():\r\n943=matrix_stack_set(matrix)\r\n944=matrix_stack_clear()\r\n945=matrix_stack_top():\r\n946=matrix_stack_is_empty():\r\n947=browser_input_capture(enable)\r\n948=os_get_config():\r\n949=os_get_info():\r\n950=os_get_language():\r\n951=os_get_region():\r\n952=os_lock_orientation(flag)\r\n953=display_get_dpi_x():\r\n954=display_get_dpi_y():\r\n955=display_set_gui_size(width,height)\r\n956=display_set_gui_maximise(xscale,yscale,xoffset,yoffset,...)\r\n957=device_mouse_dbclick_enable(enable)\r\n958=virtual_key_add(x,y,w,h,keycode)\r\n959=virtual_key_hide(id)\r\n960=virtual_key_delete(id)\r\n961=virtual_key_show(id)\r\n962=draw_enable_drawevent(enable)\r\n963=draw_enable_swf_aa(enable)!\r\n964=draw_set_swf_aa_level(aa_level)!\r\n965=draw_get_swf_aa_level()!:\r\n966=draw_texture_flush()\r\n967=draw_flush()\r\n968=gpu_set_blendenable(enable)\r\n969=gpu_set_ztestenable(enable)\r\n970=gpu_set_zfunc(cmp_func)\r\n971=gpu_set_zwriteenable(enable)\r\n972=gpu_set_fog(enable,col,start,end)\r\n973=gpu_set_cullmode(cullmode)\r\n974=gpu_set_blendmode(mode)\r\n975=gpu_set_blendmode_ext(src,dest)\r\n976=gpu_set_blendmode_ext_sepalpha(src,dest,srcalpha,destalpha)\r\n977=gpu_set_colorwriteenable(red,green,blue,alpha)$\r\n978=gpu_set_colourwriteenable(red,green,blue,alpha)£\r\n979=gpu_set_alphatestenable(enable)\r\n980=gpu_set_alphatestref(value)\r\n981=gpu_set_alphatestfunc(cmp_func)\r\n982=gpu_set_texfilter(linear)\r\n983=gpu_set_texfilter_ext(sampler_id,linear)\r\n984=gpu_set_texrepeat(repeat)\r\n985=gpu_set_texrepeat_ext(sampler_id,repeat)\r\n986=gpu_set_tex_filter(linear)\r\n987=gpu_set_tex_filter_ext(sampler_id,linear)\r\n988=gpu_set_tex_repeat(repeat)\r\n989=gpu_set_tex_repeat_ext(sampler_id,repeat)\r\n990=gpu_set_tex_mip_filter(filter)\r\n991=gpu_set_tex_mip_filter_ext(sampler_id,filter)\r\n992=gpu_set_tex_mip_bias(bias)\r\n993=gpu_set_tex_mip_bias_ext(sampler_id,bias)\r\n994=gpu_set_tex_min_mip(minmip)\r\n995=gpu_set_tex_min_mip_ext(sampler_id,minmip)\r\n996=gpu_set_tex_max_mip(maxmip)\r\n997=gpu_set_tex_max_mip_ext(sampler_id,maxmip)\r\n998=gpu_set_tex_max_aniso(maxaniso)\r\n999=gpu_set_tex_max_aniso_ext(sampler_id,maxaniso)\r\n1000=gpu_set_tex_mip_enable(setting)\r\n1001=gpu_set_tex_mip_enable_ext(sampler_id,setting)\r\n1002=gpu_get_blendenable():\r\n1003=gpu_get_ztestenable():\r\n1004=gpu_get_zfunc():\r\n1005=gpu_get_zwriteenable():\r\n1006=gpu_get_fog():\r\n1007=gpu_get_cullmode():\r\n1008=gpu_get_blendmode():\r\n1009=gpu_get_blendmode_ext():\r\n1010=gpu_get_blendmode_ext_sepalpha():\r\n1011=gpu_get_blendmode_src():\r\n1012=gpu_get_blendmode_dest():\r\n1013=gpu_get_blendmode_srcalpha():\r\n1014=gpu_get_blendmode_destalpha():\r\n1015=gpu_get_colorwriteenable()$:\r\n1016=gpu_get_colourwriteenable()£:\r\n1017=gpu_get_alphatestenable():\r\n1018=gpu_get_alphatestref():\r\n1019=gpu_get_alphatestfunc():\r\n1020=gpu_get_texfilter():\r\n1021=gpu_get_texfilter_ext(sampler_id):\r\n1022=gpu_get_texrepeat():\r\n1023=gpu_get_texrepeat_ext(sampler_id):\r\n1024=gpu_get_tex_filter():\r\n1025=gpu_get_tex_filter_ext(sampler_id):\r\n1026=gpu_get_tex_repeat():\r\n1027=gpu_get_tex_repeat_ext(sampler_id):\r\n1028=gpu_get_tex_mip_filter():\r\n1029=gpu_get_tex_mip_filter_ext(sampler_id):\r\n1030=gpu_get_tex_mip_bias():\r\n1031=gpu_get_tex_mip_bias_ext(sampler_id):\r\n1032=gpu_get_tex_min_mip():\r\n1033=gpu_get_tex_min_mip_ext(sampler_id):\r\n1034=gpu_get_tex_max_mip():\r\n1035=gpu_get_tex_max_mip_ext(sampler_id):\r\n1036=gpu_get_tex_max_aniso():\r\n1037=gpu_get_tex_max_aniso_ext(sampler_id):\r\n1038=gpu_get_tex_mip_enable():\r\n1039=gpu_get_tex_mip_enable_ext(sampler_id):\r\n1040=gpu_push_state()\r\n1041=gpu_pop_state()\r\n1042=gpu_get_state():\r\n1043=gpu_set_state(map)\r\n1044=draw_light_define_ambient(col)\r\n1045=draw_light_define_direction(ind,dx,dy,dz,col)\r\n1046=draw_light_define_point(ind,x,y,z,range,col)\r\n1047=draw_light_enable(ind,enable)\r\n1048=draw_set_lighting(enable)\r\n1049=draw_light_get_ambient():\r\n1050=draw_light_get(ind):\r\n1051=draw_get_lighting():\r\n1052=shop_leave_rating(text_string,yes_string,no_string,url)\r\n1053=url_get_domain():\r\n1054=url_open(url)\r\n1055=url_open_ext(url,target)\r\n1056=url_open_full(url,target,options)\r\n1057=get_timer():\r\n1058=device_get_tilt_x():\r\n1059=device_get_tilt_y():\r\n1060=device_get_tilt_z():\r\n1061=device_is_keypad_open():\r\n1062=device_mouse_check_button(:index,:index):\r\n1063=device_mouse_check_button_pressed(:index,:index):\r\n1064=device_mouse_check_button_released(:index,:index):\r\n1065=device_mouse_x(:index):\r\n1066=device_mouse_y(:index):\r\n1067=device_mouse_raw_x(:index):\r\n1068=device_mouse_raw_y(:index):\r\n1069=device_mouse_x_to_gui(:index):\r\n1070=device_mouse_y_to_gui(:index):\r\n1071=gamepad_is_supported():\r\n1072=gamepad_get_device_count():\r\n1073=gamepad_is_connected(device):\r\n1074=gamepad_get_description(device):\r\n1075=gamepad_get_button_threshold(device):\r\n1076=gamepad_set_button_threshold(device, threshold)\r\n1077=gamepad_get_axis_deadzone(device):\r\n1078=gamepad_set_axis_deadzone(device, deadzone)\r\n1079=gamepad_button_count(device:index):\r\n1080=gamepad_button_check(device:index, buttonIndex:index):\r\n1081=gamepad_button_check_released(device:index, buttonIndex:index):\r\n1082=gamepad_button_value(device:index, buttonIndex:index):\r\n1083=gamepad_axis_count(axis:index):\r\n1084=gamepad_axis_value(device:index, axisIndex:index):\r\n1085=gamepad_set_vibration(device, leftMotorSpeed, rightMotorSpeed)\r\n1086=gamepad_set_colour(index,colour)£\r\n1087=gamepad_set_color(index,color)$\r\n1088=os_is_paused():\r\n1089=window_has_focus():\r\n1090=code_is_compiled():\r\n1091=http_get(url):\r\n1092=http_get_file(url, dest):\r\n1093=http_post_string(:string,:string):\r\n1094=http_request(url:string, method, header_map, body):\r\n1095=json_encode(map:index):\r\n1096=json_decode(:string):\r\n1097=zip_unzip(file, destPath)\r\n1098=load_csv(:string):\r\n1099=base64_encode(:string):\r\n1100=base64_decode(:string):\r\n1101=md5_string_unicode(:string):\r\n1102=md5_string_utf8(:string):\r\n1103=md5_file(:string):\r\n1104=os_is_network_connected():\r\n1105=sha1_string_unicode(:string):\r\n1106=sha1_string_utf8(:string):\r\n1107=sha1_file(:string):\r\n1108=os_powersave_enable(enable)\r\n1109=physics_world_create(PixelToMetreScale):\r\n1110=physics_world_gravity(gx, gy)\r\n1111=physics_world_update_speed(speed)\r\n1112=physics_world_update_iterations(iterations)\r\n1113=physics_world_draw_debug(draw_flags)\r\n1114=physics_pause_enable(pause)\r\n1115=physics_fixture_create():\r\n1116=physics_fixture_set_kinematic(fixture)\r\n1117=physics_fixture_set_density(fixture, density)\r\n1118=physics_fixture_set_awake(fixture, flag)\r\n1119=physics_fixture_set_restitution(fixture, restitution)\r\n1120=physics_fixture_set_friction(fixture,friction)\r\n1121=physics_fixture_set_collision_group(fixture, group)\r\n1122=physics_fixture_set_sensor(fixture, sensorState)\r\n1123=physics_fixture_set_linear_damping(fixture, damping)\r\n1124=physics_fixture_set_angular_damping(fixture, damping)\r\n1125=physics_fixture_set_circle_shape(fixture, circleRadius)\r\n1126=physics_fixture_set_box_shape(fixture, halfWidth, halfHeight)\r\n1127=physics_fixture_set_edge_shape(fixture, x1,y1,x2,y2)\r\n1128=physics_fixture_set_polygon_shape(fixture)\r\n1129=physics_fixture_set_chain_shape(fixture, loop)\r\n1130=physics_fixture_add_point(fixture, local_x, local_y)\r\n1131=:physics_fixture_bind(fixture, obj)\r\n1132=:physics_fixture_bind_ext(fixture, obj, xo, yo)\r\n1133=physics_fixture_delete(fixture)\r\n1134=:physics_apply_force(xpos, ypos, xforce, yforce)\r\n1135=:physics_apply_impulse(xpos, ypos, ximpulse, yimpulse)\r\n1136=:physics_apply_angular_impulse(impulse)\r\n1137=:physics_apply_local_force(xlocal, ylocal, xforce_local, yforce_local)\r\n1138=:physics_apply_local_impulse(xlocal, ylocal, ximpulse_local, yimpulse_local)\r\n1139=:physics_apply_torque(torque)\r\n1140=:physics_mass_properties(mass, local_centre_of_mass_x, local_centre_of_mass_y, inertia)\r\n1141=:physics_draw_debug()\r\n1142=:physics_test_overlap(x, y, angle, obj)\r\n1143=physics_remove_fixture(inst, id)\r\n1144=:physics_set_friction(fixture, friction)\r\n1145=:physics_set_density(fixture, density)\r\n1146=:physics_set_restitution(fixture, restitution)\r\n1147=:physics_get_friction(fixture):\r\n1148=:physics_get_density(fixture):\r\n1149=:physics_get_restitution(fixture):\r\n1150=physics_joint_distance_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, collideInstances):\r\n1151=physics_joint_rope_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, maxLength, collideInstances):\r\n1152=physics_joint_revolute_create(inst1, inst2, anchor_x, anchor_y, lower_angle_limit, upper_angle_limit, enable_limit, max_motor_torque, motor_speed, enable_motor, collideInstances):\r\n1153=physics_joint_prismatic_create(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, lower_translation_limit, upper_translation_limit, enable_limit, max_motor_force, motor_speed, enable_motor, collideInstances):\r\n1154=physics_joint_pulley_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, local_anchor_1_x, local_anchor_1_y, local_anchor_2_x, local_anchor_2_y, ratio, collideInstances):\r\n1155=physics_joint_wheel_create(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, enableMotor, max_motor_torque, motor_speed, freq_hz, damping_ratio, collideInstances):\r\n1156=physics_joint_weld_create(inst1, inst2, anchor_x, anchor_y, ref_angle, freq_hz, damping_ratio, collideInstances):\r\n1157=physics_joint_friction_create(inst1, inst2, anchor_x, anchor_y, max_force, max_torque, collideInstances):\r\n1158=physics_joint_gear_create(inst1, inst2, revoluteJoint, prismaticJoint, ratio):\r\n1159=physics_joint_enable_motor(joint, motorState)\r\n1160=physics_joint_get_value(joint, field):\r\n1161=physics_joint_set_value(joint, field, value)\r\n1162=physics_joint_delete(joint)\r\n1163=physics_particle_create(typeflags, x, y, xv, yv, col, alpha, category):\r\n1164=physics_particle_delete(ind)\r\n1165=physics_particle_delete_region_circle(x, y, radius)\r\n1166=physics_particle_delete_region_box(x, y, halfWidth, halfHeight)\r\n1167=physics_particle_delete_region_poly(pointList)\r\n1168=physics_particle_set_flags(ind, typeflags)\r\n1169=physics_particle_set_category_flags(category, typeflags)\r\n1170=physics_particle_draw(typemask, category, sprite, subimg)\r\n1171=physics_particle_draw_ext(typemask, category, sprite, subimg, xscale, yscale, angle, col, alpha)\r\n1172=physics_particle_count()\r\n1173=physics_particle_get_data(buffer, dataFlags):\r\n1174=physics_particle_get_data_particle(ind, buffer, dataFlags):\r\n1175=physics_particle_group_begin(typeflags, groupflags, x, y, ang, xv, yv, angVelocity, col, alpha, strength, category)\r\n1176=physics_particle_group_circle(radius)\r\n1177=physics_particle_group_box(halfWidth, halfHeight)\r\n1178=physics_particle_group_polygon()\r\n1179=physics_particle_group_add_point(x, y)\r\n1180=physics_particle_group_end()\r\n1181=physics_particle_group_join(to, from)\r\n1182=physics_particle_group_delete(ind)\r\n1183=physics_particle_group_count(group)\r\n1184=physics_particle_group_get_data(group, buffer, dataFlags):\r\n1185=physics_particle_group_get_mass(group):\r\n1186=physics_particle_group_get_inertia(group):\r\n1187=physics_particle_group_get_centre_x(group):\r\n1188=physics_particle_group_get_centre_y(group):\r\n1189=physics_particle_group_get_vel_x(group):\r\n1190=physics_particle_group_get_vel_y(group):\r\n1191=physics_particle_group_get_ang_vel(group):\r\n1192=physics_particle_group_get_x(group):\r\n1193=physics_particle_group_get_y(group):\r\n1194=physics_particle_group_get_angle(group):\r\n1195=physics_particle_set_group_flags(group, groupflags)\r\n1196=physics_particle_get_group_flags(group):\r\n1197=physics_particle_get_max_count():\r\n1198=physics_particle_get_radius():\r\n1199=physics_particle_get_density():\r\n1200=physics_particle_get_damping():\r\n1201=physics_particle_get_gravity_scale():\r\n1202=physics_particle_set_max_count(count)\r\n1203=physics_particle_set_radius(radius)\r\n1204=physics_particle_set_density(density)\r\n1205=physics_particle_set_damping(damping)\r\n1206=physics_particle_set_gravity_scale(scale)\r\n1207=buffer_create(size, buffer_type, alignment):\r\n1208=buffer_write(buffer, type, value)\r\n1209=buffer_read(buffer, type):\r\n1210=buffer_seek(buffer, base, offset)\r\n1211=buffer_get_surface(buffer, surface, mode, offset, modulo):\r\n1212=buffer_set_surface(buffer, surface, mode, offset, modulo)\r\n1213=buffer_delete(buffer)\r\n1214=buffer_exists(buffer):\r\n1215=buffer_get_type(buffer):\r\n1216=buffer_get_alignment(buffer):\r\n1217=buffer_poke(buffer, offset, type, value)\r\n1218=buffer_peek(:buffer, offset:int, type:index):\r\n1219=buffer_save(buffer, filename)\r\n1220=buffer_save_ext(buffer, filename, offset, size)\r\n1221=buffer_load(filename):\r\n1222=buffer_load_ext(buffer, filename, offset):\r\n1223=buffer_load_partial(buffer, filename, src_offset, src_len, dest_offset):\r\n1224=buffer_copy(src_buffer, src_offset, size, dest_buffer, dest_offset)\r\n1225=buffer_fill(buffer, offset, type, value, size)\r\n1226=buffer_get_size(buffer):\r\n1227=buffer_tell(:buffer):\r\n1228=buffer_resize(buffer, newsize)\r\n1229=buffer_md5(:buffer, offset:int, size:int):\r\n1230=buffer_sha1(:buffer, offset:int, size:int):\r\n1231=buffer_base64_encode(:buffer, offset:int, size:int):\r\n1232=buffer_base64_decode(:string):\r\n1233=buffer_base64_decode_ext(:buffer, :string, offset:int):\r\n1234=buffer_sizeof(type:index):\r\n1235=buffer_get_address(buffer):\r\n1236=buffer_create_from_vertex_buffer(vertex_buffer, type, alignment):\r\n1237=buffer_create_from_vertex_buffer_ext(vertex_buffer, type, alignment, start_vertex, num_vertices):\r\n1238=buffer_copy_from_vertex_buffer(vertex_buffer, start_vertex, num_vertices, dest_buffer, dest_offset)\r\n1239=buffer_async_group_begin(groupname)\r\n1240=buffer_async_group_option(optionname,optionvalue)\r\n1241=buffer_async_group_end()\r\n1242=buffer_load_async(bufferid,filename,offset,size):\r\n1243=buffer_save_async(bufferid,filename,offset,size)\r\n1244=gml_release_mode(enable)\r\n1245=steam_activate_overlay(overlayIndex)\r\n1246=steam_is_overlay_enabled():\r\n1247=steam_is_overlay_activated():\r\n1248=steam_get_persona_name():\r\n1249=steam_initialised():\r\n1250=steam_is_cloud_enabled_for_app():\r\n1251=steam_is_cloud_enabled_for_account():\r\n1252=steam_file_persisted(:string):\r\n1253=steam_get_quota_total():\r\n1254=steam_get_quota_free():\r\n1255=steam_file_write(:string, data, :number):\r\n1256=steam_file_write_file(:string, :string):\r\n1257=steam_file_read(filename):\r\n1258=steam_file_delete(filename)\r\n1259=steam_file_exists(filename):\r\n1260=steam_file_size(filename):\r\n1261=steam_file_share(filename)\r\n1262=steam_is_screenshot_requested():\r\n1263=steam_send_screenshot(filename,width,height)\r\n1264=steam_is_user_logged_on():\r\n1265=steam_get_user_steam_id():\r\n1266=steam_user_owns_dlc(_id):\r\n1267=steam_user_installed_dlc(_id):\r\n1268=steam_set_achievement(ach_name)\r\n1269=steam_get_achievement(ach_name):\r\n1270=steam_clear_achievement(ach_name)\r\n1271=steam_set_stat_int(stat_name,value)\r\n1272=steam_set_stat_float(stat_name,value)\r\n1273=steam_set_stat_avg_rate(stat_name,session_count,session_length)\r\n1274=steam_get_stat_int(stat_name):\r\n1275=steam_get_stat_float(stat_name):\r\n1276=steam_get_stat_avg_rate(stat_name):\r\n1277=steam_reset_all_stats()\r\n1278=steam_reset_all_stats_achievements()\r\n1279=steam_stats_ready():\r\n1280=steam_create_leaderboard(lb_name,sort_method,display_type):\r\n1281=steam_upload_score(:string, :number):\r\n1282=steam_upload_score_ext(:string, :number, :bool):\r\n1283=steam_download_scores_around_user(lb_name,range_start,range_end):\r\n1284=steam_download_scores(lb_name,start_idx,end_idx):\r\n1285=steam_download_friends_scores(lb_name):\r\n1286=steam_upload_score_buffer(lb_name, score, buffer_id):\r\n1287=steam_upload_score_buffer_ext(lb_name, score, buffer_id, forceupdate):\r\n1288=steam_current_game_language():\r\n1289=steam_available_languages():\r\n1290=steam_activate_overlay_browser(url)\r\n1291=steam_activate_overlay_user(dialog_name, steamid)\r\n1292=steam_activate_overlay_store(app_id)\r\n1293=steam_get_user_persona_name(steam_id):\r\n1294=steam_get_app_id():\r\n1295=steam_get_user_account_id():\r\n1296=steam_ugc_download(ugc_handle, dest_filename):\r\n1297=steam_ugc_create_item(consumer_app_id, file_type):\r\n1298=steam_ugc_start_item_update(consumer_app_id, published_file_id)\r\n1299=steam_ugc_set_item_title(ugc_update_handle, title)\r\n1300=steam_ugc_set_item_description(ugc_update_handle, description)\r\n1301=steam_ugc_set_item_visibility(ugc_update_handle, visibility)\r\n1302=steam_ugc_set_item_tags(ugc_update_handle, tag_array)\r\n1303=steam_ugc_set_item_content(ugc_update_handle, directory)\r\n1304=steam_ugc_set_item_preview(ugc_update_handle, image_path)\r\n1305=steam_ugc_submit_item_update(ugc_update_handle, change_note):\r\n1306=steam_ugc_get_item_update_progress(ugc_update_handle, info_map):\r\n1307=steam_ugc_subscribe_item(published_file_id):\r\n1308=steam_ugc_unsubscribe_item(published_file_id):\r\n1309=steam_ugc_num_subscribed_items():\r\n1310=steam_ugc_get_subscribed_items(item_list):\r\n1311=steam_ugc_get_item_install_info(published_file_id, info_map):\r\n1312=steam_ugc_get_item_update_info(published_file_id, info_map):\r\n1313=steam_ugc_request_item_details(published_file_id, max_age_seconds):\r\n1314=steam_ugc_create_query_user(list_type, match_type, sort_order, page):\r\n1315=steam_ugc_create_query_user_ex(list_type, match_type, sort_order, page, account_id, creator_app_id, consumer_app_id):\r\n1316=steam_ugc_create_query_all(query_type, match_type, page):\r\n1317=steam_ugc_create_query_all_ex(query_type, match_type, page, creator_app_id, consumer_app_id):\r\n1318=steam_ugc_query_set_cloud_filename_filter(ugc_query_handle , match_cloud_filename):\r\n1319=steam_ugc_query_set_match_any_tag(ugc_query_handle, match_any_tag)\r\n1320=steam_ugc_query_set_search_text(ugc_query_handle, search_text)\r\n1321=steam_ugc_query_set_ranked_by_trend_days(ugc_query_handle , days)\r\n1322=steam_ugc_query_add_required_tag(ugc_query_handle, tag_name)\r\n1323=steam_ugc_query_add_excluded_tag(ugc_query_handle, tag_name)\r\n1324=steam_ugc_query_set_return_long_description(ugc_query_handle, return_long_desc)\r\n1325=steam_ugc_query_set_return_total_only(ugc_query_handle, return_total_only)\r\n1326=steam_ugc_query_set_allow_cached_response(ugc_query_handle, max_age_seconds)\r\n1327=steam_ugc_send_query(ugc_query_handle)\r\n1328=shader_set(shader)\r\n1329=shader_reset()\r\n1330=shader_current():\r\n1331=shader_is_compiled(shader):\r\n1332=shader_get_sampler_index(shader,uniform_name):\r\n1333=shader_get_uniform(shader,uniform_name):\r\n1334=shader_set_uniform_i(uniform_id,val,....)\r\n1335=shader_set_uniform_i_array(uniform_id,array)\r\n1336=shader_set_uniform_f(uniform_id,val,....)\r\n1337=shader_set_uniform_f_array(uniform_id,array)\r\n1338=shader_set_uniform_matrix(uniform_id)\r\n1339=shader_set_uniform_matrix_array(uniform_id,array)\r\n1340=shader_enable_corner_id(enable)\r\n1341=texture_set_stage(sampled_id, texture_id)\r\n1342=texture_get_texel_width(texture_id):\r\n1343=texture_get_texel_height(texture_id):\r\n1344=shaders_are_supported():\r\n1345=vertex_format_begin()\r\n1346=vertex_format_end()\r\n1347=vertex_format_delete(format_id)\r\n1348=vertex_format_add_position()\r\n1349=vertex_format_add_position_3d()\r\n1350=vertex_format_add_colour()£\r\n1351=vertex_format_add_color()$\r\n1352=vertex_format_add_normal()\r\n1353=vertex_format_add_texcoord()\r\n1354=vertex_format_add_custom(type,usage)\r\n1355=vertex_create_buffer():\r\n1356=vertex_create_buffer_ext(size):\r\n1357=vertex_delete_buffer(vbuff)\r\n1358=vertex_begin(vbuff,format)\r\n1359=vertex_end(vbuff)\r\n1360=vertex_position(vbuff,x,y)\r\n1361=vertex_position_3d(vbuff,x,y,z)\r\n1362=vertex_colour(vbuff,colour,alpha)£\r\n1363=vertex_color(vbuff,color,alpha)$\r\n1364=vertex_argb(vbuff,argb)\r\n1365=vertex_texcoord(vbuff,u,v)\r\n1366=vertex_normal(vbuff,nx,ny,nz)\r\n1367=vertex_float1(vbuff,f1)\r\n1368=vertex_float2(vbuff,f1,f2)\r\n1369=vertex_float3(vbuff,f1,f2,f3)\r\n1370=vertex_float4(vbuff,f1,f2,f3,f4)\r\n1371=vertex_ubyte4(vbuff,b1,b2,b3,b4)\r\n1372=vertex_submit(vbuff,prim,texture)\r\n1373=vertex_freeze(vbuff)\r\n1374=vertex_get_number(vbuff):\r\n1375=vertex_get_buffer_size(vbuff):\r\n1376=vertex_create_buffer_from_buffer(src_buffer,format):\r\n1377=vertex_create_buffer_from_buffer_ext(src_buffer,format,src_offset,num_vertices):\r\n1378=draw_skeleton(sprite,animname,skinname,frame,x,y,xscale,yscale,rot,col,alpha)!\r\n1379=draw_skeleton_time(sprite, animname,skinname, time, x,y, xscale,yscale, rot, col,alpha)!\r\n1380=draw_skeleton_instance(instance, animname,skinname,frame,x,y,xscale,yscale,rot,col,alpha)!\r\n1381=draw_skeleton_collision(sprite,animname,frame,x,y,xscale,yscale,rot,col)!\r\n1382=layer_get_id(layer_name):\r\n1383=layer_get_id_at_depth(depth):\r\n1384=layer_get_depth(layer_id):\r\n1385=layer_create(depth,name*,...):\r\n1386=layer_destroy(layer_id)\r\n1387=layer_destroy_instances(layer_id)\r\n1388=layer_add_instance(layer_id,instance)\r\n1389=layer_has_instance(layer_id,instance)\r\n1390=layer_set_visible(layer_id,visible)\r\n1391=layer_get_visible(layer_id):\r\n1392=layer_exists(layer_id):\r\n1393=layer_x(layer_id,x)\r\n1394=layer_y(layer_id,y)\r\n1395=layer_get_x(layer_id):\r\n1396=layer_get_y(layer_id):\r\n1397=layer_hspeed(layer_id,speed)\r\n1398=layer_vspeed(layer_id,speed)\r\n1399=layer_get_hspeed(layer_id):\r\n1400=layer_get_vspeed(layer_id):\r\n1401=layer_script_begin(layer_id,script)\r\n1402=layer_script_end(layer_id,script)\r\n1403=layer_shader(layer_id,shader)\r\n1404=layer_get_script_begin(layer_id):\r\n1405=layer_get_script_end(layer_id):\r\n1406=layer_get_shader(layer_id):\r\n1407=layer_set_target_room(room)\r\n1408=layer_get_target_room():\r\n1409=layer_reset_target_room()\r\n1410=layer_get_all():\r\n1411=layer_get_all_elements(layer_id):\r\n1412=layer_get_name(layer_id):\r\n1413=layer_depth(layer_id, depth)\r\n1414=layer_get_element_layer(element_id):\r\n1415=layer_get_element_type(element_id):\r\n1416=layer_element_move(element_id,layer_id)\r\n1417=layer_force_draw_depth(force,depth)\r\n1418=layer_is_draw_depth_forced():\r\n1419=layer_get_forced_depth():\r\n1420=layer_background_get_id(layer_id):\r\n1421=layer_background_exists(layer_id,background_element_id):\r\n1422=layer_background_create(layer_id,sprite):\r\n1423=layer_background_destroy(background_element_id)\r\n1424=layer_background_visible(background_element_id,visible)\r\n1425=layer_background_change(background_element_id,sprite)\r\n1426=layer_background_sprite(background_element_id,sprite)\r\n1427=layer_background_htiled(background_element_id,tiled)\r\n1428=layer_background_vtiled(background_element_id,tiled)\r\n1429=layer_background_stretch(background_element_id,stretch)\r\n1430=layer_background_yscale(background_element_id,yscale)\r\n1431=layer_background_xscale(background_element_id,xscale)\r\n1432=layer_background_blend(background_element_id,col)\r\n1433=layer_background_alpha(background_element_id,alpha)\r\n1434=layer_background_index(background_element_id,image_index)\r\n1435=layer_background_speed(background_element_id,image_speed)\r\n1436=layer_background_get_visible(background_element_id):\r\n1437=layer_background_get_sprite(background_element_id):\r\n1438=layer_background_get_htiled(background_element_id):\r\n1439=layer_background_get_vtiled(background_element_id):\r\n1440=layer_background_get_stretch(background_element_id):\r\n1441=layer_background_get_yscale(background_element_id):\r\n1442=layer_background_get_xscale(background_element_id):\r\n1443=layer_background_get_blend(background_element_id):\r\n1444=layer_background_get_alpha(background_element_id):\r\n1445=layer_background_get_index(background_element_id):\r\n1446=layer_background_get_speed(background_element_id):\r\n1447=layer_sprite_get_id(layer_id,sprite_element_name):\r\n1448=layer_sprite_exists(layer_id,sprite_element_id):\r\n1449=layer_sprite_create(layer_id,x,y,sprite):\r\n1450=layer_sprite_destroy(sprite_element_id)\r\n1451=layer_sprite_change(sprite_element_id,sprite)\r\n1452=layer_sprite_index(sprite_element_id,image_index)\r\n1453=layer_sprite_speed(sprite_element_id,image_speed)\r\n1454=layer_sprite_xscale(sprite_element_id,scale)\r\n1455=layer_sprite_yscale(sprite_element_id,scale)\r\n1456=layer_sprite_angle(sprite_element_id,angle)\r\n1457=layer_sprite_blend(sprite_element_id,col)\r\n1458=layer_sprite_alpha(sprite_element_id,alpha)\r\n1459=layer_sprite_x(sprite_element_id,x)\r\n1460=layer_sprite_y(sprite_element_id,y)\r\n1461=layer_sprite_get_sprite(sprite_element_id):\r\n1462=layer_sprite_get_index(sprite_element_id):\r\n1463=layer_sprite_get_speed(sprite_element_id):\r\n1464=layer_sprite_get_xscale(sprite_element_id):\r\n1465=layer_sprite_get_yscale(sprite_element_id):\r\n1466=layer_sprite_get_angle(sprite_element_id):\r\n1467=layer_sprite_get_blend(sprite_element_id):\r\n1468=layer_sprite_get_alpha(sprite_element_id):\r\n1469=layer_sprite_get_x(sprite_element_id):\r\n1470=layer_sprite_get_y(sprite_element_id):\r\n1471=layer_tilemap_get_id(layer_id):\r\n1472=layer_tilemap_exists(layer_id,tilemap_element_id):\r\n1473=layer_tilemap_create(layer_id,x,y,tileset,width,height):\r\n1474=layer_tilemap_destroy(tilemap_element_id)\r\n1475=tilemap_tileset(tilemap_element_id,tileset)\r\n1476=tilemap_x(tilemap_element_id,x)\r\n1477=tilemap_y(tilemap_element_id,y)\r\n1478=tilemap_set(tilemap_element_id,tiledata,cell_x,cell_y)\r\n1479=tilemap_set_at_pixel(tilemap_element_id,tiledata,x,y)\r\n1480=tilemap_get_tileset(tilemap_element_id):\r\n1481=tilemap_get_tile_width(tilemap_element_id):\r\n1482=tilemap_get_tile_height(tilemap_element_id):\r\n1483=tilemap_get_width(tilemap_element_id):\r\n1484=tilemap_get_height(tilemap_element_id):\r\n1485=tilemap_get_x(tilemap_element_id):\r\n1486=tilemap_get_y(tilemap_element_id):\r\n1487=tilemap_get(tilemap_element_id,cell_x,cell_y):\r\n1488=tilemap_get_at_pixel(tilemap_element_id,x,y):\r\n1489=tilemap_get_cell_x_at_pixel(tilemap_element_id,x,y):\r\n1490=tilemap_get_cell_y_at_pixel(tilemap_element_id,x,y):\r\n1491=tilemap_clear(tilemap_element_id,tiledata)\r\n1492=draw_tilemap(tilemap_element_id,x,y)\r\n1493=draw_tile(tileset,tiledata,frame,x,y)\r\n1494=tilemap_set_global_mask(mask)\r\n1495=tilemap_get_global_mask():\r\n1496=tilemap_set_mask(tilemap_element_id, mask)\r\n1497=tilemap_get_mask(tilemap_element_id):\r\n1498=tilemap_get_frame(tilemap_element_id):\r\n1499=tile_set_empty(tiledata)\r\n1500=tile_set_index(tiledata,tileindex)\r\n1501=tile_set_flip(tiledata,flip)\r\n1502=tile_set_mirror(tiledata,mirror)\r\n1503=tile_set_rotate(tiledata,rotate)\r\n1504=tile_get_empty(tiledata):\r\n1505=tile_get_index(tiledata):\r\n1506=tile_get_flip(tiledata):\r\n1507=tile_get_mirror(tiledata):\r\n1508=tile_get_rotate(tiledata):\r\n1509=layer_tile_exists(layer_id,tile_element_id,...):\r\n1510=layer_tile_create(layer_id,x,y,tileset,left,top,width,height):\r\n1511=layer_tile_destroy(tile_element_id)\r\n1512=layer_tile_change(tile_element_id,sprite)\r\n1513=layer_tile_xscale(tile_element_id,scale)\r\n1514=layer_tile_yscale(tile_element_id,scale)\r\n1515=layer_tile_blend(tile_element_id,col)\r\n1516=layer_tile_alpha(tile_element_id,alpha)\r\n1517=layer_tile_x(tile_element_id,x)\r\n1518=layer_tile_y(tile_element_id,y)\r\n1519=layer_tile_region(tile_element_id,left,top,width,height)\r\n1520=layer_tile_visible(tile_element_id,visible)\r\n1521=layer_tile_get_sprite(tile_element_id):\r\n1522=layer_tile_get_xscale(tile_element_id):\r\n1523=layer_tile_get_yscale(tile_element_id):\r\n1524=layer_tile_get_blend(tile_element_id):\r\n1525=layer_tile_get_alpha(tile_element_id):\r\n1526=layer_tile_get_x(tile_element_id):\r\n1527=layer_tile_get_y(tile_element_id):\r\n1528=layer_tile_get_region(tile_element_id):\r\n1529=layer_tile_get_visible(tile_element_id):\r\n1530=layer_instance_get_instance(instance_element_id):\r\n1531=instance_activate_layer(layer_id)\r\n1532=instance_deactivate_layer(layer_id)\r\n1533=camera_create():\r\n1534=camera_create_view(room_x,room_y,width,height,angle,object,x_speed,y_speed,x_border,y_border):\r\n1535=camera_destroy(camera)\r\n1536=camera_apply(camera)\r\n1537=camera_get_active():\r\n1538=camera_get_default():\r\n1539=camera_set_default(camera)\r\n1540=camera_set_view_mat(camera,matrix)\r\n1541=camera_set_proj_mat(camera,matrix)\r\n1542=camera_set_update_script(camera,script)\r\n1543=camera_set_begin_script(camera,script)\r\n1544=camera_set_end_script(camera,script)\r\n1545=camera_set_view_pos(camera,x,y)\r\n1546=camera_set_view_size(camera,width,height)\r\n1547=camera_set_view_speed(camera,x_speed,y_speed)\r\n1548=camera_set_view_border(camera,x_border,y_border)\r\n1549=camera_set_view_angle(camera,angle)\r\n1550=camera_set_view_target(camera,object)\r\n1551=camera_get_view_mat(camera):\r\n1552=camera_get_proj_mat(camera):\r\n1553=camera_get_update_script(camera):\r\n1554=camera_get_begin_script(camera):\r\n1555=camera_get_end_script(camera):\r\n1556=camera_get_view_x(camera):\r\n1557=camera_get_view_y(camera):\r\n1558=camera_get_view_width(camera):\r\n1559=camera_get_view_height(camera):\r\n1560=camera_get_view_speed_x(camera):\r\n1561=camera_get_view_speed_y(camera):\r\n1562=camera_get_view_border_x(camera):\r\n1563=camera_get_view_border_y(camera):\r\n1564=camera_get_view_angle(camera):\r\n1565=camera_get_view_target(camera):\r\n1566=view_get_camera(view):\r\n1567=view_get_visible(view):\r\n1568=view_get_xport(view):\r\n1569=view_get_yport(view):\r\n1570=view_get_wport(view):\r\n1571=view_get_hport(view):\r\n1572=view_get_surface_id(view):\r\n1573=view_set_camera(view,camera)\r\n1574=view_set_visible(view,visible)\r\n1575=view_set_xport(view,xport)\r\n1576=view_set_yport(view,yport)\r\n1577=view_set_wport(view,wport)\r\n1578=view_set_hport(view,hport)\r\n1579=view_set_surface_id(view,surface_id)\r\n1580=gesture_drag_time(time)\r\n1581=gesture_drag_distance(distance)\r\n1582=gesture_flick_speed(speed)\r\n1583=gesture_double_tap_time(time)\r\n1584=gesture_double_tap_distance(distance)\r\n1585=gesture_pinch_distance(distance)\r\n1586=gesture_pinch_angle_towards(angle)\r\n1587=gesture_pinch_angle_away(angle)\r\n1588=gesture_rotate_time(time)\r\n1589=gesture_rotate_angle(angle)\r\n1590=gesture_tap_count(enable)\r\n1591=gesture_get_drag_time():\r\n1592=gesture_get_drag_distance():\r\n1593=gesture_get_flick_speed():\r\n1594=gesture_get_double_tap_time():\r\n1595=gesture_get_double_tap_distance():\r\n1596=gesture_get_pinch_distance():\r\n1597=gesture_get_pinch_angle_towards():\r\n1598=gesture_get_pinch_angle_away():\r\n1599=gesture_get_rotate_time():\r\n1600=gesture_get_rotate_angle():\r\n1601=gesture_get_tap_count():";
l_gmlVars="1602=room_speed\r\n1603=fps*\r\n1604=fps_real*\r\n1605=current_time*\r\n1606=current_year*\r\n1607=current_month*\r\n1608=current_day*\r\n1609=current_weekday*\r\n1610=current_hour*\r\n1611=current_minute*\r\n1612=current_second*\r\n1613=room*\r\n1614=room_first*\r\n1615=room_last*\r\n1616=room_width*\r\n1617=room_height*\r\n1618=room_persistent\r\n1619=score\r\n1620=lives\r\n1621=health\r\n1622=event_type*\r\n1623=event_number*\r\n1624=event_object*\r\n1625=event_action*\r\n1626=application_surface*\r\n1627=debug_mode*\r\n1628=font_texture_page_size\r\n1629=keyboard_key\r\n1630=keyboard_lastkey\r\n1631=keyboard_lastchar\r\n1632=keyboard_string\r\n1633=mouse_x*\r\n1634=mouse_y*\r\n1635=mouse_button\r\n1636=mouse_lastbutton\r\n1637=cursor_sprite\r\n1638=background_colour£\r\n1639=background_showcolour£\r\n1640=background_color$\r\n1641=background_showcolor$\r\n1642=view_enabled\r\n1643=view_current*\r\n1644=game_id*\r\n1645=game_display_name*\r\n1646=game_project_name*\r\n1647=game_save_id*\r\n1648=working_directory*\r\n1649=temp_directory*\r\n1650=program_directory*\r\n1651=browser_width*\r\n1652=browser_height*\r\n1653=os_type*\r\n1654=os_device*\r\n1655=os_browser*\r\n1656=os_version*\r\n1657=display_aa*\r\n1658=async_load*\r\n1659=delta_time*\r\n1660=webgl_enabled*\r\n1661=event_data*\r\n1662=of_challen";
var l_lines=file_text_open_from_string(l_gmlFuncs);
while(!file_text_eof(l_lines)){
	var l_line=file_text_read_string(l_lines);
	file_text_readln(l_lines);
	var l_sep=string_pos("=",l_line);
	gml_func_add(string_delete(l_line,1,l_sep),live_script_get_index("__lnc__f"+string_copy(l_line,1,l_sep-1)));
}
file_text_close(l_lines);
l_lines=file_text_open_from_string(l_gmlVars);
while(!file_text_eof(l_lines)){
	var l_line1=file_text_read_string(l_lines);
	file_text_readln(l_lines);
	var l_sep1=string_pos("=",l_line1);
	gml_var_add(string_delete(l_line1,1,l_sep1),live_script_get_index("__lnc__f"+string_copy(l_line1,1,l_sep1-1)));
}
file_text_close(l_lines);
__lnc_const_decl();

#define __lnc__lf
/// __lnc__lf(...w:real)->real
if (live_enabled) {
	var l_n=argument_count;
	if(l_n==0)return 0;
	var l_r=argument[0];
	for(var l_i=1;l_i<l_n;l_i+=1){
		var l_v=argument[l_i];
		if(l_v<l_r)l_r=l_v;
	}
	return l_r;
} else return 0;

#define __lnc__lf1
/// __lnc__lf1(...w1:real)->real
if (live_enabled) {
	var l_n1=argument_count;
	if(l_n1==0)return 0;
	var l_r1=argument[0];
	for(var l_i1=1;l_i1<l_n1;l_i1+=1){
		var l_v1=argument[l_i1];
		if(l_v1>l_r1)l_r1=l_v1;
	}
	return l_r1;
} else return 0;

#define __lnc__lf2
/// __lnc__lf2(...args1:dynamic)->Any
if (live_enabled) {
	return argument[irandom(argument_count-1)];
} else return undefined;

#define __lnc__lf3
/// __lnc__lf3(...m:dynamic)->?
if (live_enabled) {
	switch(argument_count){
		case 0:return gml_thread_error("Too few arguments for script_execute.");
		case 1:return script_execute(argument[0]);
		case 2:return script_execute(argument[0],argument[1]);
		case 3:return script_execute(argument[0],argument[1],argument[2]);
		case 4:return script_execute(argument[0],argument[1],argument[2],argument[3]);
		case 5:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return gml_thread_error("Too many arguments for script_execute.");
	}
} else return undefined;

#define __lnc__lf4
/// __lnc__lf4(...m1:dynamic)
if (live_enabled) {
	switch(argument_count){
		case 0:instance_destroy();break;
		case 1:instance_destroy(argument[0]);break;
		case 2:instance_destroy(argument[0],argument[1]);break;
		default:gml_thread_error("Too many arguments for instance_destroy.");
	}
}

#define __lnc__lf5
/// __lnc__lf5(...m2:dynamic)
if (live_enabled) {
	var l_setting=argument[0];
}

#define __lnc__f0
/// __lnc__f0()->Any
if (live_enabled) {
	return is_real(argument0);
} else return undefined;

#define __lnc__f1
/// __lnc__f1()->Any
if (live_enabled) {
	return is_string(argument0);
} else return undefined;

#define __lnc__f2
/// __lnc__f2()->Any
if (live_enabled) {
	return is_array(argument0);
} else return undefined;

#define __lnc__f3
/// __lnc__f3()->Any
if (live_enabled) {
	return is_undefined(argument0);
} else return undefined;

#define __lnc__f4
/// __lnc__f4()->Any
if (live_enabled) {
	return is_int32(argument0);
} else return undefined;

#define __lnc__f5
/// __lnc__f5()->Any
if (live_enabled) {
	return is_int64(argument0);
} else return undefined;

#define __lnc__f6
/// __lnc__f6()->Any
if (live_enabled) {
	return is_ptr(argument0);
} else return undefined;

#define __lnc__f7
/// __lnc__f7()->Any
if (live_enabled) {
	return is_vec3(argument0);
} else return undefined;

#define __lnc__f8
/// __lnc__f8()->Any
if (live_enabled) {
	return is_vec4(argument0);
} else return undefined;

#define __lnc__f9
/// __lnc__f9()->Any
if (live_enabled) {
	return is_matrix(argument0);
} else return undefined;

#define __lnc__f10
/// __lnc__f10()->Any
if (live_enabled) {
	return is_bool(argument0);
} else return undefined;

#define __lnc__f11
/// __lnc__f11()->Any
if (live_enabled) {
	return typeof(argument0);
} else return undefined;

#define __lnc__f12
/// __lnc__f12()->Any
if (live_enabled) {
	return variable_global_exists(argument0);
} else return undefined;

#define __lnc__f13
/// __lnc__f13()->Any
if (live_enabled) {
	return variable_global_get(argument0);
} else return undefined;

#define __lnc__f14
/// __lnc__f14()
if (live_enabled) {
	variable_global_set(argument0,argument1);
}

#define __lnc__f15
/// __lnc__f15()->Any
if (live_enabled) {
	return variable_instance_exists(argument0,argument1);
} else return undefined;

#define __lnc__f16
/// __lnc__f16()->Any
if (live_enabled) {
	return variable_instance_get(argument0,argument1);
} else return undefined;

#define __lnc__f17
/// __lnc__f17()
if (live_enabled) {
	variable_instance_set(argument0,argument1,argument2);
}

#define __lnc__f18
/// __lnc__f18()->Any
if (live_enabled) {
	return variable_instance_get_names(argument0);
} else return undefined;

#define __lnc__f19
/// __lnc__f19()->Any
if (live_enabled) {
	return array_length_1d(argument0);
} else return undefined;

#define __lnc__f20
/// __lnc__f20()->Any
if (live_enabled) {
	return array_length_2d(argument0,argument1);
} else return undefined;

#define __lnc__f21
/// __lnc__f21()->Any
if (live_enabled) {
	return array_height_2d(argument0);
} else return undefined;

#define __lnc__f22
/// __lnc__f22()->Any
if (live_enabled) {
	return array_equals(argument0,argument1);
} else return undefined;

#define __lnc__f23
/// __lnc__f23()->Any
if (live_enabled) {
	return array_create(argument0);
} else return undefined;

#define __lnc__f24
/// __lnc__f24()
if (live_enabled) {
	array_copy(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f25
/// __lnc__f25()->Any
if (live_enabled) {
	return random(argument0);
} else return undefined;

#define __lnc__f26
/// __lnc__f26()->Any
if (live_enabled) {
	return random_range(argument0,argument1);
} else return undefined;

#define __lnc__f27
/// __lnc__f27()->Any
if (live_enabled) {
	return irandom(argument0);
} else return undefined;

#define __lnc__f28
/// __lnc__f28()->Any
if (live_enabled) {
	return irandom_range(argument0,argument1);
} else return undefined;

#define __lnc__f29
/// __lnc__f29()
if (live_enabled) {
	random_set_seed(argument0);
}

#define __lnc__f30
/// __lnc__f30()->Any
if (live_enabled) {
	return random_get_seed();
} else return undefined;

#define __lnc__f31
/// __lnc__f31()->Any
if (live_enabled) {
	return randomize();
} else return undefined;

#define __lnc__f32
/// __lnc__f32()
if (live_enabled) {
	randomise();
}

#define __lnc__f33
/// __lnc__f33()->Any
if (live_enabled) {
	return abs(argument0);
} else return undefined;

#define __lnc__f34
/// __lnc__f34()->Any
if (live_enabled) {
	return round(argument0);
} else return undefined;

#define __lnc__f35
/// __lnc__f35()->Any
if (live_enabled) {
	return floor(argument0);
} else return undefined;

#define __lnc__f36
/// __lnc__f36()->Any
if (live_enabled) {
	return ceil(argument0);
} else return undefined;

#define __lnc__f37
/// __lnc__f37()->Any
if (live_enabled) {
	return sign(argument0);
} else return undefined;

#define __lnc__f38
/// __lnc__f38()->Any
if (live_enabled) {
	return frac(argument0);
} else return undefined;

#define __lnc__f39
/// __lnc__f39()->Any
if (live_enabled) {
	return sqrt(argument0);
} else return undefined;

#define __lnc__f40
/// __lnc__f40()->Any
if (live_enabled) {
	return sqr(argument0);
} else return undefined;

#define __lnc__f41
/// __lnc__f41()->Any
if (live_enabled) {
	return exp(argument0);
} else return undefined;

#define __lnc__f42
/// __lnc__f42()->Any
if (live_enabled) {
	return ln(argument0);
} else return undefined;

#define __lnc__f43
/// __lnc__f43()->Any
if (live_enabled) {
	return log2(argument0);
} else return undefined;

#define __lnc__f44
/// __lnc__f44()->Any
if (live_enabled) {
	return log10(argument0);
} else return undefined;

#define __lnc__f45
/// __lnc__f45()->Any
if (live_enabled) {
	return sin(argument0);
} else return undefined;

#define __lnc__f46
/// __lnc__f46()->Any
if (live_enabled) {
	return cos(argument0);
} else return undefined;

#define __lnc__f47
/// __lnc__f47()->Any
if (live_enabled) {
	return tan(argument0);
} else return undefined;

#define __lnc__f48
/// __lnc__f48()->Any
if (live_enabled) {
	return arcsin(argument0);
} else return undefined;

#define __lnc__f49
/// __lnc__f49()->Any
if (live_enabled) {
	return arccos(argument0);
} else return undefined;

#define __lnc__f50
/// __lnc__f50()->Any
if (live_enabled) {
	return arctan(argument0);
} else return undefined;

#define __lnc__f51
/// __lnc__f51()->Any
if (live_enabled) {
	return arctan2(argument0,argument1);
} else return undefined;

#define __lnc__f52
/// __lnc__f52()->Any
if (live_enabled) {
	return dsin(argument0);
} else return undefined;

#define __lnc__f53
/// __lnc__f53()->Any
if (live_enabled) {
	return dcos(argument0);
} else return undefined;

#define __lnc__f54
/// __lnc__f54()->Any
if (live_enabled) {
	return dtan(argument0);
} else return undefined;

#define __lnc__f55
/// __lnc__f55()->Any
if (live_enabled) {
	return darcsin(argument0);
} else return undefined;

#define __lnc__f56
/// __lnc__f56()->Any
if (live_enabled) {
	return darccos(argument0);
} else return undefined;

#define __lnc__f57
/// __lnc__f57()->Any
if (live_enabled) {
	return darctan(argument0);
} else return undefined;

#define __lnc__f58
/// __lnc__f58()->Any
if (live_enabled) {
	return darctan2(argument0,argument1);
} else return undefined;

#define __lnc__f59
/// __lnc__f59()->Any
if (live_enabled) {
	return degtorad(argument0);
} else return undefined;

#define __lnc__f60
/// __lnc__f60()->Any
if (live_enabled) {
	return radtodeg(argument0);
} else return undefined;

#define __lnc__f61
/// __lnc__f61()->Any
if (live_enabled) {
	return power(argument0,argument1);
} else return undefined;

#define __lnc__f62
/// __lnc__f62()->Any
if (live_enabled) {
	return logn(argument0,argument1);
} else return undefined;

#define __lnc__f63
/// __lnc__f63()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:return mean();
		case 1:return mean(argument[0]);
		case 2:return mean(argument[0],argument[1]);
		case 3:return mean(argument[0],argument[1],argument[2]);
		case 4:return mean(argument[0],argument[1],argument[2],argument[3]);
		case 5:return mean(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f64
/// __lnc__f64()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:return median();
		case 1:return median(argument[0]);
		case 2:return median(argument[0],argument[1]);
		case 3:return median(argument[0],argument[1],argument[2]);
		case 4:return median(argument[0],argument[1],argument[2],argument[3]);
		case 5:return median(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f65
/// __lnc__f65()->Any
if (live_enabled) {
	return clamp(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f66
/// __lnc__f66()->Any
if (live_enabled) {
	return lerp(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f67
/// __lnc__f67()->Any
if (live_enabled) {
	return dot_product(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f68
/// __lnc__f68()->Any
if (live_enabled) {
	return dot_product_3d(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f69
/// __lnc__f69()->Any
if (live_enabled) {
	return dot_product_normalised(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f70
/// __lnc__f70()->Any
if (live_enabled) {
	return dot_product_3d_normalised(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f71
/// __lnc__f71()->Any
if (live_enabled) {
	return dot_product_normalized(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f72
/// __lnc__f72()->Any
if (live_enabled) {
	return dot_product_3d_normalized(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f73
/// __lnc__f73()
if (live_enabled) {
	math_set_epsilon(argument0);
}

#define __lnc__f74
/// __lnc__f74()->Any
if (live_enabled) {
	return math_get_epsilon();
} else return undefined;

#define __lnc__f75
/// __lnc__f75()->Any
if (live_enabled) {
	return angle_difference(argument0,argument1);
} else return undefined;

#define __lnc__f76
/// __lnc__f76()->Any
if (live_enabled) {
	return point_distance_3d(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f77
/// __lnc__f77()->Any
if (live_enabled) {
	return point_distance(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f78
/// __lnc__f78()->Any
if (live_enabled) {
	return point_direction(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f79
/// __lnc__f79()->Any
if (live_enabled) {
	return lengthdir_x(argument0,argument1);
} else return undefined;

#define __lnc__f80
/// __lnc__f80()->Any
if (live_enabled) {
	return lengthdir_y(argument0,argument1);
} else return undefined;

#define __lnc__f81
/// __lnc__f81()->Any
if (live_enabled) {
	return real(argument0);
} else return undefined;

#define __lnc__f82
/// __lnc__f82()->Any
if (live_enabled) {
	return string(argument0);
} else return undefined;

#define __lnc__f83
/// __lnc__f83()->Any
if (live_enabled) {
	return int64(argument0);
} else return undefined;

#define __lnc__f84
/// __lnc__f84()->Any
if (live_enabled) {
	return ptr(argument0);
} else return undefined;

#define __lnc__f85
/// __lnc__f85()->Any
if (live_enabled) {
	return string_format(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f86
/// __lnc__f86()->Any
if (live_enabled) {
	return chr(argument0);
} else return undefined;

#define __lnc__f87
/// __lnc__f87()->Any
if (live_enabled) {
	return ansi_char(argument0);
} else return undefined;

#define __lnc__f88
/// __lnc__f88()->Any
if (live_enabled) {
	return ord(argument0);
} else return undefined;

#define __lnc__f89
/// __lnc__f89()->Any
if (live_enabled) {
	return string_length(argument0);
} else return undefined;

#define __lnc__f90
/// __lnc__f90()->Any
if (live_enabled) {
	return string_byte_length(argument0);
} else return undefined;

#define __lnc__f91
/// __lnc__f91()->Any
if (live_enabled) {
	return string_pos(argument0,argument1);
} else return undefined;

#define __lnc__f92
/// __lnc__f92()->Any
if (live_enabled) {
	return string_copy(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f93
/// __lnc__f93()->Any
if (live_enabled) {
	return string_char_at(argument0,argument1);
} else return undefined;

#define __lnc__f94
/// __lnc__f94()->Any
if (live_enabled) {
	return string_ord_at(argument0,argument1);
} else return undefined;

#define __lnc__f95
/// __lnc__f95()->Any
if (live_enabled) {
	return string_byte_at(argument0,argument1);
} else return undefined;

#define __lnc__f96
/// __lnc__f96()->Any
if (live_enabled) {
	return string_set_byte_at(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f97
/// __lnc__f97()->Any
if (live_enabled) {
	return string_delete(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f98
/// __lnc__f98()->Any
if (live_enabled) {
	return string_insert(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f99
/// __lnc__f99()->Any
if (live_enabled) {
	return string_lower(argument0);
} else return undefined;

#define __lnc__f100
/// __lnc__f100()->Any
if (live_enabled) {
	return string_upper(argument0);
} else return undefined;

#define __lnc__f101
/// __lnc__f101()->Any
if (live_enabled) {
	return string_repeat(argument0,argument1);
} else return undefined;

#define __lnc__f102
/// __lnc__f102()->Any
if (live_enabled) {
	return string_letters(argument0);
} else return undefined;

#define __lnc__f103
/// __lnc__f103()->Any
if (live_enabled) {
	return string_digits(argument0);
} else return undefined;

#define __lnc__f104
/// __lnc__f104()->Any
if (live_enabled) {
	return string_lettersdigits(argument0);
} else return undefined;

#define __lnc__f105
/// __lnc__f105()->Any
if (live_enabled) {
	return string_replace(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f106
/// __lnc__f106()->Any
if (live_enabled) {
	return string_replace_all(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f107
/// __lnc__f107()->Any
if (live_enabled) {
	return string_count(argument0,argument1);
} else return undefined;

#define __lnc__f108
/// __lnc__f108()->Any
if (live_enabled) {
	return string_hash_to_newline(argument0);
} else return undefined;

#define __lnc__f109
/// __lnc__f109()->Any
if (live_enabled) {
	return clipboard_has_text();
} else return undefined;

#define __lnc__f110
/// __lnc__f110()
if (live_enabled) {
	clipboard_set_text(argument0);
}

#define __lnc__f111
/// __lnc__f111()->Any
if (live_enabled) {
	return clipboard_get_text();
} else return undefined;

#define __lnc__f112
/// __lnc__f112()->Any
if (live_enabled) {
	return date_current_datetime();
} else return undefined;

#define __lnc__f113
/// __lnc__f113()->Any
if (live_enabled) {
	return date_create_datetime(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f114
/// __lnc__f114()->Any
if (live_enabled) {
	return date_valid_datetime(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f115
/// __lnc__f115()->Any
if (live_enabled) {
	return date_inc_year(argument0,argument1);
} else return undefined;

#define __lnc__f116
/// __lnc__f116()->Any
if (live_enabled) {
	return date_inc_month(argument0,argument1);
} else return undefined;

#define __lnc__f117
/// __lnc__f117()->Any
if (live_enabled) {
	return date_inc_week(argument0,argument1);
} else return undefined;

#define __lnc__f118
/// __lnc__f118()->Any
if (live_enabled) {
	return date_inc_day(argument0,argument1);
} else return undefined;

#define __lnc__f119
/// __lnc__f119()->Any
if (live_enabled) {
	return date_inc_hour(argument0,argument1);
} else return undefined;

#define __lnc__f120
/// __lnc__f120()->Any
if (live_enabled) {
	return date_inc_minute(argument0,argument1);
} else return undefined;

#define __lnc__f121
/// __lnc__f121()->Any
if (live_enabled) {
	return date_inc_second(argument0,argument1);
} else return undefined;

#define __lnc__f122
/// __lnc__f122()->Any
if (live_enabled) {
	return date_get_year(argument0);
} else return undefined;

#define __lnc__f123
/// __lnc__f123()->Any
if (live_enabled) {
	return date_get_month(argument0);
} else return undefined;

#define __lnc__f124
/// __lnc__f124()->Any
if (live_enabled) {
	return date_get_week(argument0);
} else return undefined;

#define __lnc__f125
/// __lnc__f125()->Any
if (live_enabled) {
	return date_get_day(argument0);
} else return undefined;

#define __lnc__f126
/// __lnc__f126()->Any
if (live_enabled) {
	return date_get_hour(argument0);
} else return undefined;

#define __lnc__f127
/// __lnc__f127()->Any
if (live_enabled) {
	return date_get_minute(argument0);
} else return undefined;

#define __lnc__f128
/// __lnc__f128()->Any
if (live_enabled) {
	return date_get_second(argument0);
} else return undefined;

#define __lnc__f129
/// __lnc__f129()->Any
if (live_enabled) {
	return date_get_weekday(argument0);
} else return undefined;

#define __lnc__f130
/// __lnc__f130()->Any
if (live_enabled) {
	return date_get_day_of_year(argument0);
} else return undefined;

#define __lnc__f131
/// __lnc__f131()->Any
if (live_enabled) {
	return date_get_hour_of_year(argument0);
} else return undefined;

#define __lnc__f132
/// __lnc__f132()->Any
if (live_enabled) {
	return date_get_minute_of_year(argument0);
} else return undefined;

#define __lnc__f133
/// __lnc__f133()->Any
if (live_enabled) {
	return date_get_second_of_year(argument0);
} else return undefined;

#define __lnc__f134
/// __lnc__f134()->Any
if (live_enabled) {
	return date_year_span(argument0,argument1);
} else return undefined;

#define __lnc__f135
/// __lnc__f135()->Any
if (live_enabled) {
	return date_month_span(argument0,argument1);
} else return undefined;

#define __lnc__f136
/// __lnc__f136()->Any
if (live_enabled) {
	return date_week_span(argument0,argument1);
} else return undefined;

#define __lnc__f137
/// __lnc__f137()->Any
if (live_enabled) {
	return date_day_span(argument0,argument1);
} else return undefined;

#define __lnc__f138
/// __lnc__f138()->Any
if (live_enabled) {
	return date_hour_span(argument0,argument1);
} else return undefined;

#define __lnc__f139
/// __lnc__f139()->Any
if (live_enabled) {
	return date_minute_span(argument0,argument1);
} else return undefined;

#define __lnc__f140
/// __lnc__f140()->Any
if (live_enabled) {
	return date_second_span(argument0,argument1);
} else return undefined;

#define __lnc__f141
/// __lnc__f141()->Any
if (live_enabled) {
	return date_compare_datetime(argument0,argument1);
} else return undefined;

#define __lnc__f142
/// __lnc__f142()->Any
if (live_enabled) {
	return date_compare_date(argument0,argument1);
} else return undefined;

#define __lnc__f143
/// __lnc__f143()->Any
if (live_enabled) {
	return date_compare_time(argument0,argument1);
} else return undefined;

#define __lnc__f144
/// __lnc__f144()->Any
if (live_enabled) {
	return date_date_of(argument0);
} else return undefined;

#define __lnc__f145
/// __lnc__f145()->Any
if (live_enabled) {
	return date_time_of(argument0);
} else return undefined;

#define __lnc__f146
/// __lnc__f146()->Any
if (live_enabled) {
	return date_datetime_string(argument0);
} else return undefined;

#define __lnc__f147
/// __lnc__f147()->Any
if (live_enabled) {
	return date_date_string(argument0);
} else return undefined;

#define __lnc__f148
/// __lnc__f148()->Any
if (live_enabled) {
	return date_time_string(argument0);
} else return undefined;

#define __lnc__f149
/// __lnc__f149()->Any
if (live_enabled) {
	return date_days_in_month(argument0);
} else return undefined;

#define __lnc__f150
/// __lnc__f150()->Any
if (live_enabled) {
	return date_days_in_year(argument0);
} else return undefined;

#define __lnc__f151
/// __lnc__f151()->Any
if (live_enabled) {
	return date_leap_year(argument0);
} else return undefined;

#define __lnc__f152
/// __lnc__f152()->Any
if (live_enabled) {
	return date_is_today(argument0);
} else return undefined;

#define __lnc__f153
/// __lnc__f153()
if (live_enabled) {
	date_set_timezone(argument0);
}

#define __lnc__f154
/// __lnc__f154()->Any
if (live_enabled) {
	return date_get_timezone();
} else return undefined;

#define __lnc__f155
/// __lnc__f155()
if (live_enabled) {
	game_set_speed(argument0,argument1);
}

#define __lnc__f156
/// __lnc__f156()->Any
if (live_enabled) {
	return game_get_speed(argument0);
} else return undefined;

#define __lnc__f157
/// __lnc__f157()
if (live_enabled) {
	motion_set(argument0,argument1);
}

#define __lnc__f158
/// __lnc__f158()
if (live_enabled) {
	motion_add(argument0,argument1);
}

#define __lnc__f159
/// __lnc__f159()->Any
if (live_enabled) {
	return place_free(argument0,argument1);
} else return undefined;

#define __lnc__f160
/// __lnc__f160()->Any
if (live_enabled) {
	return place_empty(argument0,argument1);
} else return undefined;

#define __lnc__f161
/// __lnc__f161()->Any
if (live_enabled) {
	return place_meeting(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f162
/// __lnc__f162()->Any
if (live_enabled) {
	return place_snapped(argument0,argument1);
} else return undefined;

#define __lnc__f163
/// __lnc__f163()
if (live_enabled) {
	move_random(argument0,argument1);
}

#define __lnc__f164
/// __lnc__f164()
if (live_enabled) {
	move_snap(argument0,argument1);
}

#define __lnc__f165
/// __lnc__f165()
if (live_enabled) {
	move_towards_point(argument0,argument1,argument2);
}

#define __lnc__f166
/// __lnc__f166()
if (live_enabled) {
	move_contact_solid(argument0,argument1);
}

#define __lnc__f167
/// __lnc__f167()
if (live_enabled) {
	move_contact_all(argument0,argument1);
}

#define __lnc__f168
/// __lnc__f168()
if (live_enabled) {
	move_outside_solid(argument0,argument1);
}

#define __lnc__f169
/// __lnc__f169()
if (live_enabled) {
	move_outside_all(argument0,argument1);
}

#define __lnc__f170
/// __lnc__f170()
if (live_enabled) {
	move_bounce_solid(argument0);
}

#define __lnc__f171
/// __lnc__f171()
if (live_enabled) {
	move_bounce_all(argument0);
}

#define __lnc__f172
/// __lnc__f172()
if (live_enabled) {
	move_wrap(argument0,argument1,argument2);
}

#define __lnc__f173
/// __lnc__f173()->Any
if (live_enabled) {
	return distance_to_point(argument0,argument1);
} else return undefined;

#define __lnc__f174
/// __lnc__f174()->Any
if (live_enabled) {
	return distance_to_object(argument0);
} else return undefined;

#define __lnc__f175
/// __lnc__f175()->Any
if (live_enabled) {
	return position_empty(argument0,argument1);
} else return undefined;

#define __lnc__f176
/// __lnc__f176()->Any
if (live_enabled) {
	return position_meeting(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f177
/// __lnc__f177()
if (live_enabled) {
	path_start(argument0,argument1,argument2,argument3);
}

#define __lnc__f178
/// __lnc__f178()
if (live_enabled) {
	path_end();
}

#define __lnc__f179
/// __lnc__f179()->Any
if (live_enabled) {
	return mp_linear_step(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f180
/// __lnc__f180()->Any
if (live_enabled) {
	return mp_potential_step(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f181
/// __lnc__f181()->Any
if (live_enabled) {
	return mp_linear_step_object(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f182
/// __lnc__f182()->Any
if (live_enabled) {
	return mp_potential_step_object(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f183
/// __lnc__f183()
if (live_enabled) {
	mp_potential_settings(argument0,argument1,argument2,argument3);
}

#define __lnc__f184
/// __lnc__f184()->Any
if (live_enabled) {
	return mp_linear_path(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f185
/// __lnc__f185()->Any
if (live_enabled) {
	return mp_potential_path(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f186
/// __lnc__f186()->Any
if (live_enabled) {
	return mp_linear_path_object(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f187
/// __lnc__f187()->Any
if (live_enabled) {
	return mp_potential_path_object(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f188
/// __lnc__f188()->Any
if (live_enabled) {
	return mp_grid_create(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f189
/// __lnc__f189()
if (live_enabled) {
	mp_grid_destroy(argument0);
}

#define __lnc__f190
/// __lnc__f190()
if (live_enabled) {
	mp_grid_clear_all(argument0);
}

#define __lnc__f191
/// __lnc__f191()
if (live_enabled) {
	mp_grid_clear_cell(argument0,argument1,argument2);
}

#define __lnc__f192
/// __lnc__f192()
if (live_enabled) {
	mp_grid_clear_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f193
/// __lnc__f193()
if (live_enabled) {
	mp_grid_add_cell(argument0,argument1,argument2);
}

#define __lnc__f194
/// __lnc__f194()->Any
if (live_enabled) {
	return mp_grid_get_cell(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f195
/// __lnc__f195()
if (live_enabled) {
	mp_grid_add_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f196
/// __lnc__f196()
if (live_enabled) {
	mp_grid_add_instances(argument0,argument1,argument2);
}

#define __lnc__f197
/// __lnc__f197()->Any
if (live_enabled) {
	return mp_grid_path(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f198
/// __lnc__f198()
if (live_enabled) {
	mp_grid_draw(argument0);
}

#define __lnc__f199
/// __lnc__f199()
if (live_enabled) {
	mp_grid_to_ds_grid(argument0,argument1);
}

#define __lnc__f200
/// __lnc__f200()->Any
if (live_enabled) {
	return collision_point(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f201
/// __lnc__f201()->Any
if (live_enabled) {
	return collision_rectangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f202
/// __lnc__f202()->Any
if (live_enabled) {
	return collision_circle(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f203
/// __lnc__f203()->Any
if (live_enabled) {
	return collision_ellipse(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f204
/// __lnc__f204()->Any
if (live_enabled) {
	return collision_line(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f205
/// __lnc__f205()->Any
if (live_enabled) {
	return point_in_rectangle(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f206
/// __lnc__f206()->Any
if (live_enabled) {
	return point_in_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f207
/// __lnc__f207()->Any
if (live_enabled) {
	return point_in_circle(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f208
/// __lnc__f208()->Any
if (live_enabled) {
	return rectangle_in_rectangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f209
/// __lnc__f209()->Any
if (live_enabled) {
	return rectangle_in_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
} else return undefined;

#define __lnc__f210
/// __lnc__f210()->Any
if (live_enabled) {
	return rectangle_in_circle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f211
/// __lnc__f211()->Any
if (live_enabled) {
	return instance_find(argument0,argument1);
} else return undefined;

#define __lnc__f212
/// __lnc__f212()->Any
if (live_enabled) {
	return instance_exists(argument0);
} else return undefined;

#define __lnc__f213
/// __lnc__f213()->Any
if (live_enabled) {
	return instance_number(argument0);
} else return undefined;

#define __lnc__f214
/// __lnc__f214()->Any
if (live_enabled) {
	return instance_position(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f215
/// __lnc__f215()->Any
if (live_enabled) {
	return instance_nearest(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f216
/// __lnc__f216()->Any
if (live_enabled) {
	return instance_furthest(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f217
/// __lnc__f217()->Any
if (live_enabled) {
	return instance_place(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f218
/// __lnc__f218()->Any
if (live_enabled) {
	return instance_create_depth(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f219
/// __lnc__f219()->Any
if (live_enabled) {
	return instance_create_layer(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f220
/// __lnc__f220()->Any
if (live_enabled) {
	return instance_copy(argument0);
} else return undefined;

#define __lnc__f221
/// __lnc__f221()
if (live_enabled) {
	instance_change(argument0,argument1);
}

#define __lnc__f222
/// __lnc__f222()
if (live_enabled) {
	position_destroy(argument0,argument1);
}

#define __lnc__f223
/// __lnc__f223()
if (live_enabled) {
	position_change(argument0,argument1,argument2,argument3);
}

#define __lnc__f224
/// __lnc__f224()->Any
if (live_enabled) {
	return instance_id_get(argument0);
} else return undefined;

#define __lnc__f225
/// __lnc__f225()
if (live_enabled) {
	instance_deactivate_all(argument0);
}

#define __lnc__f226
/// __lnc__f226()
if (live_enabled) {
	instance_deactivate_object(argument0);
}

#define __lnc__f227
/// __lnc__f227()
if (live_enabled) {
	instance_deactivate_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f228
/// __lnc__f228()
if (live_enabled) {
	instance_activate_all();
}

#define __lnc__f229
/// __lnc__f229()
if (live_enabled) {
	instance_activate_object(argument0);
}

#define __lnc__f230
/// __lnc__f230()
if (live_enabled) {
	instance_activate_region(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f231
/// __lnc__f231()
if (live_enabled) {
	room_goto(argument0);
}

#define __lnc__f232
/// __lnc__f232()
if (live_enabled) {
	room_goto_previous();
}

#define __lnc__f233
/// __lnc__f233()
if (live_enabled) {
	room_goto_next();
}

#define __lnc__f234
/// __lnc__f234()->Any
if (live_enabled) {
	return room_previous(argument0);
} else return undefined;

#define __lnc__f235
/// __lnc__f235()->Any
if (live_enabled) {
	return room_next(argument0);
} else return undefined;

#define __lnc__f236
/// __lnc__f236()
if (live_enabled) {
	room_restart();
}

#define __lnc__f237
/// __lnc__f237()
if (live_enabled) {
	game_end();
}

#define __lnc__f238
/// __lnc__f238()
if (live_enabled) {
	game_restart();
}

#define __lnc__f239
/// __lnc__f239()->Any
if (live_enabled) {
	return game_load(argument0);
} else return undefined;

#define __lnc__f240
/// __lnc__f240()
if (live_enabled) {
	game_save(argument0);
}

#define __lnc__f241
/// __lnc__f241()
if (live_enabled) {
	game_save_buffer(argument0);
}

#define __lnc__f242
/// __lnc__f242()->Any
if (live_enabled) {
	return game_load_buffer(argument0);
} else return undefined;

#define __lnc__f243
/// __lnc__f243()
if (live_enabled) {
	event_perform(argument0,argument1);
}

#define __lnc__f244
/// __lnc__f244()
if (live_enabled) {
	event_user(argument0);
}

#define __lnc__f245
/// __lnc__f245()
if (live_enabled) {
	event_perform_object(argument0,argument1,argument2);
}

#define __lnc__f246
/// __lnc__f246()
if (live_enabled) {
	event_inherited();
}

#define __lnc__f247
/// __lnc__f247()
if (live_enabled) {
	show_debug_message(argument0);
}

#define __lnc__f248
/// __lnc__f248()
if (live_enabled) {
	show_debug_overlay(argument0);
}

#define __lnc__f249
/// __lnc__f249()
if (live_enabled) {
	debug_event(argument0);
}

#define __lnc__f250
/// __lnc__f250()->Any
if (live_enabled) {
	return debug_get_callstack();
} else return undefined;

#define __lnc__f251
/// __lnc__f251()->Any
if (live_enabled) {
	return alarm_get(argument0);
} else return undefined;

#define __lnc__f252
/// __lnc__f252()
if (live_enabled) {
	alarm_set(argument0,argument1);
}

#define __lnc__f253
/// __lnc__f253()
if (live_enabled) {
	keyboard_set_map(argument0,argument1);
}

#define __lnc__f254
/// __lnc__f254()->Any
if (live_enabled) {
	return keyboard_get_map(argument0);
} else return undefined;

#define __lnc__f255
/// __lnc__f255()
if (live_enabled) {
	keyboard_unset_map();
}

#define __lnc__f256
/// __lnc__f256()->Any
if (live_enabled) {
	return keyboard_check(argument0);
} else return undefined;

#define __lnc__f257
/// __lnc__f257()->Any
if (live_enabled) {
	return keyboard_check_pressed(argument0);
} else return undefined;

#define __lnc__f258
/// __lnc__f258()->Any
if (live_enabled) {
	return keyboard_check_released(argument0);
} else return undefined;

#define __lnc__f259
/// __lnc__f259()->Any
if (live_enabled) {
	return keyboard_check_direct(argument0);
} else return undefined;

#define __lnc__f260
/// __lnc__f260()->Any
if (live_enabled) {
	return keyboard_get_numlock();
} else return undefined;

#define __lnc__f261
/// __lnc__f261()
if (live_enabled) {
	keyboard_set_numlock(argument0);
}

#define __lnc__f262
/// __lnc__f262()
if (live_enabled) {
	keyboard_key_press(argument0);
}

#define __lnc__f263
/// __lnc__f263()
if (live_enabled) {
	keyboard_key_release(argument0);
}

#define __lnc__f264
/// __lnc__f264()
if (live_enabled) {
	keyboard_clear(argument0);
}

#define __lnc__f265
/// __lnc__f265()
if (live_enabled) {
	io_clear();
}

#define __lnc__f266
/// __lnc__f266()->Any
if (live_enabled) {
	return mouse_check_button(argument0);
} else return undefined;

#define __lnc__f267
/// __lnc__f267()->Any
if (live_enabled) {
	return mouse_check_button_pressed(argument0);
} else return undefined;

#define __lnc__f268
/// __lnc__f268()->Any
if (live_enabled) {
	return mouse_check_button_released(argument0);
} else return undefined;

#define __lnc__f269
/// __lnc__f269()->Any
if (live_enabled) {
	return mouse_wheel_up();
} else return undefined;

#define __lnc__f270
/// __lnc__f270()->Any
if (live_enabled) {
	return mouse_wheel_down();
} else return undefined;

#define __lnc__f271
/// __lnc__f271()
if (live_enabled) {
	mouse_clear(argument0);
}

#define __lnc__f272
/// __lnc__f272()
if (live_enabled) {
	draw_self();
}

#define __lnc__f273
/// __lnc__f273()
if (live_enabled) {
	draw_sprite(argument0,argument1,argument2,argument3);
}

#define __lnc__f274
/// __lnc__f274()
if (live_enabled) {
	draw_sprite_pos(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f275
/// __lnc__f275()
if (live_enabled) {
	draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f276
/// __lnc__f276()
if (live_enabled) {
	draw_sprite_stretched(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f277
/// __lnc__f277()
if (live_enabled) {
	draw_sprite_stretched_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f278
/// __lnc__f278()
if (live_enabled) {
	draw_sprite_tiled(argument0,argument1,argument2,argument3);
}

#define __lnc__f279
/// __lnc__f279()
if (live_enabled) {
	draw_sprite_tiled_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f280
/// __lnc__f280()
if (live_enabled) {
	draw_sprite_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f281
/// __lnc__f281()
if (live_enabled) {
	draw_sprite_part_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f282
/// __lnc__f282()
if (live_enabled) {
	draw_sprite_general(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14,argument15);
}

#define __lnc__f283
/// __lnc__f283()
if (live_enabled) {
	draw_clear(argument0);
}

#define __lnc__f284
/// __lnc__f284()
if (live_enabled) {
	draw_clear_alpha(argument0,argument1);
}

#define __lnc__f285
/// __lnc__f285()
if (live_enabled) {
	draw_point(argument0,argument1);
}

#define __lnc__f286
/// __lnc__f286()
if (live_enabled) {
	draw_line(argument0,argument1,argument2,argument3);
}

#define __lnc__f287
/// __lnc__f287()
if (live_enabled) {
	draw_line_width(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f288
/// __lnc__f288()
if (live_enabled) {
	draw_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f289
/// __lnc__f289()
if (live_enabled) {
	draw_roundrect(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f290
/// __lnc__f290()
if (live_enabled) {
	draw_roundrect_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f291
/// __lnc__f291()
if (live_enabled) {
	draw_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f292
/// __lnc__f292()
if (live_enabled) {
	draw_circle(argument0,argument1,argument2,argument3);
}

#define __lnc__f293
/// __lnc__f293()
if (live_enabled) {
	draw_ellipse(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f294
/// __lnc__f294()
if (live_enabled) {
	draw_set_circle_precision(argument0);
}

#define __lnc__f295
/// __lnc__f295()
if (live_enabled) {
	draw_arrow(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f296
/// __lnc__f296()
if (live_enabled) {
	draw_button(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f297
/// __lnc__f297()
if (live_enabled) {
	draw_path(argument0,argument1,argument2,argument3);
}

#define __lnc__f298
/// __lnc__f298()
if (live_enabled) {
	draw_healthbar(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f299
/// __lnc__f299()->Any
if (live_enabled) {
	return draw_getpixel(argument0,argument1);
} else return undefined;

#define __lnc__f300
/// __lnc__f300()->Any
if (live_enabled) {
	return draw_getpixel_ext(argument0,argument1);
} else return undefined;

#define __lnc__f301
/// __lnc__f301()
if (live_enabled) {
	draw_set_colour(argument0);
}

#define __lnc__f302
/// __lnc__f302()
if (live_enabled) {
	draw_set_color(argument0);
}

#define __lnc__f303
/// __lnc__f303()
if (live_enabled) {
	draw_set_alpha(argument0);
}

#define __lnc__f304
/// __lnc__f304()->Any
if (live_enabled) {
	return draw_get_colour();
} else return undefined;

#define __lnc__f305
/// __lnc__f305()->Any
if (live_enabled) {
	return draw_get_color();
} else return undefined;

#define __lnc__f306
/// __lnc__f306()->Any
if (live_enabled) {
	return draw_get_alpha();
} else return undefined;

#define __lnc__f307
/// __lnc__f307()->Any
if (live_enabled) {
	return merge_colour(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f308
/// __lnc__f308()->Any
if (live_enabled) {
	return make_colour_rgb(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f309
/// __lnc__f309()->Any
if (live_enabled) {
	return make_colour_hsv(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f310
/// __lnc__f310()->Any
if (live_enabled) {
	return colour_get_red(argument0);
} else return undefined;

#define __lnc__f311
/// __lnc__f311()->Any
if (live_enabled) {
	return colour_get_green(argument0);
} else return undefined;

#define __lnc__f312
/// __lnc__f312()->Any
if (live_enabled) {
	return colour_get_blue(argument0);
} else return undefined;

#define __lnc__f313
/// __lnc__f313()->Any
if (live_enabled) {
	return colour_get_hue(argument0);
} else return undefined;

#define __lnc__f314
/// __lnc__f314()->Any
if (live_enabled) {
	return colour_get_saturation(argument0);
} else return undefined;

#define __lnc__f315
/// __lnc__f315()->Any
if (live_enabled) {
	return colour_get_value(argument0);
} else return undefined;

#define __lnc__f316
/// __lnc__f316()
if (live_enabled) {
	merge_colour(argument0,argument1,argument2);
}

#define __lnc__f317
/// __lnc__f317()->Any
if (live_enabled) {
	return make_color_rgb(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f318
/// __lnc__f318()->Any
if (live_enabled) {
	return make_color_hsv(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f319
/// __lnc__f319()->Any
if (live_enabled) {
	return color_get_red(argument0);
} else return undefined;

#define __lnc__f320
/// __lnc__f320()->Any
if (live_enabled) {
	return color_get_green(argument0);
} else return undefined;

#define __lnc__f321
/// __lnc__f321()->Any
if (live_enabled) {
	return color_get_blue(argument0);
} else return undefined;

#define __lnc__f322
/// __lnc__f322()->Any
if (live_enabled) {
	return color_get_hue(argument0);
} else return undefined;

#define __lnc__f323
/// __lnc__f323()->Any
if (live_enabled) {
	return color_get_saturation(argument0);
} else return undefined;

#define __lnc__f324
/// __lnc__f324()->Any
if (live_enabled) {
	return color_get_value(argument0);
} else return undefined;

#define __lnc__f325
/// __lnc__f325()->Any
if (live_enabled) {
	return merge_color(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f326
/// __lnc__f326()
if (live_enabled) {
	screen_save(argument0);
}

#define __lnc__f327
/// __lnc__f327()
if (live_enabled) {
	screen_save_part(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f328
/// __lnc__f328()
if (live_enabled) {
	draw_set_font(argument0);
}

#define __lnc__f329
/// __lnc__f329()
if (live_enabled) {
	draw_set_halign(argument0);
}

#define __lnc__f330
/// __lnc__f330()
if (live_enabled) {
	draw_set_valign(argument0);
}

#define __lnc__f331
/// __lnc__f331()
if (live_enabled) {
	draw_text(argument0,argument1,argument2);
}

#define __lnc__f332
/// __lnc__f332()
if (live_enabled) {
	draw_text_ext(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f333
/// __lnc__f333()->Any
if (live_enabled) {
	return string_width(argument0);
} else return undefined;

#define __lnc__f334
/// __lnc__f334()->Any
if (live_enabled) {
	return string_height(argument0);
} else return undefined;

#define __lnc__f335
/// __lnc__f335()->Any
if (live_enabled) {
	return string_width_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f336
/// __lnc__f336()->Any
if (live_enabled) {
	return string_height_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f337
/// __lnc__f337()
if (live_enabled) {
	draw_text_transformed(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f338
/// __lnc__f338()
if (live_enabled) {
	draw_text_ext_transformed(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f339
/// __lnc__f339()
if (live_enabled) {
	draw_text_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f340
/// __lnc__f340()
if (live_enabled) {
	draw_text_ext_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f341
/// __lnc__f341()
if (live_enabled) {
	draw_text_transformed_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f342
/// __lnc__f342()
if (live_enabled) {
	draw_text_ext_transformed_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
}

#define __lnc__f343
/// __lnc__f343()
if (live_enabled) {
	draw_text_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f344
/// __lnc__f344()
if (live_enabled) {
	draw_text_ext_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f345
/// __lnc__f345()
if (live_enabled) {
	draw_text_transformed_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f346
/// __lnc__f346()
if (live_enabled) {
	draw_text_ext_transformed_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
}

#define __lnc__f347
/// __lnc__f347()
if (live_enabled) {
	draw_point_colour(argument0,argument1,argument2);
}

#define __lnc__f348
/// __lnc__f348()
if (live_enabled) {
	draw_line_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f349
/// __lnc__f349()
if (live_enabled) {
	draw_line_width_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f350
/// __lnc__f350()
if (live_enabled) {
	draw_rectangle_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f351
/// __lnc__f351()
if (live_enabled) {
	draw_roundrect_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f352
/// __lnc__f352()
if (live_enabled) {
	draw_roundrect_colour_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f353
/// __lnc__f353()
if (live_enabled) {
	draw_triangle_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f354
/// __lnc__f354()
if (live_enabled) {
	draw_circle_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f355
/// __lnc__f355()
if (live_enabled) {
	draw_ellipse_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f356
/// __lnc__f356()
if (live_enabled) {
	draw_point_color(argument0,argument1,argument2);
}

#define __lnc__f357
/// __lnc__f357()
if (live_enabled) {
	draw_line_color(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f358
/// __lnc__f358()
if (live_enabled) {
	draw_line_width_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f359
/// __lnc__f359()
if (live_enabled) {
	draw_rectangle_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f360
/// __lnc__f360()
if (live_enabled) {
	draw_roundrect_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f361
/// __lnc__f361()
if (live_enabled) {
	draw_roundrect_color_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f362
/// __lnc__f362()
if (live_enabled) {
	draw_triangle_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f363
/// __lnc__f363()
if (live_enabled) {
	draw_circle_color(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f364
/// __lnc__f364()
if (live_enabled) {
	draw_ellipse_color(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f365
/// __lnc__f365()
if (live_enabled) {
	draw_primitive_begin(argument0);
}

#define __lnc__f366
/// __lnc__f366()
if (live_enabled) {
	draw_vertex(argument0,argument1);
}

#define __lnc__f367
/// __lnc__f367()
if (live_enabled) {
	draw_vertex_colour(argument0,argument1,argument2,argument3);
}

#define __lnc__f368
/// __lnc__f368()
if (live_enabled) {
	draw_vertex_color(argument0,argument1,argument2,argument3);
}

#define __lnc__f369
/// __lnc__f369()
if (live_enabled) {
	draw_primitive_end();
}

#define __lnc__f370
/// __lnc__f370()->Any
if (live_enabled) {
	return sprite_get_uvs(argument0,argument1);
} else return undefined;

#define __lnc__f371
/// __lnc__f371()->Any
if (live_enabled) {
	return font_get_uvs(argument0);
} else return undefined;

#define __lnc__f372
/// __lnc__f372()->Any
if (live_enabled) {
	return sprite_get_texture(argument0,argument1);
} else return undefined;

#define __lnc__f373
/// __lnc__f373()->Any
if (live_enabled) {
	return font_get_texture(argument0);
} else return undefined;

#define __lnc__f374
/// __lnc__f374()->Any
if (live_enabled) {
	return texture_get_width(argument0);
} else return undefined;

#define __lnc__f375
/// __lnc__f375()->Any
if (live_enabled) {
	return texture_get_height(argument0);
} else return undefined;

#define __lnc__f376
/// __lnc__f376()->Any
if (live_enabled) {
	return texture_get_uvs(argument0);
} else return undefined;

#define __lnc__f377
/// __lnc__f377()
if (live_enabled) {
	draw_primitive_begin_texture(argument0,argument1);
}

#define __lnc__f378
/// __lnc__f378()
if (live_enabled) {
	draw_vertex_texture(argument0,argument1,argument2,argument3);
}

#define __lnc__f379
/// __lnc__f379()
if (live_enabled) {
	draw_vertex_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f380
/// __lnc__f380()
if (live_enabled) {
	draw_vertex_texture_color(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f381
/// __lnc__f381()
if (live_enabled) {
	texture_global_scale(argument0);
}

#define __lnc__f382
/// __lnc__f382()->Any
if (live_enabled) {
	return surface_create(argument0,argument1);
} else return undefined;

#define __lnc__f383
/// __lnc__f383()->Any
if (live_enabled) {
	return surface_create_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f384
/// __lnc__f384()
if (live_enabled) {
	surface_resize(argument0,argument1,argument2);
}

#define __lnc__f385
/// __lnc__f385()
if (live_enabled) {
	surface_free(argument0);
}

#define __lnc__f386
/// __lnc__f386()->Any
if (live_enabled) {
	return surface_exists(argument0);
} else return undefined;

#define __lnc__f387
/// __lnc__f387()->Any
if (live_enabled) {
	return surface_get_width(argument0);
} else return undefined;

#define __lnc__f388
/// __lnc__f388()->Any
if (live_enabled) {
	return surface_get_height(argument0);
} else return undefined;

#define __lnc__f389
/// __lnc__f389()->Any
if (live_enabled) {
	return surface_get_texture(argument0);
} else return undefined;

#define __lnc__f390
/// __lnc__f390()
if (live_enabled) {
	surface_set_target(argument0);
}

#define __lnc__f391
/// __lnc__f391()
if (live_enabled) {
	surface_set_target_ext(argument0,argument1);
}

#define __lnc__f392
/// __lnc__f392()
if (live_enabled) {
	surface_reset_target();
}

#define __lnc__f393
/// __lnc__f393()
if (live_enabled) {
	draw_surface(argument0,argument1,argument2);
}

#define __lnc__f394
/// __lnc__f394()
if (live_enabled) {
	draw_surface_stretched(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f395
/// __lnc__f395()
if (live_enabled) {
	draw_surface_tiled(argument0,argument1,argument2);
}

#define __lnc__f396
/// __lnc__f396()
if (live_enabled) {
	draw_surface_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f397
/// __lnc__f397()
if (live_enabled) {
	draw_surface_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f398
/// __lnc__f398()
if (live_enabled) {
	draw_surface_stretched_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f399
/// __lnc__f399()
if (live_enabled) {
	draw_surface_tiled_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f400
/// __lnc__f400()
if (live_enabled) {
	draw_surface_part_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f401
/// __lnc__f401()
if (live_enabled) {
	draw_surface_general(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14);
}

#define __lnc__f402
/// __lnc__f402()->Any
if (live_enabled) {
	return surface_getpixel(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f403
/// __lnc__f403()->Any
if (live_enabled) {
	return surface_getpixel_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f404
/// __lnc__f404()
if (live_enabled) {
	surface_save(argument0,argument1);
}

#define __lnc__f405
/// __lnc__f405()
if (live_enabled) {
	surface_save_part(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f406
/// __lnc__f406()
if (live_enabled) {
	surface_copy(argument0,argument1,argument2,argument3);
}

#define __lnc__f407
/// __lnc__f407()
if (live_enabled) {
	surface_copy_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f408
/// __lnc__f408()
if (live_enabled) {
	application_surface_draw_enable(argument0);
}

#define __lnc__f409
/// __lnc__f409()->Any
if (live_enabled) {
	return application_get_position();
} else return undefined;

#define __lnc__f410
/// __lnc__f410()
if (live_enabled) {
	application_surface_enable(argument0);
}

#define __lnc__f411
/// __lnc__f411()->Any
if (live_enabled) {
	return application_surface_is_enabled();
} else return undefined;

#define __lnc__f412
/// __lnc__f412()->Any
if (live_enabled) {
	return display_get_width();
} else return undefined;

#define __lnc__f413
/// __lnc__f413()->Any
if (live_enabled) {
	return display_get_height();
} else return undefined;

#define __lnc__f414
/// __lnc__f414()->Any
if (live_enabled) {
	return display_get_orientation();
} else return undefined;

#define __lnc__f415
/// __lnc__f415()->Any
if (live_enabled) {
	return display_get_gui_width();
} else return undefined;

#define __lnc__f416
/// __lnc__f416()->Any
if (live_enabled) {
	return display_get_gui_height();
} else return undefined;

#define __lnc__f417
/// __lnc__f417()->Any
if (live_enabled) {
	return display_reset(argument0,argument1);
} else return undefined;

#define __lnc__f418
/// __lnc__f418()->Any
if (live_enabled) {
	return display_mouse_get_x();
} else return undefined;

#define __lnc__f419
/// __lnc__f419()->Any
if (live_enabled) {
	return display_mouse_get_y();
} else return undefined;

#define __lnc__f420
/// __lnc__f420()
if (live_enabled) {
	display_mouse_set(argument0,argument1);
}

#define __lnc__f421
/// __lnc__f421()
if (live_enabled) {
	window_set_fullscreen(argument0);
}

#define __lnc__f422
/// __lnc__f422()->Any
if (live_enabled) {
	return window_get_fullscreen();
} else return undefined;

#define __lnc__f423
/// __lnc__f423()
if (live_enabled) {
	window_set_caption(argument0);
}

#define __lnc__f424
/// __lnc__f424()
if (live_enabled) {
	window_set_min_width(argument0);
}

#define __lnc__f425
/// __lnc__f425()
if (live_enabled) {
	window_set_max_width(argument0);
}

#define __lnc__f426
/// __lnc__f426()
if (live_enabled) {
	window_set_min_height(argument0);
}

#define __lnc__f427
/// __lnc__f427()
if (live_enabled) {
	window_set_max_height(argument0);
}

#define __lnc__f428
/// __lnc__f428()->Any
if (live_enabled) {
	return window_get_visible_rects(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f429
/// __lnc__f429()->Any
if (live_enabled) {
	return window_get_caption();
} else return undefined;

#define __lnc__f430
/// __lnc__f430()
if (live_enabled) {
	window_set_cursor(argument0);
}

#define __lnc__f431
/// __lnc__f431()->Any
if (live_enabled) {
	return window_get_cursor();
} else return undefined;

#define __lnc__f432
/// __lnc__f432()
if (live_enabled) {
	window_set_colour(argument0);
}

#define __lnc__f433
/// __lnc__f433()->Any
if (live_enabled) {
	return window_get_colour();
} else return undefined;

#define __lnc__f434
/// __lnc__f434()
if (live_enabled) {
	window_set_color(argument0);
}

#define __lnc__f435
/// __lnc__f435()->Any
if (live_enabled) {
	return window_get_color();
} else return undefined;

#define __lnc__f436
/// __lnc__f436()
if (live_enabled) {
	window_set_position(argument0,argument1);
}

#define __lnc__f437
/// __lnc__f437()
if (live_enabled) {
	window_set_size(argument0,argument1);
}

#define __lnc__f438
/// __lnc__f438()
if (live_enabled) {
	window_set_rectangle(argument0,argument1,argument2,argument3);
}

#define __lnc__f439
/// __lnc__f439()
if (live_enabled) {
	window_center();
}

#define __lnc__f440
/// __lnc__f440()->Any
if (live_enabled) {
	return window_get_x();
} else return undefined;

#define __lnc__f441
/// __lnc__f441()->Any
if (live_enabled) {
	return window_get_y();
} else return undefined;

#define __lnc__f442
/// __lnc__f442()->Any
if (live_enabled) {
	return window_get_width();
} else return undefined;

#define __lnc__f443
/// __lnc__f443()->Any
if (live_enabled) {
	return window_get_height();
} else return undefined;

#define __lnc__f444
/// __lnc__f444()->Any
if (live_enabled) {
	return window_mouse_get_x();
} else return undefined;

#define __lnc__f445
/// __lnc__f445()->Any
if (live_enabled) {
	return window_mouse_get_y();
} else return undefined;

#define __lnc__f446
/// __lnc__f446()
if (live_enabled) {
	window_mouse_set(argument0,argument1);
}

#define __lnc__f447
/// __lnc__f447()->Any
if (live_enabled) {
	return window_view_mouse_get_x(argument0);
} else return undefined;

#define __lnc__f448
/// __lnc__f448()->Any
if (live_enabled) {
	return window_view_mouse_get_y(argument0);
} else return undefined;

#define __lnc__f449
/// __lnc__f449()->Any
if (live_enabled) {
	return window_views_mouse_get_x();
} else return undefined;

#define __lnc__f450
/// __lnc__f450()->Any
if (live_enabled) {
	return window_views_mouse_get_y();
} else return undefined;

#define __lnc__f451
/// __lnc__f451()
if (live_enabled) {
	audio_listener_position(argument0,argument1,argument2);
}

#define __lnc__f452
/// __lnc__f452()
if (live_enabled) {
	audio_listener_velocity(argument0,argument1,argument2);
}

#define __lnc__f453
/// __lnc__f453()
if (live_enabled) {
	audio_listener_orientation(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f454
/// __lnc__f454()
if (live_enabled) {
	audio_emitter_position(argument0,argument1,argument2,argument3);
}

#define __lnc__f455
/// __lnc__f455()->Any
if (live_enabled) {
	return audio_emitter_create();
} else return undefined;

#define __lnc__f456
/// __lnc__f456()
if (live_enabled) {
	audio_emitter_free(argument0);
}

#define __lnc__f457
/// __lnc__f457()->Any
if (live_enabled) {
	return audio_emitter_exists(argument0);
} else return undefined;

#define __lnc__f458
/// __lnc__f458()
if (live_enabled) {
	audio_emitter_pitch(argument0,argument1);
}

#define __lnc__f459
/// __lnc__f459()
if (live_enabled) {
	audio_emitter_velocity(argument0,argument1,argument2,argument3);
}

#define __lnc__f460
/// __lnc__f460()
if (live_enabled) {
	audio_emitter_falloff(argument0,argument1,argument2,argument3);
}

#define __lnc__f461
/// __lnc__f461()
if (live_enabled) {
	audio_emitter_gain(argument0,argument1);
}

#define __lnc__f462
/// __lnc__f462()->Any
if (live_enabled) {
	return audio_play_sound(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f463
/// __lnc__f463()->Any
if (live_enabled) {
	return audio_play_sound_on(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f464
/// __lnc__f464()->Any
if (live_enabled) {
	return audio_play_sound_at(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f465
/// __lnc__f465()
if (live_enabled) {
	audio_stop_sound(argument0);
}

#define __lnc__f466
/// __lnc__f466()
if (live_enabled) {
	audio_resume_sound(argument0);
}

#define __lnc__f467
/// __lnc__f467()
if (live_enabled) {
	audio_pause_sound(argument0);
}

#define __lnc__f468
/// __lnc__f468()
if (live_enabled) {
	audio_channel_num(argument0);
}

#define __lnc__f469
/// __lnc__f469()->Any
if (live_enabled) {
	return audio_sound_length(argument0);
} else return undefined;

#define __lnc__f470
/// __lnc__f470()->Any
if (live_enabled) {
	return audio_get_type(argument0);
} else return undefined;

#define __lnc__f471
/// __lnc__f471()
if (live_enabled) {
	audio_falloff_set_model(argument0);
}

#define __lnc__f472
/// __lnc__f472()
if (live_enabled) {
	audio_master_gain(argument0);
}

#define __lnc__f473
/// __lnc__f473()
if (live_enabled) {
	audio_sound_gain(argument0,argument1,argument2);
}

#define __lnc__f474
/// __lnc__f474()
if (live_enabled) {
	audio_sound_pitch(argument0,argument1);
}

#define __lnc__f475
/// __lnc__f475()
if (live_enabled) {
	audio_stop_all();
}

#define __lnc__f476
/// __lnc__f476()
if (live_enabled) {
	audio_resume_all();
}

#define __lnc__f477
/// __lnc__f477()
if (live_enabled) {
	audio_pause_all();
}

#define __lnc__f478
/// __lnc__f478()->Any
if (live_enabled) {
	return audio_is_playing(argument0);
} else return undefined;

#define __lnc__f479
/// __lnc__f479()->Any
if (live_enabled) {
	return audio_is_paused(argument0);
} else return undefined;

#define __lnc__f480
/// __lnc__f480()->Any
if (live_enabled) {
	return audio_exists(argument0);
} else return undefined;

#define __lnc__f481
/// __lnc__f481()->Any
if (live_enabled) {
	return audio_emitter_get_gain(argument0);
} else return undefined;

#define __lnc__f482
/// __lnc__f482()->Any
if (live_enabled) {
	return audio_emitter_get_pitch(argument0);
} else return undefined;

#define __lnc__f483
/// __lnc__f483()->Any
if (live_enabled) {
	return audio_emitter_get_x(argument0);
} else return undefined;

#define __lnc__f484
/// __lnc__f484()->Any
if (live_enabled) {
	return audio_emitter_get_y(argument0);
} else return undefined;

#define __lnc__f485
/// __lnc__f485()->Any
if (live_enabled) {
	return audio_emitter_get_z(argument0);
} else return undefined;

#define __lnc__f486
/// __lnc__f486()->Any
if (live_enabled) {
	return audio_emitter_get_vx(argument0);
} else return undefined;

#define __lnc__f487
/// __lnc__f487()->Any
if (live_enabled) {
	return audio_emitter_get_vy(argument0);
} else return undefined;

#define __lnc__f488
/// __lnc__f488()->Any
if (live_enabled) {
	return audio_emitter_get_vz(argument0);
} else return undefined;

#define __lnc__f489
/// __lnc__f489()
if (live_enabled) {
	audio_listener_set_position(argument0,argument1,argument2,argument3);
}

#define __lnc__f490
/// __lnc__f490()
if (live_enabled) {
	audio_listener_set_velocity(argument0,argument1,argument2,argument3);
}

#define __lnc__f491
/// __lnc__f491()
if (live_enabled) {
	audio_listener_set_orientation(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f492
/// __lnc__f492()->Any
if (live_enabled) {
	return audio_listener_get_data(argument0);
} else return undefined;

#define __lnc__f493
/// __lnc__f493()
if (live_enabled) {
	audio_set_master_gain(argument0,argument1);
}

#define __lnc__f494
/// __lnc__f494()->Any
if (live_enabled) {
	return audio_get_master_gain(argument0);
} else return undefined;

#define __lnc__f495
/// __lnc__f495()->Any
if (live_enabled) {
	return audio_sound_get_gain(argument0);
} else return undefined;

#define __lnc__f496
/// __lnc__f496()->Any
if (live_enabled) {
	return audio_sound_get_pitch(argument0);
} else return undefined;

#define __lnc__f497
/// __lnc__f497()->Any
if (live_enabled) {
	return audio_get_name(argument0);
} else return undefined;

#define __lnc__f498
/// __lnc__f498()
if (live_enabled) {
	audio_sound_set_track_position(argument0,argument1);
}

#define __lnc__f499
/// __lnc__f499()->Any
if (live_enabled) {
	return audio_sound_get_track_position(argument0);
} else return undefined;

#define __lnc__f500
/// __lnc__f500()->Any
if (live_enabled) {
	return audio_create_stream(argument0);
} else return undefined;

#define __lnc__f501
/// __lnc__f501()
if (live_enabled) {
	audio_destroy_stream(argument0);
}

#define __lnc__f502
/// __lnc__f502()->Any
if (live_enabled) {
	return audio_create_sync_group(argument0);
} else return undefined;

#define __lnc__f503
/// __lnc__f503()
if (live_enabled) {
	audio_destroy_sync_group(argument0);
}

#define __lnc__f504
/// __lnc__f504()->Any
if (live_enabled) {
	return audio_play_in_sync_group(argument0,argument1);
} else return undefined;

#define __lnc__f505
/// __lnc__f505()
if (live_enabled) {
	audio_start_sync_group(argument0);
}

#define __lnc__f506
/// __lnc__f506()
if (live_enabled) {
	audio_stop_sync_group(argument0);
}

#define __lnc__f507
/// __lnc__f507()
if (live_enabled) {
	audio_pause_sync_group(argument0);
}

#define __lnc__f508
/// __lnc__f508()
if (live_enabled) {
	audio_resume_sync_group(argument0);
}

#define __lnc__f509
/// __lnc__f509()->Any
if (live_enabled) {
	return audio_sync_group_get_track_pos(argument0);
} else return undefined;

#define __lnc__f510
/// __lnc__f510()
if (live_enabled) {
	audio_sync_group_debug(argument0);
}

#define __lnc__f511
/// __lnc__f511()->Any
if (live_enabled) {
	return audio_sync_group_is_playing(argument0);
} else return undefined;

#define __lnc__f512
/// __lnc__f512()
if (live_enabled) {
	audio_debug(argument0);
}

#define __lnc__f513
/// __lnc__f513()->Any
if (live_enabled) {
	return audio_group_load(argument0);
} else return undefined;

#define __lnc__f514
/// __lnc__f514()
if (live_enabled) {
	audio_group_unload(argument0);
}

#define __lnc__f515
/// __lnc__f515()->Any
if (live_enabled) {
	return audio_group_is_loaded(argument0);
} else return undefined;

#define __lnc__f516
/// __lnc__f516()->Any
if (live_enabled) {
	return audio_group_load_progress(argument0);
} else return undefined;

#define __lnc__f517
/// __lnc__f517()->Any
if (live_enabled) {
	return audio_group_name(argument0);
} else return undefined;

#define __lnc__f518
/// __lnc__f518()
if (live_enabled) {
	audio_group_stop_all(argument0);
}

#define __lnc__f519
/// __lnc__f519()
if (live_enabled) {
	audio_group_set_gain(argument0,argument1,argument2);
}

#define __lnc__f520
/// __lnc__f520()->Any
if (live_enabled) {
	return audio_create_buffer_sound(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f521
/// __lnc__f521()
if (live_enabled) {
	audio_free_buffer_sound(argument0);
}

#define __lnc__f522
/// __lnc__f522()->Any
if (live_enabled) {
	return audio_create_play_queue(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f523
/// __lnc__f523()
if (live_enabled) {
	audio_free_play_queue(argument0);
}

#define __lnc__f524
/// __lnc__f524()
if (live_enabled) {
	audio_queue_sound(argument0,argument1,argument2,argument3);
}

#define __lnc__f525
/// __lnc__f525()->Any
if (live_enabled) {
	return audio_get_recorder_count();
} else return undefined;

#define __lnc__f526
/// __lnc__f526()->Any
if (live_enabled) {
	return audio_get_recorder_info(argument0);
} else return undefined;

#define __lnc__f527
/// __lnc__f527()->Any
if (live_enabled) {
	return audio_start_recording(argument0);
} else return undefined;

#define __lnc__f528
/// __lnc__f528()
if (live_enabled) {
	audio_stop_recording(argument0);
}

#define __lnc__f529
/// __lnc__f529()->Any
if (live_enabled) {
	return audio_sound_get_listener_mask(argument0);
} else return undefined;

#define __lnc__f530
/// __lnc__f530()->Any
if (live_enabled) {
	return audio_emitter_get_listener_mask(argument0);
} else return undefined;

#define __lnc__f531
/// __lnc__f531()->Any
if (live_enabled) {
	return audio_get_listener_mask();
} else return undefined;

#define __lnc__f532
/// __lnc__f532()
if (live_enabled) {
	audio_sound_set_listener_mask(argument0,argument1);
}

#define __lnc__f533
/// __lnc__f533()
if (live_enabled) {
	audio_emitter_set_listener_mask(argument0,argument1);
}

#define __lnc__f534
/// __lnc__f534()
if (live_enabled) {
	audio_set_listener_mask(argument0);
}

#define __lnc__f535
/// __lnc__f535()->Any
if (live_enabled) {
	return audio_get_listener_count();
} else return undefined;

#define __lnc__f536
/// __lnc__f536()->Any
if (live_enabled) {
	return audio_get_listener_info(argument0);
} else return undefined;

#define __lnc__f537
/// __lnc__f537()
if (live_enabled) {
	show_message(argument0);
}

#define __lnc__f538
/// __lnc__f538()
if (live_enabled) {
	show_message_async(argument0);
}

#define __lnc__f539
/// __lnc__f539()->Any
if (live_enabled) {
	return clickable_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f540
/// __lnc__f540()->Any
if (live_enabled) {
	return clickable_add_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f541
/// __lnc__f541()
if (live_enabled) {
	clickable_change(argument0,argument1,argument2,argument3);
}

#define __lnc__f542
/// __lnc__f542()
if (live_enabled) {
	clickable_change_ext(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f543
/// __lnc__f543()
if (live_enabled) {
	clickable_delete(argument0);
}

#define __lnc__f544
/// __lnc__f544()->Any
if (live_enabled) {
	return clickable_exists(argument0);
} else return undefined;

#define __lnc__f545
/// __lnc__f545()
if (live_enabled) {
	clickable_set_style(argument0,argument1);
}

#define __lnc__f546
/// __lnc__f546()->Any
if (live_enabled) {
	return show_question(argument0);
} else return undefined;

#define __lnc__f547
/// __lnc__f547()->Any
if (live_enabled) {
	return show_question_async(argument0);
} else return undefined;

#define __lnc__f548
/// __lnc__f548()->Any
if (live_enabled) {
	return get_integer(argument0,argument1);
} else return undefined;

#define __lnc__f549
/// __lnc__f549()->Any
if (live_enabled) {
	return get_string(argument0,argument1);
} else return undefined;

#define __lnc__f550
/// __lnc__f550()->Any
if (live_enabled) {
	return get_integer_async(argument0,argument1);
} else return undefined;

#define __lnc__f551
/// __lnc__f551()->Any
if (live_enabled) {
	return get_string_async(argument0,argument1);
} else return undefined;

#define __lnc__f552
/// __lnc__f552()->Any
if (live_enabled) {
	return get_login_async(argument0,argument1);
} else return undefined;

#define __lnc__f553
/// __lnc__f553()->Any
if (live_enabled) {
	return get_open_filename(argument0,argument1);
} else return undefined;

#define __lnc__f554
/// __lnc__f554()->Any
if (live_enabled) {
	return get_save_filename(argument0,argument1);
} else return undefined;

#define __lnc__f555
/// __lnc__f555()->Any
if (live_enabled) {
	return get_open_filename_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f556
/// __lnc__f556()->Any
if (live_enabled) {
	return get_save_filename_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f557
/// __lnc__f557()
if (live_enabled) {
	show_error(argument0,argument1);
}

#define __lnc__f558
/// __lnc__f558()
if (live_enabled) {
	highscore_clear();
}

#define __lnc__f559
/// __lnc__f559()
if (live_enabled) {
	highscore_add(argument0,argument1);
}

#define __lnc__f560
/// __lnc__f560()->Any
if (live_enabled) {
	return highscore_value(argument0);
} else return undefined;

#define __lnc__f561
/// __lnc__f561()->Any
if (live_enabled) {
	return highscore_name(argument0);
} else return undefined;

#define __lnc__f562
/// __lnc__f562()
if (live_enabled) {
	draw_highscore(argument0,argument1,argument2,argument3);
}

#define __lnc__f563
/// __lnc__f563()->Any
if (live_enabled) {
	return sprite_exists(argument0);
} else return undefined;

#define __lnc__f564
/// __lnc__f564()->Any
if (live_enabled) {
	return sprite_get_name(argument0);
} else return undefined;

#define __lnc__f565
/// __lnc__f565()->Any
if (live_enabled) {
	return sprite_get_number(argument0);
} else return undefined;

#define __lnc__f566
/// __lnc__f566()->Any
if (live_enabled) {
	return sprite_get_width(argument0);
} else return undefined;

#define __lnc__f567
/// __lnc__f567()->Any
if (live_enabled) {
	return sprite_get_height(argument0);
} else return undefined;

#define __lnc__f568
/// __lnc__f568()->Any
if (live_enabled) {
	return sprite_get_xoffset(argument0);
} else return undefined;

#define __lnc__f569
/// __lnc__f569()->Any
if (live_enabled) {
	return sprite_get_yoffset(argument0);
} else return undefined;

#define __lnc__f570
/// __lnc__f570()->Any
if (live_enabled) {
	return sprite_get_bbox_left(argument0);
} else return undefined;

#define __lnc__f571
/// __lnc__f571()->Any
if (live_enabled) {
	return sprite_get_bbox_right(argument0);
} else return undefined;

#define __lnc__f572
/// __lnc__f572()->Any
if (live_enabled) {
	return sprite_get_bbox_top(argument0);
} else return undefined;

#define __lnc__f573
/// __lnc__f573()->Any
if (live_enabled) {
	return sprite_get_bbox_bottom(argument0);
} else return undefined;

#define __lnc__f574
/// __lnc__f574()
if (live_enabled) {
	sprite_save(argument0,argument1,argument2);
}

#define __lnc__f575
/// __lnc__f575()
if (live_enabled) {
	sprite_save_strip(argument0,argument1);
}

#define __lnc__f576
/// __lnc__f576()
if (live_enabled) {
	sprite_set_cache_size(argument0,argument1);
}

#define __lnc__f577
/// __lnc__f577()
if (live_enabled) {
	sprite_set_cache_size_ext(argument0,argument1,argument2);
}

#define __lnc__f578
/// __lnc__f578()->Any
if (live_enabled) {
	return sprite_get_tpe(argument0,argument1);
} else return undefined;

#define __lnc__f579
/// __lnc__f579()
if (live_enabled) {
	sprite_prefetch(argument0);
}

#define __lnc__f580
/// __lnc__f580()
if (live_enabled) {
	sprite_prefetch_multi(argument0);
}

#define __lnc__f581
/// __lnc__f581()
if (live_enabled) {
	sprite_flush(argument0);
}

#define __lnc__f582
/// __lnc__f582()
if (live_enabled) {
	sprite_flush_multi(argument0);
}

#define __lnc__f583
/// __lnc__f583()
if (live_enabled) {
	sprite_set_speed(argument0,argument1,argument2);
}

#define __lnc__f584
/// __lnc__f584()->Any
if (live_enabled) {
	return sprite_get_speed_type(argument0);
} else return undefined;

#define __lnc__f585
/// __lnc__f585()->Any
if (live_enabled) {
	return sprite_get_speed(argument0);
} else return undefined;

#define __lnc__f586
/// __lnc__f586()->Any
if (live_enabled) {
	return font_exists(argument0);
} else return undefined;

#define __lnc__f587
/// __lnc__f587()->Any
if (live_enabled) {
	return font_get_name(argument0);
} else return undefined;

#define __lnc__f588
/// __lnc__f588()->Any
if (live_enabled) {
	return font_get_fontname(argument0);
} else return undefined;

#define __lnc__f589
/// __lnc__f589()->Any
if (live_enabled) {
	return font_get_bold(argument0);
} else return undefined;

#define __lnc__f590
/// __lnc__f590()->Any
if (live_enabled) {
	return font_get_italic(argument0);
} else return undefined;

#define __lnc__f591
/// __lnc__f591()->Any
if (live_enabled) {
	return font_get_first(argument0);
} else return undefined;

#define __lnc__f592
/// __lnc__f592()->Any
if (live_enabled) {
	return font_get_last(argument0);
} else return undefined;

#define __lnc__f593
/// __lnc__f593()->Any
if (live_enabled) {
	return font_get_size(argument0);
} else return undefined;

#define __lnc__f594
/// __lnc__f594()
if (live_enabled) {
	font_set_cache_size(argument0,argument1);
}

#define __lnc__f595
/// __lnc__f595()->Any
if (live_enabled) {
	return path_exists(argument0);
} else return undefined;

#define __lnc__f596
/// __lnc__f596()->Any
if (live_enabled) {
	return path_get_name(argument0);
} else return undefined;

#define __lnc__f597
/// __lnc__f597()->Any
if (live_enabled) {
	return path_get_length(argument0);
} else return undefined;

#define __lnc__f598
/// __lnc__f598()->Any
if (live_enabled) {
	return path_get_time(argument0,argument1);
} else return undefined;

#define __lnc__f599
/// __lnc__f599()->Any
if (live_enabled) {
	return path_get_kind(argument0);
} else return undefined;

#define __lnc__f600
/// __lnc__f600()->Any
if (live_enabled) {
	return path_get_closed(argument0);
} else return undefined;

#define __lnc__f601
/// __lnc__f601()->Any
if (live_enabled) {
	return path_get_precision(argument0);
} else return undefined;

#define __lnc__f602
/// __lnc__f602()->Any
if (live_enabled) {
	return path_get_number(argument0);
} else return undefined;

#define __lnc__f603
/// __lnc__f603()->Any
if (live_enabled) {
	return path_get_point_x(argument0,argument1);
} else return undefined;

#define __lnc__f604
/// __lnc__f604()->Any
if (live_enabled) {
	return path_get_point_y(argument0,argument1);
} else return undefined;

#define __lnc__f605
/// __lnc__f605()->Any
if (live_enabled) {
	return path_get_point_speed(argument0,argument1);
} else return undefined;

#define __lnc__f606
/// __lnc__f606()->Any
if (live_enabled) {
	return path_get_x(argument0,argument1);
} else return undefined;

#define __lnc__f607
/// __lnc__f607()->Any
if (live_enabled) {
	return path_get_y(argument0,argument1);
} else return undefined;

#define __lnc__f608
/// __lnc__f608()->Any
if (live_enabled) {
	return path_get_speed(argument0,argument1);
} else return undefined;

#define __lnc__f609
/// __lnc__f609()->Any
if (live_enabled) {
	return script_exists(argument0);
} else return undefined;

#define __lnc__f610
/// __lnc__f610()->Any
if (live_enabled) {
	return script_get_name(argument0);
} else return undefined;

#define __lnc__f611
/// __lnc__f611()->Any
if (live_enabled) {
	return timeline_add();
} else return undefined;

#define __lnc__f612
/// __lnc__f612()
if (live_enabled) {
	timeline_delete(argument0);
}

#define __lnc__f613
/// __lnc__f613()
if (live_enabled) {
	timeline_clear(argument0);
}

#define __lnc__f614
/// __lnc__f614()->Any
if (live_enabled) {
	return timeline_exists(argument0);
} else return undefined;

#define __lnc__f615
/// __lnc__f615()->Any
if (live_enabled) {
	return timeline_get_name(argument0);
} else return undefined;

#define __lnc__f616
/// __lnc__f616()
if (live_enabled) {
	timeline_moment_clear(argument0,argument1);
}

#define __lnc__f617
/// __lnc__f617()
if (live_enabled) {
	timeline_moment_add_script(argument0,argument1,argument2);
}

#define __lnc__f618
/// __lnc__f618()->Any
if (live_enabled) {
	return timeline_size(argument0);
} else return undefined;

#define __lnc__f619
/// __lnc__f619()->Any
if (live_enabled) {
	return timeline_max_moment(argument0);
} else return undefined;

#define __lnc__f620
/// __lnc__f620()->Any
if (live_enabled) {
	return object_exists(argument0);
} else return undefined;

#define __lnc__f621
/// __lnc__f621()->Any
if (live_enabled) {
	return object_get_name(argument0);
} else return undefined;

#define __lnc__f622
/// __lnc__f622()->Any
if (live_enabled) {
	return object_get_sprite(argument0);
} else return undefined;

#define __lnc__f623
/// __lnc__f623()->Any
if (live_enabled) {
	return object_get_solid(argument0);
} else return undefined;

#define __lnc__f624
/// __lnc__f624()->Any
if (live_enabled) {
	return object_get_visible(argument0);
} else return undefined;

#define __lnc__f625
/// __lnc__f625()->Any
if (live_enabled) {
	return object_get_persistent(argument0);
} else return undefined;

#define __lnc__f626
/// __lnc__f626()->Any
if (live_enabled) {
	return object_get_mask(argument0);
} else return undefined;

#define __lnc__f627
/// __lnc__f627()->Any
if (live_enabled) {
	return object_get_parent(argument0);
} else return undefined;

#define __lnc__f628
/// __lnc__f628()->Any
if (live_enabled) {
	return object_get_physics(argument0);
} else return undefined;

#define __lnc__f629
/// __lnc__f629()->Any
if (live_enabled) {
	return object_is_ancestor(argument0,argument1);
} else return undefined;

#define __lnc__f630
/// __lnc__f630()->Any
if (live_enabled) {
	return room_exists(argument0);
} else return undefined;

#define __lnc__f631
/// __lnc__f631()->Any
if (live_enabled) {
	return room_get_name(argument0);
} else return undefined;

#define __lnc__f632
/// __lnc__f632()
if (live_enabled) {
	sprite_set_offset(argument0,argument1,argument2);
}

#define __lnc__f633
/// __lnc__f633()->Any
if (live_enabled) {
	return sprite_duplicate(argument0);
} else return undefined;

#define __lnc__f634
/// __lnc__f634()
if (live_enabled) {
	sprite_assign(argument0,argument1);
}

#define __lnc__f635
/// __lnc__f635()
if (live_enabled) {
	sprite_merge(argument0,argument1);
}

#define __lnc__f636
/// __lnc__f636()->Any
if (live_enabled) {
	return sprite_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f637
/// __lnc__f637()
if (live_enabled) {
	sprite_replace(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f638
/// __lnc__f638()->Any
if (live_enabled) {
	return sprite_create_from_surface(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f639
/// __lnc__f639()->Any
if (live_enabled) {
	return sprite_add_from_surface(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f640
/// __lnc__f640()
if (live_enabled) {
	sprite_delete(argument0);
}

#define __lnc__f641
/// __lnc__f641()
if (live_enabled) {
	sprite_set_alpha_from_sprite(argument0,argument1);
}

#define __lnc__f642
/// __lnc__f642()
if (live_enabled) {
	sprite_collision_mask(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f643
/// __lnc__f643()->Any
if (live_enabled) {
	return font_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f644
/// __lnc__f644()->Any
if (live_enabled) {
	return font_add_sprite(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f645
/// __lnc__f645()->Any
if (live_enabled) {
	return font_add_sprite_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f646
/// __lnc__f646()
if (live_enabled) {
	font_replace_sprite(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f647
/// __lnc__f647()
if (live_enabled) {
	font_replace_sprite_ext(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f648
/// __lnc__f648()
if (live_enabled) {
	font_delete(argument0);
}

#define __lnc__f649
/// __lnc__f649()
if (live_enabled) {
	path_set_kind(argument0,argument1);
}

#define __lnc__f650
/// __lnc__f650()
if (live_enabled) {
	path_set_closed(argument0,argument1);
}

#define __lnc__f651
/// __lnc__f651()
if (live_enabled) {
	path_set_precision(argument0,argument1);
}

#define __lnc__f652
/// __lnc__f652()->Any
if (live_enabled) {
	return path_add();
} else return undefined;

#define __lnc__f653
/// __lnc__f653()
if (live_enabled) {
	path_assign(argument0,argument1);
}

#define __lnc__f654
/// __lnc__f654()->Any
if (live_enabled) {
	return path_duplicate(argument0);
} else return undefined;

#define __lnc__f655
/// __lnc__f655()
if (live_enabled) {
	path_append(argument0,argument1);
}

#define __lnc__f656
/// __lnc__f656()
if (live_enabled) {
	path_delete(argument0);
}

#define __lnc__f657
/// __lnc__f657()
if (live_enabled) {
	path_add_point(argument0,argument1,argument2,argument3);
}

#define __lnc__f658
/// __lnc__f658()
if (live_enabled) {
	path_insert_point(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f659
/// __lnc__f659()
if (live_enabled) {
	path_change_point(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f660
/// __lnc__f660()
if (live_enabled) {
	path_delete_point(argument0,argument1);
}

#define __lnc__f661
/// __lnc__f661()
if (live_enabled) {
	path_clear_points(argument0);
}

#define __lnc__f662
/// __lnc__f662()
if (live_enabled) {
	path_reverse(argument0);
}

#define __lnc__f663
/// __lnc__f663()
if (live_enabled) {
	path_mirror(argument0);
}

#define __lnc__f664
/// __lnc__f664()
if (live_enabled) {
	path_flip(argument0);
}

#define __lnc__f665
/// __lnc__f665()
if (live_enabled) {
	path_rotate(argument0,argument1);
}

#define __lnc__f666
/// __lnc__f666()
if (live_enabled) {
	path_rescale(argument0,argument1,argument2);
}

#define __lnc__f667
/// __lnc__f667()
if (live_enabled) {
	path_shift(argument0,argument1,argument2);
}

#define __lnc__f668
/// __lnc__f668()
if (live_enabled) {
	object_set_sprite(argument0,argument1);
}

#define __lnc__f669
/// __lnc__f669()
if (live_enabled) {
	object_set_solid(argument0,argument1);
}

#define __lnc__f670
/// __lnc__f670()
if (live_enabled) {
	object_set_visible(argument0,argument1);
}

#define __lnc__f671
/// __lnc__f671()
if (live_enabled) {
	object_set_persistent(argument0,argument1);
}

#define __lnc__f672
/// __lnc__f672()
if (live_enabled) {
	object_set_mask(argument0,argument1);
}

#define __lnc__f673
/// __lnc__f673()
if (live_enabled) {
	room_set_width(argument0,argument1);
}

#define __lnc__f674
/// __lnc__f674()
if (live_enabled) {
	room_set_height(argument0,argument1);
}

#define __lnc__f675
/// __lnc__f675()
if (live_enabled) {
	room_set_persistent(argument0,argument1);
}

#define __lnc__f676
/// __lnc__f676()
if (live_enabled) {
	room_set_background_colour(argument0,argument1,argument2);
}

#define __lnc__f677
/// __lnc__f677()
if (live_enabled) {
	room_set_background_color(argument0,argument1,argument2);
}

#define __lnc__f678
/// __lnc__f678()
if (live_enabled) {
	room_set_viewport(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f679
/// __lnc__f679()->Any
if (live_enabled) {
	return room_get_viewport(argument0,argument1);
} else return undefined;

#define __lnc__f680
/// __lnc__f680()
if (live_enabled) {
	room_set_view_enabled(argument0,argument1);
}

#define __lnc__f681
/// __lnc__f681()->Any
if (live_enabled) {
	return room_add();
} else return undefined;

#define __lnc__f682
/// __lnc__f682()->Any
if (live_enabled) {
	return room_duplicate(argument0);
} else return undefined;

#define __lnc__f683
/// __lnc__f683()
if (live_enabled) {
	room_assign(argument0,argument1);
}

#define __lnc__f684
/// __lnc__f684()->Any
if (live_enabled) {
	return room_instance_add(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f685
/// __lnc__f685()
if (live_enabled) {
	room_instance_clear(argument0);
}

#define __lnc__f686
/// __lnc__f686()->Any
if (live_enabled) {
	return room_get_camera(argument0,argument1);
} else return undefined;

#define __lnc__f687
/// __lnc__f687()
if (live_enabled) {
	room_set_camera(argument0,argument1,argument2);
}

#define __lnc__f688
/// __lnc__f688()->Any
if (live_enabled) {
	return asset_get_index(argument0);
} else return undefined;

#define __lnc__f689
/// __lnc__f689()->Any
if (live_enabled) {
	return asset_get_type(argument0);
} else return undefined;

#define __lnc__f690
/// __lnc__f690()->Any
if (live_enabled) {
	return file_text_open_from_string(argument0);
} else return undefined;

#define __lnc__f691
/// __lnc__f691()->Any
if (live_enabled) {
	return file_text_open_read(argument0);
} else return undefined;

#define __lnc__f692
/// __lnc__f692()->Any
if (live_enabled) {
	return file_text_open_write(argument0);
} else return undefined;

#define __lnc__f693
/// __lnc__f693()->Any
if (live_enabled) {
	return file_text_open_append(argument0);
} else return undefined;

#define __lnc__f694
/// __lnc__f694()
if (live_enabled) {
	file_text_close(argument0);
}

#define __lnc__f695
/// __lnc__f695()
if (live_enabled) {
	file_text_write_string(argument0,argument1);
}

#define __lnc__f696
/// __lnc__f696()
if (live_enabled) {
	file_text_write_real(argument0,argument1);
}

#define __lnc__f697
/// __lnc__f697()
if (live_enabled) {
	file_text_writeln(argument0);
}

#define __lnc__f698
/// __lnc__f698()->Any
if (live_enabled) {
	return file_text_read_string(argument0);
} else return undefined;

#define __lnc__f699
/// __lnc__f699()->Any
if (live_enabled) {
	return file_text_read_real(argument0);
} else return undefined;

#define __lnc__f700
/// __lnc__f700()->Any
if (live_enabled) {
	return file_text_readln(argument0);
} else return undefined;

#define __lnc__f701
/// __lnc__f701()->Any
if (live_enabled) {
	return file_text_eof(argument0);
} else return undefined;

#define __lnc__f702
/// __lnc__f702()->Any
if (live_enabled) {
	return file_text_eoln(argument0);
} else return undefined;

#define __lnc__f703
/// __lnc__f703()->Any
if (live_enabled) {
	return file_exists(argument0);
} else return undefined;

#define __lnc__f704
/// __lnc__f704()
if (live_enabled) {
	file_delete(argument0);
}

#define __lnc__f705
/// __lnc__f705()
if (live_enabled) {
	file_rename(argument0,argument1);
}

#define __lnc__f706
/// __lnc__f706()
if (live_enabled) {
	file_copy(argument0,argument1);
}

#define __lnc__f707
/// __lnc__f707()->Any
if (live_enabled) {
	return directory_exists(argument0);
} else return undefined;

#define __lnc__f708
/// __lnc__f708()->Any
if (live_enabled) {
	return directory_create(argument0);
} else return undefined;

#define __lnc__f709
/// __lnc__f709()
if (live_enabled) {
	directory_destroy(argument0);
}

#define __lnc__f710
/// __lnc__f710()->Any
if (live_enabled) {
	return file_find_first(argument0,argument1);
} else return undefined;

#define __lnc__f711
/// __lnc__f711()->Any
if (live_enabled) {
	return file_find_next();
} else return undefined;

#define __lnc__f712
/// __lnc__f712()->Any
if (live_enabled) {
	return file_find_close();
} else return undefined;

#define __lnc__f713
/// __lnc__f713()->Any
if (live_enabled) {
	return file_attributes(argument0,argument1);
} else return undefined;

#define __lnc__f714
/// __lnc__f714()->Any
if (live_enabled) {
	return filename_name(argument0);
} else return undefined;

#define __lnc__f715
/// __lnc__f715()->Any
if (live_enabled) {
	return filename_path(argument0);
} else return undefined;

#define __lnc__f716
/// __lnc__f716()->Any
if (live_enabled) {
	return filename_dir(argument0);
} else return undefined;

#define __lnc__f717
/// __lnc__f717()->Any
if (live_enabled) {
	return filename_drive(argument0);
} else return undefined;

#define __lnc__f718
/// __lnc__f718()->Any
if (live_enabled) {
	return filename_ext(argument0);
} else return undefined;

#define __lnc__f719
/// __lnc__f719()->Any
if (live_enabled) {
	return filename_change_ext(argument0,argument1);
} else return undefined;

#define __lnc__f720
/// __lnc__f720()->Any
if (live_enabled) {
	return file_bin_open(argument0,argument1);
} else return undefined;

#define __lnc__f721
/// __lnc__f721()
if (live_enabled) {
	file_bin_rewrite(argument0);
}

#define __lnc__f722
/// __lnc__f722()
if (live_enabled) {
	file_bin_close(argument0);
}

#define __lnc__f723
/// __lnc__f723()->Any
if (live_enabled) {
	return file_bin_position(argument0);
} else return undefined;

#define __lnc__f724
/// __lnc__f724()->Any
if (live_enabled) {
	return file_bin_size(argument0);
} else return undefined;

#define __lnc__f725
/// __lnc__f725()
if (live_enabled) {
	file_bin_seek(argument0,argument1);
}

#define __lnc__f726
/// __lnc__f726()
if (live_enabled) {
	file_bin_write_byte(argument0,argument1);
}

#define __lnc__f727
/// __lnc__f727()->Any
if (live_enabled) {
	return file_bin_read_byte(argument0);
} else return undefined;

#define __lnc__f728
/// __lnc__f728()->Any
if (live_enabled) {
	return parameter_count();
} else return undefined;

#define __lnc__f729
/// __lnc__f729()->Any
if (live_enabled) {
	return parameter_string(argument0);
} else return undefined;

#define __lnc__f730
/// __lnc__f730()->Any
if (live_enabled) {
	return environment_get_variable(argument0);
} else return undefined;

#define __lnc__f731
/// __lnc__f731()
if (live_enabled) {
	ini_open_from_string(argument0);
}

#define __lnc__f732
/// __lnc__f732()
if (live_enabled) {
	ini_open(argument0);
}

#define __lnc__f733
/// __lnc__f733()->Any
if (live_enabled) {
	return ini_close();
} else return undefined;

#define __lnc__f734
/// __lnc__f734()->Any
if (live_enabled) {
	return ini_read_string(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f735
/// __lnc__f735()->Any
if (live_enabled) {
	return ini_read_real(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f736
/// __lnc__f736()
if (live_enabled) {
	ini_write_string(argument0,argument1,argument2);
}

#define __lnc__f737
/// __lnc__f737()
if (live_enabled) {
	ini_write_real(argument0,argument1,argument2);
}

#define __lnc__f738
/// __lnc__f738()->Any
if (live_enabled) {
	return ini_key_exists(argument0,argument1);
} else return undefined;

#define __lnc__f739
/// __lnc__f739()->Any
if (live_enabled) {
	return ini_section_exists(argument0);
} else return undefined;

#define __lnc__f740
/// __lnc__f740()
if (live_enabled) {
	ini_key_delete(argument0,argument1);
}

#define __lnc__f741
/// __lnc__f741()
if (live_enabled) {
	ini_section_delete(argument0);
}

#define __lnc__f742
/// __lnc__f742()
if (live_enabled) {
	ds_set_precision(argument0);
}

#define __lnc__f743
/// __lnc__f743()->Any
if (live_enabled) {
	return ds_exists(argument0,argument1);
} else return undefined;

#define __lnc__f744
/// __lnc__f744()->Any
if (live_enabled) {
	return ds_stack_create();
} else return undefined;

#define __lnc__f745
/// __lnc__f745()
if (live_enabled) {
	ds_stack_destroy(argument0);
}

#define __lnc__f746
/// __lnc__f746()
if (live_enabled) {
	ds_stack_clear(argument0);
}

#define __lnc__f747
/// __lnc__f747()
if (live_enabled) {
	ds_stack_copy(argument0,argument1);
}

#define __lnc__f748
/// __lnc__f748()->Any
if (live_enabled) {
	return ds_stack_size(argument0);
} else return undefined;

#define __lnc__f749
/// __lnc__f749()
if (live_enabled) {
	ds_stack_empty(argument0);
}

#define __lnc__f750
/// __lnc__f750()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_stack_push needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_stack_push(argument[0],argument[1]);break;
		case 3:ds_stack_push(argument[0],argument[1],argument[2]);break;
		case 4:ds_stack_push(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f751
/// __lnc__f751()
if (live_enabled) {
	ds_stack_pop(argument0);
}

#define __lnc__f752
/// __lnc__f752()->Any
if (live_enabled) {
	return ds_stack_top(argument0);
} else return undefined;

#define __lnc__f753
/// __lnc__f753()->Any
if (live_enabled) {
	return ds_stack_write(argument0);
} else return undefined;

#define __lnc__f754
/// __lnc__f754()->Any
if (live_enabled) {
	return ds_stack_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f755
/// __lnc__f755()->Any
if (live_enabled) {
	return ds_queue_create();
} else return undefined;

#define __lnc__f756
/// __lnc__f756()
if (live_enabled) {
	ds_queue_destroy(argument0);
}

#define __lnc__f757
/// __lnc__f757()
if (live_enabled) {
	ds_queue_clear(argument0);
}

#define __lnc__f758
/// __lnc__f758()
if (live_enabled) {
	ds_queue_copy(argument0,argument1);
}

#define __lnc__f759
/// __lnc__f759()->Any
if (live_enabled) {
	return ds_queue_size(argument0);
} else return undefined;

#define __lnc__f760
/// __lnc__f760()->Any
if (live_enabled) {
	return ds_queue_empty(argument0);
} else return undefined;

#define __lnc__f761
/// __lnc__f761()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_queue_enqueue needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_queue_enqueue(argument[0],argument[1]);break;
		case 3:ds_queue_enqueue(argument[0],argument[1],argument[2]);break;
		case 4:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f762
/// __lnc__f762()
if (live_enabled) {
	ds_queue_dequeue(argument0);
}

#define __lnc__f763
/// __lnc__f763()->Any
if (live_enabled) {
	return ds_queue_head(argument0);
} else return undefined;

#define __lnc__f764
/// __lnc__f764()->Any
if (live_enabled) {
	return ds_queue_tail(argument0);
} else return undefined;

#define __lnc__f765
/// __lnc__f765()->Any
if (live_enabled) {
	return ds_queue_write(argument0);
} else return undefined;

#define __lnc__f766
/// __lnc__f766()->Any
if (live_enabled) {
	return ds_queue_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f767
/// __lnc__f767()->Any
if (live_enabled) {
	return ds_list_create();
} else return undefined;

#define __lnc__f768
/// __lnc__f768()
if (live_enabled) {
	ds_list_destroy(argument0);
}

#define __lnc__f769
/// __lnc__f769()
if (live_enabled) {
	ds_list_clear(argument0);
}

#define __lnc__f770
/// __lnc__f770()
if (live_enabled) {
	ds_list_copy(argument0,argument1);
}

#define __lnc__f771
/// __lnc__f771()->Any
if (live_enabled) {
	return ds_list_size(argument0);
} else return undefined;

#define __lnc__f772
/// __lnc__f772()->Any
if (live_enabled) {
	return ds_list_empty(argument0);
} else return undefined;

#define __lnc__f773
/// __lnc__f773()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_list_add needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_list_add(argument[0],argument[1]);break;
		case 3:ds_list_add(argument[0],argument[1],argument[2]);break;
		case 4:ds_list_add(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f774
/// __lnc__f774()
if (live_enabled) {
	ds_list_insert(argument0,argument1,argument2);
}

#define __lnc__f775
/// __lnc__f775()
if (live_enabled) {
	ds_list_replace(argument0,argument1,argument2);
}

#define __lnc__f776
/// __lnc__f776()
if (live_enabled) {
	ds_list_delete(argument0,argument1);
}

#define __lnc__f777
/// __lnc__f777()->Any
if (live_enabled) {
	return ds_list_find_index(argument0,argument1);
} else return undefined;

#define __lnc__f778
/// __lnc__f778()->Any
if (live_enabled) {
	return ds_list_find_value(argument0,argument1);
} else return undefined;

#define __lnc__f779
/// __lnc__f779()
if (live_enabled) {
	ds_list_mark_as_list(argument0,argument1);
}

#define __lnc__f780
/// __lnc__f780()
if (live_enabled) {
	ds_list_mark_as_map(argument0,argument1);
}

#define __lnc__f781
/// __lnc__f781()
if (live_enabled) {
	ds_list_sort(argument0,argument1);
}

#define __lnc__f782
/// __lnc__f782()
if (live_enabled) {
	ds_list_shuffle(argument0);
}

#define __lnc__f783
/// __lnc__f783()->Any
if (live_enabled) {
	return ds_list_write(argument0);
} else return undefined;

#define __lnc__f784
/// __lnc__f784()->Any
if (live_enabled) {
	return ds_list_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f785
/// __lnc__f785()
if (live_enabled) {
	ds_list_set(argument0,argument1,argument2);
}

#define __lnc__f786
/// __lnc__f786()->Any
if (live_enabled) {
	return ds_map_create();
} else return undefined;

#define __lnc__f787
/// __lnc__f787()
if (live_enabled) {
	ds_map_destroy(argument0);
}

#define __lnc__f788
/// __lnc__f788()
if (live_enabled) {
	ds_map_clear(argument0);
}

#define __lnc__f789
/// __lnc__f789()
if (live_enabled) {
	ds_map_copy(argument0,argument1);
}

#define __lnc__f790
/// __lnc__f790()->Any
if (live_enabled) {
	return ds_map_size(argument0);
} else return undefined;

#define __lnc__f791
/// __lnc__f791()->Any
if (live_enabled) {
	return ds_map_empty(argument0);
} else return undefined;

#define __lnc__f792
/// __lnc__f792()
if (live_enabled) {
	ds_map_add(argument0,argument1,argument2);
}

#define __lnc__f793
/// __lnc__f793()
if (live_enabled) {
	ds_map_add_list(argument0,argument1,argument2);
}

#define __lnc__f794
/// __lnc__f794()
if (live_enabled) {
	ds_map_add_map(argument0,argument1,argument2);
}

#define __lnc__f795
/// __lnc__f795()
if (live_enabled) {
	ds_map_replace(argument0,argument1,argument2);
}

#define __lnc__f796
/// __lnc__f796()
if (live_enabled) {
	ds_map_replace_map(argument0,argument1,argument2);
}

#define __lnc__f797
/// __lnc__f797()
if (live_enabled) {
	ds_map_replace_list(argument0,argument1,argument2);
}

#define __lnc__f798
/// __lnc__f798()
if (live_enabled) {
	ds_map_delete(argument0,argument1);
}

#define __lnc__f799
/// __lnc__f799()->Any
if (live_enabled) {
	return ds_map_exists(argument0,argument1);
} else return undefined;

#define __lnc__f800
/// __lnc__f800()->Any
if (live_enabled) {
	return ds_map_find_value(argument0,argument1);
} else return undefined;

#define __lnc__f801
/// __lnc__f801()->Any
if (live_enabled) {
	return ds_map_find_previous(argument0,argument1);
} else return undefined;

#define __lnc__f802
/// __lnc__f802()->Any
if (live_enabled) {
	return ds_map_find_next(argument0,argument1);
} else return undefined;

#define __lnc__f803
/// __lnc__f803()->Any
if (live_enabled) {
	return ds_map_find_first(argument0);
} else return undefined;

#define __lnc__f804
/// __lnc__f804()->Any
if (live_enabled) {
	return ds_map_find_last(argument0);
} else return undefined;

#define __lnc__f805
/// __lnc__f805()->Any
if (live_enabled) {
	return ds_map_write(argument0);
} else return undefined;

#define __lnc__f806
/// __lnc__f806()->Any
if (live_enabled) {
	return ds_map_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f807
/// __lnc__f807()
if (live_enabled) {
	ds_map_secure_save(argument0,argument1);
}

#define __lnc__f808
/// __lnc__f808()->Any
if (live_enabled) {
	return ds_map_secure_load(argument0);
} else return undefined;

#define __lnc__f809
/// __lnc__f809()->Any
if (live_enabled) {
	return ds_map_secure_load_buffer(argument0);
} else return undefined;

#define __lnc__f810
/// __lnc__f810()
if (live_enabled) {
	ds_map_secure_save_buffer(argument0,argument1);
}

#define __lnc__f811
/// __lnc__f811()
if (live_enabled) {
	ds_map_set(argument0,argument1,argument2);
}

#define __lnc__f812
/// __lnc__f812()->Any
if (live_enabled) {
	return ds_priority_create();
} else return undefined;

#define __lnc__f813
/// __lnc__f813()
if (live_enabled) {
	ds_priority_destroy(argument0);
}

#define __lnc__f814
/// __lnc__f814()
if (live_enabled) {
	ds_priority_clear(argument0);
}

#define __lnc__f815
/// __lnc__f815()
if (live_enabled) {
	ds_priority_copy(argument0,argument1);
}

#define __lnc__f816
/// __lnc__f816()->Any
if (live_enabled) {
	return ds_priority_size(argument0);
} else return undefined;

#define __lnc__f817
/// __lnc__f817()->Any
if (live_enabled) {
	return ds_priority_empty(argument0);
} else return undefined;

#define __lnc__f818
/// __lnc__f818()
if (live_enabled) {
	ds_priority_add(argument0,argument1,argument2);
}

#define __lnc__f819
/// __lnc__f819()
if (live_enabled) {
	ds_priority_change_priority(argument0,argument1,argument2);
}

#define __lnc__f820
/// __lnc__f820()->Any
if (live_enabled) {
	return ds_priority_find_priority(argument0,argument1);
} else return undefined;

#define __lnc__f821
/// __lnc__f821()
if (live_enabled) {
	ds_priority_delete_value(argument0,argument1);
}

#define __lnc__f822
/// __lnc__f822()->Any
if (live_enabled) {
	return ds_priority_delete_min(argument0);
} else return undefined;

#define __lnc__f823
/// __lnc__f823()->Any
if (live_enabled) {
	return ds_priority_find_min(argument0);
} else return undefined;

#define __lnc__f824
/// __lnc__f824()->Any
if (live_enabled) {
	return ds_priority_delete_max(argument0);
} else return undefined;

#define __lnc__f825
/// __lnc__f825()->Any
if (live_enabled) {
	return ds_priority_find_max(argument0);
} else return undefined;

#define __lnc__f826
/// __lnc__f826()->Any
if (live_enabled) {
	return ds_priority_write(argument0);
} else return undefined;

#define __lnc__f827
/// __lnc__f827()->Any
if (live_enabled) {
	return ds_priority_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f828
/// __lnc__f828()->Any
if (live_enabled) {
	return ds_grid_create(argument0,argument1);
} else return undefined;

#define __lnc__f829
/// __lnc__f829()
if (live_enabled) {
	ds_grid_destroy(argument0);
}

#define __lnc__f830
/// __lnc__f830()
if (live_enabled) {
	ds_grid_copy(argument0,argument1);
}

#define __lnc__f831
/// __lnc__f831()
if (live_enabled) {
	ds_grid_resize(argument0,argument1,argument2);
}

#define __lnc__f832
/// __lnc__f832()->Any
if (live_enabled) {
	return ds_grid_width(argument0);
} else return undefined;

#define __lnc__f833
/// __lnc__f833()->Any
if (live_enabled) {
	return ds_grid_height(argument0);
} else return undefined;

#define __lnc__f834
/// __lnc__f834()
if (live_enabled) {
	ds_grid_clear(argument0,argument1);
}

#define __lnc__f835
/// __lnc__f835()
if (live_enabled) {
	ds_grid_set(argument0,argument1,argument2,argument3);
}

#define __lnc__f836
/// __lnc__f836()
if (live_enabled) {
	ds_grid_add(argument0,argument1,argument2,argument3);
}

#define __lnc__f837
/// __lnc__f837()
if (live_enabled) {
	ds_grid_multiply(argument0,argument1,argument2,argument3);
}

#define __lnc__f838
/// __lnc__f838()
if (live_enabled) {
	ds_grid_set_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f839
/// __lnc__f839()
if (live_enabled) {
	ds_grid_add_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f840
/// __lnc__f840()
if (live_enabled) {
	ds_grid_multiply_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f841
/// __lnc__f841()
if (live_enabled) {
	ds_grid_set_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f842
/// __lnc__f842()
if (live_enabled) {
	ds_grid_add_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f843
/// __lnc__f843()
if (live_enabled) {
	ds_grid_multiply_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f844
/// __lnc__f844()
if (live_enabled) {
	ds_grid_set_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f845
/// __lnc__f845()
if (live_enabled) {
	ds_grid_add_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f846
/// __lnc__f846()
if (live_enabled) {
	ds_grid_multiply_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f847
/// __lnc__f847()->Any
if (live_enabled) {
	return ds_grid_get(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f848
/// __lnc__f848()->Any
if (live_enabled) {
	return ds_grid_get_sum(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f849
/// __lnc__f849()->Any
if (live_enabled) {
	return ds_grid_get_max(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f850
/// __lnc__f850()->Any
if (live_enabled) {
	return ds_grid_get_min(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f851
/// __lnc__f851()->Any
if (live_enabled) {
	return ds_grid_get_mean(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f852
/// __lnc__f852()->Any
if (live_enabled) {
	return ds_grid_get_disk_sum(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f853
/// __lnc__f853()->Any
if (live_enabled) {
	return ds_grid_get_disk_min(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f854
/// __lnc__f854()->Any
if (live_enabled) {
	return ds_grid_get_disk_max(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f855
/// __lnc__f855()->Any
if (live_enabled) {
	return ds_grid_get_disk_mean(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f856
/// __lnc__f856()->Any
if (live_enabled) {
	return ds_grid_value_exists(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f857
/// __lnc__f857()->Any
if (live_enabled) {
	return ds_grid_value_x(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f858
/// __lnc__f858()->Any
if (live_enabled) {
	return ds_grid_value_y(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f859
/// __lnc__f859()->Any
if (live_enabled) {
	return ds_grid_value_disk_exists(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f860
/// __lnc__f860()->Any
if (live_enabled) {
	return ds_grid_value_disk_x(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f861
/// __lnc__f861()->Any
if (live_enabled) {
	return ds_grid_value_disk_y(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f862
/// __lnc__f862()
if (live_enabled) {
	ds_grid_shuffle(argument0);
}

#define __lnc__f863
/// __lnc__f863()->Any
if (live_enabled) {
	return ds_grid_write(argument0);
} else return undefined;

#define __lnc__f864
/// __lnc__f864()->Any
if (live_enabled) {
	return ds_grid_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f865
/// __lnc__f865()
if (live_enabled) {
	ds_grid_sort(argument0,argument1,argument2);
}

#define __lnc__f866
/// __lnc__f866()
if (live_enabled) {
	ds_grid_set(argument0,argument1,argument2,argument3);
}

#define __lnc__f867
/// __lnc__f867()->Any
if (live_enabled) {
	return ds_grid_get(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f868
/// __lnc__f868()->Any
if (live_enabled) {
	return effect_create_below(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f869
/// __lnc__f869()->Any
if (live_enabled) {
	return effect_create_above(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f870
/// __lnc__f870()
if (live_enabled) {
	effect_clear();
}

#define __lnc__f871
/// __lnc__f871()->Any
if (live_enabled) {
	return part_type_create();
} else return undefined;

#define __lnc__f872
/// __lnc__f872()
if (live_enabled) {
	part_type_destroy(argument0);
}

#define __lnc__f873
/// __lnc__f873()->Any
if (live_enabled) {
	return part_type_exists(argument0);
} else return undefined;

#define __lnc__f874
/// __lnc__f874()
if (live_enabled) {
	part_type_clear(argument0);
}

#define __lnc__f875
/// __lnc__f875()
if (live_enabled) {
	part_type_shape(argument0,argument1);
}

#define __lnc__f876
/// __lnc__f876()
if (live_enabled) {
	part_type_sprite(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f877
/// __lnc__f877()->Any
if (live_enabled) {
	return part_type_size(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f878
/// __lnc__f878()
if (live_enabled) {
	part_type_scale(argument0,argument1,argument2);
}

#define __lnc__f879
/// __lnc__f879()
if (live_enabled) {
	part_type_orientation(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f880
/// __lnc__f880()
if (live_enabled) {
	part_type_life(argument0,argument1,argument2);
}

#define __lnc__f881
/// __lnc__f881()
if (live_enabled) {
	part_type_step(argument0,argument1,argument2);
}

#define __lnc__f882
/// __lnc__f882()
if (live_enabled) {
	part_type_death(argument0,argument1,argument2);
}

#define __lnc__f883
/// __lnc__f883()
if (live_enabled) {
	part_type_speed(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f884
/// __lnc__f884()
if (live_enabled) {
	part_type_direction(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f885
/// __lnc__f885()
if (live_enabled) {
	part_type_gravity(argument0,argument1,argument2);
}

#define __lnc__f886
/// __lnc__f886()
if (live_enabled) {
	part_type_colour1(argument0,argument1);
}

#define __lnc__f887
/// __lnc__f887()
if (live_enabled) {
	part_type_colour2(argument0,argument1,argument2);
}

#define __lnc__f888
/// __lnc__f888()
if (live_enabled) {
	part_type_colour3(argument0,argument1,argument2,argument3);
}

#define __lnc__f889
/// __lnc__f889()
if (live_enabled) {
	part_type_colour_mix(argument0,argument1,argument2);
}

#define __lnc__f890
/// __lnc__f890()
if (live_enabled) {
	part_type_colour_rgb(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f891
/// __lnc__f891()
if (live_enabled) {
	part_type_colour_hsv(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f892
/// __lnc__f892()
if (live_enabled) {
	part_type_color1(argument0,argument1);
}

#define __lnc__f893
/// __lnc__f893()
if (live_enabled) {
	part_type_color2(argument0,argument1,argument2);
}

#define __lnc__f894
/// __lnc__f894()
if (live_enabled) {
	part_type_color3(argument0,argument1,argument2,argument3);
}

#define __lnc__f895
/// __lnc__f895()
if (live_enabled) {
	part_type_color_mix(argument0,argument1,argument2);
}

#define __lnc__f896
/// __lnc__f896()
if (live_enabled) {
	part_type_color_rgb(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f897
/// __lnc__f897()
if (live_enabled) {
	part_type_color_hsv(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f898
/// __lnc__f898()
if (live_enabled) {
	part_type_alpha1(argument0,argument1);
}

#define __lnc__f899
/// __lnc__f899()
if (live_enabled) {
	part_type_alpha2(argument0,argument1,argument2);
}

#define __lnc__f900
/// __lnc__f900()
if (live_enabled) {
	part_type_alpha3(argument0,argument1,argument2,argument3);
}

#define __lnc__f901
/// __lnc__f901()
if (live_enabled) {
	part_type_blend(argument0,argument1);
}

#define __lnc__f902
/// __lnc__f902()->Any
if (live_enabled) {
	return part_system_create();
} else return undefined;

#define __lnc__f903
/// __lnc__f903()->Any
if (live_enabled) {
	return part_system_create_layer(argument0,argument1);
} else return undefined;

#define __lnc__f904
/// __lnc__f904()
if (live_enabled) {
	part_system_destroy(argument0);
}

#define __lnc__f905
/// __lnc__f905()->Any
if (live_enabled) {
	return part_system_exists(argument0);
} else return undefined;

#define __lnc__f906
/// __lnc__f906()
if (live_enabled) {
	part_system_clear(argument0);
}

#define __lnc__f907
/// __lnc__f907()
if (live_enabled) {
	part_system_draw_order(argument0,argument1);
}

#define __lnc__f908
/// __lnc__f908()
if (live_enabled) {
	part_system_depth(argument0,argument1);
}

#define __lnc__f909
/// __lnc__f909()
if (live_enabled) {
	part_system_position(argument0,argument1,argument2);
}

#define __lnc__f910
/// __lnc__f910()
if (live_enabled) {
	part_system_automatic_update(argument0,argument1);
}

#define __lnc__f911
/// __lnc__f911()
if (live_enabled) {
	part_system_automatic_draw(argument0,argument1);
}

#define __lnc__f912
/// __lnc__f912()
if (live_enabled) {
	part_system_update(argument0);
}

#define __lnc__f913
/// __lnc__f913()
if (live_enabled) {
	part_system_drawit(argument0);
}

#define __lnc__f914
/// __lnc__f914()->Any
if (live_enabled) {
	return part_system_get_layer(argument0);
} else return undefined;

#define __lnc__f915
/// __lnc__f915()
if (live_enabled) {
	part_system_layer(argument0,argument1);
}

#define __lnc__f916
/// __lnc__f916()->Any
if (live_enabled) {
	return part_particles_create(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f917
/// __lnc__f917()->Any
if (live_enabled) {
	return part_particles_create_colour(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f918
/// __lnc__f918()->Any
if (live_enabled) {
	return part_particles_create_color(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f919
/// __lnc__f919()
if (live_enabled) {
	part_particles_clear(argument0);
}

#define __lnc__f920
/// __lnc__f920()
if (live_enabled) {
	part_particles_count(argument0);
}

#define __lnc__f921
/// __lnc__f921()->Any
if (live_enabled) {
	return part_emitter_create(argument0);
} else return undefined;

#define __lnc__f922
/// __lnc__f922()
if (live_enabled) {
	part_emitter_destroy(argument0,argument1);
}

#define __lnc__f923
/// __lnc__f923()
if (live_enabled) {
	part_emitter_destroy_all(argument0);
}

#define __lnc__f924
/// __lnc__f924()->Any
if (live_enabled) {
	return part_emitter_exists(argument0,argument1);
} else return undefined;

#define __lnc__f925
/// __lnc__f925()
if (live_enabled) {
	part_emitter_clear(argument0,argument1);
}

#define __lnc__f926
/// __lnc__f926()
if (live_enabled) {
	part_emitter_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f927
/// __lnc__f927()
if (live_enabled) {
	part_emitter_burst(argument0,argument1,argument2,argument3);
}

#define __lnc__f928
/// __lnc__f928()
if (live_enabled) {
	part_emitter_stream(argument0,argument1,argument2,argument3);
}

#define __lnc__f929
/// __lnc__f929()->Any
if (live_enabled) {
	return window_handle();
} else return undefined;

#define __lnc__f930
/// __lnc__f930()->Any
if (live_enabled) {
	return window_device();
} else return undefined;

#define __lnc__f931
/// __lnc__f931()->Any
if (live_enabled) {
	return matrix_get(argument0);
} else return undefined;

#define __lnc__f932
/// __lnc__f932()
if (live_enabled) {
	matrix_set(argument0,argument1);
}

#define __lnc__f933
/// __lnc__f933()->Any
if (live_enabled) {
	return matrix_build_identity();
} else return undefined;

#define __lnc__f934
/// __lnc__f934()->Any
if (live_enabled) {
	return matrix_build(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f935
/// __lnc__f935()->Any
if (live_enabled) {
	return matrix_build_lookat(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f936
/// __lnc__f936()->Any
if (live_enabled) {
	return matrix_build_projection_ortho(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f937
/// __lnc__f937()->Any
if (live_enabled) {
	return matrix_build_projection_perspective(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f938
/// __lnc__f938()->Any
if (live_enabled) {
	return matrix_build_projection_perspective_fov(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f939
/// __lnc__f939()->Any
if (live_enabled) {
	return matrix_multiply(argument0,argument1);
} else return undefined;

#define __lnc__f940
/// __lnc__f940()->Any
if (live_enabled) {
	return matrix_transform_vertex(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f941
/// __lnc__f941()
if (live_enabled) {
	switch(argument_count){
		case 0:matrix_stack_push();break;
		case 1:matrix_stack_push(argument[0]);break;
		case 2:matrix_stack_push(argument[0],argument[1]);break;
		case 3:matrix_stack_push(argument[0],argument[1],argument[2]);break;
		case 4:matrix_stack_push(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:matrix_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f942
/// __lnc__f942()->Any
if (live_enabled) {
	return matrix_stack_pop();
} else return undefined;

#define __lnc__f943
/// __lnc__f943()
if (live_enabled) {
	matrix_stack_set(argument0);
}

#define __lnc__f944
/// __lnc__f944()
if (live_enabled) {
	matrix_stack_clear();
}

#define __lnc__f945
/// __lnc__f945()->Any
if (live_enabled) {
	return matrix_stack_top();
} else return undefined;

#define __lnc__f946
/// __lnc__f946()->Any
if (live_enabled) {
	return matrix_stack_is_empty();
} else return undefined;

#define __lnc__f947
/// __lnc__f947()
if (live_enabled) {
	browser_input_capture(argument0);
}

#define __lnc__f948
/// __lnc__f948()->Any
if (live_enabled) {
	return os_get_config();
} else return undefined;

#define __lnc__f949
/// __lnc__f949()->Any
if (live_enabled) {
	return os_get_info();
} else return undefined;

#define __lnc__f950
/// __lnc__f950()->Any
if (live_enabled) {
	return os_get_language();
} else return undefined;

#define __lnc__f951
/// __lnc__f951()->Any
if (live_enabled) {
	return os_get_region();
} else return undefined;

#define __lnc__f952
/// __lnc__f952()
if (live_enabled) {
	os_lock_orientation(argument0);
}

#define __lnc__f953
/// __lnc__f953()->Any
if (live_enabled) {
	return display_get_dpi_x();
} else return undefined;

#define __lnc__f954
/// __lnc__f954()->Any
if (live_enabled) {
	return display_get_dpi_y();
} else return undefined;

#define __lnc__f955
/// __lnc__f955()
if (live_enabled) {
	display_set_gui_size(argument0,argument1);
}

#define __lnc__f956
/// __lnc__f956()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:case 2:case 3:gml_thread_error("display_set_gui_maximise needs at least 4 arguments, got "+string(argument_count));break;
		case 4:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:display_set_gui_maximise(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f957
/// __lnc__f957()
if (live_enabled) {
	device_mouse_dbclick_enable(argument0);
}

#define __lnc__f958
/// __lnc__f958()
if (live_enabled) {
	virtual_key_add(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f959
/// __lnc__f959()
if (live_enabled) {
	virtual_key_hide(argument0);
}

#define __lnc__f960
/// __lnc__f960()
if (live_enabled) {
	virtual_key_delete(argument0);
}

#define __lnc__f961
/// __lnc__f961()
if (live_enabled) {
	virtual_key_show(argument0);
}

#define __lnc__f962
/// __lnc__f962()
if (live_enabled) {
	draw_enable_drawevent(argument0);
}

#define __lnc__f963
/// __lnc__f963()
if (live_enabled) {
	draw_enable_swf_aa(argument0);
}

#define __lnc__f964
/// __lnc__f964()
if (live_enabled) {
	draw_set_swf_aa_level(argument0);
}

#define __lnc__f965
/// __lnc__f965()->Any
if (live_enabled) {
	return draw_get_swf_aa_level();
} else return undefined;

#define __lnc__f966
/// __lnc__f966()
if (live_enabled) {
	draw_texture_flush();
}

#define __lnc__f967
/// __lnc__f967()
if (live_enabled) {
	draw_flush();
}

#define __lnc__f968
/// __lnc__f968()
if (live_enabled) {
	gpu_set_blendenable(argument0);
}

#define __lnc__f969
/// __lnc__f969()
if (live_enabled) {
	gpu_set_ztestenable(argument0);
}

#define __lnc__f970
/// __lnc__f970()
if (live_enabled) {
	gpu_set_zfunc(argument0);
}

#define __lnc__f971
/// __lnc__f971()
if (live_enabled) {
	gpu_set_zwriteenable(argument0);
}

#define __lnc__f972
/// __lnc__f972()
if (live_enabled) {
	gpu_set_fog(argument0,argument1,argument2,argument3);
}

#define __lnc__f973
/// __lnc__f973()
if (live_enabled) {
	gpu_set_cullmode(argument0);
}

#define __lnc__f974
/// __lnc__f974()
if (live_enabled) {
	gpu_set_blendmode(argument0);
}

#define __lnc__f975
/// __lnc__f975()
if (live_enabled) {
	gpu_set_blendmode_ext(argument0,argument1);
}

#define __lnc__f976
/// __lnc__f976()
if (live_enabled) {
	gpu_set_blendmode_ext_sepalpha(argument0,argument1,argument2,argument3);
}

#define __lnc__f977
/// __lnc__f977()
if (live_enabled) {
	gpu_set_colorwriteenable(argument0,argument1,argument2,argument3);
}

#define __lnc__f978
/// __lnc__f978()
if (live_enabled) {
	gpu_set_colourwriteenable(argument0,argument1,argument2,argument3);
}

#define __lnc__f979
/// __lnc__f979()
if (live_enabled) {
	gpu_set_alphatestenable(argument0);
}

#define __lnc__f980
/// __lnc__f980()
if (live_enabled) {
	gpu_set_alphatestref(argument0);
}

#define __lnc__f981
/// __lnc__f981()
if (live_enabled) {
	gpu_set_alphatestfunc(argument0);
}

#define __lnc__f982
/// __lnc__f982()
if (live_enabled) {
	gpu_set_texfilter(argument0);
}

#define __lnc__f983
/// __lnc__f983()
if (live_enabled) {
	gpu_set_texfilter_ext(argument0,argument1);
}

#define __lnc__f984
/// __lnc__f984()
if (live_enabled) {
	gpu_set_texrepeat(argument0);
}

#define __lnc__f985
/// __lnc__f985()
if (live_enabled) {
	gpu_set_texrepeat_ext(argument0,argument1);
}

#define __lnc__f986
/// __lnc__f986()
if (live_enabled) {
	gpu_set_tex_filter(argument0);
}

#define __lnc__f987
/// __lnc__f987()
if (live_enabled) {
	gpu_set_tex_filter_ext(argument0,argument1);
}

#define __lnc__f988
/// __lnc__f988()
if (live_enabled) {
	gpu_set_tex_repeat(argument0);
}

#define __lnc__f989
/// __lnc__f989()
if (live_enabled) {
	gpu_set_tex_repeat_ext(argument0,argument1);
}

#define __lnc__f990
/// __lnc__f990()
if (live_enabled) {
	gpu_set_tex_mip_filter(argument0);
}

#define __lnc__f991
/// __lnc__f991()
if (live_enabled) {
	gpu_set_tex_mip_filter_ext(argument0,argument1);
}

#define __lnc__f992
/// __lnc__f992()
if (live_enabled) {
	gpu_set_tex_mip_bias(argument0);
}

#define __lnc__f993
/// __lnc__f993()
if (live_enabled) {
	gpu_set_tex_mip_bias_ext(argument0,argument1);
}

#define __lnc__f994
/// __lnc__f994()
if (live_enabled) {
	gpu_set_tex_min_mip(argument0);
}

#define __lnc__f995
/// __lnc__f995()
if (live_enabled) {
	gpu_set_tex_min_mip_ext(argument0,argument1);
}

#define __lnc__f996
/// __lnc__f996()
if (live_enabled) {
	gpu_set_tex_max_mip(argument0);
}

#define __lnc__f997
/// __lnc__f997()
if (live_enabled) {
	gpu_set_tex_max_mip_ext(argument0,argument1);
}

#define __lnc__f998
/// __lnc__f998()
if (live_enabled) {
	gpu_set_tex_max_aniso(argument0);
}

#define __lnc__f999
/// __lnc__f999()
if (live_enabled) {
	gpu_set_tex_max_aniso_ext(argument0,argument1);
}

#define __lnc__f1000
/// __lnc__f1000()
if (live_enabled) {
	gpu_set_tex_mip_enable(argument0);
}

#define __lnc__f1001
/// __lnc__f1001()
if (live_enabled) {
	gpu_set_tex_mip_enable_ext(argument0,argument1);
}

#define __lnc__f1002
/// __lnc__f1002()->Any
if (live_enabled) {
	return gpu_get_blendenable();
} else return undefined;

#define __lnc__f1003
/// __lnc__f1003()->Any
if (live_enabled) {
	return gpu_get_ztestenable();
} else return undefined;

#define __lnc__f1004
/// __lnc__f1004()->Any
if (live_enabled) {
	return gpu_get_zfunc();
} else return undefined;

#define __lnc__f1005
/// __lnc__f1005()->Any
if (live_enabled) {
	return gpu_get_zwriteenable();
} else return undefined;

#define __lnc__f1006
/// __lnc__f1006()->Any
if (live_enabled) {
	return gpu_get_fog();
} else return undefined;

#define __lnc__f1007
/// __lnc__f1007()->Any
if (live_enabled) {
	return gpu_get_cullmode();
} else return undefined;

#define __lnc__f1008
/// __lnc__f1008()->Any
if (live_enabled) {
	return gpu_get_blendmode();
} else return undefined;

#define __lnc__f1009
/// __lnc__f1009()->Any
if (live_enabled) {
	return gpu_get_blendmode_ext();
} else return undefined;

#define __lnc__f1010
/// __lnc__f1010()->Any
if (live_enabled) {
	return gpu_get_blendmode_ext_sepalpha();
} else return undefined;

#define __lnc__f1011
/// __lnc__f1011()->Any
if (live_enabled) {
	return gpu_get_blendmode_src();
} else return undefined;

#define __lnc__f1012
/// __lnc__f1012()->Any
if (live_enabled) {
	return gpu_get_blendmode_dest();
} else return undefined;

#define __lnc__f1013
/// __lnc__f1013()->Any
if (live_enabled) {
	return gpu_get_blendmode_srcalpha();
} else return undefined;

#define __lnc__f1014
/// __lnc__f1014()->Any
if (live_enabled) {
	return gpu_get_blendmode_destalpha();
} else return undefined;

#define __lnc__f1015
/// __lnc__f1015()->Any
if (live_enabled) {
	return gpu_get_colorwriteenable();
} else return undefined;

#define __lnc__f1016
/// __lnc__f1016()->Any
if (live_enabled) {
	return gpu_get_colourwriteenable();
} else return undefined;

#define __lnc__f1017
/// __lnc__f1017()->Any
if (live_enabled) {
	return gpu_get_alphatestenable();
} else return undefined;

#define __lnc__f1018
/// __lnc__f1018()->Any
if (live_enabled) {
	return gpu_get_alphatestref();
} else return undefined;

#define __lnc__f1019
/// __lnc__f1019()->Any
if (live_enabled) {
	return gpu_get_alphatestfunc();
} else return undefined;

#define __lnc__f1020
/// __lnc__f1020()->Any
if (live_enabled) {
	return gpu_get_texfilter();
} else return undefined;

#define __lnc__f1021
/// __lnc__f1021()->Any
if (live_enabled) {
	return gpu_get_texfilter_ext(argument0);
} else return undefined;

#define __lnc__f1022
/// __lnc__f1022()->Any
if (live_enabled) {
	return gpu_get_texrepeat();
} else return undefined;

#define __lnc__f1023
/// __lnc__f1023()->Any
if (live_enabled) {
	return gpu_get_texrepeat_ext(argument0);
} else return undefined;

#define __lnc__f1024
/// __lnc__f1024()->Any
if (live_enabled) {
	return gpu_get_tex_filter();
} else return undefined;

#define __lnc__f1025
/// __lnc__f1025()->Any
if (live_enabled) {
	return gpu_get_tex_filter_ext(argument0);
} else return undefined;

#define __lnc__f1026
/// __lnc__f1026()->Any
if (live_enabled) {
	return gpu_get_tex_repeat();
} else return undefined;

#define __lnc__f1027
/// __lnc__f1027()->Any
if (live_enabled) {
	return gpu_get_tex_repeat_ext(argument0);
} else return undefined;

#define __lnc__f1028
/// __lnc__f1028()->Any
if (live_enabled) {
	return gpu_get_tex_mip_filter();
} else return undefined;

#define __lnc__f1029
/// __lnc__f1029()->Any
if (live_enabled) {
	return gpu_get_tex_mip_filter_ext(argument0);
} else return undefined;

#define __lnc__f1030
/// __lnc__f1030()->Any
if (live_enabled) {
	return gpu_get_tex_mip_bias();
} else return undefined;

#define __lnc__f1031
/// __lnc__f1031()->Any
if (live_enabled) {
	return gpu_get_tex_mip_bias_ext(argument0);
} else return undefined;

#define __lnc__f1032
/// __lnc__f1032()->Any
if (live_enabled) {
	return gpu_get_tex_min_mip();
} else return undefined;

#define __lnc__f1033
/// __lnc__f1033()->Any
if (live_enabled) {
	return gpu_get_tex_min_mip_ext(argument0);
} else return undefined;

#define __lnc__f1034
/// __lnc__f1034()->Any
if (live_enabled) {
	return gpu_get_tex_max_mip();
} else return undefined;

#define __lnc__f1035
/// __lnc__f1035()->Any
if (live_enabled) {
	return gpu_get_tex_max_mip_ext(argument0);
} else return undefined;

#define __lnc__f1036
/// __lnc__f1036()->Any
if (live_enabled) {
	return gpu_get_tex_max_aniso();
} else return undefined;

#define __lnc__f1037
/// __lnc__f1037()->Any
if (live_enabled) {
	return gpu_get_tex_max_aniso_ext(argument0);
} else return undefined;

#define __lnc__f1038
/// __lnc__f1038()->Any
if (live_enabled) {
	return gpu_get_tex_mip_enable();
} else return undefined;

#define __lnc__f1039
/// __lnc__f1039()->Any
if (live_enabled) {
	return gpu_get_tex_mip_enable_ext(argument0);
} else return undefined;

#define __lnc__f1040
/// __lnc__f1040()
if (live_enabled) {
	gpu_push_state();
}

#define __lnc__f1041
/// __lnc__f1041()
if (live_enabled) {
	gpu_pop_state();
}

#define __lnc__f1042
/// __lnc__f1042()->Any
if (live_enabled) {
	return gpu_get_state();
} else return undefined;

#define __lnc__f1043
/// __lnc__f1043()
if (live_enabled) {
	gpu_set_state(argument0);
}

#define __lnc__f1044
/// __lnc__f1044()
if (live_enabled) {
	draw_light_define_ambient(argument0);
}

#define __lnc__f1045
/// __lnc__f1045()
if (live_enabled) {
	draw_light_define_direction(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1046
/// __lnc__f1046()
if (live_enabled) {
	draw_light_define_point(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f1047
/// __lnc__f1047()
if (live_enabled) {
	draw_light_enable(argument0,argument1);
}

#define __lnc__f1048
/// __lnc__f1048()
if (live_enabled) {
	draw_set_lighting(argument0);
}

#define __lnc__f1049
/// __lnc__f1049()->Any
if (live_enabled) {
	return draw_light_get_ambient();
} else return undefined;

#define __lnc__f1050
/// __lnc__f1050()->Any
if (live_enabled) {
	return draw_light_get(argument0);
} else return undefined;

#define __lnc__f1051
/// __lnc__f1051()->Any
if (live_enabled) {
	return draw_get_lighting();
} else return undefined;

#define __lnc__f1052
/// __lnc__f1052()
if (live_enabled) {
	shop_leave_rating(argument0,argument1,argument2,argument3);
}

#define __lnc__f1053
/// __lnc__f1053()->Any
if (live_enabled) {
	return url_get_domain();
} else return undefined;

#define __lnc__f1054
/// __lnc__f1054()
if (live_enabled) {
	url_open(argument0);
}

#define __lnc__f1055
/// __lnc__f1055()
if (live_enabled) {
	url_open_ext(argument0,argument1);
}

#define __lnc__f1056
/// __lnc__f1056()
if (live_enabled) {
	url_open_full(argument0,argument1,argument2);
}

#define __lnc__f1057
/// __lnc__f1057()->Any
if (live_enabled) {
	return get_timer();
} else return undefined;

#define __lnc__f1058
/// __lnc__f1058()->Any
if (live_enabled) {
	return device_get_tilt_x();
} else return undefined;

#define __lnc__f1059
/// __lnc__f1059()->Any
if (live_enabled) {
	return device_get_tilt_y();
} else return undefined;

#define __lnc__f1060
/// __lnc__f1060()->Any
if (live_enabled) {
	return device_get_tilt_z();
} else return undefined;

#define __lnc__f1061
/// __lnc__f1061()->Any
if (live_enabled) {
	return device_is_keypad_open();
} else return undefined;

#define __lnc__f1062
/// __lnc__f1062()->Any
if (live_enabled) {
	return device_mouse_check_button(argument0,argument1);
} else return undefined;

#define __lnc__f1063
/// __lnc__f1063()->Any
if (live_enabled) {
	return device_mouse_check_button_pressed(argument0,argument1);
} else return undefined;

#define __lnc__f1064
/// __lnc__f1064()->Any
if (live_enabled) {
	return device_mouse_check_button_released(argument0,argument1);
} else return undefined;

#define __lnc__f1065
/// __lnc__f1065()->Any
if (live_enabled) {
	return device_mouse_x(argument0);
} else return undefined;

#define __lnc__f1066
/// __lnc__f1066()->Any
if (live_enabled) {
	return device_mouse_y(argument0);
} else return undefined;

#define __lnc__f1067
/// __lnc__f1067()->Any
if (live_enabled) {
	return device_mouse_raw_x(argument0);
} else return undefined;

#define __lnc__f1068
/// __lnc__f1068()->Any
if (live_enabled) {
	return device_mouse_raw_y(argument0);
} else return undefined;

#define __lnc__f1069
/// __lnc__f1069()->Any
if (live_enabled) {
	return device_mouse_x_to_gui(argument0);
} else return undefined;

#define __lnc__f1070
/// __lnc__f1070()->Any
if (live_enabled) {
	return device_mouse_y_to_gui(argument0);
} else return undefined;

#define __lnc__f1071
/// __lnc__f1071()->Any
if (live_enabled) {
	return gamepad_is_supported();
} else return undefined;

#define __lnc__f1072
/// __lnc__f1072()->Any
if (live_enabled) {
	return gamepad_get_device_count();
} else return undefined;

#define __lnc__f1073
/// __lnc__f1073()->Any
if (live_enabled) {
	return gamepad_is_connected(argument0);
} else return undefined;

#define __lnc__f1074
/// __lnc__f1074()->Any
if (live_enabled) {
	return gamepad_get_description(argument0);
} else return undefined;

#define __lnc__f1075
/// __lnc__f1075()->Any
if (live_enabled) {
	return gamepad_get_button_threshold(argument0);
} else return undefined;

#define __lnc__f1076
/// __lnc__f1076()
if (live_enabled) {
	gamepad_set_button_threshold(argument0,argument1);
}

#define __lnc__f1077
/// __lnc__f1077()->Any
if (live_enabled) {
	return gamepad_get_axis_deadzone(argument0);
} else return undefined;

#define __lnc__f1078
/// __lnc__f1078()
if (live_enabled) {
	gamepad_set_axis_deadzone(argument0,argument1);
}

#define __lnc__f1079
/// __lnc__f1079()->Any
if (live_enabled) {
	return gamepad_button_count(argument0);
} else return undefined;

#define __lnc__f1080
/// __lnc__f1080()->Any
if (live_enabled) {
	return gamepad_button_check(argument0,argument1);
} else return undefined;

#define __lnc__f1081
/// __lnc__f1081()->Any
if (live_enabled) {
	return gamepad_button_check_released(argument0,argument1);
} else return undefined;

#define __lnc__f1082
/// __lnc__f1082()->Any
if (live_enabled) {
	return gamepad_button_value(argument0,argument1);
} else return undefined;

#define __lnc__f1083
/// __lnc__f1083()->Any
if (live_enabled) {
	return gamepad_axis_count(argument0);
} else return undefined;

#define __lnc__f1084
/// __lnc__f1084()->Any
if (live_enabled) {
	return gamepad_axis_value(argument0,argument1);
} else return undefined;

#define __lnc__f1085
/// __lnc__f1085()
if (live_enabled) {
	gamepad_set_vibration(argument0,argument1,argument2);
}

#define __lnc__f1086
/// __lnc__f1086()
if (live_enabled) {
	gamepad_set_colour(argument0,argument1);
}

#define __lnc__f1087
/// __lnc__f1087()
if (live_enabled) {
	gamepad_set_color(argument0,argument1);
}

#define __lnc__f1088
/// __lnc__f1088()->Any
if (live_enabled) {
	return os_is_paused();
} else return undefined;

#define __lnc__f1089
/// __lnc__f1089()->Any
if (live_enabled) {
	return window_has_focus();
} else return undefined;

#define __lnc__f1090
/// __lnc__f1090()->Any
if (live_enabled) {
	return code_is_compiled();
} else return undefined;

#define __lnc__f1091
/// __lnc__f1091()->Any
if (live_enabled) {
	return http_get(argument0);
} else return undefined;

#define __lnc__f1092
/// __lnc__f1092()->Any
if (live_enabled) {
	return http_get_file(argument0,argument1);
} else return undefined;

#define __lnc__f1093
/// __lnc__f1093()->Any
if (live_enabled) {
	return http_post_string(argument0,argument1);
} else return undefined;

#define __lnc__f1094
/// __lnc__f1094()->Any
if (live_enabled) {
	return http_request(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1095
/// __lnc__f1095()->Any
if (live_enabled) {
	return json_encode(argument0);
} else return undefined;

#define __lnc__f1096
/// __lnc__f1096()->Any
if (live_enabled) {
	return json_decode(argument0);
} else return undefined;

#define __lnc__f1097
/// __lnc__f1097()
if (live_enabled) {
	zip_unzip(argument0,argument1);
}

#define __lnc__f1098
/// __lnc__f1098()->Any
if (live_enabled) {
	return load_csv(argument0);
} else return undefined;

#define __lnc__f1099
/// __lnc__f1099()->Any
if (live_enabled) {
	return base64_encode(argument0);
} else return undefined;

#define __lnc__f1100
/// __lnc__f1100()->Any
if (live_enabled) {
	return base64_decode(argument0);
} else return undefined;

#define __lnc__f1101
/// __lnc__f1101()->Any
if (live_enabled) {
	return md5_string_unicode(argument0);
} else return undefined;

#define __lnc__f1102
/// __lnc__f1102()->Any
if (live_enabled) {
	return md5_string_utf8(argument0);
} else return undefined;

#define __lnc__f1103
/// __lnc__f1103()->Any
if (live_enabled) {
	return md5_file(argument0);
} else return undefined;

#define __lnc__f1104
/// __lnc__f1104()->Any
if (live_enabled) {
	return os_is_network_connected();
} else return undefined;

#define __lnc__f1105
/// __lnc__f1105()->Any
if (live_enabled) {
	return sha1_string_unicode(argument0);
} else return undefined;

#define __lnc__f1106
/// __lnc__f1106()->Any
if (live_enabled) {
	return sha1_string_utf8(argument0);
} else return undefined;

#define __lnc__f1107
/// __lnc__f1107()->Any
if (live_enabled) {
	return sha1_file(argument0);
} else return undefined;

#define __lnc__f1108
/// __lnc__f1108()
if (live_enabled) {
	os_powersave_enable(argument0);
}

#define __lnc__f1109
/// __lnc__f1109()->Any
if (live_enabled) {
	return physics_world_create(argument0);
} else return undefined;

#define __lnc__f1110
/// __lnc__f1110()
if (live_enabled) {
	physics_world_gravity(argument0,argument1);
}

#define __lnc__f1111
/// __lnc__f1111()
if (live_enabled) {
	physics_world_update_speed(argument0);
}

#define __lnc__f1112
/// __lnc__f1112()
if (live_enabled) {
	physics_world_update_iterations(argument0);
}

#define __lnc__f1113
/// __lnc__f1113()
if (live_enabled) {
	physics_world_draw_debug(argument0);
}

#define __lnc__f1114
/// __lnc__f1114()
if (live_enabled) {
	physics_pause_enable(argument0);
}

#define __lnc__f1115
/// __lnc__f1115()->Any
if (live_enabled) {
	return physics_fixture_create();
} else return undefined;

#define __lnc__f1116
/// __lnc__f1116()
if (live_enabled) {
	physics_fixture_set_kinematic(argument0);
}

#define __lnc__f1117
/// __lnc__f1117()
if (live_enabled) {
	physics_fixture_set_density(argument0,argument1);
}

#define __lnc__f1118
/// __lnc__f1118()
if (live_enabled) {
	physics_fixture_set_awake(argument0,argument1);
}

#define __lnc__f1119
/// __lnc__f1119()
if (live_enabled) {
	physics_fixture_set_restitution(argument0,argument1);
}

#define __lnc__f1120
/// __lnc__f1120()
if (live_enabled) {
	physics_fixture_set_friction(argument0,argument1);
}

#define __lnc__f1121
/// __lnc__f1121()
if (live_enabled) {
	physics_fixture_set_collision_group(argument0,argument1);
}

#define __lnc__f1122
/// __lnc__f1122()
if (live_enabled) {
	physics_fixture_set_sensor(argument0,argument1);
}

#define __lnc__f1123
/// __lnc__f1123()
if (live_enabled) {
	physics_fixture_set_linear_damping(argument0,argument1);
}

#define __lnc__f1124
/// __lnc__f1124()
if (live_enabled) {
	physics_fixture_set_angular_damping(argument0,argument1);
}

#define __lnc__f1125
/// __lnc__f1125()
if (live_enabled) {
	physics_fixture_set_circle_shape(argument0,argument1);
}

#define __lnc__f1126
/// __lnc__f1126()
if (live_enabled) {
	physics_fixture_set_box_shape(argument0,argument1,argument2);
}

#define __lnc__f1127
/// __lnc__f1127()
if (live_enabled) {
	physics_fixture_set_edge_shape(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1128
/// __lnc__f1128()
if (live_enabled) {
	physics_fixture_set_polygon_shape(argument0);
}

#define __lnc__f1129
/// __lnc__f1129()
if (live_enabled) {
	physics_fixture_set_chain_shape(argument0,argument1);
}

#define __lnc__f1130
/// __lnc__f1130()
if (live_enabled) {
	physics_fixture_add_point(argument0,argument1,argument2);
}

#define __lnc__f1131
/// __lnc__f1131()
if (live_enabled) {
	physics_fixture_bind(argument0,argument1);
}

#define __lnc__f1132
/// __lnc__f1132()
if (live_enabled) {
	physics_fixture_bind_ext(argument0,argument1,argument2,argument3);
}

#define __lnc__f1133
/// __lnc__f1133()
if (live_enabled) {
	physics_fixture_delete(argument0);
}

#define __lnc__f1134
/// __lnc__f1134()
if (live_enabled) {
	physics_apply_force(argument0,argument1,argument2,argument3);
}

#define __lnc__f1135
/// __lnc__f1135()
if (live_enabled) {
	physics_apply_impulse(argument0,argument1,argument2,argument3);
}

#define __lnc__f1136
/// __lnc__f1136()
if (live_enabled) {
	physics_apply_angular_impulse(argument0);
}

#define __lnc__f1137
/// __lnc__f1137()
if (live_enabled) {
	physics_apply_local_force(argument0,argument1,argument2,argument3);
}

#define __lnc__f1138
/// __lnc__f1138()
if (live_enabled) {
	physics_apply_local_impulse(argument0,argument1,argument2,argument3);
}

#define __lnc__f1139
/// __lnc__f1139()
if (live_enabled) {
	physics_apply_torque(argument0);
}

#define __lnc__f1140
/// __lnc__f1140()
if (live_enabled) {
	physics_mass_properties(argument0,argument1,argument2,argument3);
}

#define __lnc__f1141
/// __lnc__f1141()
if (live_enabled) {
	physics_draw_debug();
}

#define __lnc__f1142
/// __lnc__f1142()
if (live_enabled) {
	physics_test_overlap(argument0,argument1,argument2,argument3);
}

#define __lnc__f1143
/// __lnc__f1143()
if (live_enabled) {
	physics_remove_fixture(argument0,argument1);
}

#define __lnc__f1144
/// __lnc__f1144()
if (live_enabled) {
	physics_set_friction(argument0,argument1);
}

#define __lnc__f1145
/// __lnc__f1145()
if (live_enabled) {
	physics_set_density(argument0,argument1);
}

#define __lnc__f1146
/// __lnc__f1146()
if (live_enabled) {
	physics_set_restitution(argument0,argument1);
}

#define __lnc__f1147
/// __lnc__f1147()->Any
if (live_enabled) {
	return physics_get_friction(argument0);
} else return undefined;

#define __lnc__f1148
/// __lnc__f1148()->Any
if (live_enabled) {
	return physics_get_density(argument0);
} else return undefined;

#define __lnc__f1149
/// __lnc__f1149()->Any
if (live_enabled) {
	return physics_get_restitution(argument0);
} else return undefined;

#define __lnc__f1150
/// __lnc__f1150()->Any
if (live_enabled) {
	return physics_joint_distance_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1151
/// __lnc__f1151()->Any
if (live_enabled) {
	return physics_joint_rope_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1152
/// __lnc__f1152()->Any
if (live_enabled) {
	return physics_joint_revolute_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
} else return undefined;

#define __lnc__f1153
/// __lnc__f1153()->Any
if (live_enabled) {
	return physics_joint_prismatic_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
} else return undefined;

#define __lnc__f1154
/// __lnc__f1154()->Any
if (live_enabled) {
	return physics_joint_pulley_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
} else return undefined;

#define __lnc__f1155
/// __lnc__f1155()->Any
if (live_enabled) {
	return physics_joint_wheel_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
} else return undefined;

#define __lnc__f1156
/// __lnc__f1156()->Any
if (live_enabled) {
	return physics_joint_weld_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1157
/// __lnc__f1157()->Any
if (live_enabled) {
	return physics_joint_friction_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1158
/// __lnc__f1158()->Any
if (live_enabled) {
	return physics_joint_gear_create(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1159
/// __lnc__f1159()
if (live_enabled) {
	physics_joint_enable_motor(argument0,argument1);
}

#define __lnc__f1160
/// __lnc__f1160()->Any
if (live_enabled) {
	return physics_joint_get_value(argument0,argument1);
} else return undefined;

#define __lnc__f1161
/// __lnc__f1161()
if (live_enabled) {
	physics_joint_set_value(argument0,argument1,argument2);
}

#define __lnc__f1162
/// __lnc__f1162()
if (live_enabled) {
	physics_joint_delete(argument0);
}

#define __lnc__f1163
/// __lnc__f1163()->Any
if (live_enabled) {
	return physics_particle_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1164
/// __lnc__f1164()
if (live_enabled) {
	physics_particle_delete(argument0);
}

#define __lnc__f1165
/// __lnc__f1165()
if (live_enabled) {
	physics_particle_delete_region_circle(argument0,argument1,argument2);
}

#define __lnc__f1166
/// __lnc__f1166()
if (live_enabled) {
	physics_particle_delete_region_box(argument0,argument1,argument2,argument3);
}

#define __lnc__f1167
/// __lnc__f1167()
if (live_enabled) {
	physics_particle_delete_region_poly(argument0);
}

#define __lnc__f1168
/// __lnc__f1168()
if (live_enabled) {
	physics_particle_set_flags(argument0,argument1);
}

#define __lnc__f1169
/// __lnc__f1169()
if (live_enabled) {
	physics_particle_set_category_flags(argument0,argument1);
}

#define __lnc__f1170
/// __lnc__f1170()
if (live_enabled) {
	physics_particle_draw(argument0,argument1,argument2,argument3);
}

#define __lnc__f1171
/// __lnc__f1171()
if (live_enabled) {
	physics_particle_draw_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1172
/// __lnc__f1172()
if (live_enabled) {
	physics_particle_count();
}

#define __lnc__f1173
/// __lnc__f1173()->Any
if (live_enabled) {
	return physics_particle_get_data(argument0,argument1);
} else return undefined;

#define __lnc__f1174
/// __lnc__f1174()->Any
if (live_enabled) {
	return physics_particle_get_data_particle(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1175
/// __lnc__f1175()
if (live_enabled) {
	physics_particle_group_begin(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f1176
/// __lnc__f1176()
if (live_enabled) {
	physics_particle_group_circle(argument0);
}

#define __lnc__f1177
/// __lnc__f1177()
if (live_enabled) {
	physics_particle_group_box(argument0,argument1);
}

#define __lnc__f1178
/// __lnc__f1178()
if (live_enabled) {
	physics_particle_group_polygon();
}

#define __lnc__f1179
/// __lnc__f1179()
if (live_enabled) {
	physics_particle_group_add_point(argument0,argument1);
}

#define __lnc__f1180
/// __lnc__f1180()
if (live_enabled) {
	physics_particle_group_end();
}

#define __lnc__f1181
/// __lnc__f1181()
if (live_enabled) {
	physics_particle_group_join(argument0,argument1);
}

#define __lnc__f1182
/// __lnc__f1182()
if (live_enabled) {
	physics_particle_group_delete(argument0);
}

#define __lnc__f1183
/// __lnc__f1183()
if (live_enabled) {
	physics_particle_group_count(argument0);
}

#define __lnc__f1184
/// __lnc__f1184()->Any
if (live_enabled) {
	return physics_particle_group_get_data(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1185
/// __lnc__f1185()->Any
if (live_enabled) {
	return physics_particle_group_get_mass(argument0);
} else return undefined;

#define __lnc__f1186
/// __lnc__f1186()->Any
if (live_enabled) {
	return physics_particle_group_get_inertia(argument0);
} else return undefined;

#define __lnc__f1187
/// __lnc__f1187()->Any
if (live_enabled) {
	return physics_particle_group_get_centre_x(argument0);
} else return undefined;

#define __lnc__f1188
/// __lnc__f1188()->Any
if (live_enabled) {
	return physics_particle_group_get_centre_y(argument0);
} else return undefined;

#define __lnc__f1189
/// __lnc__f1189()->Any
if (live_enabled) {
	return physics_particle_group_get_vel_x(argument0);
} else return undefined;

#define __lnc__f1190
/// __lnc__f1190()->Any
if (live_enabled) {
	return physics_particle_group_get_vel_y(argument0);
} else return undefined;

#define __lnc__f1191
/// __lnc__f1191()->Any
if (live_enabled) {
	return physics_particle_group_get_ang_vel(argument0);
} else return undefined;

#define __lnc__f1192
/// __lnc__f1192()->Any
if (live_enabled) {
	return physics_particle_group_get_x(argument0);
} else return undefined;

#define __lnc__f1193
/// __lnc__f1193()->Any
if (live_enabled) {
	return physics_particle_group_get_y(argument0);
} else return undefined;

#define __lnc__f1194
/// __lnc__f1194()->Any
if (live_enabled) {
	return physics_particle_group_get_angle(argument0);
} else return undefined;

#define __lnc__f1195
/// __lnc__f1195()
if (live_enabled) {
	physics_particle_set_group_flags(argument0,argument1);
}

#define __lnc__f1196
/// __lnc__f1196()->Any
if (live_enabled) {
	return physics_particle_get_group_flags(argument0);
} else return undefined;

#define __lnc__f1197
/// __lnc__f1197()->Any
if (live_enabled) {
	return physics_particle_get_max_count();
} else return undefined;

#define __lnc__f1198
/// __lnc__f1198()->Any
if (live_enabled) {
	return physics_particle_get_radius();
} else return undefined;

#define __lnc__f1199
/// __lnc__f1199()->Any
if (live_enabled) {
	return physics_particle_get_density();
} else return undefined;

#define __lnc__f1200
/// __lnc__f1200()->Any
if (live_enabled) {
	return physics_particle_get_damping();
} else return undefined;

#define __lnc__f1201
/// __lnc__f1201()->Any
if (live_enabled) {
	return physics_particle_get_gravity_scale();
} else return undefined;

#define __lnc__f1202
/// __lnc__f1202()
if (live_enabled) {
	physics_particle_set_max_count(argument0);
}

#define __lnc__f1203
/// __lnc__f1203()
if (live_enabled) {
	physics_particle_set_radius(argument0);
}

#define __lnc__f1204
/// __lnc__f1204()
if (live_enabled) {
	physics_particle_set_density(argument0);
}

#define __lnc__f1205
/// __lnc__f1205()
if (live_enabled) {
	physics_particle_set_damping(argument0);
}

#define __lnc__f1206
/// __lnc__f1206()
if (live_enabled) {
	physics_particle_set_gravity_scale(argument0);
}

#define __lnc__f1207
/// __lnc__f1207()->Any
if (live_enabled) {
	return buffer_create(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1208
/// __lnc__f1208()
if (live_enabled) {
	buffer_write(argument0,argument1,argument2);
}

#define __lnc__f1209
/// __lnc__f1209()->Any
if (live_enabled) {
	return buffer_read(argument0,argument1);
} else return undefined;

#define __lnc__f1210
/// __lnc__f1210()
if (live_enabled) {
	buffer_seek(argument0,argument1,argument2);
}

#define __lnc__f1211
/// __lnc__f1211()->Any
if (live_enabled) {
	return buffer_get_surface(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1212
/// __lnc__f1212()
if (live_enabled) {
	buffer_set_surface(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1213
/// __lnc__f1213()
if (live_enabled) {
	buffer_delete(argument0);
}

#define __lnc__f1214
/// __lnc__f1214()->Any
if (live_enabled) {
	return buffer_exists(argument0);
} else return undefined;

#define __lnc__f1215
/// __lnc__f1215()->Any
if (live_enabled) {
	return buffer_get_type(argument0);
} else return undefined;

#define __lnc__f1216
/// __lnc__f1216()->Any
if (live_enabled) {
	return buffer_get_alignment(argument0);
} else return undefined;

#define __lnc__f1217
/// __lnc__f1217()
if (live_enabled) {
	buffer_poke(argument0,argument1,argument2,argument3);
}

#define __lnc__f1218
/// __lnc__f1218()->Any
if (live_enabled) {
	return buffer_peek(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1219
/// __lnc__f1219()
if (live_enabled) {
	buffer_save(argument0,argument1);
}

#define __lnc__f1220
/// __lnc__f1220()
if (live_enabled) {
	buffer_save_ext(argument0,argument1,argument2,argument3);
}

#define __lnc__f1221
/// __lnc__f1221()->Any
if (live_enabled) {
	return buffer_load(argument0);
} else return undefined;

#define __lnc__f1222
/// __lnc__f1222()->Any
if (live_enabled) {
	return buffer_load_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1223
/// __lnc__f1223()->Any
if (live_enabled) {
	return buffer_load_partial(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1224
/// __lnc__f1224()
if (live_enabled) {
	buffer_copy(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1225
/// __lnc__f1225()
if (live_enabled) {
	buffer_fill(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1226
/// __lnc__f1226()->Any
if (live_enabled) {
	return buffer_get_size(argument0);
} else return undefined;

#define __lnc__f1227
/// __lnc__f1227()->Any
if (live_enabled) {
	return buffer_tell(argument0);
} else return undefined;

#define __lnc__f1228
/// __lnc__f1228()
if (live_enabled) {
	buffer_resize(argument0,argument1);
}

#define __lnc__f1229
/// __lnc__f1229()->Any
if (live_enabled) {
	return buffer_md5(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1230
/// __lnc__f1230()->Any
if (live_enabled) {
	return buffer_sha1(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1231
/// __lnc__f1231()->Any
if (live_enabled) {
	return buffer_base64_encode(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1232
/// __lnc__f1232()->Any
if (live_enabled) {
	return buffer_base64_decode(argument0);
} else return undefined;

#define __lnc__f1233
/// __lnc__f1233()->Any
if (live_enabled) {
	return buffer_base64_decode_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1234
/// __lnc__f1234()->Any
if (live_enabled) {
	return buffer_sizeof(argument0);
} else return undefined;

#define __lnc__f1235
/// __lnc__f1235()->Any
if (live_enabled) {
	return buffer_get_address(argument0);
} else return undefined;

#define __lnc__f1236
/// __lnc__f1236()->Any
if (live_enabled) {
	return buffer_create_from_vertex_buffer(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1237
/// __lnc__f1237()->Any
if (live_enabled) {
	return buffer_create_from_vertex_buffer_ext(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1238
/// __lnc__f1238()
if (live_enabled) {
	buffer_copy_from_vertex_buffer(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1239
/// __lnc__f1239()
if (live_enabled) {
	buffer_async_group_begin(argument0);
}

#define __lnc__f1240
/// __lnc__f1240()
if (live_enabled) {
	buffer_async_group_option(argument0,argument1);
}

#define __lnc__f1241
/// __lnc__f1241()
if (live_enabled) {
	buffer_async_group_end();
}

#define __lnc__f1242
/// __lnc__f1242()->Any
if (live_enabled) {
	return buffer_load_async(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1243
/// __lnc__f1243()
if (live_enabled) {
	buffer_save_async(argument0,argument1,argument2,argument3);
}

#define __lnc__f1244
/// __lnc__f1244()
if (live_enabled) {
	gml_release_mode(argument0);
}

#define __lnc__f1245
/// __lnc__f1245()
if (live_enabled) {
	steam_activate_overlay(argument0);
}

#define __lnc__f1246
/// __lnc__f1246()->Any
if (live_enabled) {
	return steam_is_overlay_enabled();
} else return undefined;

#define __lnc__f1247
/// __lnc__f1247()->Any
if (live_enabled) {
	return steam_is_overlay_activated();
} else return undefined;

#define __lnc__f1248
/// __lnc__f1248()->Any
if (live_enabled) {
	return steam_get_persona_name();
} else return undefined;

#define __lnc__f1249
/// __lnc__f1249()->Any
if (live_enabled) {
	return steam_initialised();
} else return undefined;

#define __lnc__f1250
/// __lnc__f1250()->Any
if (live_enabled) {
	return steam_is_cloud_enabled_for_app();
} else return undefined;

#define __lnc__f1251
/// __lnc__f1251()->Any
if (live_enabled) {
	return steam_is_cloud_enabled_for_account();
} else return undefined;

#define __lnc__f1252
/// __lnc__f1252()->Any
if (live_enabled) {
	return steam_file_persisted(argument0);
} else return undefined;

#define __lnc__f1253
/// __lnc__f1253()->Any
if (live_enabled) {
	return steam_get_quota_total();
} else return undefined;

#define __lnc__f1254
/// __lnc__f1254()->Any
if (live_enabled) {
	return steam_get_quota_free();
} else return undefined;

#define __lnc__f1255
/// __lnc__f1255()->Any
if (live_enabled) {
	return steam_file_write(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1256
/// __lnc__f1256()->Any
if (live_enabled) {
	return steam_file_write_file(argument0,argument1);
} else return undefined;

#define __lnc__f1257
/// __lnc__f1257()->Any
if (live_enabled) {
	return steam_file_read(argument0);
} else return undefined;

#define __lnc__f1258
/// __lnc__f1258()
if (live_enabled) {
	steam_file_delete(argument0);
}

#define __lnc__f1259
/// __lnc__f1259()->Any
if (live_enabled) {
	return steam_file_exists(argument0);
} else return undefined;

#define __lnc__f1260
/// __lnc__f1260()->Any
if (live_enabled) {
	return steam_file_size(argument0);
} else return undefined;

#define __lnc__f1261
/// __lnc__f1261()
if (live_enabled) {
	steam_file_share(argument0);
}

#define __lnc__f1262
/// __lnc__f1262()->Any
if (live_enabled) {
	return steam_is_screenshot_requested();
} else return undefined;

#define __lnc__f1263
/// __lnc__f1263()
if (live_enabled) {
	steam_send_screenshot(argument0,argument1,argument2);
}

#define __lnc__f1264
/// __lnc__f1264()->Any
if (live_enabled) {
	return steam_is_user_logged_on();
} else return undefined;

#define __lnc__f1265
/// __lnc__f1265()->Any
if (live_enabled) {
	return steam_get_user_steam_id();
} else return undefined;

#define __lnc__f1266
/// __lnc__f1266()->Any
if (live_enabled) {
	return steam_user_owns_dlc(argument0);
} else return undefined;

#define __lnc__f1267
/// __lnc__f1267()->Any
if (live_enabled) {
	return steam_user_installed_dlc(argument0);
} else return undefined;

#define __lnc__f1268
/// __lnc__f1268()
if (live_enabled) {
	steam_set_achievement(argument0);
}

#define __lnc__f1269
/// __lnc__f1269()->Any
if (live_enabled) {
	return steam_get_achievement(argument0);
} else return undefined;

#define __lnc__f1270
/// __lnc__f1270()
if (live_enabled) {
	steam_clear_achievement(argument0);
}

#define __lnc__f1271
/// __lnc__f1271()
if (live_enabled) {
	steam_set_stat_int(argument0,argument1);
}

#define __lnc__f1272
/// __lnc__f1272()
if (live_enabled) {
	steam_set_stat_float(argument0,argument1);
}

#define __lnc__f1273
/// __lnc__f1273()
if (live_enabled) {
	steam_set_stat_avg_rate(argument0,argument1,argument2);
}

#define __lnc__f1274
/// __lnc__f1274()->Any
if (live_enabled) {
	return steam_get_stat_int(argument0);
} else return undefined;

#define __lnc__f1275
/// __lnc__f1275()->Any
if (live_enabled) {
	return steam_get_stat_float(argument0);
} else return undefined;

#define __lnc__f1276
/// __lnc__f1276()->Any
if (live_enabled) {
	return steam_get_stat_avg_rate(argument0);
} else return undefined;

#define __lnc__f1277
/// __lnc__f1277()
if (live_enabled) {
	steam_reset_all_stats();
}

#define __lnc__f1278
/// __lnc__f1278()
if (live_enabled) {
	steam_reset_all_stats_achievements();
}

#define __lnc__f1279
/// __lnc__f1279()->Any
if (live_enabled) {
	return steam_stats_ready();
} else return undefined;

#define __lnc__f1280
/// __lnc__f1280()->Any
if (live_enabled) {
	return steam_create_leaderboard(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1281
/// __lnc__f1281()->Any
if (live_enabled) {
	return steam_upload_score(argument0,argument1);
} else return undefined;

#define __lnc__f1282
/// __lnc__f1282()->Any
if (live_enabled) {
	return steam_upload_score_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1283
/// __lnc__f1283()->Any
if (live_enabled) {
	return steam_download_scores_around_user(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1284
/// __lnc__f1284()->Any
if (live_enabled) {
	return steam_download_scores(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1285
/// __lnc__f1285()->Any
if (live_enabled) {
	return steam_download_friends_scores(argument0);
} else return undefined;

#define __lnc__f1286
/// __lnc__f1286()->Any
if (live_enabled) {
	return steam_upload_score_buffer(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1287
/// __lnc__f1287()->Any
if (live_enabled) {
	return steam_upload_score_buffer_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1288
/// __lnc__f1288()->Any
if (live_enabled) {
	return steam_current_game_language();
} else return undefined;

#define __lnc__f1289
/// __lnc__f1289()->Any
if (live_enabled) {
	return steam_available_languages();
} else return undefined;

#define __lnc__f1290
/// __lnc__f1290()
if (live_enabled) {
	steam_activate_overlay_browser(argument0);
}

#define __lnc__f1291
/// __lnc__f1291()
if (live_enabled) {
	steam_activate_overlay_user(argument0,argument1);
}

#define __lnc__f1292
/// __lnc__f1292()
if (live_enabled) {
	steam_activate_overlay_store(argument0);
}

#define __lnc__f1293
/// __lnc__f1293()->Any
if (live_enabled) {
	return steam_get_user_persona_name(argument0);
} else return undefined;

#define __lnc__f1294
/// __lnc__f1294()->Any
if (live_enabled) {
	return steam_get_app_id();
} else return undefined;

#define __lnc__f1295
/// __lnc__f1295()->Any
if (live_enabled) {
	return steam_get_user_account_id();
} else return undefined;

#define __lnc__f1296
/// __lnc__f1296()->Any
if (live_enabled) {
	return steam_ugc_download(argument0,argument1);
} else return undefined;

#define __lnc__f1297
/// __lnc__f1297()->Any
if (live_enabled) {
	return steam_ugc_create_item(argument0,argument1);
} else return undefined;

#define __lnc__f1298
/// __lnc__f1298()
if (live_enabled) {
	steam_ugc_start_item_update(argument0,argument1);
}

#define __lnc__f1299
/// __lnc__f1299()
if (live_enabled) {
	steam_ugc_set_item_title(argument0,argument1);
}

#define __lnc__f1300
/// __lnc__f1300()
if (live_enabled) {
	steam_ugc_set_item_description(argument0,argument1);
}

#define __lnc__f1301
/// __lnc__f1301()
if (live_enabled) {
	steam_ugc_set_item_visibility(argument0,argument1);
}

#define __lnc__f1302
/// __lnc__f1302()
if (live_enabled) {
	steam_ugc_set_item_tags(argument0,argument1);
}

#define __lnc__f1303
/// __lnc__f1303()
if (live_enabled) {
	steam_ugc_set_item_content(argument0,argument1);
}

#define __lnc__f1304
/// __lnc__f1304()
if (live_enabled) {
	steam_ugc_set_item_preview(argument0,argument1);
}

#define __lnc__f1305
/// __lnc__f1305()->Any
if (live_enabled) {
	return steam_ugc_submit_item_update(argument0,argument1);
} else return undefined;

#define __lnc__f1306
/// __lnc__f1306()->Any
if (live_enabled) {
	return steam_ugc_get_item_update_progress(argument0,argument1);
} else return undefined;

#define __lnc__f1307
/// __lnc__f1307()->Any
if (live_enabled) {
	return steam_ugc_subscribe_item(argument0);
} else return undefined;

#define __lnc__f1308
/// __lnc__f1308()->Any
if (live_enabled) {
	return steam_ugc_unsubscribe_item(argument0);
} else return undefined;

#define __lnc__f1309
/// __lnc__f1309()->Any
if (live_enabled) {
	return steam_ugc_num_subscribed_items();
} else return undefined;

#define __lnc__f1310
/// __lnc__f1310()->Any
if (live_enabled) {
	return steam_ugc_get_subscribed_items(argument0);
} else return undefined;

#define __lnc__f1311
/// __lnc__f1311()->Any
if (live_enabled) {
	return steam_ugc_get_item_install_info(argument0,argument1);
} else return undefined;

#define __lnc__f1312
/// __lnc__f1312()->Any
if (live_enabled) {
	return steam_ugc_get_item_update_info(argument0,argument1);
} else return undefined;

#define __lnc__f1313
/// __lnc__f1313()->Any
if (live_enabled) {
	return steam_ugc_request_item_details(argument0,argument1);
} else return undefined;

#define __lnc__f1314
/// __lnc__f1314()->Any
if (live_enabled) {
	return steam_ugc_create_query_user(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1315
/// __lnc__f1315()->Any
if (live_enabled) {
	return steam_ugc_create_query_user_ex(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1316
/// __lnc__f1316()->Any
if (live_enabled) {
	return steam_ugc_create_query_all(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1317
/// __lnc__f1317()->Any
if (live_enabled) {
	return steam_ugc_create_query_all_ex(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1318
/// __lnc__f1318()->Any
if (live_enabled) {
	return steam_ugc_query_set_cloud_filename_filter(argument0,argument1);
} else return undefined;

#define __lnc__f1319
/// __lnc__f1319()
if (live_enabled) {
	steam_ugc_query_set_match_any_tag(argument0,argument1);
}

#define __lnc__f1320
/// __lnc__f1320()
if (live_enabled) {
	steam_ugc_query_set_search_text(argument0,argument1);
}

#define __lnc__f1321
/// __lnc__f1321()
if (live_enabled) {
	steam_ugc_query_set_ranked_by_trend_days(argument0,argument1);
}

#define __lnc__f1322
/// __lnc__f1322()
if (live_enabled) {
	steam_ugc_query_add_required_tag(argument0,argument1);
}

#define __lnc__f1323
/// __lnc__f1323()
if (live_enabled) {
	steam_ugc_query_add_excluded_tag(argument0,argument1);
}

#define __lnc__f1324
/// __lnc__f1324()
if (live_enabled) {
	steam_ugc_query_set_return_long_description(argument0,argument1);
}

#define __lnc__f1325
/// __lnc__f1325()
if (live_enabled) {
	steam_ugc_query_set_return_total_only(argument0,argument1);
}

#define __lnc__f1326
/// __lnc__f1326()
if (live_enabled) {
	steam_ugc_query_set_allow_cached_response(argument0,argument1);
}

#define __lnc__f1327
/// __lnc__f1327()
if (live_enabled) {
	steam_ugc_send_query(argument0);
}

#define __lnc__f1328
/// __lnc__f1328()
if (live_enabled) {
	shader_set(argument0);
}

#define __lnc__f1329
/// __lnc__f1329()
if (live_enabled) {
	shader_reset();
}

#define __lnc__f1330
/// __lnc__f1330()->Any
if (live_enabled) {
	return shader_current();
} else return undefined;

#define __lnc__f1331
/// __lnc__f1331()->Any
if (live_enabled) {
	return shader_is_compiled(argument0);
} else return undefined;

#define __lnc__f1332
/// __lnc__f1332()->Any
if (live_enabled) {
	return shader_get_sampler_index(argument0,argument1);
} else return undefined;

#define __lnc__f1333
/// __lnc__f1333()->Any
if (live_enabled) {
	return shader_get_uniform(argument0,argument1);
} else return undefined;

#define __lnc__f1334
/// __lnc__f1334()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("shader_set_uniform_i needs at least 2 arguments, got "+string(argument_count));break;
		case 2:shader_set_uniform_i(argument[0],argument[1]);break;
		case 3:shader_set_uniform_i(argument[0],argument[1],argument[2]);break;
		case 4:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f1335
/// __lnc__f1335()
if (live_enabled) {
	shader_set_uniform_i_array(argument0,argument1);
}

#define __lnc__f1336
/// __lnc__f1336()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("shader_set_uniform_f needs at least 2 arguments, got "+string(argument_count));break;
		case 2:shader_set_uniform_f(argument[0],argument[1]);break;
		case 3:shader_set_uniform_f(argument[0],argument[1],argument[2]);break;
		case 4:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f1337
/// __lnc__f1337()
if (live_enabled) {
	shader_set_uniform_f_array(argument0,argument1);
}

#define __lnc__f1338
/// __lnc__f1338()
if (live_enabled) {
	shader_set_uniform_matrix(argument0);
}

#define __lnc__f1339
/// __lnc__f1339()
if (live_enabled) {
	shader_set_uniform_matrix_array(argument0,argument1);
}

#define __lnc__f1340
/// __lnc__f1340()
if (live_enabled) {
	shader_enable_corner_id(argument0);
}

#define __lnc__f1341
/// __lnc__f1341()
if (live_enabled) {
	texture_set_stage(argument0,argument1);
}

#define __lnc__f1342
/// __lnc__f1342()->Any
if (live_enabled) {
	return texture_get_texel_width(argument0);
} else return undefined;

#define __lnc__f1343
/// __lnc__f1343()->Any
if (live_enabled) {
	return texture_get_texel_height(argument0);
} else return undefined;

#define __lnc__f1344
/// __lnc__f1344()->Any
if (live_enabled) {
	return shaders_are_supported();
} else return undefined;

#define __lnc__f1345
/// __lnc__f1345()
if (live_enabled) {
	vertex_format_begin();
}

#define __lnc__f1346
/// __lnc__f1346()
if (live_enabled) {
	vertex_format_end();
}

#define __lnc__f1347
/// __lnc__f1347()
if (live_enabled) {
	vertex_format_delete(argument0);
}

#define __lnc__f1348
/// __lnc__f1348()
if (live_enabled) {
	vertex_format_add_position();
}

#define __lnc__f1349
/// __lnc__f1349()
if (live_enabled) {
	vertex_format_add_position_3d();
}

#define __lnc__f1350
/// __lnc__f1350()
if (live_enabled) {
	vertex_format_add_colour();
}

#define __lnc__f1351
/// __lnc__f1351()
if (live_enabled) {
	vertex_format_add_color();
}

#define __lnc__f1352
/// __lnc__f1352()
if (live_enabled) {
	vertex_format_add_normal();
}

#define __lnc__f1353
/// __lnc__f1353()
if (live_enabled) {
	vertex_format_add_texcoord();
}

#define __lnc__f1354
/// __lnc__f1354()
if (live_enabled) {
	vertex_format_add_custom(argument0,argument1);
}

#define __lnc__f1355
/// __lnc__f1355()->Any
if (live_enabled) {
	return vertex_create_buffer();
} else return undefined;

#define __lnc__f1356
/// __lnc__f1356()->Any
if (live_enabled) {
	return vertex_create_buffer_ext(argument0);
} else return undefined;

#define __lnc__f1357
/// __lnc__f1357()
if (live_enabled) {
	vertex_delete_buffer(argument0);
}

#define __lnc__f1358
/// __lnc__f1358()
if (live_enabled) {
	vertex_begin(argument0,argument1);
}

#define __lnc__f1359
/// __lnc__f1359()
if (live_enabled) {
	vertex_end(argument0);
}

#define __lnc__f1360
/// __lnc__f1360()
if (live_enabled) {
	vertex_position(argument0,argument1,argument2);
}

#define __lnc__f1361
/// __lnc__f1361()
if (live_enabled) {
	vertex_position_3d(argument0,argument1,argument2,argument3);
}

#define __lnc__f1362
/// __lnc__f1362()
if (live_enabled) {
	vertex_colour(argument0,argument1,argument2);
}

#define __lnc__f1363
/// __lnc__f1363()
if (live_enabled) {
	vertex_color(argument0,argument1,argument2);
}

#define __lnc__f1364
/// __lnc__f1364()
if (live_enabled) {
	vertex_argb(argument0,argument1);
}

#define __lnc__f1365
/// __lnc__f1365()
if (live_enabled) {
	vertex_texcoord(argument0,argument1,argument2);
}

#define __lnc__f1366
/// __lnc__f1366()
if (live_enabled) {
	vertex_normal(argument0,argument1,argument2,argument3);
}

#define __lnc__f1367
/// __lnc__f1367()
if (live_enabled) {
	vertex_float1(argument0,argument1);
}

#define __lnc__f1368
/// __lnc__f1368()
if (live_enabled) {
	vertex_float2(argument0,argument1,argument2);
}

#define __lnc__f1369
/// __lnc__f1369()
if (live_enabled) {
	vertex_float3(argument0,argument1,argument2,argument3);
}

#define __lnc__f1370
/// __lnc__f1370()
if (live_enabled) {
	vertex_float4(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1371
/// __lnc__f1371()
if (live_enabled) {
	vertex_ubyte4(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1372
/// __lnc__f1372()
if (live_enabled) {
	vertex_submit(argument0,argument1,argument2);
}

#define __lnc__f1373
/// __lnc__f1373()
if (live_enabled) {
	vertex_freeze(argument0);
}

#define __lnc__f1374
/// __lnc__f1374()->Any
if (live_enabled) {
	return vertex_get_number(argument0);
} else return undefined;

#define __lnc__f1375
/// __lnc__f1375()->Any
if (live_enabled) {
	return vertex_get_buffer_size(argument0);
} else return undefined;

#define __lnc__f1376
/// __lnc__f1376()->Any
if (live_enabled) {
	return vertex_create_buffer_from_buffer(argument0,argument1);
} else return undefined;

#define __lnc__f1377
/// __lnc__f1377()->Any
if (live_enabled) {
	return vertex_create_buffer_from_buffer_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1378
/// __lnc__f1378()
if (live_enabled) {
	draw_skeleton(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1379
/// __lnc__f1379()
if (live_enabled) {
	draw_skeleton_time(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1380
/// __lnc__f1380()
if (live_enabled) {
	draw_skeleton_instance(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1381
/// __lnc__f1381()
if (live_enabled) {
	draw_skeleton_collision(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1382
/// __lnc__f1382()->Any
if (live_enabled) {
	return layer_get_id(argument0);
} else return undefined;

#define __lnc__f1383
/// __lnc__f1383()->Any
if (live_enabled) {
	return layer_get_id_at_depth(argument0);
} else return undefined;

#define __lnc__f1384
/// __lnc__f1384()->Any
if (live_enabled) {
	return layer_get_depth(argument0);
} else return undefined;

#define __lnc__f1385
/// __lnc__f1385()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:return gml_thread_error("layer_create needs at least 2 arguments, got "+string(argument_count));
		case 2:return layer_create(argument[0],argument[1]);
		case 3:return layer_create(argument[0],argument[1],argument[2]);
		case 4:return layer_create(argument[0],argument[1],argument[2],argument[3]);
		case 5:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return layer_create(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f1386
/// __lnc__f1386()
if (live_enabled) {
	layer_destroy(argument0);
}

#define __lnc__f1387
/// __lnc__f1387()
if (live_enabled) {
	layer_destroy_instances(argument0);
}

#define __lnc__f1388
/// __lnc__f1388()
if (live_enabled) {
	layer_add_instance(argument0,argument1);
}

#define __lnc__f1389
/// __lnc__f1389()
if (live_enabled) {
	layer_has_instance(argument0,argument1);
}

#define __lnc__f1390
/// __lnc__f1390()
if (live_enabled) {
	layer_set_visible(argument0,argument1);
}

#define __lnc__f1391
/// __lnc__f1391()->Any
if (live_enabled) {
	return layer_get_visible(argument0);
} else return undefined;

#define __lnc__f1392
/// __lnc__f1392()->Any
if (live_enabled) {
	return layer_exists(argument0);
} else return undefined;

#define __lnc__f1393
/// __lnc__f1393()
if (live_enabled) {
	layer_x(argument0,argument1);
}

#define __lnc__f1394
/// __lnc__f1394()
if (live_enabled) {
	layer_y(argument0,argument1);
}

#define __lnc__f1395
/// __lnc__f1395()->Any
if (live_enabled) {
	return layer_get_x(argument0);
} else return undefined;

#define __lnc__f1396
/// __lnc__f1396()->Any
if (live_enabled) {
	return layer_get_y(argument0);
} else return undefined;

#define __lnc__f1397
/// __lnc__f1397()
if (live_enabled) {
	layer_hspeed(argument0,argument1);
}

#define __lnc__f1398
/// __lnc__f1398()
if (live_enabled) {
	layer_vspeed(argument0,argument1);
}

#define __lnc__f1399
/// __lnc__f1399()->Any
if (live_enabled) {
	return layer_get_hspeed(argument0);
} else return undefined;

#define __lnc__f1400
/// __lnc__f1400()->Any
if (live_enabled) {
	return layer_get_vspeed(argument0);
} else return undefined;

#define __lnc__f1401
/// __lnc__f1401()
if (live_enabled) {
	layer_script_begin(argument0,argument1);
}

#define __lnc__f1402
/// __lnc__f1402()
if (live_enabled) {
	layer_script_end(argument0,argument1);
}

#define __lnc__f1403
/// __lnc__f1403()
if (live_enabled) {
	layer_shader(argument0,argument1);
}

#define __lnc__f1404
/// __lnc__f1404()->Any
if (live_enabled) {
	return layer_get_script_begin(argument0);
} else return undefined;

#define __lnc__f1405
/// __lnc__f1405()->Any
if (live_enabled) {
	return layer_get_script_end(argument0);
} else return undefined;

#define __lnc__f1406
/// __lnc__f1406()->Any
if (live_enabled) {
	return layer_get_shader(argument0);
} else return undefined;

#define __lnc__f1407
/// __lnc__f1407()
if (live_enabled) {
	layer_set_target_room(argument0);
}

#define __lnc__f1408
/// __lnc__f1408()->Any
if (live_enabled) {
	return layer_get_target_room();
} else return undefined;

#define __lnc__f1409
/// __lnc__f1409()
if (live_enabled) {
	layer_reset_target_room();
}

#define __lnc__f1410
/// __lnc__f1410()->Any
if (live_enabled) {
	return layer_get_all();
} else return undefined;

#define __lnc__f1411
/// __lnc__f1411()->Any
if (live_enabled) {
	return layer_get_all_elements(argument0);
} else return undefined;

#define __lnc__f1412
/// __lnc__f1412()->Any
if (live_enabled) {
	return layer_get_name(argument0);
} else return undefined;

#define __lnc__f1413
/// __lnc__f1413()
if (live_enabled) {
	layer_depth(argument0,argument1);
}

#define __lnc__f1414
/// __lnc__f1414()->Any
if (live_enabled) {
	return layer_get_element_layer(argument0);
} else return undefined;

#define __lnc__f1415
/// __lnc__f1415()->Any
if (live_enabled) {
	return layer_get_element_type(argument0);
} else return undefined;

#define __lnc__f1416
/// __lnc__f1416()
if (live_enabled) {
	layer_element_move(argument0,argument1);
}

#define __lnc__f1417
/// __lnc__f1417()
if (live_enabled) {
	layer_force_draw_depth(argument0,argument1);
}

#define __lnc__f1418
/// __lnc__f1418()->Any
if (live_enabled) {
	return layer_is_draw_depth_forced();
} else return undefined;

#define __lnc__f1419
/// __lnc__f1419()->Any
if (live_enabled) {
	return layer_get_forced_depth();
} else return undefined;

#define __lnc__f1420
/// __lnc__f1420()->Any
if (live_enabled) {
	return layer_background_get_id(argument0);
} else return undefined;

#define __lnc__f1421
/// __lnc__f1421()->Any
if (live_enabled) {
	return layer_background_exists(argument0,argument1);
} else return undefined;

#define __lnc__f1422
/// __lnc__f1422()->Any
if (live_enabled) {
	return layer_background_create(argument0,argument1);
} else return undefined;

#define __lnc__f1423
/// __lnc__f1423()
if (live_enabled) {
	layer_background_destroy(argument0);
}

#define __lnc__f1424
/// __lnc__f1424()
if (live_enabled) {
	layer_background_visible(argument0,argument1);
}

#define __lnc__f1425
/// __lnc__f1425()
if (live_enabled) {
	layer_background_change(argument0,argument1);
}

#define __lnc__f1426
/// __lnc__f1426()
if (live_enabled) {
	layer_background_sprite(argument0,argument1);
}

#define __lnc__f1427
/// __lnc__f1427()
if (live_enabled) {
	layer_background_htiled(argument0,argument1);
}

#define __lnc__f1428
/// __lnc__f1428()
if (live_enabled) {
	layer_background_vtiled(argument0,argument1);
}

#define __lnc__f1429
/// __lnc__f1429()
if (live_enabled) {
	layer_background_stretch(argument0,argument1);
}

#define __lnc__f1430
/// __lnc__f1430()
if (live_enabled) {
	layer_background_yscale(argument0,argument1);
}

#define __lnc__f1431
/// __lnc__f1431()
if (live_enabled) {
	layer_background_xscale(argument0,argument1);
}

#define __lnc__f1432
/// __lnc__f1432()
if (live_enabled) {
	layer_background_blend(argument0,argument1);
}

#define __lnc__f1433
/// __lnc__f1433()
if (live_enabled) {
	layer_background_alpha(argument0,argument1);
}

#define __lnc__f1434
/// __lnc__f1434()
if (live_enabled) {
	layer_background_index(argument0,argument1);
}

#define __lnc__f1435
/// __lnc__f1435()
if (live_enabled) {
	layer_background_speed(argument0,argument1);
}

#define __lnc__f1436
/// __lnc__f1436()->Any
if (live_enabled) {
	return layer_background_get_visible(argument0);
} else return undefined;

#define __lnc__f1437
/// __lnc__f1437()->Any
if (live_enabled) {
	return layer_background_get_sprite(argument0);
} else return undefined;

#define __lnc__f1438
/// __lnc__f1438()->Any
if (live_enabled) {
	return layer_background_get_htiled(argument0);
} else return undefined;

#define __lnc__f1439
/// __lnc__f1439()->Any
if (live_enabled) {
	return layer_background_get_vtiled(argument0);
} else return undefined;

#define __lnc__f1440
/// __lnc__f1440()->Any
if (live_enabled) {
	return layer_background_get_stretch(argument0);
} else return undefined;

#define __lnc__f1441
/// __lnc__f1441()->Any
if (live_enabled) {
	return layer_background_get_yscale(argument0);
} else return undefined;

#define __lnc__f1442
/// __lnc__f1442()->Any
if (live_enabled) {
	return layer_background_get_xscale(argument0);
} else return undefined;

#define __lnc__f1443
/// __lnc__f1443()->Any
if (live_enabled) {
	return layer_background_get_blend(argument0);
} else return undefined;

#define __lnc__f1444
/// __lnc__f1444()->Any
if (live_enabled) {
	return layer_background_get_alpha(argument0);
} else return undefined;

#define __lnc__f1445
/// __lnc__f1445()->Any
if (live_enabled) {
	return layer_background_get_index(argument0);
} else return undefined;

#define __lnc__f1446
/// __lnc__f1446()->Any
if (live_enabled) {
	return layer_background_get_speed(argument0);
} else return undefined;

#define __lnc__f1447
/// __lnc__f1447()->Any
if (live_enabled) {
	return layer_sprite_get_id(argument0,argument1);
} else return undefined;

#define __lnc__f1448
/// __lnc__f1448()->Any
if (live_enabled) {
	return layer_sprite_exists(argument0,argument1);
} else return undefined;

#define __lnc__f1449
/// __lnc__f1449()->Any
if (live_enabled) {
	return layer_sprite_create(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1450
/// __lnc__f1450()
if (live_enabled) {
	layer_sprite_destroy(argument0);
}

#define __lnc__f1451
/// __lnc__f1451()
if (live_enabled) {
	layer_sprite_change(argument0,argument1);
}

#define __lnc__f1452
/// __lnc__f1452()
if (live_enabled) {
	layer_sprite_index(argument0,argument1);
}

#define __lnc__f1453
/// __lnc__f1453()
if (live_enabled) {
	layer_sprite_speed(argument0,argument1);
}

#define __lnc__f1454
/// __lnc__f1454()
if (live_enabled) {
	layer_sprite_xscale(argument0,argument1);
}

#define __lnc__f1455
/// __lnc__f1455()
if (live_enabled) {
	layer_sprite_yscale(argument0,argument1);
}

#define __lnc__f1456
/// __lnc__f1456()
if (live_enabled) {
	layer_sprite_angle(argument0,argument1);
}

#define __lnc__f1457
/// __lnc__f1457()
if (live_enabled) {
	layer_sprite_blend(argument0,argument1);
}

#define __lnc__f1458
/// __lnc__f1458()
if (live_enabled) {
	layer_sprite_alpha(argument0,argument1);
}

#define __lnc__f1459
/// __lnc__f1459()
if (live_enabled) {
	layer_sprite_x(argument0,argument1);
}

#define __lnc__f1460
/// __lnc__f1460()
if (live_enabled) {
	layer_sprite_y(argument0,argument1);
}

#define __lnc__f1461
/// __lnc__f1461()->Any
if (live_enabled) {
	return layer_sprite_get_sprite(argument0);
} else return undefined;

#define __lnc__f1462
/// __lnc__f1462()->Any
if (live_enabled) {
	return layer_sprite_get_index(argument0);
} else return undefined;

#define __lnc__f1463
/// __lnc__f1463()->Any
if (live_enabled) {
	return layer_sprite_get_speed(argument0);
} else return undefined;

#define __lnc__f1464
/// __lnc__f1464()->Any
if (live_enabled) {
	return layer_sprite_get_xscale(argument0);
} else return undefined;

#define __lnc__f1465
/// __lnc__f1465()->Any
if (live_enabled) {
	return layer_sprite_get_yscale(argument0);
} else return undefined;

#define __lnc__f1466
/// __lnc__f1466()->Any
if (live_enabled) {
	return layer_sprite_get_angle(argument0);
} else return undefined;

#define __lnc__f1467
/// __lnc__f1467()->Any
if (live_enabled) {
	return layer_sprite_get_blend(argument0);
} else return undefined;

#define __lnc__f1468
/// __lnc__f1468()->Any
if (live_enabled) {
	return layer_sprite_get_alpha(argument0);
} else return undefined;

#define __lnc__f1469
/// __lnc__f1469()->Any
if (live_enabled) {
	return layer_sprite_get_x(argument0);
} else return undefined;

#define __lnc__f1470
/// __lnc__f1470()->Any
if (live_enabled) {
	return layer_sprite_get_y(argument0);
} else return undefined;

#define __lnc__f1471
/// __lnc__f1471()->Any
if (live_enabled) {
	return layer_tilemap_get_id(argument0);
} else return undefined;

#define __lnc__f1472
/// __lnc__f1472()->Any
if (live_enabled) {
	return layer_tilemap_exists(argument0,argument1);
} else return undefined;

#define __lnc__f1473
/// __lnc__f1473()->Any
if (live_enabled) {
	return layer_tilemap_create(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f1474
/// __lnc__f1474()
if (live_enabled) {
	layer_tilemap_destroy(argument0);
}

#define __lnc__f1475
/// __lnc__f1475()
if (live_enabled) {
	tilemap_tileset(argument0,argument1);
}

#define __lnc__f1476
/// __lnc__f1476()
if (live_enabled) {
	tilemap_x(argument0,argument1);
}

#define __lnc__f1477
/// __lnc__f1477()
if (live_enabled) {
	tilemap_y(argument0,argument1);
}

#define __lnc__f1478
/// __lnc__f1478()
if (live_enabled) {
	tilemap_set(argument0,argument1,argument2,argument3);
}

#define __lnc__f1479
/// __lnc__f1479()
if (live_enabled) {
	tilemap_set_at_pixel(argument0,argument1,argument2,argument3);
}

#define __lnc__f1480
/// __lnc__f1480()->Any
if (live_enabled) {
	return tilemap_get_tileset(argument0);
} else return undefined;

#define __lnc__f1481
/// __lnc__f1481()->Any
if (live_enabled) {
	return tilemap_get_tile_width(argument0);
} else return undefined;

#define __lnc__f1482
/// __lnc__f1482()->Any
if (live_enabled) {
	return tilemap_get_tile_height(argument0);
} else return undefined;

#define __lnc__f1483
/// __lnc__f1483()->Any
if (live_enabled) {
	return tilemap_get_width(argument0);
} else return undefined;

#define __lnc__f1484
/// __lnc__f1484()->Any
if (live_enabled) {
	return tilemap_get_height(argument0);
} else return undefined;

#define __lnc__f1485
/// __lnc__f1485()->Any
if (live_enabled) {
	return tilemap_get_x(argument0);
} else return undefined;

#define __lnc__f1486
/// __lnc__f1486()->Any
if (live_enabled) {
	return tilemap_get_y(argument0);
} else return undefined;

#define __lnc__f1487
/// __lnc__f1487()->Any
if (live_enabled) {
	return tilemap_get(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1488
/// __lnc__f1488()->Any
if (live_enabled) {
	return tilemap_get_at_pixel(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1489
/// __lnc__f1489()->Any
if (live_enabled) {
	return tilemap_get_cell_x_at_pixel(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1490
/// __lnc__f1490()->Any
if (live_enabled) {
	return tilemap_get_cell_y_at_pixel(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1491
/// __lnc__f1491()
if (live_enabled) {
	tilemap_clear(argument0,argument1);
}

#define __lnc__f1492
/// __lnc__f1492()
if (live_enabled) {
	draw_tilemap(argument0,argument1,argument2);
}

#define __lnc__f1493
/// __lnc__f1493()
if (live_enabled) {
	draw_tile(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1494
/// __lnc__f1494()
if (live_enabled) {
	tilemap_set_global_mask(argument0);
}

#define __lnc__f1495
/// __lnc__f1495()->Any
if (live_enabled) {
	return tilemap_get_global_mask();
} else return undefined;

#define __lnc__f1496
/// __lnc__f1496()
if (live_enabled) {
	tilemap_set_mask(argument0,argument1);
}

#define __lnc__f1497
/// __lnc__f1497()->Any
if (live_enabled) {
	return tilemap_get_mask(argument0);
} else return undefined;

#define __lnc__f1498
/// __lnc__f1498()->Any
if (live_enabled) {
	return tilemap_get_frame(argument0);
} else return undefined;

#define __lnc__f1499
/// __lnc__f1499()
if (live_enabled) {
	tile_set_empty(argument0);
}

#define __lnc__f1500
/// __lnc__f1500()
if (live_enabled) {
	tile_set_index(argument0,argument1);
}

#define __lnc__f1501
/// __lnc__f1501()
if (live_enabled) {
	tile_set_flip(argument0,argument1);
}

#define __lnc__f1502
/// __lnc__f1502()
if (live_enabled) {
	tile_set_mirror(argument0,argument1);
}

#define __lnc__f1503
/// __lnc__f1503()
if (live_enabled) {
	tile_set_rotate(argument0,argument1);
}

#define __lnc__f1504
/// __lnc__f1504()->Any
if (live_enabled) {
	return tile_get_empty(argument0);
} else return undefined;

#define __lnc__f1505
/// __lnc__f1505()->Any
if (live_enabled) {
	return tile_get_index(argument0);
} else return undefined;

#define __lnc__f1506
/// __lnc__f1506()->Any
if (live_enabled) {
	return tile_get_flip(argument0);
} else return undefined;

#define __lnc__f1507
/// __lnc__f1507()->Any
if (live_enabled) {
	return tile_get_mirror(argument0);
} else return undefined;

#define __lnc__f1508
/// __lnc__f1508()->Any
if (live_enabled) {
	return tile_get_rotate(argument0);
} else return undefined;

#define __lnc__f1509
/// __lnc__f1509()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:return gml_thread_error("layer_tile_exists needs at least 2 arguments, got "+string(argument_count));
		case 2:return layer_tile_exists(argument[0],argument[1]);
		case 3:return layer_tile_exists(argument[0],argument[1],argument[2]);
		case 4:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3]);
		case 5:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return layer_tile_exists(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f1510
/// __lnc__f1510()->Any
if (live_enabled) {
	return layer_tile_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1511
/// __lnc__f1511()
if (live_enabled) {
	layer_tile_destroy(argument0);
}

#define __lnc__f1512
/// __lnc__f1512()
if (live_enabled) {
	layer_tile_change(argument0,argument1);
}

#define __lnc__f1513
/// __lnc__f1513()
if (live_enabled) {
	layer_tile_xscale(argument0,argument1);
}

#define __lnc__f1514
/// __lnc__f1514()
if (live_enabled) {
	layer_tile_yscale(argument0,argument1);
}

#define __lnc__f1515
/// __lnc__f1515()
if (live_enabled) {
	layer_tile_blend(argument0,argument1);
}

#define __lnc__f1516
/// __lnc__f1516()
if (live_enabled) {
	layer_tile_alpha(argument0,argument1);
}

#define __lnc__f1517
/// __lnc__f1517()
if (live_enabled) {
	layer_tile_x(argument0,argument1);
}

#define __lnc__f1518
/// __lnc__f1518()
if (live_enabled) {
	layer_tile_y(argument0,argument1);
}

#define __lnc__f1519
/// __lnc__f1519()
if (live_enabled) {
	layer_tile_region(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1520
/// __lnc__f1520()
if (live_enabled) {
	layer_tile_visible(argument0,argument1);
}

#define __lnc__f1521
/// __lnc__f1521()->Any
if (live_enabled) {
	return layer_tile_get_sprite(argument0);
} else return undefined;

#define __lnc__f1522
/// __lnc__f1522()->Any
if (live_enabled) {
	return layer_tile_get_xscale(argument0);
} else return undefined;

#define __lnc__f1523
/// __lnc__f1523()->Any
if (live_enabled) {
	return layer_tile_get_yscale(argument0);
} else return undefined;

#define __lnc__f1524
/// __lnc__f1524()->Any
if (live_enabled) {
	return layer_tile_get_blend(argument0);
} else return undefined;

#define __lnc__f1525
/// __lnc__f1525()->Any
if (live_enabled) {
	return layer_tile_get_alpha(argument0);
} else return undefined;

#define __lnc__f1526
/// __lnc__f1526()->Any
if (live_enabled) {
	return layer_tile_get_x(argument0);
} else return undefined;

#define __lnc__f1527
/// __lnc__f1527()->Any
if (live_enabled) {
	return layer_tile_get_y(argument0);
} else return undefined;

#define __lnc__f1528
/// __lnc__f1528()->Any
if (live_enabled) {
	return layer_tile_get_region(argument0);
} else return undefined;

#define __lnc__f1529
/// __lnc__f1529()->Any
if (live_enabled) {
	return layer_tile_get_visible(argument0);
} else return undefined;

#define __lnc__f1530
/// __lnc__f1530()->Any
if (live_enabled) {
	return layer_instance_get_instance(argument0);
} else return undefined;

#define __lnc__f1531
/// __lnc__f1531()
if (live_enabled) {
	instance_activate_layer(argument0);
}

#define __lnc__f1532
/// __lnc__f1532()
if (live_enabled) {
	instance_deactivate_layer(argument0);
}

#define __lnc__f1533
/// __lnc__f1533()->Any
if (live_enabled) {
	return camera_create();
} else return undefined;

#define __lnc__f1534
/// __lnc__f1534()->Any
if (live_enabled) {
	return camera_create_view(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
} else return undefined;

#define __lnc__f1535
/// __lnc__f1535()
if (live_enabled) {
	camera_destroy(argument0);
}

#define __lnc__f1536
/// __lnc__f1536()
if (live_enabled) {
	camera_apply(argument0);
}

#define __lnc__f1537
/// __lnc__f1537()->Any
if (live_enabled) {
	return camera_get_active();
} else return undefined;

#define __lnc__f1538
/// __lnc__f1538()->Any
if (live_enabled) {
	return camera_get_default();
} else return undefined;

#define __lnc__f1539
/// __lnc__f1539()
if (live_enabled) {
	camera_set_default(argument0);
}

#define __lnc__f1540
/// __lnc__f1540()
if (live_enabled) {
	camera_set_view_mat(argument0,argument1);
}

#define __lnc__f1541
/// __lnc__f1541()
if (live_enabled) {
	camera_set_proj_mat(argument0,argument1);
}

#define __lnc__f1542
/// __lnc__f1542()
if (live_enabled) {
	camera_set_update_script(argument0,argument1);
}

#define __lnc__f1543
/// __lnc__f1543()
if (live_enabled) {
	camera_set_begin_script(argument0,argument1);
}

#define __lnc__f1544
/// __lnc__f1544()
if (live_enabled) {
	camera_set_end_script(argument0,argument1);
}

#define __lnc__f1545
/// __lnc__f1545()
if (live_enabled) {
	camera_set_view_pos(argument0,argument1,argument2);
}

#define __lnc__f1546
/// __lnc__f1546()
if (live_enabled) {
	camera_set_view_size(argument0,argument1,argument2);
}

#define __lnc__f1547
/// __lnc__f1547()
if (live_enabled) {
	camera_set_view_speed(argument0,argument1,argument2);
}

#define __lnc__f1548
/// __lnc__f1548()
if (live_enabled) {
	camera_set_view_border(argument0,argument1,argument2);
}

#define __lnc__f1549
/// __lnc__f1549()
if (live_enabled) {
	camera_set_view_angle(argument0,argument1);
}

#define __lnc__f1550
/// __lnc__f1550()
if (live_enabled) {
	camera_set_view_target(argument0,argument1);
}

#define __lnc__f1551
/// __lnc__f1551()->Any
if (live_enabled) {
	return camera_get_view_mat(argument0);
} else return undefined;

#define __lnc__f1552
/// __lnc__f1552()->Any
if (live_enabled) {
	return camera_get_proj_mat(argument0);
} else return undefined;

#define __lnc__f1553
/// __lnc__f1553()->Any
if (live_enabled) {
	return camera_get_update_script(argument0);
} else return undefined;

#define __lnc__f1554
/// __lnc__f1554()->Any
if (live_enabled) {
	return camera_get_begin_script(argument0);
} else return undefined;

#define __lnc__f1555
/// __lnc__f1555()->Any
if (live_enabled) {
	return camera_get_end_script(argument0);
} else return undefined;

#define __lnc__f1556
/// __lnc__f1556()->Any
if (live_enabled) {
	return camera_get_view_x(argument0);
} else return undefined;

#define __lnc__f1557
/// __lnc__f1557()->Any
if (live_enabled) {
	return camera_get_view_y(argument0);
} else return undefined;

#define __lnc__f1558
/// __lnc__f1558()->Any
if (live_enabled) {
	return camera_get_view_width(argument0);
} else return undefined;

#define __lnc__f1559
/// __lnc__f1559()->Any
if (live_enabled) {
	return camera_get_view_height(argument0);
} else return undefined;

#define __lnc__f1560
/// __lnc__f1560()->Any
if (live_enabled) {
	return camera_get_view_speed_x(argument0);
} else return undefined;

#define __lnc__f1561
/// __lnc__f1561()->Any
if (live_enabled) {
	return camera_get_view_speed_y(argument0);
} else return undefined;

#define __lnc__f1562
/// __lnc__f1562()->Any
if (live_enabled) {
	return camera_get_view_border_x(argument0);
} else return undefined;

#define __lnc__f1563
/// __lnc__f1563()->Any
if (live_enabled) {
	return camera_get_view_border_y(argument0);
} else return undefined;

#define __lnc__f1564
/// __lnc__f1564()->Any
if (live_enabled) {
	return camera_get_view_angle(argument0);
} else return undefined;

#define __lnc__f1565
/// __lnc__f1565()->Any
if (live_enabled) {
	return camera_get_view_target(argument0);
} else return undefined;

#define __lnc__f1566
/// __lnc__f1566()->Any
if (live_enabled) {
	return view_get_camera(argument0);
} else return undefined;

#define __lnc__f1567
/// __lnc__f1567()->Any
if (live_enabled) {
	return view_get_visible(argument0);
} else return undefined;

#define __lnc__f1568
/// __lnc__f1568()->Any
if (live_enabled) {
	return view_get_xport(argument0);
} else return undefined;

#define __lnc__f1569
/// __lnc__f1569()->Any
if (live_enabled) {
	return view_get_yport(argument0);
} else return undefined;

#define __lnc__f1570
/// __lnc__f1570()->Any
if (live_enabled) {
	return view_get_wport(argument0);
} else return undefined;

#define __lnc__f1571
/// __lnc__f1571()->Any
if (live_enabled) {
	return view_get_hport(argument0);
} else return undefined;

#define __lnc__f1572
/// __lnc__f1572()->Any
if (live_enabled) {
	return view_get_surface_id(argument0);
} else return undefined;

#define __lnc__f1573
/// __lnc__f1573()
if (live_enabled) {
	view_set_camera(argument0,argument1);
}

#define __lnc__f1574
/// __lnc__f1574()
if (live_enabled) {
	view_set_visible(argument0,argument1);
}

#define __lnc__f1575
/// __lnc__f1575()
if (live_enabled) {
	view_set_xport(argument0,argument1);
}

#define __lnc__f1576
/// __lnc__f1576()
if (live_enabled) {
	view_set_yport(argument0,argument1);
}

#define __lnc__f1577
/// __lnc__f1577()
if (live_enabled) {
	view_set_wport(argument0,argument1);
}

#define __lnc__f1578
/// __lnc__f1578()
if (live_enabled) {
	view_set_hport(argument0,argument1);
}

#define __lnc__f1579
/// __lnc__f1579()
if (live_enabled) {
	view_set_surface_id(argument0,argument1);
}

#define __lnc__f1580
/// __lnc__f1580()
if (live_enabled) {
	gesture_drag_time(argument0);
}

#define __lnc__f1581
/// __lnc__f1581()
if (live_enabled) {
	gesture_drag_distance(argument0);
}

#define __lnc__f1582
/// __lnc__f1582()
if (live_enabled) {
	gesture_flick_speed(argument0);
}

#define __lnc__f1583
/// __lnc__f1583()
if (live_enabled) {
	gesture_double_tap_time(argument0);
}

#define __lnc__f1584
/// __lnc__f1584()
if (live_enabled) {
	gesture_double_tap_distance(argument0);
}

#define __lnc__f1585
/// __lnc__f1585()
if (live_enabled) {
	gesture_pinch_distance(argument0);
}

#define __lnc__f1586
/// __lnc__f1586()
if (live_enabled) {
	gesture_pinch_angle_towards(argument0);
}

#define __lnc__f1587
/// __lnc__f1587()
if (live_enabled) {
	gesture_pinch_angle_away(argument0);
}

#define __lnc__f1588
/// __lnc__f1588()
if (live_enabled) {
	gesture_rotate_time(argument0);
}

#define __lnc__f1589
/// __lnc__f1589()
if (live_enabled) {
	gesture_rotate_angle(argument0);
}

#define __lnc__f1590
/// __lnc__f1590()
if (live_enabled) {
	gesture_tap_count(argument0);
}

#define __lnc__f1591
/// __lnc__f1591()->Any
if (live_enabled) {
	return gesture_get_drag_time();
} else return undefined;

#define __lnc__f1592
/// __lnc__f1592()->Any
if (live_enabled) {
	return gesture_get_drag_distance();
} else return undefined;

#define __lnc__f1593
/// __lnc__f1593()->Any
if (live_enabled) {
	return gesture_get_flick_speed();
} else return undefined;

#define __lnc__f1594
/// __lnc__f1594()->Any
if (live_enabled) {
	return gesture_get_double_tap_time();
} else return undefined;

#define __lnc__f1595
/// __lnc__f1595()->Any
if (live_enabled) {
	return gesture_get_double_tap_distance();
} else return undefined;

#define __lnc__f1596
/// __lnc__f1596()->Any
if (live_enabled) {
	return gesture_get_pinch_distance();
} else return undefined;

#define __lnc__f1597
/// __lnc__f1597()->Any
if (live_enabled) {
	return gesture_get_pinch_angle_towards();
} else return undefined;

#define __lnc__f1598
/// __lnc__f1598()->Any
if (live_enabled) {
	return gesture_get_pinch_angle_away();
} else return undefined;

#define __lnc__f1599
/// __lnc__f1599()->Any
if (live_enabled) {
	return gesture_get_rotate_time();
} else return undefined;

#define __lnc__f1600
/// __lnc__f1600()->Any
if (live_enabled) {
	return gesture_get_rotate_angle();
} else return undefined;

#define __lnc__f1601
/// __lnc__f1601()->Any
if (live_enabled) {
	return gesture_get_tap_count();
} else return undefined;

#define __lnc__f1602
/// __lnc__f1602(...args2:Any)->Any
if (live_enabled) {
	if(argument[0]){
		room_speed = argument[1];
		return undefined;
	} else return room_speed;
} else return undefined;

#define __lnc__f1603
/// __lnc__f1603()->Any
if (live_enabled) {
	return fps;
} else return undefined;

#define __lnc__f1604
/// __lnc__f1604()->Any
if (live_enabled) {
	return fps_real;
} else return undefined;

#define __lnc__f1605
/// __lnc__f1605()->Any
if (live_enabled) {
	return current_time;
} else return undefined;

#define __lnc__f1606
/// __lnc__f1606()->Any
if (live_enabled) {
	return current_year;
} else return undefined;

#define __lnc__f1607
/// __lnc__f1607()->Any
if (live_enabled) {
	return current_month;
} else return undefined;

#define __lnc__f1608
/// __lnc__f1608()->Any
if (live_enabled) {
	return current_day;
} else return undefined;

#define __lnc__f1609
/// __lnc__f1609()->Any
if (live_enabled) {
	return current_weekday;
} else return undefined;

#define __lnc__f1610
/// __lnc__f1610()->Any
if (live_enabled) {
	return current_hour;
} else return undefined;

#define __lnc__f1611
/// __lnc__f1611()->Any
if (live_enabled) {
	return current_minute;
} else return undefined;

#define __lnc__f1612
/// __lnc__f1612()->Any
if (live_enabled) {
	return current_second;
} else return undefined;

#define __lnc__f1613
/// __lnc__f1613()->Any
if (live_enabled) {
	return room;
} else return undefined;

#define __lnc__f1614
/// __lnc__f1614()->Any
if (live_enabled) {
	return room_first;
} else return undefined;

#define __lnc__f1615
/// __lnc__f1615()->Any
if (live_enabled) {
	return room_last;
} else return undefined;

#define __lnc__f1616
/// __lnc__f1616()->Any
if (live_enabled) {
	return room_width;
} else return undefined;

#define __lnc__f1617
/// __lnc__f1617()->Any
if (live_enabled) {
	return room_height;
} else return undefined;

#define __lnc__f1618
/// __lnc__f1618(...args3:Any)->Any
if (live_enabled) {
	if(argument[0]){
		room_persistent = argument[1];
		return undefined;
	} else return room_persistent;
} else return undefined;

#define __lnc__f1619
/// __lnc__f1619(...args4:Any)->Any
if (live_enabled) {
	if(argument[0]){
		score = argument[1];
		return undefined;
	} else return score;
} else return undefined;

#define __lnc__f1620
/// __lnc__f1620(...args5:Any)->Any
if (live_enabled) {
	if(argument[0]){
		lives = argument[1];
		return undefined;
	} else return lives;
} else return undefined;

#define __lnc__f1621
/// __lnc__f1621(...args6:Any)->Any
if (live_enabled) {
	if(argument[0]){
		health = argument[1];
		return undefined;
	} else return health;
} else return undefined;

#define __lnc__f1622
/// __lnc__f1622()->Any
if (live_enabled) {
	return event_type;
} else return undefined;

#define __lnc__f1623
/// __lnc__f1623()->Any
if (live_enabled) {
	return event_number;
} else return undefined;

#define __lnc__f1624
/// __lnc__f1624()->Any
if (live_enabled) {
	return event_object;
} else return undefined;

#define __lnc__f1625
/// __lnc__f1625()->Any
if (live_enabled) {
	return event_action;
} else return undefined;

#define __lnc__f1626
/// __lnc__f1626()->Any
if (live_enabled) {
	return application_surface;
} else return undefined;

#define __lnc__f1627
/// __lnc__f1627()->Any
if (live_enabled) {
	return debug_mode;
} else return undefined;

#define __lnc__f1628
/// __lnc__f1628(...args7:Any)->Any
if (live_enabled) {
	if(argument[0]){
		font_texture_page_size = argument[1];
		return undefined;
	} else return font_texture_page_size;
} else return undefined;

#define __lnc__f1629
/// __lnc__f1629(...args8:Any)->Any
if (live_enabled) {
	if(argument[0]){
		keyboard_key = argument[1];
		return undefined;
	} else return keyboard_key;
} else return undefined;

#define __lnc__f1630
/// __lnc__f1630(...args9:Any)->Any
if (live_enabled) {
	if(argument[0]){
		keyboard_lastkey = argument[1];
		return undefined;
	} else return keyboard_lastkey;
} else return undefined;

#define __lnc__f1631
/// __lnc__f1631(...args10:Any)->Any
if (live_enabled) {
	if(argument[0]){
		keyboard_lastchar = argument[1];
		return undefined;
	} else return keyboard_lastchar;
} else return undefined;

#define __lnc__f1632
/// __lnc__f1632(...args11:Any)->Any
if (live_enabled) {
	if(argument[0]){
		keyboard_string = argument[1];
		return undefined;
	} else return keyboard_string;
} else return undefined;

#define __lnc__f1633
/// __lnc__f1633()->Any
if (live_enabled) {
	return mouse_x;
} else return undefined;

#define __lnc__f1634
/// __lnc__f1634()->Any
if (live_enabled) {
	return mouse_y;
} else return undefined;

#define __lnc__f1635
/// __lnc__f1635(...args12:Any)->Any
if (live_enabled) {
	if(argument[0]){
		mouse_button = argument[1];
		return undefined;
	} else return mouse_button;
} else return undefined;

#define __lnc__f1636
/// __lnc__f1636(...args13:Any)->Any
if (live_enabled) {
	if(argument[0]){
		mouse_lastbutton = argument[1];
		return undefined;
	} else return mouse_lastbutton;
} else return undefined;

#define __lnc__f1637
/// __lnc__f1637(...args14:Any)->Any
if (live_enabled) {
	if(argument[0]){
		cursor_sprite = argument[1];
		return undefined;
	} else return cursor_sprite;
} else return undefined;

#define __lnc__f1638
/// __lnc__f1638(...args15:Any)->Any
if (live_enabled) {
	if(argument[0]){
		background_colour = argument[1];
		return undefined;
	} else return background_colour;
} else return undefined;

#define __lnc__f1639
/// __lnc__f1639(...args16:Any)->Any
if (live_enabled) {
	if(argument[0]){
		background_showcolour = argument[1];
		return undefined;
	} else return background_showcolour;
} else return undefined;

#define __lnc__f1640
/// __lnc__f1640(...args17:Any)->Any
if (live_enabled) {
	if(argument[0]){
		background_color = argument[1];
		return undefined;
	} else return background_color;
} else return undefined;

#define __lnc__f1641
/// __lnc__f1641(...args18:Any)->Any
if (live_enabled) {
	if(argument[0]){
		background_showcolor = argument[1];
		return undefined;
	} else return background_showcolor;
} else return undefined;

#define __lnc__f1642
/// __lnc__f1642(...args19:Any)->Any
if (live_enabled) {
	if(argument[0]){
		view_enabled = argument[1];
		return undefined;
	} else return view_enabled;
} else return undefined;

#define __lnc__f1643
/// __lnc__f1643()->Any
if (live_enabled) {
	return view_current;
} else return undefined;

#define __lnc__f1644
/// __lnc__f1644()->Any
if (live_enabled) {
	return game_id;
} else return undefined;

#define __lnc__f1645
/// __lnc__f1645()->Any
if (live_enabled) {
	return game_display_name;
} else return undefined;

#define __lnc__f1646
/// __lnc__f1646()->Any
if (live_enabled) {
	return game_project_name;
} else return undefined;

#define __lnc__f1647
/// __lnc__f1647()->Any
if (live_enabled) {
	return game_save_id;
} else return undefined;

#define __lnc__f1648
/// __lnc__f1648()->Any
if (live_enabled) {
	return working_directory;
} else return undefined;

#define __lnc__f1649
/// __lnc__f1649()->Any
if (live_enabled) {
	return temp_directory;
} else return undefined;

#define __lnc__f1650
/// __lnc__f1650()->Any
if (live_enabled) {
	return program_directory;
} else return undefined;

#define __lnc__f1651
/// __lnc__f1651()->Any
if (live_enabled) {
	return browser_width;
} else return undefined;

#define __lnc__f1652
/// __lnc__f1652()->Any
if (live_enabled) {
	return browser_height;
} else return undefined;

#define __lnc__f1653
/// __lnc__f1653()->Any
if (live_enabled) {
	return os_type;
} else return undefined;

#define __lnc__f1654
/// __lnc__f1654()->Any
if (live_enabled) {
	return os_device;
} else return undefined;

#define __lnc__f1655
/// __lnc__f1655()->Any
if (live_enabled) {
	return os_browser;
} else return undefined;

#define __lnc__f1656
/// __lnc__f1656()->Any
if (live_enabled) {
	return os_version;
} else return undefined;

#define __lnc__f1657
/// __lnc__f1657()->Any
if (live_enabled) {
	return display_aa;
} else return undefined;

#define __lnc__f1658
/// __lnc__f1658()->Any
if (live_enabled) {
	return async_load;
} else return undefined;

#define __lnc__f1659
/// __lnc__f1659()->Any
if (live_enabled) {
	return delta_time;
} else return undefined;

#define __lnc__f1660
/// __lnc__f1660()->Any
if (live_enabled) {
	return webgl_enabled;
} else return undefined;

#define __lnc__f1661
/// __lnc__f1661()->Any
if (live_enabled) {
	return event_data;
} else return undefined;

#define __lnc__f1662
/// __lnc__f1662(...args20:Any)->Any
if (live_enabled) {
	if(argument[0]){
		of_challen = argument[1];
		return undefined;
	} else return of_challen;
} else return undefined;

#define __lnc_const_decl_f0
/// __lnc_const_decl_f0()
if (live_enabled) {
	gml_const_add("undefined",undefined);
	gml_const_add("pointer_invalid",pointer_invalid);
	gml_const_add("pointer_null",pointer_null);
	gml_const_add("path_action_stop",path_action_stop);
	gml_const_add("path_action_restart",path_action_restart);
	gml_const_add("path_action_continue",path_action_continue);
	gml_const_add("path_action_reverse",path_action_reverse);
	gml_const_add("pi",pi);
	gml_const_add("GM_build_date",GM_build_date);
	gml_const_add("GM_version",GM_version);
	gml_const_add("timezone_local",timezone_local);
	gml_const_add("timezone_utc",timezone_utc);
	gml_const_add("gamespeed_fps",gamespeed_fps);
	gml_const_add("gamespeed_microseconds",gamespeed_microseconds);
	gml_const_add("ev_create",ev_create);
	gml_const_add("ev_destroy",ev_destroy);
	gml_const_add("ev_step",ev_step);
	gml_const_add("ev_alarm",ev_alarm);
	gml_const_add("ev_keyboard",ev_keyboard);
	gml_const_add("ev_mouse",ev_mouse);
	gml_const_add("ev_collision",ev_collision);
	gml_const_add("ev_other",ev_other);
	gml_const_add("ev_draw",ev_draw);
	gml_const_add("ev_draw_begin",ev_draw_begin);
	gml_const_add("ev_draw_end",ev_draw_end);
	gml_const_add("ev_draw_pre",ev_draw_pre);
	gml_const_add("ev_draw_post",ev_draw_post);
	gml_const_add("ev_keypress",ev_keypress);
	gml_const_add("ev_keyrelease",ev_keyrelease);
	gml_const_add("ev_trigger",ev_trigger);
	gml_const_add("ev_left_button",ev_left_button);
	gml_const_add("ev_right_button",ev_right_button);
}

#define __lnc_const_decl_f1
/// __lnc_const_decl_f1()
if (live_enabled) {
	gml_const_add("ev_middle_button",ev_middle_button);
	gml_const_add("ev_no_button",ev_no_button);
	gml_const_add("ev_left_press",ev_left_press);
	gml_const_add("ev_right_press",ev_right_press);
	gml_const_add("ev_middle_press",ev_middle_press);
	gml_const_add("ev_left_release",ev_left_release);
	gml_const_add("ev_right_release",ev_right_release);
	gml_const_add("ev_middle_release",ev_middle_release);
	gml_const_add("ev_mouse_enter",ev_mouse_enter);
	gml_const_add("ev_mouse_leave",ev_mouse_leave);
	gml_const_add("ev_mouse_wheel_up",ev_mouse_wheel_up);
	gml_const_add("ev_mouse_wheel_down",ev_mouse_wheel_down);
	gml_const_add("ev_global_left_button",ev_global_left_button);
	gml_const_add("ev_global_right_button",ev_global_right_button);
	gml_const_add("ev_global_middle_button",ev_global_middle_button);
	gml_const_add("ev_global_left_press",ev_global_left_press);
	gml_const_add("ev_global_right_press",ev_global_right_press);
	gml_const_add("ev_global_middle_press",ev_global_middle_press);
	gml_const_add("ev_global_left_release",ev_global_left_release);
	gml_const_add("ev_global_right_release",ev_global_right_release);
	gml_const_add("ev_global_middle_release",ev_global_middle_release);
	gml_const_add("ev_joystick1_left",ev_joystick1_left);
	gml_const_add("ev_joystick1_right",ev_joystick1_right);
	gml_const_add("ev_joystick1_up",ev_joystick1_up);
	gml_const_add("ev_joystick1_down",ev_joystick1_down);
	gml_const_add("ev_joystick1_button1",ev_joystick1_button1);
	gml_const_add("ev_joystick1_button2",ev_joystick1_button2);
	gml_const_add("ev_joystick1_button3",ev_joystick1_button3);
	gml_const_add("ev_joystick1_button4",ev_joystick1_button4);
	gml_const_add("ev_joystick1_button5",ev_joystick1_button5);
	gml_const_add("ev_joystick1_button6",ev_joystick1_button6);
	gml_const_add("ev_joystick1_button7",ev_joystick1_button7);
}

#define __lnc_const_decl_f2
/// __lnc_const_decl_f2()
if (live_enabled) {
	gml_const_add("ev_joystick1_button8",ev_joystick1_button8);
	gml_const_add("ev_joystick2_left",ev_joystick2_left);
	gml_const_add("ev_joystick2_right",ev_joystick2_right);
	gml_const_add("ev_joystick2_up",ev_joystick2_up);
	gml_const_add("ev_joystick2_down",ev_joystick2_down);
	gml_const_add("ev_joystick2_button1",ev_joystick2_button1);
	gml_const_add("ev_joystick2_button2",ev_joystick2_button2);
	gml_const_add("ev_joystick2_button3",ev_joystick2_button3);
	gml_const_add("ev_joystick2_button4",ev_joystick2_button4);
	gml_const_add("ev_joystick2_button5",ev_joystick2_button5);
	gml_const_add("ev_joystick2_button6",ev_joystick2_button6);
	gml_const_add("ev_joystick2_button7",ev_joystick2_button7);
	gml_const_add("ev_joystick2_button8",ev_joystick2_button8);
	gml_const_add("ev_outside",ev_outside);
	gml_const_add("ev_boundary",ev_boundary);
	gml_const_add("ev_game_start",ev_game_start);
	gml_const_add("ev_game_end",ev_game_end);
	gml_const_add("ev_room_start",ev_room_start);
	gml_const_add("ev_room_end",ev_room_end);
	gml_const_add("ev_no_more_lives",ev_no_more_lives);
	gml_const_add("ev_animation_end",ev_animation_end);
	gml_const_add("ev_end_of_path",ev_end_of_path);
	gml_const_add("ev_no_more_health",ev_no_more_health);
	gml_const_add("ev_user0",ev_user0);
	gml_const_add("ev_user1",ev_user1);
	gml_const_add("ev_user2",ev_user2);
	gml_const_add("ev_user3",ev_user3);
	gml_const_add("ev_user4",ev_user4);
	gml_const_add("ev_user5",ev_user5);
	gml_const_add("ev_user6",ev_user6);
	gml_const_add("ev_user7",ev_user7);
	gml_const_add("ev_user8",ev_user8);
}

#define __lnc_const_decl_f3
/// __lnc_const_decl_f3()
if (live_enabled) {
	gml_const_add("ev_user9",ev_user9);
	gml_const_add("ev_user10",ev_user10);
	gml_const_add("ev_user11",ev_user11);
	gml_const_add("ev_user12",ev_user12);
	gml_const_add("ev_user13",ev_user13);
	gml_const_add("ev_user14",ev_user14);
	gml_const_add("ev_user15",ev_user15);
	gml_const_add("ev_step_normal",ev_step_normal);
	gml_const_add("ev_step_begin",ev_step_begin);
	gml_const_add("ev_step_end",ev_step_end);
	gml_const_add("ev_gui",ev_gui);
	gml_const_add("ev_gui_begin",ev_gui_begin);
	gml_const_add("ev_gui_end",ev_gui_end);
	gml_const_add("ev_gesture",ev_gesture);
	gml_const_add("ev_gesture_tap",ev_gesture_tap);
	gml_const_add("ev_gesture_double_tap",ev_gesture_double_tap);
	gml_const_add("ev_gesture_drag_start",ev_gesture_drag_start);
	gml_const_add("ev_gesture_dragging",ev_gesture_dragging);
	gml_const_add("ev_gesture_drag_end",ev_gesture_drag_end);
	gml_const_add("ev_gesture_flick",ev_gesture_flick);
	gml_const_add("ev_gesture_pinch_start",ev_gesture_pinch_start);
	gml_const_add("ev_gesture_pinch_in",ev_gesture_pinch_in);
	gml_const_add("ev_gesture_pinch_out",ev_gesture_pinch_out);
	gml_const_add("ev_gesture_pinch_end",ev_gesture_pinch_end);
	gml_const_add("ev_gesture_rotate_start",ev_gesture_rotate_start);
	gml_const_add("ev_gesture_rotating",ev_gesture_rotating);
	gml_const_add("ev_gesture_rotate_end",ev_gesture_rotate_end);
	gml_const_add("ev_global_gesture_tap",ev_global_gesture_tap);
	gml_const_add("ev_global_gesture_double_tap",ev_global_gesture_double_tap);
	gml_const_add("ev_global_gesture_drag_start",ev_global_gesture_drag_start);
	gml_const_add("ev_global_gesture_dragging",ev_global_gesture_dragging);
	gml_const_add("ev_global_gesture_drag_end",ev_global_gesture_drag_end);
}

#define __lnc_const_decl_f4
/// __lnc_const_decl_f4()
if (live_enabled) {
	gml_const_add("ev_global_gesture_flick",ev_global_gesture_flick);
	gml_const_add("ev_global_gesture_pinch_start",ev_global_gesture_pinch_start);
	gml_const_add("ev_global_gesture_pinch_in",ev_global_gesture_pinch_in);
	gml_const_add("ev_global_gesture_pinch_out",ev_global_gesture_pinch_out);
	gml_const_add("ev_global_gesture_pinch_end",ev_global_gesture_pinch_end);
	gml_const_add("ev_global_gesture_rotate_start",ev_global_gesture_rotate_start);
	gml_const_add("ev_global_gesture_rotating",ev_global_gesture_rotating);
	gml_const_add("ev_global_gesture_rotate_end",ev_global_gesture_rotate_end);
	gml_const_add("vk_nokey",vk_nokey);
	gml_const_add("vk_anykey",vk_anykey);
	gml_const_add("vk_enter",vk_enter);
	gml_const_add("vk_return",vk_return);
	gml_const_add("vk_shift",vk_shift);
	gml_const_add("vk_control",vk_control);
	gml_const_add("vk_alt",vk_alt);
	gml_const_add("vk_escape",vk_escape);
	gml_const_add("vk_space",vk_space);
	gml_const_add("vk_backspace",vk_backspace);
	gml_const_add("vk_tab",vk_tab);
	gml_const_add("vk_pause",vk_pause);
	gml_const_add("vk_printscreen",vk_printscreen);
	gml_const_add("vk_left",vk_left);
	gml_const_add("vk_right",vk_right);
	gml_const_add("vk_up",vk_up);
	gml_const_add("vk_down",vk_down);
	gml_const_add("vk_home",vk_home);
	gml_const_add("vk_end",vk_end);
	gml_const_add("vk_delete",vk_delete);
	gml_const_add("vk_insert",vk_insert);
	gml_const_add("vk_pageup",vk_pageup);
	gml_const_add("vk_pagedown",vk_pagedown);
	gml_const_add("vk_f1",vk_f1);
}

#define __lnc_const_decl_f5
/// __lnc_const_decl_f5()
if (live_enabled) {
	gml_const_add("vk_f2",vk_f2);
	gml_const_add("vk_f3",vk_f3);
	gml_const_add("vk_f4",vk_f4);
	gml_const_add("vk_f5",vk_f5);
	gml_const_add("vk_f6",vk_f6);
	gml_const_add("vk_f7",vk_f7);
	gml_const_add("vk_f8",vk_f8);
	gml_const_add("vk_f9",vk_f9);
	gml_const_add("vk_f10",vk_f10);
	gml_const_add("vk_f11",vk_f11);
	gml_const_add("vk_f12",vk_f12);
	gml_const_add("vk_numpad0",vk_numpad0);
	gml_const_add("vk_numpad1",vk_numpad1);
	gml_const_add("vk_numpad2",vk_numpad2);
	gml_const_add("vk_numpad3",vk_numpad3);
	gml_const_add("vk_numpad4",vk_numpad4);
	gml_const_add("vk_numpad5",vk_numpad5);
	gml_const_add("vk_numpad6",vk_numpad6);
	gml_const_add("vk_numpad7",vk_numpad7);
	gml_const_add("vk_numpad8",vk_numpad8);
	gml_const_add("vk_numpad9",vk_numpad9);
	gml_const_add("vk_divide",vk_divide);
	gml_const_add("vk_multiply",vk_multiply);
	gml_const_add("vk_subtract",vk_subtract);
	gml_const_add("vk_add",vk_add);
	gml_const_add("vk_decimal",vk_decimal);
	gml_const_add("vk_lshift",vk_lshift);
	gml_const_add("vk_lcontrol",vk_lcontrol);
	gml_const_add("vk_lalt",vk_lalt);
	gml_const_add("vk_rshift",vk_rshift);
	gml_const_add("vk_rcontrol",vk_rcontrol);
	gml_const_add("vk_ralt",vk_ralt);
}

#define __lnc_const_decl_f6
/// __lnc_const_decl_f6()
if (live_enabled) {
	gml_const_add("mb_any",mb_any);
	gml_const_add("mb_none",mb_none);
	gml_const_add("mb_left",mb_left);
	gml_const_add("mb_right",mb_right);
	gml_const_add("mb_middle",mb_middle);
	gml_const_add("c_aqua",c_aqua);
	gml_const_add("c_black",c_black);
	gml_const_add("c_blue",c_blue);
	gml_const_add("c_dkgray",c_dkgray);
	gml_const_add("c_fuchsia",c_fuchsia);
	gml_const_add("c_gray",c_gray);
	gml_const_add("c_green",c_green);
	gml_const_add("c_lime",c_lime);
	gml_const_add("c_ltgray",c_ltgray);
	gml_const_add("c_maroon",c_maroon);
	gml_const_add("c_navy",c_navy);
	gml_const_add("c_olive",c_olive);
	gml_const_add("c_purple",c_purple);
	gml_const_add("c_red",c_red);
	gml_const_add("c_silver",c_silver);
	gml_const_add("c_teal",c_teal);
	gml_const_add("c_white",c_white);
	gml_const_add("c_yellow",c_yellow);
	gml_const_add("c_orange",c_orange);
	gml_const_add("fa_left",fa_left);
	gml_const_add("fa_center",fa_center);
	gml_const_add("fa_right",fa_right);
	gml_const_add("fa_top",fa_top);
	gml_const_add("fa_middle",fa_middle);
	gml_const_add("fa_bottom",fa_bottom);
	gml_const_add("pr_pointlist",pr_pointlist);
	gml_const_add("pr_linelist",pr_linelist);
}

#define __lnc_const_decl_f7
/// __lnc_const_decl_f7()
if (live_enabled) {
	gml_const_add("pr_linestrip",pr_linestrip);
	gml_const_add("pr_trianglelist",pr_trianglelist);
	gml_const_add("pr_trianglestrip",pr_trianglestrip);
	gml_const_add("pr_trianglefan",pr_trianglefan);
	gml_const_add("bm_normal",bm_normal);
	gml_const_add("bm_add",bm_add);
	gml_const_add("bm_max",bm_max);
	gml_const_add("bm_subtract",bm_subtract);
	gml_const_add("bm_zero",bm_zero);
	gml_const_add("bm_one",bm_one);
	gml_const_add("bm_src_colour",bm_src_colour);
	gml_const_add("bm_inv_src_colour",bm_inv_src_colour);
	gml_const_add("bm_src_color",bm_src_color);
	gml_const_add("bm_inv_src_color",bm_inv_src_color);
	gml_const_add("bm_src_alpha",bm_src_alpha);
	gml_const_add("bm_inv_src_alpha",bm_inv_src_alpha);
	gml_const_add("bm_dest_alpha",bm_dest_alpha);
	gml_const_add("bm_inv_dest_alpha",bm_inv_dest_alpha);
	gml_const_add("bm_dest_colour",bm_dest_colour);
	gml_const_add("bm_inv_dest_colour",bm_inv_dest_colour);
	gml_const_add("bm_dest_color",bm_dest_color);
	gml_const_add("bm_inv_dest_color",bm_inv_dest_color);
	gml_const_add("bm_src_alpha_sat",bm_src_alpha_sat);
	gml_const_add("tf_point",tf_point);
	gml_const_add("tf_linear",tf_linear);
	gml_const_add("tf_anisotropic",tf_anisotropic);
	gml_const_add("mip_off",mip_off);
	gml_const_add("mip_on",mip_on);
	gml_const_add("mip_markedonly",mip_markedonly);
	gml_const_add("audio_falloff_none",audio_falloff_none);
	gml_const_add("audio_falloff_inverse_distance",audio_falloff_inverse_distance);
	gml_const_add("audio_falloff_inverse_distance_clamped",audio_falloff_inverse_distance_clamped);
}

#define __lnc_const_decl_f8
/// __lnc_const_decl_f8()
if (live_enabled) {
	gml_const_add("audio_falloff_linear_distance",audio_falloff_linear_distance);
	gml_const_add("audio_falloff_linear_distance_clamped",audio_falloff_linear_distance_clamped);
	gml_const_add("audio_falloff_exponent_distance",audio_falloff_exponent_distance);
	gml_const_add("audio_falloff_exponent_distance_clamped",audio_falloff_exponent_distance_clamped);
	gml_const_add("audio_mono",audio_mono);
	gml_const_add("audio_stereo",audio_stereo);
	gml_const_add("audio_3d",audio_3d);
	gml_const_add("cr_default",cr_default);
	gml_const_add("cr_none",cr_none);
	gml_const_add("cr_arrow",cr_arrow);
	gml_const_add("cr_cross",cr_cross);
	gml_const_add("cr_beam",cr_beam);
	gml_const_add("cr_size_nesw",cr_size_nesw);
	gml_const_add("cr_size_ns",cr_size_ns);
	gml_const_add("cr_size_nwse",cr_size_nwse);
	gml_const_add("cr_size_we",cr_size_we);
	gml_const_add("cr_uparrow",cr_uparrow);
	gml_const_add("cr_hourglass",cr_hourglass);
	gml_const_add("cr_drag",cr_drag);
	gml_const_add("cr_appstart",cr_appstart);
	gml_const_add("cr_handpoint",cr_handpoint);
	gml_const_add("cr_size_all",cr_size_all);
	gml_const_add("spritespeed_framespersecond",spritespeed_framespersecond);
	gml_const_add("spritespeed_framespergameframe",spritespeed_framespergameframe);
	gml_const_add("asset_object",asset_object);
	gml_const_add("asset_unknown",asset_unknown);
	gml_const_add("asset_sprite",asset_sprite);
	gml_const_add("asset_sound",asset_sound);
	gml_const_add("asset_room",asset_room);
	gml_const_add("asset_path",asset_path);
	gml_const_add("asset_script",asset_script);
	gml_const_add("asset_font",asset_font);
}

#define __lnc_const_decl_f9
/// __lnc_const_decl_f9()
if (live_enabled) {
	gml_const_add("asset_timeline",asset_timeline);
	gml_const_add("asset_tiles",asset_tiles);
	gml_const_add("asset_shader",asset_shader);
	gml_const_add("fa_readonly",fa_readonly);
	gml_const_add("fa_hidden",fa_hidden);
	gml_const_add("fa_sysfile",fa_sysfile);
	gml_const_add("fa_volumeid",fa_volumeid);
	gml_const_add("fa_directory",fa_directory);
	gml_const_add("fa_archive",fa_archive);
	gml_const_add("ds_type_map",ds_type_map);
	gml_const_add("ds_type_list",ds_type_list);
	gml_const_add("ds_type_stack",ds_type_stack);
	gml_const_add("ds_type_queue",ds_type_queue);
	gml_const_add("ds_type_grid",ds_type_grid);
	gml_const_add("ds_type_priority",ds_type_priority);
	gml_const_add("ef_explosion",ef_explosion);
	gml_const_add("ef_ring",ef_ring);
	gml_const_add("ef_ellipse",ef_ellipse);
	gml_const_add("ef_firework",ef_firework);
	gml_const_add("ef_smoke",ef_smoke);
	gml_const_add("ef_smokeup",ef_smokeup);
	gml_const_add("ef_star",ef_star);
	gml_const_add("ef_spark",ef_spark);
	gml_const_add("ef_flare",ef_flare);
	gml_const_add("ef_cloud",ef_cloud);
	gml_const_add("ef_rain",ef_rain);
	gml_const_add("ef_snow",ef_snow);
	gml_const_add("pt_shape_pixel",pt_shape_pixel);
	gml_const_add("pt_shape_disk",pt_shape_disk);
	gml_const_add("pt_shape_square",pt_shape_square);
	gml_const_add("pt_shape_line",pt_shape_line);
	gml_const_add("pt_shape_star",pt_shape_star);
}

#define __lnc_const_decl_f10
/// __lnc_const_decl_f10()
if (live_enabled) {
	gml_const_add("pt_shape_circle",pt_shape_circle);
	gml_const_add("pt_shape_ring",pt_shape_ring);
	gml_const_add("pt_shape_sphere",pt_shape_sphere);
	gml_const_add("pt_shape_flare",pt_shape_flare);
	gml_const_add("pt_shape_spark",pt_shape_spark);
	gml_const_add("pt_shape_explosion",pt_shape_explosion);
	gml_const_add("pt_shape_cloud",pt_shape_cloud);
	gml_const_add("pt_shape_smoke",pt_shape_smoke);
	gml_const_add("pt_shape_snow",pt_shape_snow);
	gml_const_add("ps_distr_linear",ps_distr_linear);
	gml_const_add("ps_distr_gaussian",ps_distr_gaussian);
	gml_const_add("ps_distr_invgaussian",ps_distr_invgaussian);
	gml_const_add("ps_shape_rectangle",ps_shape_rectangle);
	gml_const_add("ps_shape_ellipse",ps_shape_ellipse);
	gml_const_add("ps_shape_diamond",ps_shape_diamond);
	gml_const_add("ps_shape_line",ps_shape_line);
	gml_const_add("matrix_view",matrix_view);
	gml_const_add("matrix_projection",matrix_projection);
	gml_const_add("matrix_world",matrix_world);
	gml_const_add("os_windows",os_windows);
	gml_const_add("os_macosx",os_macosx);
	gml_const_add("os_ios",os_ios);
	gml_const_add("os_android",os_android);
	gml_const_add("os_linux",os_linux);
	gml_const_add("os_unknown",os_unknown);
	gml_const_add("os_winphone",os_winphone);
	gml_const_add("os_win8native",os_win8native);
	gml_const_add("os_psvita",os_psvita);
	gml_const_add("os_ps4",os_ps4);
	gml_const_add("os_xboxone",os_xboxone);
	gml_const_add("os_ps3",os_ps3);
	gml_const_add("os_uwp",os_uwp);
}

#define __lnc_const_decl_f11
/// __lnc_const_decl_f11()
if (live_enabled) {
	gml_const_add("browser_not_a_browser",browser_not_a_browser);
	gml_const_add("browser_unknown",browser_unknown);
	gml_const_add("browser_ie",browser_ie);
	gml_const_add("browser_firefox",browser_firefox);
	gml_const_add("browser_chrome",browser_chrome);
	gml_const_add("browser_safari",browser_safari);
	gml_const_add("browser_safari_mobile",browser_safari_mobile);
	gml_const_add("browser_opera",browser_opera);
	gml_const_add("browser_tizen",browser_tizen);
	gml_const_add("browser_edge",browser_edge);
	gml_const_add("browser_windows_store",browser_windows_store);
	gml_const_add("browser_ie_mobile",browser_ie_mobile);
	gml_const_add("device_ios_unknown",device_ios_unknown);
	gml_const_add("device_ios_iphone",device_ios_iphone);
	gml_const_add("device_ios_iphone_retina",device_ios_iphone_retina);
	gml_const_add("device_ios_ipad",device_ios_ipad);
	gml_const_add("device_ios_ipad_retina",device_ios_ipad_retina);
	gml_const_add("device_ios_iphone5",device_ios_iphone5);
	gml_const_add("device_ios_iphone6",device_ios_iphone6);
	gml_const_add("device_ios_iphone6plus",device_ios_iphone6plus);
	gml_const_add("device_emulator",device_emulator);
	gml_const_add("device_tablet",device_tablet);
	gml_const_add("display_landscape",display_landscape);
	gml_const_add("display_landscape_flipped",display_landscape_flipped);
	gml_const_add("display_portrait",display_portrait);
	gml_const_add("display_portrait_flipped",display_portrait_flipped);
	gml_const_add("of_challenge_win",of_challenge_win);
	gml_const_add("of_challenge_tie",of_challenge_tie);
	gml_const_add("cmpfunc_never",cmpfunc_never);
	gml_const_add("cmpfunc_less",cmpfunc_less);
	gml_const_add("cmpfunc_equal",cmpfunc_equal);
	gml_const_add("cmpfunc_lessequal",cmpfunc_lessequal);
}

#define __lnc_const_decl_f12
/// __lnc_const_decl_f12()
if (live_enabled) {
	gml_const_add("cmpfunc_greater",cmpfunc_greater);
	gml_const_add("cmpfunc_notequal",cmpfunc_notequal);
	gml_const_add("cmpfunc_greaterequal",cmpfunc_greaterequal);
	gml_const_add("cmpfunc_always",cmpfunc_always);
	gml_const_add("cull_noculling",cull_noculling);
	gml_const_add("cull_clockwise",cull_clockwise);
	gml_const_add("cull_counterclockwise",cull_counterclockwise);
	gml_const_add("lighttype_dir",lighttype_dir);
	gml_const_add("lighttype_point",lighttype_point);
	gml_const_add("phy_joint_anchor_1_x",phy_joint_anchor_1_x);
	gml_const_add("phy_joint_anchor_1_y",phy_joint_anchor_1_y);
	gml_const_add("phy_joint_anchor_2_x",phy_joint_anchor_2_x);
	gml_const_add("phy_joint_anchor_2_y",phy_joint_anchor_2_y);
	gml_const_add("phy_joint_reaction_force_x",phy_joint_reaction_force_x);
	gml_const_add("phy_joint_reaction_force_y",phy_joint_reaction_force_y);
	gml_const_add("phy_joint_reaction_torque",phy_joint_reaction_torque);
	gml_const_add("phy_joint_motor_speed",phy_joint_motor_speed);
	gml_const_add("phy_joint_angle",phy_joint_angle);
	gml_const_add("phy_joint_motor_torque",phy_joint_motor_torque);
	gml_const_add("phy_joint_max_motor_torque",phy_joint_max_motor_torque);
	gml_const_add("phy_joint_translation",phy_joint_translation);
	gml_const_add("phy_joint_speed",phy_joint_speed);
	gml_const_add("phy_joint_motor_force",phy_joint_motor_force);
	gml_const_add("phy_joint_max_motor_force",phy_joint_max_motor_force);
	gml_const_add("phy_joint_length_1",phy_joint_length_1);
	gml_const_add("phy_joint_length_2",phy_joint_length_2);
	gml_const_add("phy_joint_damping_ratio",phy_joint_damping_ratio);
	gml_const_add("phy_joint_frequency",phy_joint_frequency);
	gml_const_add("phy_joint_lower_angle_limit",phy_joint_lower_angle_limit);
	gml_const_add("phy_joint_upper_angle_limit",phy_joint_upper_angle_limit);
	gml_const_add("phy_joint_angle_limits",phy_joint_angle_limits);
	gml_const_add("phy_joint_max_length",phy_joint_max_length);
}

#define __lnc_const_decl_f13
/// __lnc_const_decl_f13()
if (live_enabled) {
	gml_const_add("phy_joint_max_torque",phy_joint_max_torque);
	gml_const_add("phy_joint_max_force",phy_joint_max_force);
	gml_const_add("phy_debug_render_aabb",phy_debug_render_aabb);
	gml_const_add("phy_debug_render_collision_pairs",phy_debug_render_collision_pairs);
	gml_const_add("phy_debug_render_coms",phy_debug_render_coms);
	gml_const_add("phy_debug_render_core_shapes",phy_debug_render_core_shapes);
	gml_const_add("phy_debug_render_joints",phy_debug_render_joints);
	gml_const_add("phy_debug_render_obb",phy_debug_render_obb);
	gml_const_add("phy_debug_render_shapes",phy_debug_render_shapes);
	gml_const_add("phy_particle_flag_water",phy_particle_flag_water);
	gml_const_add("phy_particle_flag_zombie",phy_particle_flag_zombie);
	gml_const_add("phy_particle_flag_wall",phy_particle_flag_wall);
	gml_const_add("phy_particle_flag_spring",phy_particle_flag_spring);
	gml_const_add("phy_particle_flag_elastic",phy_particle_flag_elastic);
	gml_const_add("phy_particle_flag_viscous",phy_particle_flag_viscous);
	gml_const_add("phy_particle_flag_powder",phy_particle_flag_powder);
	gml_const_add("phy_particle_flag_tensile",phy_particle_flag_tensile);
	gml_const_add("phy_particle_flag_colourmixing",phy_particle_flag_colourmixing);
	gml_const_add("phy_particle_group_flag_solid",phy_particle_group_flag_solid);
	gml_const_add("phy_particle_group_flag_rigid",phy_particle_group_flag_rigid);
	gml_const_add("phy_particle_data_flag_typeflags",phy_particle_data_flag_typeflags);
	gml_const_add("phy_particle_data_flag_position",phy_particle_data_flag_position);
	gml_const_add("phy_particle_data_flag_velocity",phy_particle_data_flag_velocity);
	gml_const_add("phy_particle_data_flag_colour",phy_particle_data_flag_colour);
	gml_const_add("phy_particle_data_flag_category",phy_particle_data_flag_category);
	gml_const_add("buffer_fixed",buffer_fixed);
	gml_const_add("buffer_grow",buffer_grow);
	gml_const_add("buffer_wrap",buffer_wrap);
	gml_const_add("buffer_fast",buffer_fast);
	gml_const_add("buffer_vbuffer",buffer_vbuffer);
	gml_const_add("buffer_network",buffer_network);
	gml_const_add("buffer_u8",buffer_u8);
}

#define __lnc_const_decl_f14
/// __lnc_const_decl_f14()
if (live_enabled) {
	gml_const_add("buffer_s8",buffer_s8);
	gml_const_add("buffer_u16",buffer_u16);
	gml_const_add("buffer_s16",buffer_s16);
	gml_const_add("buffer_u32",buffer_u32);
	gml_const_add("buffer_s32",buffer_s32);
	gml_const_add("buffer_u64",buffer_u64);
	gml_const_add("buffer_f16",buffer_f16);
	gml_const_add("buffer_f32",buffer_f32);
	gml_const_add("buffer_f64",buffer_f64);
	gml_const_add("buffer_bool",buffer_bool);
	gml_const_add("buffer_text",buffer_text);
	gml_const_add("buffer_string",buffer_string);
	gml_const_add("buffer_seek_start",buffer_seek_start);
	gml_const_add("buffer_seek_relative",buffer_seek_relative);
	gml_const_add("buffer_seek_end",buffer_seek_end);
	gml_const_add("gp_face1",gp_face1);
	gml_const_add("gp_face2",gp_face2);
	gml_const_add("gp_face3",gp_face3);
	gml_const_add("gp_face4",gp_face4);
	gml_const_add("gp_shoulderl",gp_shoulderl);
	gml_const_add("gp_shoulderr",gp_shoulderr);
	gml_const_add("gp_shoulderlb",gp_shoulderlb);
	gml_const_add("gp_shoulderrb",gp_shoulderrb);
	gml_const_add("gp_select",gp_select);
	gml_const_add("gp_start",gp_start);
	gml_const_add("gp_stickl",gp_stickl);
	gml_const_add("gp_stickr",gp_stickr);
	gml_const_add("gp_padu",gp_padu);
	gml_const_add("gp_padd",gp_padd);
	gml_const_add("gp_padl",gp_padl);
	gml_const_add("gp_padr",gp_padr);
	gml_const_add("gp_axislh",gp_axislh);
}

#define __lnc_const_decl_f15
/// __lnc_const_decl_f15()
if (live_enabled) {
	gml_const_add("gp_axislv",gp_axislv);
	gml_const_add("gp_axisrh",gp_axisrh);
	gml_const_add("gp_axisrv",gp_axisrv);
	gml_const_add("ov_friends",ov_friends);
	gml_const_add("ov_community",ov_community);
	gml_const_add("ov_players",ov_players);
	gml_const_add("ov_settings",ov_settings);
	gml_const_add("ov_gamegroup",ov_gamegroup);
	gml_const_add("ov_achievements",ov_achievements);
	gml_const_add("lb_sort_none",lb_sort_none);
	gml_const_add("lb_sort_ascending",lb_sort_ascending);
	gml_const_add("lb_sort_descending",lb_sort_descending);
	gml_const_add("lb_disp_none",lb_disp_none);
	gml_const_add("lb_disp_numeric",lb_disp_numeric);
	gml_const_add("lb_disp_time_sec",lb_disp_time_sec);
	gml_const_add("lb_disp_time_ms",lb_disp_time_ms);
	gml_const_add("ugc_result_success",ugc_result_success);
	gml_const_add("ugc_filetype_community",ugc_filetype_community);
	gml_const_add("ugc_filetype_microtrans",ugc_filetype_microtrans);
	gml_const_add("ugc_visibility_public",ugc_visibility_public);
	gml_const_add("ugc_visibility_friends_only",ugc_visibility_friends_only);
	gml_const_add("ugc_visibility_private",ugc_visibility_private);
	gml_const_add("ugc_query_RankedByVote",ugc_query_RankedByVote);
	gml_const_add("ugc_query_RankedByPublicationDate",ugc_query_RankedByPublicationDate);
	gml_const_add("ugc_query_AcceptedForGameRankedByAcceptanceDate",ugc_query_AcceptedForGameRankedByAcceptanceDate);
	gml_const_add("ugc_query_RankedByTrend",ugc_query_RankedByTrend);
	gml_const_add("ugc_query_FavoritedByFriendsRankedByPublicationDate",ugc_query_FavoritedByFriendsRankedByPublicationDate);
	gml_const_add("ugc_query_CreatedByFriendsRankedByPublicationDate",ugc_query_CreatedByFriendsRankedByPublicationDate);
	gml_const_add("ugc_query_RankedByNumTimesReported",ugc_query_RankedByNumTimesReported);
	gml_const_add("ugc_query_CreatedByFollowedUsersRankedByPublicationDate",ugc_query_CreatedByFollowedUsersRankedByPublicationDate);
	gml_const_add("ugc_query_NotYetRated",ugc_query_NotYetRated);
	gml_const_add("ugc_query_RankedByTotalVotesAsc",ugc_query_RankedByTotalVotesAsc);
}

#define __lnc_const_decl_f16
/// __lnc_const_decl_f16()
if (live_enabled) {
	gml_const_add("ugc_query_RankedByVotesUp",ugc_query_RankedByVotesUp);
	gml_const_add("ugc_query_RankedByTextSearch",ugc_query_RankedByTextSearch);
	gml_const_add("ugc_sortorder_CreationOrderDesc",ugc_sortorder_CreationOrderDesc);
	gml_const_add("ugc_sortorder_CreationOrderAsc",ugc_sortorder_CreationOrderAsc);
	gml_const_add("ugc_sortorder_TitleAsc",ugc_sortorder_TitleAsc);
	gml_const_add("ugc_sortorder_LastUpdatedDesc",ugc_sortorder_LastUpdatedDesc);
	gml_const_add("ugc_sortorder_SubscriptionDateDesc",ugc_sortorder_SubscriptionDateDesc);
	gml_const_add("ugc_sortorder_VoteScoreDesc",ugc_sortorder_VoteScoreDesc);
	gml_const_add("ugc_sortorder_ForModeration",ugc_sortorder_ForModeration);
	gml_const_add("ugc_list_Published",ugc_list_Published);
	gml_const_add("ugc_list_VotedOn",ugc_list_VotedOn);
	gml_const_add("ugc_list_VotedUp",ugc_list_VotedUp);
	gml_const_add("ugc_list_VotedDown",ugc_list_VotedDown);
	gml_const_add("ugc_list_WillVoteLater",ugc_list_WillVoteLater);
	gml_const_add("ugc_list_Favorited",ugc_list_Favorited);
	gml_const_add("ugc_list_Subscribed",ugc_list_Subscribed);
	gml_const_add("ugc_list_UsedOrPlayed",ugc_list_UsedOrPlayed);
	gml_const_add("ugc_list_Followed",ugc_list_Followed);
	gml_const_add("ugc_match_Items",ugc_match_Items);
	gml_const_add("ugc_match_Items_Mtx",ugc_match_Items_Mtx);
	gml_const_add("ugc_match_Items_ReadyToUse",ugc_match_Items_ReadyToUse);
	gml_const_add("ugc_match_Collections",ugc_match_Collections);
	gml_const_add("ugc_match_Artwork",ugc_match_Artwork);
	gml_const_add("ugc_match_Videos",ugc_match_Videos);
	gml_const_add("ugc_match_Screenshots",ugc_match_Screenshots);
	gml_const_add("ugc_match_AllGuides",ugc_match_AllGuides);
	gml_const_add("ugc_match_WebGuides",ugc_match_WebGuides);
	gml_const_add("ugc_match_IntegratedGuides",ugc_match_IntegratedGuides);
	gml_const_add("ugc_match_UsableInGame",ugc_match_UsableInGame);
	gml_const_add("ugc_match_ControllerBindings",ugc_match_ControllerBindings);
	gml_const_add("vertex_usage_position",vertex_usage_position);
	gml_const_add("vertex_usage_colour",vertex_usage_colour);
}

#define __lnc_const_decl_f17
/// __lnc_const_decl_f17()
if (live_enabled) {
	gml_const_add("vertex_usage_normal",vertex_usage_normal);
	gml_const_add("vertex_usage_texcoord",vertex_usage_texcoord);
	gml_const_add("vertex_usage_blendweight",vertex_usage_blendweight);
	gml_const_add("vertex_usage_blendindices",vertex_usage_blendindices);
	gml_const_add("vertex_usage_psize",vertex_usage_psize);
	gml_const_add("vertex_usage_tangent",vertex_usage_tangent);
	gml_const_add("vertex_usage_binormal",vertex_usage_binormal);
	gml_const_add("vertex_usage_fog",vertex_usage_fog);
	gml_const_add("vertex_usage_depth",vertex_usage_depth);
	gml_const_add("vertex_usage_sample",vertex_usage_sample);
	gml_const_add("vertex_type_float1",vertex_type_float1);
	gml_const_add("vertex_type_float2",vertex_type_float2);
	gml_const_add("vertex_type_float3",vertex_type_float3);
	gml_const_add("vertex_type_float4",vertex_type_float4);
	gml_const_add("vertex_type_colour",vertex_type_colour);
	gml_const_add("vertex_type_ubyte4",vertex_type_ubyte4);
	gml_const_add("layerelementtype_undefined",layerelementtype_undefined);
	gml_const_add("layerelementtype_background",layerelementtype_background);
	gml_const_add("layerelementtype_instance",layerelementtype_instance);
	gml_const_add("layerelementtype_oldtilemap",layerelementtype_oldtilemap);
	gml_const_add("layerelementtype_sprite",layerelementtype_sprite);
	gml_const_add("layerelementtype_tilemap",layerelementtype_tilemap);
	gml_const_add("layerelementtype_particlesystem",layerelementtype_particlesystem);
	gml_const_add("layerelementtype_tile",layerelementtype_tile);
	gml_const_add("tile_rotate",tile_rotate);
	gml_const_add("tile_flip",tile_flip);
	gml_const_add("tile_mirror",tile_mirror);
	gml_const_add("tile_index_mask",tile_index_mask);
}

#define __lnc_const_decl
/// __lnc_const_decl()
if (live_enabled) {
	__lnc_const_decl_f0();
	__lnc_const_decl_f1();
	__lnc_const_decl_f2();
	__lnc_const_decl_f3();
	__lnc_const_decl_f4();
	__lnc_const_decl_f5();
	__lnc_const_decl_f6();
	__lnc_const_decl_f7();
	__lnc_const_decl_f8();
	__lnc_const_decl_f9();
	__lnc_const_decl_f10();
	__lnc_const_decl_f11();
	__lnc_const_decl_f12();
	__lnc_const_decl_f13();
	__lnc_const_decl_f14();
	__lnc_const_decl_f15();
	__lnc_const_decl_f16();
	__lnc_const_decl_f17();
}
