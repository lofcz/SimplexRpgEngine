
txr_build_list = txr_parse_tokens;
txr_build_pos = 0;
txr_build_len = ds_list_size(txr_build_list);
if (txr_build_expr(0)) return true;
if (txr_build_pos < txr_build_len - 1) {
	return txr_throw_at("Trailing data", txr_parse_tokens[|txr_build_pos]);
} else return false;
