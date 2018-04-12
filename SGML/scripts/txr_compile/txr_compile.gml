/// @param source_string
if (txr_parse(argument0)) return undefined;
if (txr_build()) return undefined;
var out = txr_compile_list;
ds_list_clear(out);
if (txr_compile_expr(txr_build_node)) return undefined;
var n = ds_list_size(out);
var arr = array_create(n);
for (var i = 0; i < n; i++) arr[i] = out[|i];
ds_list_clear(out);
return arr;