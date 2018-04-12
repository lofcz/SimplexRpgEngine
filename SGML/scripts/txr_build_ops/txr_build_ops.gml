/// @arg first

/// @param first
var nodes = ds_list_create();
ds_list_add(nodes, txr_build_node);
var ops = ds_list_create();
ds_list_add(ops, argument0);
//
var tk;
while (1) {
	// try to read the next expression and add it to list:
	if (txr_build_expr(txr_build_flag.no_ops)) {
		ds_list_destroy(nodes);
		ds_list_destroy(ops);
		return true;
	}
	ds_list_add(nodes, txr_build_node);
	// if followed by an operator, add that too, stop otherwise:
	tk = txr_build_list[|txr_build_pos];
	if (tk[0] == txr_token.op) {
		txr_build_pos++;
		ds_list_add(ops, tk);
	} else break;
}
// Nest operators from top to bottom priority:
var n = ds_list_size(ops);
var pmax = (txr_op.maxp >> 4);
var pri = 0;
while (pri < pmax) {
	for (var i = 0; i < n; i++) {
		tk = ops[|i];
		if ((tk[2] >> 4) != pri) continue;
		nodes[|i] = [txr_node.binop, tk[1], tk[2], nodes[|i], nodes[|i + 1]];
		ds_list_delete(nodes, i + 1);
		ds_list_delete(ops, i);
		n -= 1; i -= 1;
	}
	pri += 1;
}
// Cleanup and return:
txr_build_node = nodes[|0];
ds_list_destroy(nodes);
ds_list_destroy(ops);
return false;
