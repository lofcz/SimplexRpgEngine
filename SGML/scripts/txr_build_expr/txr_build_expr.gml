/// @param flags

/// @param flags
var flags = argument0;
var tk = txr_build_list[|txr_build_pos++];
switch (tk[0]) {
	case txr_token.number: txr_build_node = [txr_node.number, tk[1], tk[2]]; break;
	case txr_token.ident: txr_build_node = [txr_node.ident, tk[1], tk[2]]; break;
	case txr_token.par_open: // (value)
		if (txr_build_expr(0)) return true;
		tk = txr_build_list[|txr_build_pos++];
		if (tk[0] != txr_token.par_close) return txr_throw_at("Expected a `)`", tk);
		break;
	case txr_token.op: // -value, +value
		switch (tk[2]) {
			case txr_op.add:
				if (txr_build_expr(txr_build_flag.no_ops)) return true;
				break;
			case txr_op.sub:
				if (txr_build_expr(txr_build_flag.no_ops)) return true;
				txr_build_node = [txr_node.unop, tk[1], txr_unop.negate, txr_build_node];
				break;
			default: return txr_throw_at("Unexpected token", tk);
		}
		break;
	default: return txr_throw_at("Unexpected token", tk);
}
if ((flags & txr_build_flag.no_ops) == 0) {
	tk = txr_build_list[|txr_build_pos];
	if (tk[0] == txr_token.op) {
		txr_build_pos += 1;
		if (txr_build_ops(tk)) return true;
	}
}
return false;