/// MaximiseWindow(_update_only)
var _update_only=false;
if( argument_count==1 ) _update_only = argument[0];

// get current window details
var wx = window_get_x();
var wy = window_get_y();
var ww = window_get_width();
var wh = window_get_height();

// get multi-monitor info
display_data = window_get_visible_rects(wx, wy, wx + ww, wy + wh);
display_num = array_length_1d(display_data) / 8;

// find out which monitor we're "mostly" on top of....
var monitor=-1;
var coverage=0;
var last_coverage=0;
var index=0;
for(var i=0;i<display_num;i++){
    var xx1 = display_data[index];
    var yy1 = display_data[index+1];
    var xx2 = display_data[index+2];
    var yy2 = display_data[index+3];
    coverage = (xx2-xx1)*(yy2-yy1);
    coverage_area[i]=coverage;
    if( coverage>last_coverage ){
        monitor=index;
        last_coverage = coverage;
    }
    index+=8;
}
if(_update_only) return -1;
if( monitor<0 ) return -1;      // errrr....


// Now get the monitor we're maximising to....
var monx1 = display_data[monitor+4];
var mony1 = display_data[monitor+5];
var monx2 = display_data[monitor+6];
var mony2 = display_data[monitor+7];
window_set_rectangle(monx1,mony1,monx2-monx1,mony2-mony1);

