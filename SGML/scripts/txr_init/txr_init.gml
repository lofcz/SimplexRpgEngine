// Jazyk:
#macro txr_error global.txr_error_val

// parser:
#macro txr_parse_tokens global.txr_parse_tokens_val
txr_parse_tokens = ds_list_create();
enum txr_token {
	eof = 0, // <end of file>
    op = 1, // + - * / % div
    par_open = 2, // (
    par_close = 3, // )
    number = 4, // 37
    ident = 5, // some
}
enum txr_op {
    mul  = 0x01, // *
    fdiv = 0x02, // /
    fmod = 0x03, // %
    idiv = 0x04, // div
    add  = 0x10, // +
    sub  = 0x11, // -
	maxp = 0x20 // maximum priority
}

// builder:
#macro txr_build_list global.txr_build_list_val
#macro txr_build_node global.txr_build_node_val
#macro txr_build_pos  global.txr_build_pos_val
#macro txr_build_len  global.txr_build_len_val
enum txr_node {
	number = 1, // (number)
	ident = 2, // (name)
	unop = 3, // (unop, node)
	binop = 4, // (binop, a, b)
}
enum txr_unop {
	negate = 1, // -value
}
enum txr_build_flag {
	no_ops = 1
}

// compiler:
#macro txr_compile_list global.txr_compile_list_val
txr_compile_list = ds_list_create();
enum txr_action {
	number = 1, // (value): push(value)
	ident = 2, // (name): push(self[name])
	unop = 3, // (unop): push(-pop())
	binop = 4, // (op): a = pop(); b = pop(); push(binop(op, a, b))
}
