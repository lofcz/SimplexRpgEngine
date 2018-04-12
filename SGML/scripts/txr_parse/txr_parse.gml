/// @desc txr_parse(string)
/// @param str


/*
	Parser výrazu, výsledek zpracovává AST
*/
var str = argument0;
var len = string_length(str);
var out = txr_parse_tokens;
ds_list_clear(out);
var pos = 1;
while (pos <= len) {
    var start = pos;
    var char = string_ord_at(str, pos);
    pos += 1;
    switch (char) {
		case ord(" "): case ord("\t"): case ord("\r"): case ord("\n"): break;
		case ord("("): ds_list_add(out, [txr_token.par_open, start]); break;
		case ord(")"): ds_list_add(out, [txr_token.par_close, start]); break;
        case ord("+"): ds_list_add(out, [txr_token.op, start, txr_op.add]); break;
		case ord("-"): ds_list_add(out, [txr_token.op, start, txr_op.sub]); break;
		case ord("*"): ds_list_add(out, [txr_token.op, start, txr_op.mul]); break;
		case ord("/"): ds_list_add(out, [txr_token.op, start, txr_op.fdiv]); break;
		case ord("%"): ds_list_add(out, [txr_token.op, start, txr_op.fmod]); break;
		default:
			if (char >= ord("0") && char <= ord("9")) {
				while (pos <= len) {
					char = string_ord_at(str, pos);
					if (char >= ord("0") && char <= ord("9")) {
						pos += 1;
					} else break;
				}
				var val = real(string_copy(str, start, pos - start));
				ds_list_add(out, [txr_token.number, start, val]);
			}
			else if (char == ord("_")
				|| (char >= ord("a") && char <= ord("z"))
				|| (char >= ord("A") && char <= ord("Z"))
			) {
				while (pos <= len) {
					char = string_ord_at(str, pos);
					if (char == ord("_")
						|| (char >= ord("0") && char <= ord("9"))
						|| (char >= ord("a") && char <= ord("z"))
						|| (char >= ord("A") && char <= ord("Z"))
					) {
						pos += 1;
					} else break;
				}
				var name = string_copy(str, start, pos - start);
				switch (name) {
					case "mod": ds_list_add(out, [txr_token.op, start, txr_op.fmod]); break;
					case "div": ds_list_add(out, [txr_token.op, start, txr_op.idiv]); break;
					default: ds_list_add(out, [txr_token.ident, start, name]); break;
				}
			}
			else {
				ds_list_clear(out);
				return txr_throw("Unexpected character `" + chr(char) + "`", start);
			}
    }
}
ds_list_add(out, [txr_token.eof, len + 1]);
return false;
