#define live_preinit
// Generated at 2017-11-25 17:18:26 (10574ms)
globalvar mq_gml_builder;mq_gml_builder=[undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined];
globalvar mq_gml_program;mq_gml_program=[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined];
globalvar mq_gml_enum;mq_gml_enum=[undefined,undefined,undefined,undefined];
globalvar mq_gml_enum_ctr;mq_gml_enum_ctr=[undefined,undefined,undefined,0];
globalvar mq_gml_pos;mq_gml_pos=[undefined,0,0];
globalvar mq_gml_script;mq_gml_script=[undefined,undefined,0,undefined,undefined,undefined,0,0,undefined,undefined];
globalvar mq_gml_source;mq_gml_source=[undefined,undefined,undefined,0,undefined,undefined,undefined];
globalvar mq_gml_std_haxe_class;mq_gml_std_haxe_class=[0,undefined,undefined];
globalvar mq_gml_std_haxe_enum;mq_gml_std_haxe_enum=[0,undefined,undefined];
globalvar mq_gml_func_scope;mq_gml_func_scope=[undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined];
globalvar mq_gml_with_scope;mq_gml_with_scope=[0,0,undefined,undefined];
globalvar mt_gml_std_array;mt_gml_std_array=gml_std_haxe_class_create(1,"gml_std_array");
globalvar mt_gml_builder;mt_gml_builder=gml_std_haxe_class_create(7,"gml_builder");
globalvar mt_gml_program;mt_gml_program=gml_std_haxe_class_create(11,"gml_program");
globalvar mt_gml_std_haxe_type_tools;mt_gml_std_haxe_type_tools=gml_std_haxe_class_create(32,"gml_std_haxe_type_tools");
globalvar mt_gml_enum;mt_gml_enum=gml_std_haxe_class_create(33,"gml_enum");
globalvar mt_gml_enum_ctr;mt_gml_enum_ctr=gml_std_haxe_class_create(34,"gml_enum_ctr");
globalvar mt_ast_gml_keyword;mt_ast_gml_keyword=gml_std_haxe_enum_create(35,"ast_gml_keyword");
globalvar mt_gml_node;mt_gml_node=gml_std_haxe_enum_create(36,"gml_node",["undefined","number","cstring","enum_ctr","array_decl","object_decl","ensure_array","ident","self","other","script","native_script","const","arg_const","arg_index","arg_count","call","call_script","call_script_at","call_script_id","call_field","call_func","call_func_at","prefix","postfix","un_op","bin_op","set_op","to_bool","from_bool","in","local","local_set","local_aop","global","global_set","global_aop","field","field_set","field_aop","env","env_set","env_aop","env_fd","env_fd_set","env_fd_aop","env1d","env1d_set","env1d_aop","alarm","alarm_set","alarm_aop","index","index_set","index_aop","index_prefix","index_postfix","index2d","index2d_set","index2d_aop","index2d_prefix","index2d_postfix","raw_id","raw_id_set","raw_id_aop","raw_id_prefix","raw_id_postfix","raw_id2d","raw_id2d_set","raw_id2d_aop","raw_id2d_prefix","raw_id2d_postfix","ds_list","ds_list_set","ds_list_aop","ds_list_prefix","ds_list_postfix","ds_map","ds_map_set","ds_map_aop","ds_map_prefix","ds_map_postfix","ds_grid","ds_grid_set","ds_grid_aop","ds_grid_prefix","ds_grid_postfix","var_decl","block","if_then","ternary","switch","wait","fork","while","do_until","do_while","repeat","for","with","once","return","exit","break","continue","debugger","comment_line","comment_line_pre","comment_line_post","comment_line_sep","comment_block","comment_block_pre","comment_block_post"]);
globalvar mt_gml_pos;mt_gml_pos=gml_std_haxe_class_create(42,"gml_pos");
globalvar mt_gml_script;mt_gml_script=gml_std_haxe_class_create(43,"gml_script");
globalvar mt_gml_source;mt_gml_source=gml_std_haxe_class_create(44,"gml_source");
globalvar mt_gml_token;mt_gml_token=gml_std_haxe_enum_create(45,"gml_token",["header","macro","hash","semico","comma","period","colon","qmark","at_sign","keyword","ident","env","undefined","number","cstring","un_op","in","adjfix","bin_op","set_op","par_open","par_close","sqb_open","sqb_close","cub_open","cub_close","arg_const","comment_post","comment_line","comment_block"]);
globalvar mt_ast_gml_un_op;mt_ast_gml_un_op=gml_std_haxe_enum_create(46,"ast_gml_un_op");
globalvar mt_gml_class;mt_gml_class=gml_std_haxe_enum_create(51,"gml_class");
globalvar mt_gml_std_haxe_class;mt_gml_std_haxe_class=gml_std_haxe_class_create(56,"gml_std_haxe_class");
globalvar mt_gml_std_haxe_enum;mt_gml_std_haxe_enum=gml_std_haxe_class_create(57,"gml_std_haxe_enum");
globalvar mt_gml_action;mt_gml_action=gml_std_haxe_enum_create(151,"gml_action",["discard","dup","dup2x","dup_in","undefined","number","cstring","array_decl","object_decl","const","self","other","local","local_set","local_aop","global","global_set","global_aop","field","field_set","field_aop","index","index_set","index_aop","index2d","index2d_set","index2d_aop","env","env_set","env_aop","env1d","env1d_set","env1d_aop","ds_aop","arg_const","arg_const_set","arg_const_aop","arg_index","arg_index_set","arg_index_aop","arg_count","add_int","equ_op","neq_op","add_op","concat","bin_op","un_op","in","call_script","call_script_at","call_func","jump","jump_if","jump_unless","bool_and","bool_or","switch","repeat_jump","repeat_pre","with_pre","with_next","with_post","break","continue","return","result","wait","fork","ensure_array_local","ensure_array_global","ensure_array_field","alarm","alarm_set","alarm_aop"]);
globalvar mt_gml_func_scope;mt_gml_func_scope=gml_std_haxe_class_create(155,"gml_func_scope");
globalvar mt_gml_with_scope;mt_gml_with_scope=gml_std_haxe_class_create(167,"gml_with_scope");
globalvar g_gml_compile_error_text;
globalvar g_gml_compile_error_pos;
globalvar g_gml_compile_curr_script;
globalvar g_gml_compile_curr_program;
globalvar g_gml_compile_curr_break;g_gml_compile_curr_break=-1;
globalvar g_gml_compile_curr_continue;g_gml_compile_curr_continue=-1;
globalvar g_gml_parser_error_text;
globalvar g_gml_parser_error_pos;
globalvar g_gml_parser_src_buf;g_gml_parser_src_buf=buffer_create(1024,3,1);
globalvar g_gml_parser_str_buf;g_gml_parser_str_buf=buffer_create(1024,1,1);
globalvar g_gml_parser_buf_sub_buf;g_gml_parser_buf_sub_buf=buffer_create(1024,1,1);
globalvar g_gml_parser_tem_row;
globalvar g_gml_parser_tem_row_start;
globalvar g_gml_parser_tem_end;
globalvar g_gml_program_seek_inst;
globalvar g_gml_program_seek_func;
globalvar g_gml_program_seek_script;
globalvar g_gml_sig_list;g_gml_sig_list=ds_list_create();
globalvar g_gml_func_argc;g_gml_func_argc=ds_map_create();
globalvar g_gml_func_args;g_gml_func_args=ds_map_create();
globalvar g_gml_func_rest;g_gml_func_rest=ds_map_create();
globalvar g_gml_func_eval;g_gml_func_eval=ds_map_create();
globalvar g_gml_func_script;g_gml_func_script=ds_map_create();
globalvar g_gml_func_script_id;g_gml_func_script_id=ds_map_create();
globalvar g_gml_inst_data;g_gml_inst_data=ds_map_create();
globalvar g_gml_self;
globalvar g_gml_scope_separator;g_gml_scope_separator="";
globalvar g_gml_scope_lookup;g_gml_scope_lookup=ds_map_create();
globalvar g_gml_scope_fields;g_gml_scope_fields=ds_map_create();
globalvar g_gml_scope_default;
var l_defscope=ds_map_create();
g_gml_scope_lookup[?""]=l_defscope;
g_gml_scope_fields[?l_defscope]="";
g_gml_scope_default=l_defscope;
globalvar g_gml_scope_list;g_gml_scope_list=ds_list_create();
globalvar g_gml_var_flags;g_gml_var_flags=ds_map_create();
globalvar g_gml_var_refs;g_gml_var_refs=ds_map_create();
globalvar g_gml_var_types;g_gml_var_types=ds_map_create();
globalvar g_gml_pf_readonly;g_gml_pf_readonly=1;
globalvar g_gml_pf_array;g_gml_pf_array=2;
globalvar g_gml_pf_inst;g_gml_pf_inst=4;
globalvar g_gml_const_map;g_gml_const_map=ds_map_create();
globalvar g_gml_const_val;g_gml_const_val=ds_map_create();
globalvar g_gml_asset_kind;g_gml_asset_kind=ds_map_create();
globalvar g_gml_asset_index;g_gml_asset_index=ds_map_create();
globalvar g_gml_seek_eval_error_text;
globalvar g_gml_seek_eval_error_pos;
globalvar g_gml_seek_eval_eval_rec;
globalvar g_gml_seek_eval_eval_thread;g_gml_seek_eval_eval_thread=undefined;
globalvar g_gml_seek_eval_eval_actions;g_gml_seek_eval_eval_actions=ds_list_create();
globalvar g_gml_seek_eval_invalid_value;g_gml_seek_eval_invalid_value=[];
globalvar g_gml_seek_set_op_resolve_set_op_safe;
globalvar g_gml_seek_set_op_resolve_set_op_xw;
globalvar g_live_is_ready;g_live_is_ready=false;
globalvar g_live_request_url;g_live_request_url=undefined;
globalvar g_live_request_guid;g_live_request_guid=undefined;
globalvar g_live_request_id;g_live_request_id=undefined;
globalvar g_live_request_time;g_live_request_time=0;
globalvar g_live_request_rate;g_live_request_rate=1;
globalvar g_live_request_password;g_live_request_password="";
globalvar g_live_result;g_live_result="";
globalvar g_live_directory;
globalvar g_live_live_map;g_live_live_map=ds_map_create();
globalvar g_live_live_list;g_live_live_list=ds_list_create();
globalvar g_live_live_enums;g_live_live_enums=ds_map_create();
globalvar g_live_live_macros;g_live_live_macros=ds_map_create();
globalvar g_live_live_globals;g_live_live_globals=undefined;
globalvar g_live_bug24929_map;g_live_bug24929_map=live_bug24929_init();
globalvar g_live_log_script;g_live_log_script=live_script_get_index("live_log_impl");
globalvar g_live_async_http_1_found;g_live_async_http_1_found=ds_map_create();
globalvar g_live_async_http_1_acc;g_live_async_http_1_acc=ds_list_create();
globalvar g_gml_action_list_length;
globalvar g_gml_object_children;
globalvar g_gml_object_fields;g_gml_object_fields=gml_object_init();
globalvar g_gml_object_access;
globalvar g_gml_thread_current;g_gml_thread_current=undefined;
globalvar g_gml_value_cfunc;
globalvar g_gml_type_check_map;g_gml_type_check_map=gml_type_check_init();
globalvar g_gml_value_list_length;
live_preinit_api();
live_preinit_project();

#define gml_std_array_odecl
/// gml_std_array_odecl(meta:string, size:int, pairs:dynamic)->T
var l_meta=argument[0],l_size=argument[1];
if (live_enabled) {
	var l_r=undefined;
	l_r[1,0]=l_meta;
	var l_i=l_size;
	while(--l_i>=0){
		l_r[@l_i]=undefined;
	}
	var l_n=argument_count;
	for(l_i=2;l_i<l_n;l_i+=2){
		l_r[@argument[l_i]]=argument[l_i+1];
	}
	return l_r;
} else return undefined;

#define gml_std_array_wget
/// gml_std_array_wget(this:array, index:int)->T
var this=argument[0],l_index=argument[1];
if (live_enabled) {
	return this[l_index];
} else return undefined;

#define gml_std_array_wset
/// gml_std_array_wset(this:array, index:int, value:T)
var this=argument[0],l_index=argument[1],l_value=argument[2];
if (live_enabled) {
	this[@l_index]=l_value;
}

#define gml_std_array_push
/// gml_std_array_push(this:array, v:T)->int
var this=argument[0],l_v=argument[1];
if (live_enabled) {
	var l_i=array_length_1d(this);
	this[@l_i]=l_v;
	return l_i;
} else return 0;

#define gml_std_array_slice
/// gml_std_array_slice(this:array, pos:int, ?end:int)->array<T>
var this=argument[0],l_pos=argument[1],l_end;
if(argument_count>2)l_end=argument[2];else l_end=undefined;
if (live_enabled) {
	var l_len=array_length_1d(this);
	if(l_pos<0){
		l_pos+=l_len;
		if(l_pos<0)l_pos=0;
	}
	if(l_end==undefined||l_end>l_len)l_end=l_len;
	var l_out=[];
	if(l_end<=l_pos)return l_out;
	var l_size=l_end-l_pos;
	l_pos+=l_size;
	while(--l_size>=0){
		l_out[@l_size]=this[--l_pos];
	}
	return l_out;
} else return undefined;

#define gml_std_array_clone
/// gml_std_array_clone(this:array)->array<T>
var this=argument[0];
if (live_enabled) {
	var l_out;
	if(array_height_2d(this)>1){
		l_out=this;
		l_out[1,0]=l_out[1,0];
	} else if(array_length_1d(this)>0){
		l_out=this;
		l_out[0] = this[0];
	} else l_out=[];
	return l_out;
} else return undefined;

#define gml_builder_create
/// gml_builder_create(src:source)
var this=mq_gml_builder;
this[1,0]=mt_gml_builder;
var l_src=argument[0];
if (live_enabled) {
	this[@10]=undefined;
	this[@7]=[];
	this[@6]=[];
	this[@5]=[];
	this[@4]=[];
	this[@2]=0;
	this[@1]=l_src;
	if(l_src[5]!=undefined)this[@0]=l_src[5]; else this[@0]=gml_parser_run(l_src);
	if(this[0]!=undefined){
		this[@3]=array_length_1d(this[0]);
		gml_builder_build_outer(this,l_src[2]);
	} else {
		this[@10]=g_gml_parser_error_text;
		this[@11]=g_gml_parser_error_pos;
	}
}
return this;

#define gml_builder_error_at
/// gml_builder_error_at(this:builder, text:string, pos:pos)->bool
var this=argument[0],l_text=argument[1],l_pos=argument[2];
if (live_enabled) {
	this[@10]=gml_pos_to_string(l_pos)+": "+l_text;
	this[@11]=l_pos;
	return true;
} else return false;

#define gml_builder_error
/// gml_builder_error(this:builder, text:string, tk:token)->bool
var this=argument[0],l_text=argument[1],l_tk=argument[2];
if (live_enabled) {
	return gml_builder_error_at(this,l_text,l_tk[1]);
} else return false;

#define gml_builder_expect
/// gml_builder_expect(this:builder, text:string, tk:token)->bool
var this=argument[0],l_text=argument[1],l_tk=argument[2];
if (live_enabled) {
	return gml_builder_error(this,"Expected "+l_text+", got "+gml_std_haxe_type_tools_enum_ctr(l_tk),l_tk);
} else return false;

#define gml_builder_expect_node
/// gml_builder_expect_node(this:builder, text:string, node:node)->bool
var this=argument[0],l_text=argument[1],l_node=argument[2];
if (live_enabled) {
	return gml_builder_error_at(this,"Expected "+l_text+", got "+gml_std_haxe_type_tools_enum_ctr(l_node),l_node[1]);
} else return false;

#define gml_builder_build_ops
/// gml_builder_build_ops(this:builder, firstPos:pos, firstOp:GmlOp)->bool
var this=argument[0],l_firstPos=argument[1],l_firstOp=argument[2];
if (live_enabled) {
	this[@2]+=1;
	var l_nodes=ds_list_create();
	ds_list_add(l_nodes,this[12]);
	var l_ops=ds_list_create();
	ds_list_add(l_ops,l_firstOp);
	var l_locs=ds_list_create();
	ds_list_add(l_locs,l_firstPos);
	var l_proc=true;
	var l_i;
	while(l_proc&&this[2]<this[3]){
		if(gml_builder_build_expr(this,1)){
			ds_list_destroy(l_nodes);
			ds_list_destroy(l_ops);
			ds_list_destroy(l_locs);
			return true;
		}
		ds_list_add(l_nodes,this[12]);
		if(this[2]<this[3]){
			var l__g=gml_std_array_wget(this[0],this[2]);
			switch(l__g[0]){
				case 18:
					this[@2]+=1;
					ds_list_add(l_locs,l__g[1]);
					ds_list_add(l_ops,l__g[2]);
					break;
				case 19:
					if(l__g[2]==-1){
						this[@2]+=1;
						ds_list_add(l_locs,l__g[1]);
						ds_list_add(l_ops,64);
					} else l_proc=false;
					break;
				default:l_proc=false;
			}
		}
	}
	var l_pmin=7;
	var l_pmax=0;
	var l_n=ds_list_size(l_ops);
	for(l_i=0;l_i<l_n;l_i+=1){
		var l_pcur=gml_op_get_priority(l_ops[|l_i]);
		if(l_pcur<l_pmin)l_pmin=l_pcur;
		if(l_pcur>l_pmax)l_pmax=l_pcur;
	}
	while(l_pmin<=l_pmax){
		for(l_i=0;l_i<l_n;l_i+=1){
			if(gml_op_get_priority(l_ops[|l_i])==l_pmin){
				l_nodes[|l_i]=gml_node_bin_op(l_locs[|l_i],l_ops[|l_i],l_nodes[|l_i],l_nodes[|l_i+1]);
				ds_list_delete(l_nodes,l_i+1);
				ds_list_delete(l_ops,l_i);
				ds_list_delete(l_locs,l_i);
				l_n-=1;
				l_i-=1;
			}
		}
		l_pmin+=1;
	}
	this[@12]=l_nodes[|0];
	ds_list_destroy(l_nodes);
	ds_list_destroy(l_ops);
	ds_list_destroy(l_locs);
	return false;
} else return false;

#define gml_builder_build_args
/// gml_builder_build_args(this:builder, pos:pos, sqb:bool)->bool
var this=argument[0],l_pos=argument[1],l_sqb=argument[2];
if (live_enabled) {
	var l_args1=[];
	var l_proc=true;
	var l_seenComma=true;
	var l_func=this[12];
	while(l_proc&&this[2]<this[3]){
		var l_tk=gml_std_array_wget(this[0],this[2]);
		switch(l_tk[0]){
			case 4:
				if(l_seenComma){
					return gml_builder_error(this,"Unexpected comma",l_tk);
				} else {
					l_seenComma=true;
					this[@2]+=1;
				}
				break;
			case 21:
				if(l_sqb){
					return gml_builder_error(this,"Unexpected `)`",l_tk);
				} else {
					l_proc=false;
					this[@2]+=1;
				}
				break;
			default:
				if(l_seenComma){
					l_seenComma=false;
					if(gml_builder_build_expr(this,0))return true;
					gml_std_array_push(l_args1,this[12]);
				} else return gml_builder_expect(this,"a comma or closing token.",l_tk);
		}
	}
	if(l_proc)return gml_builder_error_at(this,"Unclosed list",l_pos);
	if(l_sqb)this[@12]=gml_node_array_decl(l_pos,l_args1); else this[@12]=gml_node_call(l_pos,l_func,l_args1);
	return false;
} else return false;

#define gml_builder_build_expr
/// gml_builder_build_expr(this:builder, flags:int)->bool
var this=argument[0],l_flags=argument[1];
if (live_enabled) {
	if(this[2]>=this[3])return gml_builder_error_at(this,"Expected an expression",gml_std_array_wget(this[1],6));
	var l_proc,l_sep,l_i,l_n,l_s,l_tk;
	var l_tk0=gml_std_array_wget(this[0],this[@2]++);
	var l_node,l_node2,l_nodes;
	switch(l_tk0[0]){
		case 0:if((l_flags&4)!=0)return gml_builder_error(this,"Expected a statement, got a header (did you miss a closing bracket?)",l_tk0); else return gml_builder_error(this,"Expected an expression, got a header (did you miss a closing parenthesis?)",l_tk0);
		case 9:
			switch(l_tk0[2]){
				case 0:
					var l_d=l_tk0[1];
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected a period",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==5){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected a period",gml_std_array_wget(this[0],this[2]));
					var l__g1=gml_std_array_wget(this[0],this[2]);
					if(l__g1[0]==10){
						this[@2]+=1;
						this[@12]=gml_node_global(l__g1[1],l__g1[2]);
					} else return gml_builder_expect(this,"a field name",gml_std_array_wget(this[0],this[2]));
					break;
				case 21:
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected an opening square bracket",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==22){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected an opening square bracket",gml_std_array_wget(this[0],this[2]));
					if(gml_builder_build_expr(this,0))return true;
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected a closing square bracket",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected a closing square bracket",gml_std_array_wget(this[0],this[2]));
					this[@12]=gml_node_arg_index(l_tk0[1],this[12]);
					break;
				case 22:this[@12]=gml_node_arg_count(l_tk0[1]);break;
				default:if((l_flags&4)!=0)return gml_builder_expect(this,"a statement",l_tk0); else return gml_builder_expect(this,"a value",l_tk0);
			}
			break;
		case 10:
			var l_s2=l_tk0[2];
			switch(l_s2){
				case "other":this[@12]=gml_node_other(l_tk0[1]);break;
				case "self":this[@12]=gml_node_self(l_tk0[1]);break;
				default:
					if(ds_map_exists(g_gml_asset_index,l_s2)){
						l_i=g_gml_asset_index[?l_s2];
						this[@12]=gml_node_number(l_tk0[1],l_i,undefined);
					} else this[@12]=gml_node_ident(l_tk0[1],l_s2);
			}
			break;
		case 12:this[@12]=gml_node_undefined(l_tk0[1]);break;
		case 13:this[@12]=gml_node_number(l_tk0[1],l_tk0[2],l_tk0[3]);break;
		case 14:this[@12]=gml_node_cstring(l_tk0[1],l_tk0[2]);break;
		case 15:
			if(gml_builder_build_expr(this,1))return true;
			var l__g4=this[12];
			if(l__g4[0]==1){
				var l_f1=l__g4[2];
				switch(l_tk0[2]){
					case 0:l_f1=-l_f1;break;
					case 1:l_f1=(l_f1>0.5) ? 0 : 1;break;
					case 2:l_f1=~floor(l_f1);break;
				}
				this[@12]=gml_node_number(l_tk0[1],l_f1,undefined);
			} else this[@12]=gml_node_un_op(l_tk0[1],this[12],l_tk0[2]);
			break;
		case 17:
			if(gml_builder_build_expr(this,1))return true;
			this[@12]=gml_node_prefix(l_tk0[1],this[12],l_tk0[2]);
			break;
		case 18:
			switch(l_tk0[2]){
				case 16:
					var l_d9=l_tk0[1];
					if(gml_builder_build_expr(this,1))return true;
					break;
				case 17:
					var l_d10=l_tk0[1];
					if(gml_builder_build_expr(this,1))return true;
					var l__g5=this[12];
					if(l__g5[0]==1)this[@12]=gml_node_number(l_d10,-l__g5[2],undefined); else this[@12]=gml_node_un_op(l_d10,this[12],0);
					break;
				default:if((l_flags&4)!=0)return gml_builder_expect(this,"a statement",l_tk0); else return gml_builder_expect(this,"a value",l_tk0);
			}
			break;
		case 20:
			if(gml_builder_build_expr(this,0))return true;
			if(this[2]>=this[3])return gml_builder_error(this,"Unclosed parenthesis",l_tk0);
			if(this[2]>=this[3]){
				return gml_builder_error_at(this,"Expected a closing parenthesis",gml_std_array_wget(this[1],6));
			} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==21){
				this[@2]+=1;
			} else return gml_builder_error(this,"Expected a closing parenthesis",gml_std_array_wget(this[0],this[2]));
			break;
		case 22:
			l_proc=true;
			l_sep=true;
			l_nodes=[];
			while(l_proc&&this[2]<this[3]){
				switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
					case 4:
						if(l_sep){
							return gml_builder_expect(this,"a value or closing bracket",gml_std_array_wget(this[0],this[2]));
						} else {
							this[@2]+=1;
							l_sep=true;
						}
						break;
					case 23:
						this[@2]+=1;
						l_proc=false;
						break;
					default:
						if(gml_builder_build_expr(this,0))return true;
						gml_std_array_push(l_nodes,this[12]);
						l_sep=false;
				}
			}
			this[@12]=gml_node_array_decl(l_tk0[1],l_nodes);
			break;
		case 24:
			var l_keys=[];
			l_nodes=[];
			l_proc=true;
			if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==25){
				this[@2]+=1;
			} else while(l_proc&&this[2]<this[3]){
				var l__g11=gml_std_array_wget(this[0],this[2]);
				switch(l__g11[0]){
					case 10:
						l_s=l__g11[2];
						gml_std_array_push(l_keys,l_s);
						this[@2]+=1;
						if(this[2]>=this[3]){
							return gml_builder_error_at(this,"Expected a `:` in object declaration",gml_std_array_wget(this[1],6));
						} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
							this[@2]+=1;
						} else return gml_builder_error(this,"Expected a `:` in object declaration",gml_std_array_wget(this[0],this[2]));
						if(gml_builder_build_expr(this,0))return true;
						gml_std_array_push(l_nodes,this[12]);
						switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
							case 4:
								this[@2]+=1;
								if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==25){
									this[@2]+=1;
									l_proc=false;
								}
								break;
							case 25:
								this[@2]+=1;
								l_proc=false;
								break;
							default:return gml_builder_expect(this,"a `,` or a `}` in object declaration",gml_std_array_wget(this[0],this[2]));
						}
						break;
					case 14:
						l_s=l__g11[2];
						gml_std_array_push(l_keys,l_s);
						this[@2]+=1;
						if(this[2]>=this[3]){
							return gml_builder_error_at(this,"Expected a `:` in object declaration",gml_std_array_wget(this[1],6));
						} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
							this[@2]+=1;
						} else return gml_builder_error(this,"Expected a `:` in object declaration",gml_std_array_wget(this[0],this[2]));
						if(gml_builder_build_expr(this,0))return true;
						gml_std_array_push(l_nodes,this[12]);
						switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
							case 4:
								this[@2]+=1;
								if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==25){
									this[@2]+=1;
									l_proc=false;
								}
								break;
							case 25:
								this[@2]+=1;
								l_proc=false;
								break;
							default:return gml_builder_expect(this,"a `,` or a `}` in object declaration",gml_std_array_wget(this[0],this[2]));
						}
						break;
					default:return gml_builder_expect(this,"a key-value pair or a `}` in object declaration",gml_std_array_wget(this[0],this[2]));
				}
			}
			this[@12]=gml_node_object_decl(l_tk0[1],l_keys,l_nodes);
			break;
		case 26:this[@12]=gml_node_arg_const(l_tk0[1],l_tk0[2]);break;
		case 27:
			if(gml_builder_build_expr(this,l_flags))return true;
			this[@12]=gml_node_comment_line_pre(l_tk0[1],l_tk0[2],this[12]);
			break;
		case 28:
			if(gml_builder_build_expr(this,l_flags))return true;
			this[@12]=gml_node_comment_line_sep(l_tk0[1],l_tk0[2],this[12]);
			break;
		case 29:
			if(gml_builder_build_expr(this,l_flags))return true;
			this[@12]=gml_node_comment_block_pre(l_tk0[1],l_tk0[2],this[12],l_tk0[3]);
			break;
		default:if((l_flags&4)!=0)return gml_builder_expect(this,"a statement",l_tk0); else return gml_builder_expect(this,"a value",l_tk0);
	}
	l_proc=true;
	while(l_proc&&this[2]<this[3]){
		l_tk=gml_std_array_wget(this[0],this[2]);
		switch(l_tk[0]){
			case 5:
				if((l_flags&2)==0){
					this[@2]+=1;
					var l__g9=gml_std_array_wget(this[0],this[2]);
					if(l__g9[0]==10){
						l_s=l__g9[2];
						this[@2]+=1;
						this[@12]=gml_node_field(l_tk[1],this[12],l_s);
					} else return gml_builder_error(this,"Expected a field name",gml_std_array_wget(this[0],this[2]));
				} else return gml_builder_error(this,"Unexpected period",gml_std_array_wget(this[0],this[2]));
				break;
			case 7:
				if((l_flags&1)==0){
					this[@2]+=1;
					l_node=this[12];
					if(gml_builder_build_expr(this,0))return true;
					l_node2=this[12];
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected an else-colon",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected an else-colon",gml_std_array_wget(this[0],this[2]));
					if(gml_builder_build_expr(this,0))return true;
					this[@12]=gml_node_ternary(l_tk[1],l_node,l_node2,this[12]);
				} else l_proc=false;
				break;
			case 15:
				if(l_tk[2]==1){
					if((l_flags&2)==0){
						this[@2]+=1;
						if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==16){
							l_node=this[12];
							this[@2]+=1;
							if(gml_builder_build_expr(this,1))return true;
							this[@12]=gml_node_in(l_tk[1],l_node,this[12],true);
						} else this[@2]-=1;
					}
				} else l_proc=false;
				break;
			case 16:
				if((l_flags&2)==0){
					l_node=this[12];
					this[@2]+=1;
					if(gml_builder_build_expr(this,1))return true;
					this[@12]=gml_node_in(l_tk[1],l_node,this[12],false);
				}
				break;
			case 17:
				if((l_flags&2)==0){
					this[@2]+=1;
					this[@12]=gml_node_postfix(l_tk[1],this[12],l_tk[2]);
					l_flags|=2;
				} else if(l_tk[2]){
					return gml_builder_error_at(this,"Unexpected `++`",l_tk[1]);
				} else return gml_builder_error_at(this,"Unexpected `--`",l_tk[1]);
				break;
			case 18:
				if((l_flags&1)==0){
					if(gml_builder_build_ops(this,l_tk[1],l_tk[2]))return true;
					l_flags|=2;
				} else l_proc=false;
				break;
			case 19:
				if(l_tk[2]==-1){
					if((l_flags&1)==0){
						if(gml_builder_build_ops(this,l_tk[1],64))return true;
						l_flags|=2;
					} else l_proc=false;
				} else l_proc=false;
				break;
			case 20:
				if((l_flags&2)==0){
					this[@2]+=1;
					if(gml_builder_build_args(this,l_tk[1],false))return true;
				} else return gml_builder_error_at(this,"Unexpected `(`",l_tk[1]);
				break;
			case 22:
				var l_d24=l_tk[1];
				if((l_flags&2)==0){
					this[@2]+=1;
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected an index",gml_std_array_wget(this[1],6));
					l_node=this[12];
					var l__g19=gml_std_array_wget(this[0],this[2]);
					switch(l__g19[0]){
						case 2:
							this[@2]+=1;
							if(gml_builder_build_expr(this,0))return true;
							l_node2=this[12];
							if(this[2]>=this[3]){
								return gml_builder_error_at(this,"Expected a comma",gml_std_array_wget(this[1],6));
							} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==4){
								this[@2]+=1;
							} else return gml_builder_error(this,"Expected a comma",gml_std_array_wget(this[0],this[2]));
							if(gml_builder_build_expr(this,0))return true;
							if(this[2]>=this[3]){
								return gml_builder_error_at(this,"Expected a closing bracket",gml_std_array_wget(this[1],6));
							} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
								this[@2]+=1;
							} else return gml_builder_error(this,"Expected a closing bracket",gml_std_array_wget(this[0],this[2]));
							this[@12]=gml_node_ds_grid(l_d24,l_node,l_node2,this[12]);
							break;
						case 7:
							this[@2]+=1;
							if(gml_builder_build_expr(this,0))return true;
							if(this[2]>=this[3]){
								return gml_builder_error_at(this,"Expected a closing bracket",gml_std_array_wget(this[1],6));
							} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
								this[@2]+=1;
							} else return gml_builder_error(this,"Expected a closing bracket",gml_std_array_wget(this[0],this[2]));
							this[@12]=gml_node_ds_map(l_d24,l_node,this[12]);
							break;
						case 8:
							this[@2]+=1;
							if(gml_builder_build_expr(this,0))return true;
							if(this[2]>=this[3])return gml_builder_error_at(this,"Expected comma or a closing bracket",gml_std_array_wget(this[1],6));
							switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
								case 4:
									this[@2]+=1;
									l_node2=this[12];
									if(gml_builder_build_expr(this,0))return true;
									if(this[2]>=this[3]){
										return gml_builder_error_at(this,"Expected a closing bracket",gml_std_array_wget(this[1],6));
									} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
										this[@2]+=1;
									} else return gml_builder_error(this,"Expected a closing bracket",gml_std_array_wget(this[0],this[2]));
									this[@12]=gml_node_raw_id2d(l_d24,l_node,l_node2,this[12]);
									break;
								case 23:
									this[@2]+=1;
									this[@12]=gml_node_raw_id(l_d24,l_node,this[12]);
									break;
								default:gml_builder_expect(this,"comma or a closing bracket",gml_std_array_wget(this[0],this[2]));
							}
							break;
						case 18:
							if(l__g19[2]==48){
								this[@2]+=1;
								if(gml_builder_build_expr(this,0))return true;
								if(this[2]>=this[3]){
									return gml_builder_error_at(this,"Expected a closing bracket",gml_std_array_wget(this[1],6));
								} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
									this[@2]+=1;
								} else return gml_builder_error(this,"Expected a closing bracket",gml_std_array_wget(this[0],this[2]));
								this[@12]=gml_node_ds_list(l_d24,l_node,this[12]);
							} else l_proc=false;
							break;
						default:l_proc=false;
					}
					if(!l_proc){
						l_proc=true;
						if(gml_builder_build_expr(this,0))return true;
						if(this[2]>=this[3])return gml_builder_error_at(this,"Expected comma or a closing bracket",gml_std_array_wget(this[1],6));
						switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
							case 4:
								this[@2]+=1;
								l_node2=this[12];
								if(gml_builder_build_expr(this,0))return true;
								if(this[2]>=this[3]){
									return gml_builder_error_at(this,"Expected a closing bracket",gml_std_array_wget(this[1],6));
								} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==23){
									this[@2]+=1;
								} else return gml_builder_error(this,"Expected a closing bracket",gml_std_array_wget(this[0],this[2]));
								this[@12]=gml_node_index2d(l_d24,l_node,l_node2,this[12]);
								break;
							case 23:
								this[@2]+=1;
								this[@12]=gml_node_index(l_d24,l_node,this[12]);
								break;
							default:gml_builder_expect(this,"comma or a closing bracket",gml_std_array_wget(this[0],this[2]));
						}
					}
				} else return gml_builder_error_at(this,"Unexpected `[`",l_d24);
				break;
			case 27:
				this[@2]+=1;
				this[@12]=gml_node_comment_line_post(l_tk[1],this[12],l_tk[2]);
				break;
			case 28:this[@2]+=1;break;
			case 29:
				this[@2]+=1;
				this[@12]=gml_node_comment_block_post(l_tk[1],this[12],l_tk[2],l_tk[3]);
				break;
			default:l_proc=false;
		}
	}
	return false;
} else return false;

#define gml_builder_build_line
/// gml_builder_build_line(this:builder)->bool
var this=argument[0];
if (live_enabled) {
	if(this[2]>=this[3])return gml_builder_error_at(this,"Expected a statement",gml_std_array_wget(this[1],6));
	var l_tk=gml_std_array_wget(this[0],this[@2]++);
	var l_tk2,l_proc,l_sep,l_x,l_x1,l_x2,l_nodes,l_i,l_s,l_d;
	var l_unknown=false;
	switch(l_tk[0]){
		case 1:
			var l__g=gml_std_array_wget(this[0],this[@2]++);
			if(l__g[0]==10){
				if(gml_builder_build_expr(this,0))return true;
				var l_i1=array_length_1d(this[6]);
				gml_std_array_wset(this[6],l_i1,l__g[2]);
				gml_std_array_wset(this[7],l_i1,this[12]);
				this[@12]=gml_node_block(l_tk[1],[]);
			} else gml_builder_error(this,"Expected a macro name",gml_std_array_wget(this[0],this[2]));
			break;
		case 9:
			switch(l_tk[2]){
				case 1:
					l_d=l_tk[1];
					this[@12]=gml_node_block(l_d,[]);
					while(this[2]<this[3]){
						l_tk2=gml_std_array_wget(this[0],this[@2]++);
						if(l_tk2[0]==10){
							l_d=l_tk2[1];
							l_s=l_tk2[2];
							l_i=array_length_1d(this[6]);
							gml_std_array_wset(this[6],l_i,l_s);
							gml_std_array_wset(this[7],l_i,gml_node_global(l_d,l_s));
							if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==4){
								this[@2]+=1;
								continue;
							}
						} else return gml_builder_error(this,"Expected a global variable name.",l_tk2);
						break;
					}
					break;
				case 2:
					l_nodes=[];
					l_proc=true;
					while(l_proc&&this[2]<this[3]){
						l_tk2=gml_std_array_wget(this[0],this[@2]++);
						if(l_tk2[0]==10){
							if(this[2]>=this[3])return gml_builder_error_at(this,"Expected a variable value",gml_std_array_wget(this[1],6));
							l_tk=gml_std_array_wget(this[0],this[2]);
							if(l_tk[0]==19){
								if(l_tk[2]==-1){
									this[@2]+=1;
									if(gml_builder_build_expr(this,0))return true;
								} else this[@12]=undefined;
							} else this[@12]=undefined;
							gml_std_array_push(l_nodes,gml_node_var_decl(l_tk2[1],l_tk2[2],this[12]));
							if(this[2]<this[3])switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
								case 3:
									this[@2]+=1;
									l_proc=false;
									break;
								case 4:this[@2]+=1;break;
								case 10:
									this[@2]+=1;
									if(this[2]<this[3]){
										var l__g3=gml_std_array_wget(this[0],this[2]);
										if(l__g3[0]==19){
											if(l__g3[2]==-1){
												this[@2]-=1;
												return gml_builder_error(this,"Suspicious assignment after a variable declaration. Did you forget a `,` or a `;`?",gml_std_array_wget(this[0],this[2]));
											}
										}
									}
									this[@2]-=1;
									l_proc=false;
									break;
								default:l_proc=false;
							}
						} else return gml_builder_expect(this,"a variable name",l_tk2);
					}
					if(array_length_1d(l_nodes)!=1)this[@12]=gml_node_block(l_tk[1],l_nodes); else this[@12]=l_nodes[0];
					break;
				case 3:
					var l_e;
					var l__g4=gml_std_array_wget(this[0],this[2]);
					if(l__g4[0]==10){
						var l_s2=l__g4[2];
						var l_d5=l__g4[1];
						this[@2]+=1;
						l_e=gml_enum_create(l_s2,l_d5);
					} else return gml_builder_error(this,"Expected an enum name",gml_std_array_wget(this[0],this[2]));
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected enum block",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==24){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected enum block",gml_std_array_wget(this[0],this[2]));
					l_proc=true;
					l_sep=true;
					while(this[2]<this[3]&&l_proc){
						var l__g12=gml_std_array_wget(this[0],this[2]);
						switch(l__g12[0]){
							case 4:
								if(l_sep){
									return gml_builder_error(this,"Unexpected comma",gml_std_array_wget(this[0],this[2]));
								} else {
									this[@2]+=1;
									l_sep=true;
								}
								break;
							case 10:
								if(l_sep){
									this[@2]+=1;
									var l__g13=gml_std_array_wget(this[0],this[2]);
									if(l__g13[0]==19){
										if(l__g13[2]==-1){
											this[@2]+=1;
											if(gml_builder_build_expr(this,0))return true;
										} else this[@12]=undefined;
									} else this[@12]=undefined;
									var l_ec=gml_enum_ctr_create(l__g12[2],l__g12[1],this[12]);
									gml_std_array_push(l_e[2],l_ec);
									ds_map_set(l_e[3],l_ec[0],l_ec);
									l_sep=false;
								} else return gml_builder_expect(this,"a comma or a closing bracket",gml_std_array_wget(this[0],this[2]));
								break;
							case 25:
								this[@2]+=1;
								l_proc=false;
								break;
							default:return gml_builder_expect(this,"a comma, enum entry, or closing bracket",gml_std_array_wget(this[0],this[2]));
						}
					}
					if(l_proc)return gml_builder_error(this,"Unclosed enum-block",l_tk);
					gml_std_array_push(this[5],l_e);
					this[@12]=gml_node_block(l_tk[1],[]);
					break;
				case 4:
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected a then-expression",gml_std_array_wget(this[1],6));
					var l__g5=gml_std_array_wget(this[0],this[2]);
					if(l__g5[0]==9){
						if(l__g5[2]==5)this[@2]+=1;
					}
					if(gml_builder_build_line(this))return true;
					l_x2=this[12];
					while(this[2]<this[3]){
						switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
							case 27:case 28:case 29:
								this[@2]+=1;
								continue;
						}
						break;
					}
					if(this[2]<this[3]){
						var l__g15=gml_std_array_wget(this[0],this[2]);
						if(l__g15[0]==9){
							if(l__g15[2]==6){
								this[@2]+=1;
								if(gml_builder_build_line(this))return true;
								l_x=this[12];
							} else l_x=undefined;
						} else l_x=undefined;
					} else l_x=undefined;
					this[@12]=gml_node_if_then(l_tk[1],l_x1,l_x2,l_x);
					break;
				case 7:
					var l_d7=l_tk[1];
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					var l_cc=[];
					var l_c=undefined;
					if(this[2]>=this[3]){
						return gml_builder_error_at(this,"Expected switch-block body",gml_std_array_wget(this[1],6));
					} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==24){
						this[@2]+=1;
					} else return gml_builder_error(this,"Expected switch-block body",gml_std_array_wget(this[0],this[2]));
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected switch-block contents",gml_std_array_wget(this[1],6));
					var l__g7=gml_std_array_wget(this[0],this[2]);
					switch(l__g7[0]){
						case 9:
							switch(l__g7[2]){
								case 8:case 9:break;
								default:return gml_builder_expect(this,"`case` or `default`",gml_std_array_wget(this[0],this[2]));
							}
							break;
						case 27:case 28:case 29:break;
						default:return gml_builder_expect(this,"`case` or `default`",gml_std_array_wget(this[0],this[2]));
					}
					l_proc=true;
					l_x2=undefined;
					l_nodes=undefined;
					var l_pre=[];
					while(this[2]<this[3]&&l_proc){
						var l__g16=gml_std_array_wget(this[0],this[2]);
						switch(l__g16[0]){
							case 9:
								switch(l__g16[2]){
									case 8:
										this[@2]+=1;
										if(gml_builder_build_expr(this,0))return true;
										if(this[2]>=this[3]){
											return gml_builder_error_at(this,"Expected a colon",gml_std_array_wget(this[1],6));
										} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
											this[@2]+=1;
										} else return gml_builder_error(this,"Expected a colon",gml_std_array_wget(this[0],this[2]));
										l_nodes=[this[12]];
										while(this[2]<this[3]){
											var l__g18=gml_std_array_wget(this[0],this[2]);
											if(l__g18[0]==9){
												if(l__g18[2]==8){
													this[@2]+=1;
													if(gml_builder_build_expr(this,0))return true;
													if(this[2]>=this[3]){
														return gml_builder_error_at(this,"Expected a colon",gml_std_array_wget(this[1],6));
													} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
														this[@2]+=1;
													} else return gml_builder_error(this,"Expected a colon",gml_std_array_wget(this[0],this[2]));
													gml_std_array_push(l_nodes,this[12]);
													continue;
												}
											}
											break;
										}
										l_c=undefined;
										l_c[1,0] = "GmlNodeCase";
										l_c[2]=l_pre;
										l_c[0]=l_nodes;
										l_c[1]=undefined;
										gml_std_array_push(l_cc,l_c);
										l_nodes=[];
										l_pre=[];
										l_c[@1]=gml_node_block(l__g16[1],l_nodes);
										break;
									case 9:
										this[@2]+=1;
										if(this[2]>=this[3]){
											return gml_builder_error_at(this,"Expected a colon",gml_std_array_wget(this[1],6));
										} else if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==6){
											this[@2]+=1;
										} else return gml_builder_error(this,"Expected a colon",gml_std_array_wget(this[0],this[2]));
										l_nodes=[];
										l_x2=gml_node_block(l__g16[1],l_nodes);
										break;
									default:
										if(gml_builder_build_line(this))return true;
										gml_std_array_push(l_nodes,this[12]);
								}
								break;
							case 25:
								this[@2]+=1;
								l_proc=false;
								break;
							case 27:
								this[@2]+=1;
								gml_std_array_push(l_pre,gml_node_comment_line(l__g16[1],l__g16[2]));
								break;
							case 28:
								this[@2]+=1;
								gml_std_array_push(l_pre,gml_node_comment_line(l__g16[1],l__g16[2]));
								break;
							case 29:
								this[@2]+=1;
								gml_std_array_push(l_pre,gml_node_comment_block(l__g16[1],l__g16[2]));
								break;
							default:
								if(gml_builder_build_line(this))return true;
								gml_std_array_push(l_nodes,this[12]);
						}
					}
					if(l_proc)return gml_builder_error_at(this,"Unclosed switch-block",l_d7);
					this[@12]=gml_node_switch(l_d7,l_x1,l_cc,l_x2);
					break;
				case 10:
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					if(gml_builder_build_line(this))return true;
					this[@12]=gml_node_repeat(l_tk[1],l_x1,this[12]);
					break;
				case 11:
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					if(gml_builder_build_line(this))return true;
					this[@12]=gml_node_while(l_tk[1],l_x1,this[12]);
					break;
				case 13:
					var l_d13=l_tk[1];
					if(gml_builder_build_line(this))return true;
					l_x1=this[12];
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected a `while` or `until`",gml_std_array_wget(this[1],6));
					var l__g8=gml_std_array_wget(this[0],this[2]);
					if(l__g8[0]==9)switch(l__g8[2]){
						case 11:
							this[@2]+=1;
							if(gml_builder_build_expr(this,0))return true;
							this[@12]=gml_node_do_while(l_d13,l_x1,this[12]);
							break;
						case 12:
							this[@2]+=1;
							if(gml_builder_build_expr(this,0))return true;
							this[@12]=gml_node_do_until(l_d13,l_x1,this[12]);
							break;
						default:return gml_builder_expect(this,"a `while` or `until`",gml_std_array_wget(this[0],this[2]));
					} else return gml_builder_expect(this,"a `while` or `until`",gml_std_array_wget(this[0],this[2]));
					break;
				case 14:
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected for-loop header",gml_std_array_wget(this[1],6));
					if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==20){
						this[@2]+=1;
						l_proc=true;
					} else l_proc=false;
					if(gml_builder_build_line(this))return true;
					l_x=this[12];
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					if(this[2]>=this[3])return gml_builder_error_at(this,"Expected for-loop post-action",gml_std_array_wget(this[1],6));
					if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==3)this[@2]+=1;
					if(gml_builder_build_line(this))return true;
					l_x2=this[12];
					if(l_proc){
						if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==21)this[@2]+=1; else return gml_builder_expect(this,"a closing parenthesis",gml_std_array_wget(this[0],this[2]));
					}
					if(gml_builder_build_line(this))return true;
					this[@12]=gml_node_for(l_tk[1],l_x,l_x1,l_x2,this[12]);
					break;
				case 15:
					if(gml_builder_build_expr(this,0))return true;
					l_x1=this[12];
					if(gml_builder_build_line(this))return true;
					this[@12]=gml_node_with(l_tk[1],l_x1,this[12]);
					break;
				case 16:this[@12]=gml_node_continue(l_tk[1]);break;
				case 17:this[@12]=gml_node_break(l_tk[1]);break;
				case 18:
					if(gml_builder_build_expr(this,0))return true;
					this[@12]=gml_node_return(l_tk[1],this[12]);
					break;
				case 19:this[@12]=gml_node_exit(l_tk[1]);break;
				case 20:
					if(gml_builder_build_expr(this,0))return true;
					this[@12]=gml_node_wait(l_tk[1],this[12]);
					break;
				case 23:this[@12]=gml_node_debugger(l_tk[1]);break;
				default:l_unknown=true;
			}
			break;
		case 24:
			var l_start=l_tk[1];
			l_proc=true;
			l_nodes=[];
			if(this[2]<this[3]){
				var l__g10=gml_std_array_wget(this[0],this[2]);
				if(l__g10[0]==27){
					gml_std_array_push(l_nodes,gml_node_comment_line(l__g10[1],l__g10[2]));
					this[@2]+=1;
				}
			}
			while(l_proc&&this[2]<this[3]){
				var l__g20=gml_std_array_wget(this[0],this[2]);
				switch(l__g20[0]){
					case 25:
						this[@2]+=1;
						l_proc=false;
						break;
					case 28:
						this[@2]+=1;
						gml_std_array_push(l_nodes,gml_node_comment_line(l__g20[1],l__g20[2]));
						break;
					case 29:
						switch(l__g20[3]){
							case false:
								if(gml_builder_build_line(this))return true;
								gml_std_array_push(l_nodes,gml_node_comment_block_pre(l__g20[1],l__g20[2],this[12],false));
								break;
							case true:
								this[@2]+=1;
								gml_std_array_push(l_nodes,gml_node_comment_block(l__g20[1],l__g20[2]));
								break;
						}
						break;
					default:
						if(gml_builder_build_line(this))return true;
						gml_std_array_push(l_nodes,this[12]);
				}
			}
			if(l_proc)return gml_builder_error_at(this,"Expected a closing bracket.",l_start);
			this[@12]=gml_node_block(l_start,l_nodes);
			break;
		case 27:
			if(gml_builder_build_line(this))return true;
			this[@12]=gml_node_comment_line_pre(l_tk[1],l_tk[2],this[12]);
			break;
		case 28:
			if(this[2]<this[3]){
				if(gml_builder_build_line(this))return true;
				this[@12]=gml_node_comment_line_sep(l_tk[1],l_tk[2],this[12]);
			} else this[@12]=gml_node_comment_line(l_tk[1],l_tk[2]);
			break;
		case 29:
			if(this[2]<this[3]){
				if(gml_builder_build_line(this))return true;
				this[@12]=gml_node_comment_block_pre(l_tk[1],l_tk[2],this[12],l_tk[3]);
			} else this[@12]=gml_node_comment_block(l_tk[1],l_tk[2]);
			break;
		default:l_unknown=true;
	}
	if(l_unknown)this[@2]-=1;
	if(l_unknown){
		if(gml_builder_build_expr(this,5))return true;
		if(this[2]<this[3]){
			var l__g22=gml_std_array_wget(this[0],this[2]);
			if(l__g22[0]==19){
				l_x=this[12];
				this[@2]+=1;
				if(gml_builder_build_expr(this,0))return true;
				this[@12]=gml_node_set_op(l__g22[1],l__g22[2],l_x,this[12]);
			} else if(!gml_node_is_statement(this[12])){
				return gml_builder_expect_node(this,"a statement",this[12]);
			}
		} else if(!gml_node_is_statement(this[12])){
			return gml_builder_expect_node(this,"a statement",this[12]);
		}
	}
	while(this[2]<this[3]){
		if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==3){
			this[@2]+=1;
			continue;
		}
		break;
	}
	if(this[2]<this[3]){
		var l__g24=gml_std_array_wget(this[0],this[2]);
		if(l__g24[0]==27){
			this[@2]+=1;
			this[@12]=gml_node_comment_line_post(l__g24[1],this[12],l__g24[2]);
		}
	}
	return false;
} else return false;

#define gml_builder_build_outer
/// gml_builder_build_outer(this:builder, name:string, ?namedArgs:Dictionary<int>, namedArgc:int = 0)->bool
var this=argument[0],l_name=argument[1],l_namedArgs,l_namedArgc;
if(argument_count>2)l_namedArgs=argument[2];else l_namedArgs=undefined;
if(argument_count>3)l_namedArgc=argument[3];else l_namedArgc=0;
if (live_enabled) {
	var l_scr=gml_script_create(this[1],l_name,(this[2]>=this[3]) ? gml_std_array_wget(this[1],6) : gml_std_array_wget(gml_std_array_wget(this[0],this[2]),1));
	if(l_namedArgs==undefined)l_namedArgs=ds_map_create();
	l_scr[@8]=l_namedArgs;
	l_scr[@7]=l_namedArgc;
	gml_std_array_push(this[4],l_scr);
	var l_nodes=[];
	var l_proc=true;
	while(this[2]<this[3]){
		var l__g=gml_std_array_wget(this[0],this[2]);
		switch(l__g[0]){
			case 0:
				this[@2]+=1;
				var l_nextName=l__g[2];
				var l_nextArgs=undefined;
				var l_nextArgc=0;
				if(!(l__g[3]||this[2]>=this[3])){
					if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==20){
						this[@2]+=1;
						l_nextArgs=ds_map_create();
						var l_proc1=true;
						if(this[2]>=this[3])return gml_builder_error_at(this,"Expected script arguments",gml_std_array_wget(this[1],6));
						if(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)==21){
							this[@2]+=1;
						} else while(l_proc1&&this[2]<this[3]){
							var l__g11=gml_std_array_wget(this[0],this[2]);
							if(l__g11[0]==10){
								var l_s=l__g11[2];
								var l_nextArg=l_s;
								if(ds_map_exists(l_nextArgs,l_nextArg)){
									ds_map_destroy(l_nextArgs);
									return gml_builder_error(this,"An argument named "+l_nextArg+" is already defined at position "+string(l_nextArgs[?l_nextArg]),gml_std_array_wget(this[0],this[2]));
								}
								l_nextArgs[?l_s]=l_nextArgc;
								l_nextArgc+=1;
								this[@2]+=1;
								switch(gml_std_array_wget(gml_std_array_wget(this[0],this[2]),0)){
									case 4:this[@2]+=1;break;
									case 21:
										this[@2]+=1;
										l_proc1=false;
										break;
									default:
										ds_map_destroy(l_nextArgs);
										return gml_builder_expect(this,"a comma or closing parenthesis in script arguments",gml_std_array_wget(this[0],this[2]));
								}
							} else return gml_builder_expect(this,"an argument",gml_std_array_wget(this[0],this[2]));
						}
					}
				}
				if(gml_builder_build_outer(this,l_nextName,l_nextArgs,l_nextArgc))return true;
				break;
			case 28:
				gml_std_array_push(l_nodes,gml_node_comment_line(l__g[1],l__g[2]));
				this[@2]+=1;
				break;
			default:
				if(gml_builder_build_line(this))return true;
				gml_std_array_push(l_nodes,this[12]);
		}
	}
	if(array_length_1d(l_nodes)>1){
		l_scr[@3]=gml_node_block(gml_std_array_wget(l_nodes[0],1),l_nodes);
	} else if(array_length_1d(l_nodes)==1){
		l_scr[@3]=l_nodes[0];
	} else l_scr[@3]=gml_node_block(gml_std_array_wget(this[1],6),l_nodes);
	return false;
} else return false;

#define gml_compile_error
/// gml_compile_error(text:string, pos:pos)->bool
var l_text=argument[0],l_pos=argument[1];
if (live_enabled) {
	g_gml_compile_error_text=gml_pos_to_string(l_pos)+" "+l_text;
	g_gml_compile_error_pos=l_pos;
	return true;
} else return false;

#define gml_compile_node
/// gml_compile_node(q:node, r:GmlActionList, out:bool)->bool
var l_q=argument[0],l_r=argument[1],l_out=argument[2];
if (live_enabled) {
	var l_x,l_x2,l_x3,l_w,l_i,l_k,l_l,l_n,l_p0,l_p1,l_p2,l_p3,l_pc,l_pb,l_s,l_v,l_d,l_o;
	switch(l_q[0]){
		case 0:if(l_out)ds_list_add(l_r,gml_action_undefined(l_q[1]));break;
		case 1:if(l_out)ds_list_add(l_r,gml_action_number(l_q[1],l_q[2]));break;
		case 2:if(l_out)ds_list_add(l_r,gml_action_cstring(l_q[1],l_q[2]));break;
		case 4:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(gml_compile_node(l_w[l_i],l_r,true))return true;
			}
			ds_list_add(l_r,gml_action_array_decl(l_q[1],l_n));
			break;
		case 5:
			var l_keys=l_q[2];
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			l_s="";
			for(l_i=0;l_i<l_n;l_i+=1){
				if(gml_compile_node(l_w[l_i],l_r,true))return true;
				l_s+=l_keys[l_i]+"\n";
			}
			ds_list_add(l_r,gml_action_object_decl(l_q[1],l_keys,l_s));
			break;
		case 6:
			l_d=l_q[1];
			l_x=l_q[2];
			switch(l_x[0]){
				case 31:ds_list_add(l_r,gml_action_ensure_array_local(l_d,ds_map_find_value(g_gml_compile_curr_script[5],l_x[2])));break;
				case 34:ds_list_add(l_r,gml_action_ensure_array_global(l_d,l_x[2]));break;
				case 37:
					l_x2=l_x[2];
					if(gml_node_is_simple(l_x2)){
						if(gml_compile_node(l_x2,l_r,true))return true;
						ds_list_add(l_r,gml_action_ensure_array_field(l_d,l_x[3]));
					} else return gml_compile_error("Cannot ensure array type - expression may have side effects.",l_x[1]);
					break;
				default:return gml_compile_error("Cannot ensure array type for value. Use [@index] if it does not need allocation or create it explicitly.",l_d);
			}
			break;
		case 8:ds_list_add(l_r,gml_action_self(l_q[1]));break;
		case 9:ds_list_add(l_r,gml_action_other(l_q[1]));break;
		case 10:ds_list_add(l_r,gml_action_const(l_q[1],gml_std_array_wget(l_q[2],2)));break;
		case 11:ds_list_add(l_r,gml_action_const(l_q[1],l_q[3]));break;
		case 12:ds_list_add(l_r,gml_action_const(l_q[1],g_gml_const_val[?l_q[2]]));break;
		case 13:ds_list_add(l_r,gml_action_arg_const(l_q[1],l_q[2]));break;
		case 14:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_arg_index(l_q[1]));
			break;
		case 15:ds_list_add(l_r,gml_action_arg_count(l_q[1]));break;
		case 17:
			l_d=l_q[1];
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(gml_compile_node(l_w[l_i],l_r,true))return true;
			}
			ds_list_add(l_r,gml_action_call_script(l_d,ds_map_find_value(g_gml_compile_curr_program[2],l_q[2]),l_n));
			if(l_out)ds_list_add(l_r,gml_action_result(l_d));
			break;
		case 18:
			l_d=l_q[1];
			if(gml_compile_node(l_q[2],l_r,true))return true;
			l_w=l_q[4];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				gml_compile_node(l_w[l_i],l_r,true);
			}
			ds_list_add(l_r,gml_action_call_script_at(l_d,ds_map_find_value(g_gml_compile_curr_program[2],l_q[3]),l_n));
			if(l_out)ds_list_add(l_r,gml_action_result(l_d));
			break;
		case 21:
			l_s=l_q[2];
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(gml_compile_node(l_w[l_i],l_r,true))return true;
			}
			ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],l_n,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],ds_map_exists(g_gml_inst_data,l_s),l_out));
			break;
		case 23:
			l_d=l_q[1];
			l_x=l_q[2];
			l_i=(l_q[3]) ? 1 : -1;
			switch(l_x[0]){
				case 31:
					l_k=ds_map_find_value(g_gml_compile_curr_script[5],l_x[2]);
					ds_list_add(l_r,gml_action_local(l_d,l_k));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					if(l_out)ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_local_set(l_d,l_k));
					break;
				case 34:
					l_s=l_x[2];
					ds_list_add(l_r,gml_action_global(l_d,l_s));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					if(l_out)ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_global_set(l_d,l_s));
					break;
				case 37:
					l_s=l_x[3];
					if(gml_compile_node(l_x[2],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_field(l_d,l_s));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,2));
					ds_list_add(l_r,gml_action_field_set(l_d,l_s));
					break;
				case 52:
					if(gml_compile_node(l_x[2],l_r,true))return true;
					if(gml_compile_node(l_x[3],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup2x(l_d));
					ds_list_add(l_r,gml_action_index(l_d));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,3));
					ds_list_add(l_r,gml_action_index_set(l_d));
					break;
				case 62:
					if(gml_compile_node(l_x[2],l_r,true))return true;
					if(gml_compile_node(l_x[3],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup2x(l_d));
					ds_list_add(l_r,gml_action_index(l_d));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,3));
					ds_list_add(l_r,gml_action_index_set(l_d));
					break;
				default:return gml_compile_error("Can't apply prefix to "+gml_std_haxe_type_tools_enum_ctr(l_x),l_d);
			}
			break;
		case 24:
			l_d=l_q[1];
			l_x=l_q[2];
			l_i=(l_q[3]) ? 1 : -1;
			switch(l_x[0]){
				case 31:
					l_k=ds_map_find_value(g_gml_compile_curr_script[5],l_x[2]);
					ds_list_add(l_r,gml_action_local(l_d,l_k));
					if(l_out)ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					ds_list_add(l_r,gml_action_local_set(l_d,l_k));
					break;
				case 34:
					l_s=l_x[2];
					ds_list_add(l_r,gml_action_global(l_d,l_s));
					if(l_out)ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					ds_list_add(l_r,gml_action_global_set(l_d,l_s));
					break;
				case 37:
					l_s=l_x[3];
					if(gml_compile_node(l_x[2],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup(l_d));
					ds_list_add(l_r,gml_action_field(l_d,l_s));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,2));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					ds_list_add(l_r,gml_action_field_set(l_d,l_s));
					break;
				case 52:
					if(gml_compile_node(l_x[2],l_r,true))return true;
					if(gml_compile_node(l_x[3],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup2x(l_d));
					ds_list_add(l_r,gml_action_index(l_d));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,3));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					ds_list_add(l_r,gml_action_index_set(l_d));
					break;
				case 62:
					if(gml_compile_node(l_x[2],l_r,true))return true;
					if(gml_compile_node(l_x[3],l_r,true))return true;
					ds_list_add(l_r,gml_action_dup2x(l_d));
					ds_list_add(l_r,gml_action_index(l_d));
					if(l_out)ds_list_add(l_r,gml_action_dup_in(l_d,3));
					ds_list_add(l_r,gml_action_add_int(l_d,l_i));
					ds_list_add(l_r,gml_action_index_set(l_d));
					break;
				default:return gml_compile_error("Can't apply postfix to "+gml_std_haxe_type_tools_enum_ctr(l_x),l_d);
			}
			break;
		case 25:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_un_op(l_q[1],l_q[3]));
			break;
		case 26:
			l_d=l_q[1];
			l_o=l_q[2];
			l_x=l_q[3];
			l_x2=l_q[4];
			switch(l_o){
				case 16:
					if(gml_compile_node(l_x,l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					ds_list_add(l_r,gml_action_add_op(l_d));
					break;
				case 18:
					if(gml_compile_node(l_x,l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					ds_list_add(l_r,gml_action_concat(l_d));
					break;
				case 64:
					if(gml_compile_node(l_x,l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					ds_list_add(l_r,gml_action_equ_op(l_d));
					break;
				case 65:
					if(gml_compile_node(l_x,l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					ds_list_add(l_r,gml_action_neq_op(l_d));
					break;
				case 80:
					if(gml_compile_node(l_x,l_r,true))return true;
					l_p0=ds_list_size(l_r);
					ds_list_add(l_r,gml_action_bool_and(l_d,0));
					if(gml_compile_node(l_x2,l_r,true))return true;
					l_r[|l_p0]=gml_action_bool_and(l_d,ds_list_size(l_r));
					break;
				case 96:
					if(gml_compile_node(l_x,l_r,true))return true;
					l_p0=ds_list_size(l_r);
					ds_list_add(l_r,gml_action_bool_or(l_d,0));
					if(gml_compile_node(l_x2,l_r,true))return true;
					l_r[|l_p0]=gml_action_bool_or(l_d,ds_list_size(l_r));
					break;
				default:
					if(gml_compile_node(l_x,l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					ds_list_add(l_r,gml_action_bin_op(l_d,l_o));
			}
			break;
		case 27:
			l_d=l_q[1];
			l_o=l_q[2];
			l_x=l_q[3];
			l_x2=l_q[4];
			switch(l_x[0]){
				case 13:
					l_i=l_x[2];
					if(gml_compile_node(l_x2,l_r,true))return true;
					if(l_o!=-1)ds_list_add(l_r,gml_action_arg_const_aop(l_d,l_o,l_i)); else ds_list_add(l_r,gml_action_arg_const_set(l_d,l_i));
					break;
				case 14:
					if(gml_compile_node(l_x[2],l_r,true))return true;
					if(gml_compile_node(l_x2,l_r,true))return true;
					if(l_o!=-1)ds_list_add(l_r,gml_action_arg_index_aop(l_d,l_o)); else ds_list_add(l_r,gml_action_arg_index_set(l_d));
					break;
				default:return gml_compile_error("Cannot set "+gml_std_haxe_type_tools_enum_ctr(l_x),l_d);
			}
			break;
		case 30:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_in(l_q[1],l_q[4]));
			break;
		case 31:ds_list_add(l_r,gml_action_local(l_q[1],ds_map_find_value(g_gml_compile_curr_script[5],l_q[2])));break;
		case 32:
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_local_set(l_q[1],ds_map_find_value(g_gml_compile_curr_script[5],l_q[2])));
			break;
		case 33:
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_local_aop(l_q[1],l_q[3],ds_map_find_value(g_gml_compile_curr_script[5],l_q[2])));
			break;
		case 34:ds_list_add(l_r,gml_action_global(l_q[1],l_q[2]));break;
		case 35:
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_global_set(l_q[1],l_q[2]));
			break;
		case 36:
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_global_aop(l_q[1],l_q[3],l_q[2]));
			break;
		case 37:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_field(l_q[1],l_q[3]));
			break;
		case 38:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_field_set(l_q[1],l_q[3]));
			break;
		case 39:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_field_aop(l_q[1],l_q[4],l_q[3]));
			break;
		case 40:ds_list_add(l_r,gml_action_env(l_q[1],g_gml_var_refs[?l_q[2]]));break;
		case 41:
			var l_s19=l_q[2];
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_env_set(l_q[1],g_gml_var_refs[?l_s19],g_gml_var_types[?l_s19]));
			break;
		case 42:
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_env_aop(l_q[1],l_q[3],g_gml_var_refs[?l_q[2]]));
			break;
		case 46:
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_env1d(l_q[1],g_gml_var_refs[?l_q[2]]));
			break;
		case 47:
			var l_s22=l_q[2];
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_env1d_set(l_q[1],g_gml_var_refs[?l_s22],g_gml_var_types[?l_s22]));
			break;
		case 48:
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_env1d_aop(l_q[1],l_q[4],g_gml_var_refs[?l_q[2]]));
			break;
		case 49:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_alarm(l_q[1]));
			break;
		case 50:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_alarm_set(l_q[1]));
			break;
		case 51:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_alarm_aop(l_q[1],l_q[4]));
			break;
		case 52:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_index(l_q[1]));
			break;
		case 53:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_index_set(l_q[1]));
			break;
		case 54:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_index_aop(l_q[1],l_q[4]));
			break;
		case 57:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d(l_q[1]));
			break;
		case 58:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d_set(l_q[1]));
			break;
		case 59:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			if(gml_compile_node(l_q[6],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d_aop(l_q[1],l_q[5]));
			break;
		case 62:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			ds_list_add(l_r,gml_action_index(l_q[1]));
			break;
		case 63:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_index_set(l_q[1]));
			break;
		case 64:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_index_aop(l_q[1],l_q[4]));
			break;
		case 67:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d(l_q[1]));
			break;
		case 68:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			if(gml_compile_node(l_q[5],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d_set(l_q[1]));
			break;
		case 69:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(gml_compile_node(l_q[4],l_r,true))return true;
			if(gml_compile_node(l_q[6],l_r,true))return true;
			ds_list_add(l_r,gml_action_index2d_aop(l_q[1],l_q[5]));
			break;
		case 72:
			l_s="ds_list_find_value";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],2,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 73:
			l_s="ds_list_set";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[4],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],3,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 74:
			if(ds_map_exists(g_gml_func_script,"ds_list_find_value")&&ds_map_exists(g_gml_func_script,"ds_list_set")){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[5],l_r,true))return true;
				ds_list_add(l_r,gml_action_ds_aop(l_q[1],l_q[4],3,g_gml_func_script[?"ds_list_find_value"],g_gml_func_script[?"ds_list_set"],l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 77:
			l_s="ds_map_find_value";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],2,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 78:
			l_s="ds_map_set";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[4],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],3,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 79:
			if(ds_map_exists(g_gml_func_script,"ds_map_find_value")&&ds_map_exists(g_gml_func_script,"ds_map_set")){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[5],l_r,true))return true;
				ds_list_add(l_r,gml_action_ds_aop(l_q[1],l_q[4],3,g_gml_func_script[?"ds_map_find_value"],g_gml_func_script[?"ds_map_set"],l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 82:
			l_s="ds_grid_get";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[4],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],3,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 83:
			l_s="ds_grid_set";
			if(ds_map_exists(g_gml_func_script,l_s)){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[4],l_r,true))return true;
				if(gml_compile_node(l_q[5],l_r,true))return true;
				ds_list_add(l_r,gml_action_call_func(l_q[1],g_gml_func_script[?l_s],4,g_gml_func_args[?l_s],g_gml_func_rest[?l_s],false,l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 84:
			if(ds_map_exists(g_gml_func_script,"ds_grid_get")&&ds_map_exists(g_gml_func_script,"ds_grid_set")){
				if(gml_compile_node(l_q[2],l_r,true))return true;
				if(gml_compile_node(l_q[3],l_r,true))return true;
				if(gml_compile_node(l_q[4],l_r,true))return true;
				if(gml_compile_node(l_q[6],l_r,true))return true;
				ds_list_add(l_r,gml_action_ds_aop(l_q[1],l_q[5],4,g_gml_func_script[?"ds_grid_get"],g_gml_func_script[?"ds_grid_set"],l_out));
			} else return gml_compile_error("Accessor not supported",l_q[1]);
			break;
		case 87:
			l_x=l_q[3];
			if(l_x!=undefined){
				if(gml_compile_node(l_x,l_r,true))return true;
				ds_list_add(l_r,gml_action_local_set(l_q[1],ds_map_find_value(g_gml_compile_curr_script[5],l_q[2])));
			}
			break;
		case 88:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			if(l_n>0){
				l_n-=1;
				for(l_i=0;l_i<l_n;l_i+=1){
					if(gml_compile_node(l_w[l_i],l_r,false))return true;
				}
				if(gml_compile_node(l_w[l_i],l_r,l_out))return true;
			}
			break;
		case 89:
			l_d=l_q[1];
			l_x=l_q[4];
			if(gml_compile_node(l_q[2],l_r,true))return true;
			l_i=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_jump_unless(l_d,0));
			if(gml_compile_node(l_q[3],l_r,false))return true;
			if(l_x!=undefined){
				l_n=ds_list_size(l_r);
				ds_list_add(l_r,gml_action_jump(l_d,0));
				l_r[|l_i]=gml_action_jump_unless(l_d,ds_list_size(l_r));
				if(gml_compile_node(l_x,l_r,false))return true;
				l_r[|l_n]=gml_action_jump(l_d,ds_list_size(l_r));
			} else l_r[|l_i]=gml_action_jump_unless(l_d,ds_list_size(l_r));
			break;
		case 90:
			l_d=l_q[1];
			if(gml_compile_node(l_q[2],l_r,true))return true;
			l_i=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_jump_unless(l_d,0));
			if(gml_compile_node(l_q[3],l_r,l_out))return true;
			l_n=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_jump(l_d,0));
			l_r[|l_i]=gml_action_jump_unless(l_d,ds_list_size(l_r));
			if(gml_compile_node(l_q[4],l_r,l_out))return true;
			l_r[|l_n]=gml_action_jump(l_d,ds_list_size(l_r));
			break;
		case 91:
			var l__cc=l_q[3];
			l_d=l_q[1];
			var l_jt=ds_map_create();
			if(gml_compile_node(l_q[2],l_r,true))return true;
			l_p0=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_switch(l_d,l_jt,0));
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_break=l_p0;
			l_n=array_length_1d(l__cc);
			for(l_i=0;l_i<l_n;l_i+=1){
				var l__cv=gml_std_array_wget(l__cc[l_i],0);
				l_l=array_length_1d(l__cv);
				for(l_k=0;l_k<l_l;l_k+=1){
					var l__g=l__cv[l_k];
					switch(l__g[0]){
						case 0:l_jt[?undefined]=ds_list_size(l_r);break;
						case 1:l_jt[?l__g[2]]=ds_list_size(l_r);break;
						case 2:l_jt[?l__g[2]]=ds_list_size(l_r);break;
						case 3:l_jt[?gml_std_array_wget(l__g[3],3)]=ds_list_size(l_r);break;
						default:return gml_compile_error("Expression must be constant value",gml_std_array_wget(l__cv[l_k],1));
					}
				}
				if(gml_compile_node(gml_std_array_wget(l__cc[l_i],1),l_r,false))return true;
			}
			l_p1=ds_list_size(l_r);
			l_x=l_q[4];
			if(l_x!=undefined&&gml_compile_node(l_x,l_r,false))return true;
			g_gml_compile_curr_break=l_pb;
			l_r[|l_p0]=gml_action_switch(l_d,l_jt,l_p1);
			l_p2=ds_list_size(l_r);
			for(l_k=l_p0;l_k<l_p2;l_k+=1){
				var l__g1=l_r[|l_k];
				if(l__g1[0]==63){
					var l_lp=l__g1[2];
					var l_d52=l__g1[1];
					if(l_lp==l_p0)l_r[|l_k]=gml_action_jump(l_d52,l_p2);
				}
			}
			break;
		case 92:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_wait(l_q[1]));
			break;
		case 93:ds_list_add(l_r,gml_action_fork(l_q[1],l_out));break;
		case 94:
			l_d=l_q[1];
			l_p0=ds_list_size(l_r);
			if(gml_compile_node(l_q[2],l_r,true))return true;
			l_p1=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_jump_unless(l_d,0));
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[3],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			ds_list_add(l_r,gml_action_jump(l_d,l_p0));
			l_p2=ds_list_size(l_r);
			l_r[|l_p1]=gml_action_jump_unless(l_d,l_p2);
			for(l_k=l_p1;l_k<l_p2;l_k+=1){
				var l__g2=l_r[|l_k];
				switch(l__g2[0]){
					case 63:if(l__g2[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g2[1],l_p2);break;
					case 64:if(l__g2[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g2[1],l_p0);break;
				}
			}
			break;
		case 95:
			l_d=l_q[1];
			l_p0=ds_list_size(l_r);
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[2],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_r);
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(l_q[0]==95)ds_list_add(l_r,gml_action_jump_unless(l_d,l_p0)); else ds_list_add(l_r,gml_action_jump_if(l_d,l_p0));
			l_p2=ds_list_size(l_r);
			for(l_k=l_p0;l_k<l_p1;l_k+=1){
				var l__g3=l_r[|l_k];
				switch(l__g3[0]){
					case 63:if(l__g3[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g3[1],l_p2);break;
					case 64:if(l__g3[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g3[1],l_p1);break;
				}
			}
			break;
		case 96:
			l_d=l_q[1];
			l_p0=ds_list_size(l_r);
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[2],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_r);
			if(gml_compile_node(l_q[3],l_r,true))return true;
			if(l_q[0]==95)ds_list_add(l_r,gml_action_jump_unless(l_d,l_p0)); else ds_list_add(l_r,gml_action_jump_if(l_d,l_p0));
			l_p2=ds_list_size(l_r);
			for(l_k=l_p0;l_k<l_p1;l_k+=1){
				var l__g4=l_r[|l_k];
				switch(l__g4[0]){
					case 63:if(l__g4[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g4[1],l_p2);break;
					case 64:if(l__g4[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g4[1],l_p1);break;
				}
			}
			break;
		case 97:
			l_d=l_q[1];
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_repeat_pre(l_d));
			l_p0=ds_list_size(l_r);
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[3],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			l_p1=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_repeat_jump(l_d,l_p0));
			l_p2=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_discard(l_d));
			for(l_k=l_p0;l_k<l_p2;l_k+=1){
				var l__g5=l_r[|l_k];
				switch(l__g5[0]){
					case 63:if(l__g5[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g5[1],l_p2);break;
					case 64:if(l__g5[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g5[1],l_p1);break;
				}
			}
			break;
		case 98:
			l_d=l_q[1];
			if(gml_compile_node(l_q[2],l_r,false))return true;
			l_p0=ds_list_size(l_r);
			if(gml_compile_node(l_q[3],l_r,true))return true;
			l_p1=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_jump_unless(l_d,0));
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[5],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			l_p2=ds_list_size(l_r);
			if(gml_compile_node(l_q[4],l_r,false))return true;
			ds_list_add(l_r,gml_action_jump(l_d,l_p0));
			l_p3=ds_list_size(l_r);
			l_r[|l_p1]=gml_action_jump_unless(l_d,l_p3);
			for(l_k=l_p1;l_k<l_p2;l_k+=1){
				var l__g6=l_r[|l_k];
				switch(l__g6[0]){
					case 63:if(l__g6[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g6[1],l_p3);break;
					case 64:if(l__g6[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g6[1],l_p2);break;
				}
			}
			break;
		case 99:
			l_d=l_q[1];
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_with_pre(l_d));
			l_p0=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_with_next(l_d,0));
			l_pc=g_gml_compile_curr_continue;
			l_pb=g_gml_compile_curr_break;
			g_gml_compile_curr_continue=l_p0;
			g_gml_compile_curr_break=l_p0;
			if(gml_compile_node(l_q[3],l_r,false))return true;
			g_gml_compile_curr_continue=l_pc;
			g_gml_compile_curr_break=l_pb;
			ds_list_add(l_r,gml_action_jump(l_d,l_p0));
			l_p1=ds_list_size(l_r);
			ds_list_add(l_r,gml_action_with_post(l_d));
			l_r[|l_p0]=gml_action_with_next(l_d,l_p1);
			for(l_k=l_p0;l_k<l_p1;l_k+=1){
				var l__g7=l_r[|l_k];
				switch(l__g7[0]){
					case 63:if(l__g7[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g7[1],l_p1);break;
					case 64:if(l__g7[2]==l_p0)l_r[|l_k]=gml_action_jump(l__g7[1],l_p0);break;
				}
			}
			break;
		case 101:
			if(gml_compile_node(l_q[2],l_r,true))return true;
			ds_list_add(l_r,gml_action_return(l_q[1]));
			break;
		case 102:
			l_d=l_q[1];
			ds_list_add(l_r,gml_action_number(l_d,0));
			ds_list_add(l_r,gml_action_return(l_d));
			break;
		case 103:
			l_d=l_q[1];
			l_i=g_gml_compile_curr_break;
			if(l_i>=0)ds_list_add(l_r,gml_action_break(l_d,l_i)); else return gml_compile_error("Cannot `break` here",l_d);
			break;
		case 104:
			l_d=l_q[1];
			l_i=g_gml_compile_curr_continue;
			if(l_i>=0)ds_list_add(l_r,gml_action_continue(l_d,l_i)); else return gml_compile_error("Cannot `continue` here",l_d);
			break;
		default:return gml_compile_error("Cannot compile "+gml_std_haxe_type_tools_enum_ctr(l_q),l_q[1]);
	}
	return false;
} else return false;

#define gml_compile_script
/// gml_compile_script(q:script)->bool
var l_q=argument[0];
if (live_enabled) {
	var l_r=ds_list_create();
	l_q[@9]=l_r;
	g_gml_compile_curr_script=l_q;
	g_gml_compile_curr_break=-1;
	g_gml_compile_curr_continue=-1;
	var l_e=gml_compile_node(l_q[3],l_r,false);
	g_gml_compile_curr_script=undefined;
	return l_e;
} else return false;

#define gml_compile_program
/// gml_compile_program(p:program)->bool
var l_p=argument[0];
if (live_enabled) {
	g_gml_compile_curr_program=l_p;
	var l_arr=l_p[1];
	var l_i;
	var l_num=array_length_1d(l_arr);
	for(l_i=0;l_i<l_num;l_i+=1){
		if(gml_compile_script(l_arr[l_i]))break;
	}
	g_gml_compile_curr_program=undefined;
	return l_i<l_num;
} else return false;

#define gml_parser_error
/// gml_parser_error(text:string, pos:pos, tkl:ds_list<token>)->array<token>
var l_text=argument[0],l_pos=argument[1],l_tkl=argument[2];
if (live_enabled) {
	ds_list_destroy(l_tkl);
	g_gml_parser_error_text=gml_pos_to_string(l_pos)+": "+l_text;
	g_gml_parser_error_pos=l_pos;
	return undefined;
} else return undefined;

#define gml_parser_buf_sub
/// gml_parser_buf_sub(buf:buffer, str:buffer, start:int, end:int)->string
var l_buf=argument[0],l_str=argument[1],l_start=argument[2],l_end=argument[3];
if (live_enabled) {
	var l_len=l_end-l_start;
	buffer_copy(l_buf,l_start,l_len,l_str,0);
	buffer_poke(l_str,l_len,buffer_u8,0);
	buffer_seek(l_str,0,0);
	return buffer_read(l_str,buffer_string);
} else return undefined;

#define gml_parser_run
/// gml_parser_run(src:source, temStart:int = -1)->array<token>
var l_src=argument[0],l_temStart;
if(argument_count>1)l_temStart=argument[1];else l_temStart=-1;
if (live_enabled) {
	var l_z,l_s,l_i,l_n,l_zi,l_row,l_rowStart,l_pos,l_tks;
	var l_out=ds_list_create();
	if(l_temStart>=0){
		l_row=g_gml_parser_tem_row;
		l_rowStart=g_gml_parser_tem_row_start;
		l_pos=l_temStart;
	} else {
		l_row=1;
		l_rowStart=0;
		l_pos=0;
	}
	var l_file1=l_src[0];
	var l_code=l_src[1];
	var l_len=string_byte_length(l_code);
	var l_buf=g_gml_parser_src_buf;
	var l_str=g_gml_parser_str_buf;
	if(l_temStart<0){
		if(buffer_get_size(l_str)<l_len)buffer_resize(l_str,l_len);
		buffer_seek(l_str,0,0);
		buffer_write(l_str,buffer_string,l_code);
		if(buffer_get_size(l_buf)<l_len)buffer_resize(l_buf,l_len);
		buffer_copy(g_gml_parser_str_buf,0,l_len,l_buf,0);
	}
	var l_sub_buf=g_gml_parser_buf_sub_buf;
	var l_checkLine=false;
	var l_brackets=0;
	while(l_pos<l_len){
		var l_c=buffer_peek(l_buf,l_pos++,buffer_u8);
		switch(l_c){
			case 10:
				if(l_checkLine){
					l_i=ds_list_size(l_out)-1;
					var l__g=l_out[|l_i];
					if(l__g[0]==0){
						if(l__g[3]==false)l_out[|l_i]=gml_token_header(l__g[1],l__g[2],true);
					}
				}
				l_row+=1;
				l_rowStart=l_pos;
				continue;
			case 9:case 13:case 32:continue;
		}
		var l_start=l_pos-1;
		var l_d1=gml_pos_create(l_src,l_row,l_pos-l_rowStart);
		var l_op;
		switch(l_c){
			case 33:
				if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
					l_pos+=1;
					l_op=65;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				} else ds_list_add(l_out,gml_token_un_op(l_d1,1));
				break;
			case 34:
				l_z=true;
				l_c=buffer_peek(l_buf,l_pos,buffer_u8);
				if(l_c>=192){
					if(l_c>=224){
						if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
					} else l_rowStart+=1;
				}
				while(l_pos<l_len){
					switch(l_c){
						case 10:case 13:
							ds_list_destroy(l_out);
							return gml_parser_error("Unclosed string",l_d1,l_out);
						case 34:break;
						case 92:
							if(l_z){
								l_z=false;
								buffer_seek(l_str,0,0);
							}
							l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start+1,l_pos);
							buffer_write(l_str,buffer_text,l_s);
							l_pos+=1;
							l_c=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_c>=192){
								if(l_c>=224){
									if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
								} else l_rowStart+=1;
							}
							switch(l_c){
								case 92:buffer_write(l_str,buffer_u8,92);break;
								case 97:buffer_write(l_str,buffer_u8,7);break;
								case 98:buffer_write(l_str,buffer_u8,8);break;
								case 102:buffer_write(l_str,buffer_u8,12);break;
								case 110:buffer_write(l_str,buffer_u8,10);break;
								case 114:buffer_write(l_str,buffer_u8,13);break;
								case 116:buffer_write(l_str,buffer_u8,9);break;
								case 117:case 120:
									l_n=0;
									for(l_i=(l_c==117) ? 12 : 4;l_i>=0;l_i-=4){
										l_pos+=1;
										l_c=buffer_peek(l_buf,l_pos,buffer_u8);
										if(l_c>=48&&l_c<=57){
											l_c-=48;
										} else if(l_c>=65&&l_c<=70){
											l_c-=55;
										} else if(l_c>=97&&l_c<=102){
											l_c-=87;
										} else l_c=0;
										l_n|=(l_c<<l_i);
									}
									buffer_write(l_str,buffer_u8,l_n);
									break;
								case 118:buffer_write(l_str,buffer_u8,11);break;
								default:
									buffer_write(l_str,buffer_u8,l_c);
									if(l_c==13){
										l_pos+=1;
										if(buffer_peek(l_buf,l_pos,buffer_u8)==10)buffer_write(l_str,buffer_u8,10); else l_pos-=1;
									}
							}
							l_start=l_pos;
							l_pos+=1;
							l_c=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_c>=192){
								if(l_c>=224){
									if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
								} else l_rowStart+=1;
							}
							continue;
						default:
							l_pos+=1;
							l_c=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_c>=192){
								if(l_c>=224){
									if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
								} else l_rowStart+=1;
							}
							continue;
					}
					break;
				}
				if(l_pos>=l_len){
					ds_list_destroy(l_out);
					return gml_parser_error("Unclosed string",l_d1,l_out);
				} else l_pos+=1;
				if(l_z){
					l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start+1,l_pos-1);
				} else {
					l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start+1,l_pos-1);
					buffer_write(l_str,buffer_text,l_s);
					buffer_write(l_str,buffer_u8,0);
					buffer_seek(l_str,0,0);
					l_s=buffer_read(l_str,buffer_string);
				}
				ds_list_add(l_out,gml_token_cstring(l_d1,l_s));
				break;
			case 35:
				l_start=l_pos;
				while(l_pos<l_len){
					l_c=buffer_peek(l_buf,l_pos,buffer_u8);
					if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)l_pos+=1; else break;
				}
				switch(gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos)){
					case "define":
						l_start=l_pos;
						while(l_pos<l_len){
							l_c=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_c==32||l_c==9)l_pos+=1; else break;
						}
						if((l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90)&&l_pos<l_len){
							l_start=l_pos;
							l_pos+=1;
							while(l_pos<l_len){
								l_c=buffer_peek(l_buf,l_pos,buffer_u8);
								if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)l_pos+=1; else break;
							}
							ds_list_add(l_out,gml_token_header(l_d1,gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos),false));
							l_checkLine=true;
						} else {
							ds_list_destroy(l_out);
							return gml_parser_error("Expected a script name",l_d1,l_out);
						}
						break;
					case "macro":ds_list_add(l_out,gml_token_macro(l_d1));break;
					case "endregion":case "region":
						while(l_pos<l_len){
							l_i=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_i==10||l_i==13)break; else l_pos+=1;
						}
						break;
					default:
						ds_list_add(l_out,gml_token_hash(l_d1));
						l_pos=l_start;
				}
				break;
			case 36:
				for(l_i=0;l_pos<l_len;l_pos+=1){
					l_c=buffer_peek(l_buf,l_pos,buffer_u8);
					if(l_c>=48&&l_c<=57){
						l_i=((l_i<<4)|l_c-48);
					} else if(l_c>=97&&l_c<=102){
						l_i=((l_i<<4)|l_c-87);
					} else if(l_c>=65&&l_c<=70){
						l_i=((l_i<<4)|l_c-55);
					} else break;
				}
				ds_list_add(l_out,gml_token_number(l_d1,l_i,gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos)));
				break;
			case 37:
				l_op=2;
				if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
					l_pos+=1;
					ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
				} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				break;
			case 38:
				if(buffer_peek(l_buf,l_pos,buffer_u8)==38){
					l_pos+=1;
					l_op=80;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				} else {
					l_op=49;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				}
				break;
			case 39:
				ds_list_destroy(l_out);
				return gml_parser_error("Single quotes are not allowed for strings.",l_d1,l_out);
			case 40:ds_list_add(l_out,gml_token_par_open(l_d1));break;
			case 41:ds_list_add(l_out,gml_token_par_close(l_d1));break;
			case 42:
				l_op=0;
				if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
					l_pos+=1;
					ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
				} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				break;
			case 43:
				switch(buffer_peek(l_buf,l_pos,buffer_u8)){
					case 43:
						l_pos+=1;
						ds_list_add(l_out,gml_token_adjfix(l_d1,true));
						break;
					case 61:
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,16));
						break;
					default:ds_list_add(l_out,gml_token_bin_op(l_d1,16));
				}
				break;
			case 44:ds_list_add(l_out,gml_token_comma(l_d1));break;
			case 45:
				switch(buffer_peek(l_buf,l_pos,buffer_u8)){
					case 45:
						l_pos+=1;
						ds_list_add(l_out,gml_token_adjfix(l_d1,false));
						break;
					case 61:
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,17));
						break;
					default:ds_list_add(l_out,gml_token_bin_op(l_d1,17));
				}
				break;
			case 46:
				l_c=buffer_peek(l_buf,l_pos,buffer_u8);
				if(l_c>=48&&l_c<=57){
					while(true){
						l_pos+=1;
						l_c=buffer_peek(l_buf,l_pos,buffer_u8);
						if(!(l_c>=48&&l_c<=57))break;
					}
					l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos);
					ds_list_add(l_out,gml_token_number(l_d1,real(l_s),l_s));
				} else ds_list_add(l_out,gml_token_period(l_d1));
				break;
			case 47:
				switch(buffer_peek(l_buf,l_pos,buffer_u8)){
					case 42:
						l_pos+=1;
						while(true){
							l_c=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_c>=192){
								if(l_c>=224){
									if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
								} else l_rowStart+=1;
							}
							if(l_c==10){
								l_row+=1;
								l_rowStart=l_pos;
							}
							l_pos+=1;
							if(!(l_pos<l_len&&(l_c!=42||buffer_peek(l_buf,l_pos,buffer_u8)!=47)))break;
						}
						l_i=l_pos;
						l_z=true;
						l_pos+=1;
						while(++l_i<l_len){
							switch(buffer_peek(l_buf,l_i,buffer_u8)){
								case 10:case 13:break;
								case 9:case 32:continue;
								default:l_z=false;
							}
							break;
						}
						break;
					case 47:
						l_start=++l_pos;
						while(l_pos<l_len){
							l_i=buffer_peek(l_buf,l_pos,buffer_u8);
							if(l_i==10||l_i==13)break; else l_pos+=1;
						}
						break;
					case 61:
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,1));
						break;
					default:
						l_op=1;
						if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
							l_pos+=1;
							ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
						} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				}
				break;
			case 58:ds_list_add(l_out,gml_token_colon(l_d1));break;
			case 59:ds_list_add(l_out,gml_token_semico(l_d1));break;
			case 60:
				switch(buffer_peek(l_buf,l_pos,buffer_u8)){
					case 60:
						l_pos+=1;
						l_op=32;
						if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
							l_pos+=1;
							ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
						} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
						break;
					case 61:
						l_pos+=1;
						ds_list_add(l_out,gml_token_bin_op(l_d1,67));
						break;
					case 62:
						l_pos+=1;
						l_op=65;
						if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
							l_pos+=1;
							ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
						} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
						break;
					default:ds_list_add(l_out,gml_token_bin_op(l_d1,66));
				}
				break;
			case 61:
				if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
					l_pos+=1;
					ds_list_add(l_out,gml_token_bin_op(l_d1,64));
				} else ds_list_add(l_out,gml_token_set_op(l_d1,-1));
				break;
			case 62:
				switch(buffer_peek(l_buf,l_pos,buffer_u8)){
					case 61:
						l_pos+=1;
						ds_list_add(l_out,gml_token_bin_op(l_d1,69));
						break;
					case 62:
						l_pos+=1;
						l_op=33;
						if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
							l_pos+=1;
							ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
						} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
						break;
					default:ds_list_add(l_out,gml_token_bin_op(l_d1,68));
				}
				break;
			case 63:ds_list_add(l_out,gml_token_qmark(l_d1));break;
			case 64:
				l_c=buffer_peek(l_buf,l_pos,buffer_u8);
				if(l_c==34||l_c==39){
					l_n=++l_pos;
					l_i=buffer_peek(l_buf,l_pos,buffer_u8);
					if(l_c>=192){
						if(l_c>=224){
							if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
						} else l_rowStart+=1;
					}
					while(l_i!=l_c&&l_pos<l_len){
						l_pos+=1;
						l_i=buffer_peek(l_buf,l_pos,buffer_u8);
						if(l_c>=192){
							if(l_c>=224){
								if(l_c>=240)l_rowStart+=3; else l_rowStart+=2;
							} else l_rowStart+=1;
						}
					}
					if(l_pos<l_len){
						l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_n,l_pos++);
					} else {
						ds_list_destroy(l_out);
						gml_parser_error("Unclosed string",l_d1,l_out);
						l_s=undefined;
					}
					ds_list_add(l_out,gml_token_cstring(l_d1,l_s));
				} else ds_list_add(l_out,gml_token_at_sign(l_d1));
				break;
			case 91:ds_list_add(l_out,gml_token_sqb_open(l_d1));break;
			case 93:ds_list_add(l_out,gml_token_sqb_close(l_d1));break;
			case 94:
				if(buffer_peek(l_buf,l_pos,buffer_u8)==94){
					l_pos+=1;
					l_op=65;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				} else {
					l_op=50;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				}
				break;
			case 123:
				l_brackets+=1;
				ds_list_add(l_out,gml_token_cub_open(l_d1));
				break;
			case 124:
				if(buffer_peek(l_buf,l_pos,buffer_u8)==124){
					l_pos+=1;
					l_op=96;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				} else {
					l_op=48;
					if(buffer_peek(l_buf,l_pos,buffer_u8)==61){
						l_pos+=1;
						ds_list_add(l_out,gml_token_set_op(l_d1,l_op));
					} else ds_list_add(l_out,gml_token_bin_op(l_d1,l_op));
				}
				break;
			case 125:
				l_brackets-=1;
				if(l_temStart>=0&&l_brackets<0){
					if(l_temStart>=0){
						g_gml_parser_tem_end=l_pos;
						g_gml_parser_tem_row=l_row;
						g_gml_parser_tem_row_start=l_rowStart;
					}
					l_n=ds_list_size(l_out);
					l_tks=array_create(l_n);
					for(l_i=0;l_i<l_n;l_i+=1){
						l_tks[@l_i]=l_out[|l_i];
					}
					ds_list_destroy(l_out);
					return l_tks;
				} else ds_list_add(l_out,gml_token_cub_close(l_d1));
				break;
			case 126:ds_list_add(l_out,gml_token_un_op(l_d1,2));break;
			default:
				if(l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c==95){
					while(l_pos<l_len){
						l_c=buffer_peek(l_buf,l_pos,buffer_u8);
						if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57)l_pos+=1; else break;
					}
					l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos);
					switch(l_s){
						case "all":ds_list_add(l_out,gml_token_number(l_d1,-3,undefined));break;
						case "and":ds_list_add(l_out,gml_token_bin_op(l_d1,80));break;
						case "argument":ds_list_add(l_out,gml_token_keyword(l_d1,21));break;
						case "argument_count":ds_list_add(l_out,gml_token_keyword(l_d1,22));break;
						case "begin":ds_list_add(l_out,gml_token_cub_open(l_d1));break;
						case "break":ds_list_add(l_out,gml_token_keyword(l_d1,17));break;
						case "case":ds_list_add(l_out,gml_token_keyword(l_d1,8));break;
						case "continue":ds_list_add(l_out,gml_token_keyword(l_d1,16));break;
						case "default":ds_list_add(l_out,gml_token_keyword(l_d1,9));break;
						case "div":ds_list_add(l_out,gml_token_bin_op(l_d1,3));break;
						case "do":ds_list_add(l_out,gml_token_keyword(l_d1,13));break;
						case "else":ds_list_add(l_out,gml_token_keyword(l_d1,6));break;
						case "end":ds_list_add(l_out,gml_token_cub_close(l_d1));break;
						case "enum":ds_list_add(l_out,gml_token_keyword(l_d1,3));break;
						case "exit":ds_list_add(l_out,gml_token_keyword(l_d1,19));break;
						case "false":ds_list_add(l_out,gml_token_number(l_d1,0,undefined));break;
						case "for":ds_list_add(l_out,gml_token_keyword(l_d1,14));break;
						case "global":ds_list_add(l_out,gml_token_keyword(l_d1,0));break;
						case "globalvar":ds_list_add(l_out,gml_token_keyword(l_d1,1));break;
						case "if":ds_list_add(l_out,gml_token_keyword(l_d1,4));break;
						case "in":ds_list_add(l_out,gml_token_in(l_d1));break;
						case "mod":ds_list_add(l_out,gml_token_bin_op(l_d1,2));break;
						case "noone":ds_list_add(l_out,gml_token_number(l_d1,-4,undefined));break;
						case "not":ds_list_add(l_out,gml_token_un_op(l_d1,1));break;
						case "or":ds_list_add(l_out,gml_token_bin_op(l_d1,96));break;
						case "repeat":ds_list_add(l_out,gml_token_keyword(l_d1,10));break;
						case "return":ds_list_add(l_out,gml_token_keyword(l_d1,18));break;
						case "switch":ds_list_add(l_out,gml_token_keyword(l_d1,7));break;
						case "then":ds_list_add(l_out,gml_token_keyword(l_d1,5));break;
						case "true":ds_list_add(l_out,gml_token_number(l_d1,1,undefined));break;
						case "undefined":ds_list_add(l_out,gml_token_undefined(l_d1));break;
						case "until":ds_list_add(l_out,gml_token_keyword(l_d1,12));break;
						case "var":ds_list_add(l_out,gml_token_keyword(l_d1,2));break;
						case "while":ds_list_add(l_out,gml_token_keyword(l_d1,11));break;
						case "with":ds_list_add(l_out,gml_token_keyword(l_d1,15));break;
						case "xor":ds_list_add(l_out,gml_token_bin_op(l_d1,65));break;
						default:
							if(gml_std_string_startsWith(l_s,"argument")){
								var l_s_8=string_delete(l_s,1,8);
								if(string_digits(l_s_8)==l_s_8)ds_list_add(l_out,gml_token_arg_const(l_d1,floor(real(l_s_8)))); else ds_list_add(l_out,gml_token_ident(l_d1,l_s));
							} else ds_list_add(l_out,gml_token_ident(l_d1,l_s));
					}
				} else if(l_c>=48&&l_c<=57||l_c==46){
					l_pos-=1;
					l_z=false;
					l_s=undefined;
					while(l_pos<l_len){
						l_c=buffer_peek(l_buf,l_pos,buffer_u8);
						if(l_c==46){
							if(l_z){
								ds_list_destroy(l_out);
								return gml_parser_error("Extra dot in a number",l_d1,l_out);
							} else {
								l_pos+=1;
								l_c=buffer_peek(l_buf,l_pos,buffer_u8);
								if(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90){
									l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos-2);
									ds_list_add(l_out,gml_token_number(l_d1,real(l_s),l_s));
									l_d1=gml_pos_create(l_src,l_row,l_pos-l_rowStart);
									ds_list_add(l_out,gml_token_period(l_d1));
									break;
								}
								l_z=true;
							}
						} else if(l_c>=48&&l_c<=57){
							l_pos+=1;
						} else break;
					}
					if(l_s==undefined){
						while(buffer_peek(l_buf,l_start,buffer_u8)==48){
							l_start+=1;
							if(l_start>=l_pos){
								l_start-=1;
								break;
							} else if(buffer_peek(l_buf,l_start,buffer_u8)==46){
								l_start-=1;
								break;
							}
						}
						l_s=gml_parser_buf_sub(l_buf,l_sub_buf,l_start,l_pos);
						ds_list_add(l_out,gml_token_number(l_d1,real(l_s),l_s));
					}
				} else {
					var l_text="Unexpected character `"+chr(l_c)+"`";
					ds_list_destroy(l_out);
					return gml_parser_error(l_text,l_d1,l_out);
				}
		}
	}
	if(l_temStart>=0){
		g_gml_parser_tem_end=l_pos;
		g_gml_parser_tem_row=l_row;
		g_gml_parser_tem_row_start=l_rowStart;
	}
	l_n=ds_list_size(l_out);
	l_tks=array_create(l_n);
	for(l_i=0;l_i<l_n;l_i+=1){
		l_tks[@l_i]=l_out[|l_i];
	}
	ds_list_destroy(l_out);
	return l_tks;
} else return undefined;

#define gml_program_seek_error
/// gml_program_seek_error(msg:string, d:GmlNodeData)->bool
var l_msg=argument[0],l_d=argument[1];
if (live_enabled) {
	return gml_program_error(g_gml_program_seek_inst,l_msg,l_d);
} else return false;

#define gml_program_create
/// gml_program_create(sources:array<source>)
var this=mq_gml_program;
this[1,0]=mt_gml_program;
this[8]=undefined;
var l_sources=argument[0];
if (live_enabled) {
	this[@12]=false;
	this[@10]=undefined;
	this[@9]=undefined;
	this[@8]=undefined;
	this[@7]=ds_list_create();
	this[@6]=ds_list_create();
	this[@5]=ds_map_create();
	this[@4]=ds_map_create();
	this[@3]=[];
	this[@2]=ds_map_create();
	this[@1]=[];
	this[@0]=undefined;
	this[@0]=l_sources;
	var l_builders=[];
	var l__g=0;
	while(l__g<array_length_1d(l_sources)){
		var l_src=l_sources[l__g];
		l__g+=1;
		var l_b=gml_builder_create(l_src);
		gml_std_array_push(l_builders,l_b);
		if(l_b[10]==undefined){
			var l_main=l_src[2];
			var l__g1=0;
			var l__g2=l_b[4];
			while(l__g1<array_length_1d(l__g2)){
				var l_scr=l__g2[l__g1];
				l__g1+=1;
				if(ds_map_exists(this[2],l_scr[0])){
					if(l_scr[0]==l_main){
						var l_node=gml_std_array_wget(ds_map_find_value(this[2],l_main),3);
						if(l_node[0]==88&&array_length_1d(l_node[2])==0){
							var l_w=this[1];
							var l_i=0;
							var l_n=array_length_1d(l_w);
							while(l_i<l_n){
								if(gml_std_array_wget(l_w[l_i],0)==l_main){
									while(++l_i<l_n){
										l_w[@l_i-1]=l_w[l_i];
									}
									l_w[@l_n-1]=l_scr;
								} else l_i+=1;
							}
							ds_map_set(this[2],l_scr[0],l_scr);
						} else {
							gml_program_error(this,"Cannot override prefix-script \""+l_main+"\" because it is not empty",l_scr[1]);
							return this;
						}
					} else {
						gml_program_error(this,"Script "+l_scr[0]+" is already defined.",l_scr[1]);
						return this;
					}
				} else {
					gml_std_array_push(this[1],l_scr);
					ds_map_set(this[2],l_scr[0],l_scr);
				}
			}
			var l__g11=0;
			var l__g21=l_b[5];
			while(l__g11<array_length_1d(l__g21)){
				var l_e=l__g21[l__g11];
				l__g11+=1;
				gml_std_array_push(this[3],l_e);
				ds_map_set(this[4],l_e[0],l_e);
			}
			var l_mcrNames=l_b[6];
			var l_mcrNodes=l_b[7];
			var l_mcrMap=this[5];
			var l_i1=0;
			for(var l__g12=array_length_1d(l_mcrNames);l_i1<l__g12;l_i1+=1){
				l_mcrMap[?l_mcrNames[l_i1]]=l_mcrNodes[l_i1];
			}
		} else if(l_src[4]){
			var l_errorNext=l_b[10];
			if(this[10]!=undefined)this[@10]+="\n"+l_errorNext; else this[@10]=l_errorNext;
		} else {
			this[@10]=l_b[10];
			this[@11]=l_b[11];
			return this;
		}
	}
	var l_i2;
	var l_n1=array_length_1d(this[1]);
	for(l_i2=0;l_i2<l_n1;l_i2+=1){
		gml_std_array_wset(gml_std_array_wget(this[1],l_i2),2,l_i2);
	}
	if(gml_program_check(this)){
		g_gml_program_seek_inst=undefined;
		return this;
	} else if(gml_compile_program(this)){
		if(this[10]!=undefined)this[@10]+="\n"+g_gml_compile_error_text; else this[@10]=g_gml_compile_error_text;
		this[@11]=g_gml_compile_error_pos;
		return this;
	}
	this[@12]=true;
}
return this;

#define gml_program_error
/// gml_program_error(this:program, text:string, d:GmlNodeData)->bool
var this=argument[0],l_text=argument[1],l_d=argument[2];
if (live_enabled) {
	var l_pos=l_d;
	this[@10]=gml_pos_to_string(l_pos)+" "+l_text;
	this[@11]=l_pos;
	return true;
} else return false;

#define gml_program_destroy
/// gml_program_destroy(this:program)
var this=argument[0];
if (live_enabled) {
	var l__g=0;
	var l__g1=this[1];
	while(l__g<array_length_1d(l__g1)){
		var l_q=l__g1[l__g];
		l__g+=1;
		gml_script_destroy(l_q);
	}
	ds_map_destroy(this[2]);
	ds_map_destroy(this[4]);
	ds_map_destroy(this[5]);
	ds_list_destroy(this[6]);
	ds_list_destroy(this[7]);
}

#define gml_program_call_v
/// gml_program_call_v(this:program, name:string, args1:GmlValueList, copy:bool = true)->thread
var this=argument[0],l_name=argument[1],l_args1=argument[2],l_copy;
if(argument_count>3)l_copy=argument[3];else l_copy=true;
if (live_enabled) {
	if(ds_map_exists(this[2],l_name)){
		var l_scr=ds_map_find_value(this[2],l_name);
		var l_locals=array_create(l_scr[6]);
		if(l_copy)l_args1=gml_value_list_copy(l_args1);
		var l_th=gml_thread_create(this,l_scr[9],l_args1,l_locals);
		l_th[@3]=this[8];
		l_th[@6]=this[9];
		gml_thread_exec(l_th);
		return l_th;
	} else return undefined;
} else return undefined;

#define gml_program_call
/// gml_program_call(this:program, name:string, ...rest:GmlValue)->thread
var this=argument[0],l_name=argument[1];
if (live_enabled) {
	var l_argc=(argument_count-2);
	var l_args1=array_create(l_argc);
	var l_i=0;
	for(var l__g=l_argc;l_i<l__g;l_i+=1){
		l_args1[@l_i]=argument[l_i+2];
	}
	var l_args2=l_args1;
	if(ds_map_exists(this[2],l_name)){
		var l_scr=ds_map_find_value(this[2],l_name);
		var l_locals=array_create(l_scr[6]);
		l_args2=gml_value_list_copy(l_args2);
		var l_th=gml_thread_create(this,l_scr[9],l_args2,l_locals);
		l_th[@3]=this[8];
		l_th[@6]=this[9];
		gml_thread_exec(l_th);
		return l_th;
	} else return undefined;
} else return undefined;

#define gml_program_print
/// gml_program_print(this:program)->string
var this=argument[0];
if (live_enabled) {
	var l_r="";
	var l__g1=0;
	var l__g=array_length_1d(this[1]);
	while(l__g1<l__g){
		var l_i=l__g1++;
		if(l_i>0)l_r+="\n";
		var l_scr=gml_std_array_wget(this[1],l_i);
		l_r+="#define "+l_scr[0]+"\n"+gml_action_list_print(l_scr[9]);
	}
	return l_r;
} else return undefined;

#define gml_program_update
/// gml_program_update(this:program, dt:real, ?timeTag:GmlThreadTimeTag)
var this=argument[0],l_dt=argument[1],l_timeTag;
if(argument_count>2)l_timeTag=argument[2];else l_timeTag=undefined;
if (live_enabled) {
	var l_list=this[6];
	var l_n=ds_list_size(l_list);
	if(l_n>0){
		var l_swap=this[7];
		this[@6]=l_swap;
		var l_i=0;
		while(l_i<l_n){
			var l_th=l_list[|l_i];
			if(l_th[6]==l_timeTag){
				var l_t=l_th[5]-l_dt;
				if(l_t<=0){
					l_th[@5]=0;
					ds_list_delete(l_list,l_i);
					gml_thread_exec(l_th);
					l_n-=1;
				} else {
					l_th[@5]=l_t;
					l_i+=1;
				}
			} else l_i+=1;
		}
		l_n=ds_list_size(l_swap);
		for(l_i=0;l_i<l_n;l_i+=1){
			ds_list_add(l_list,l_swap[|l_i]);
		}
		ds_list_clear(l_swap);
		this[@6]=l_list;
	}
}

#define gml_program_change_time_tags
/// gml_program_change_time_tags(this:program, fromTag:GmlThreadTimeTag, toTag:GmlThreadTimeTag)
var this=argument[0],l_fromTag=argument[1],l_toTag=argument[2];
if (live_enabled) {
	var l_list=this[6];
	var l_n=ds_list_size(l_list);
	for(var l_i=0;l_i<l_n;l_i+=1){
		var l_th=l_list[|l_i];
		if(l_th[6]==l_fromTag)l_th[@6]=l_toTag;
	}
}

#define gml_program_seek
/// gml_program_seek(this:program, f:function[ :node :ArrayList<node>]:bool, st:bool = false)->bool
var this=argument[0],l_f=argument[1],l_st;
if(argument_count>2)l_st=argument[2];else l_st=false;
if (live_enabled) {
	var l_w;
	if(l_st)l_w=ds_list_create(); else l_w=undefined;
	g_gml_program_seek_func=l_f;
	var l_m=this[1];
	var l_n=array_length_1d(l_m);
	var l_i=0;
	while(l_i<l_n){
		var l_scr=l_m[l_i];
		g_gml_program_seek_script=l_scr;
		if(script_execute(l_f,l_scr[3],l_w))break; else l_i+=1;
	}
	g_gml_program_seek_script=undefined;
	g_gml_program_seek_func=undefined;
	if(l_st)ds_list_destroy(l_w);
	return l_i<l_n;
} else return false;

#define gml_program_check
/// gml_program_check(this:program)->bool
var this=argument[0];
if (live_enabled) {
	g_gml_program_seek_inst=this;
	if(gml_program_seek(this,live_script_get_index("gml_seek_arguments_proc"),false))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_locals_proc"),false))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_idents_proc"),true))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_calls_proc"),false))return true;
	if(gml_seek_enum_values_proc())return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_enum_fields_proc"),false))return true;
	if(gml_seek_eval_opt())return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_self_fields_proc"),false))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_alarms_proc"),false))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_adjfix_proc"),true))return true;
	if(gml_program_seek(this,live_script_get_index("gml_seek_set_op_proc"),true))return true;
	g_gml_program_seek_inst=undefined;
	return false;
} else return false;

#define gml_program_eval
/// gml_program_eval(this:program, q:node)->bool
var this=argument[0],l_q=argument[1];
if (live_enabled) {
	var l_r,l_v;
	switch(l_q[0]){
		case 1:l_r=l_q[2];break;
		case 2:l_r=l_q[2];break;
		case 26:
			if(gml_program_eval(this,l_q[3]))return true;
			l_r=this[14];
			if(gml_program_eval(this,l_q[4]))return true;
			l_v=this[14];
			switch(l_q[2]){
				case 0:l_r*=l_v;break;
				case 1:l_r/=l_v;break;
				case 2:l_r%=l_v;break;
				case 3:l_r=(l_r div l_v);break;
				case 16:l_r+=l_v;break;
				case 17:l_r-=l_v;break;
				case 32:l_r=l_r<<l_v;break;
				case 33:l_r=l_r>>l_v;break;
				case 48:l_r|=l_v;break;
				case 49:l_r&=l_v;break;
				case 50:l_r^=l_v;break;
				default:return gml_program_error(this,"Can not evaluate this compile-time",l_q[1]);
			}
			break;
		case 37:
			if(gml_std_array_wget(l_q[2],0)==7){
				var l_f=l_q[3];
				var l_d1=l_q[1];
				var l_s=gml_std_array_wget(l_q[2],2);
				var l_e=ds_map_find_value(this[4],l_s);
				if(l_e!=undefined){
					var l_c=ds_map_find_value(l_e[3],l_f);
					if(l_c!=undefined){
						l_r=l_c[3];
						if(l_r==undefined)return gml_program_error(this,"Value of "+l_s+"."+l_f+" is not known here",l_d1);
					} else return gml_program_error(this,"Enum `"+l_s+"` does not contain field `"+l_f+"`",l_d1);
				} else return gml_program_error(this,"Could not find enum "+l_s,l_d1);
			} else return gml_program_error(this,"Can not evaluate this compile-time",l_q[1]);
			break;
		default:return gml_program_error(this,"Can not evaluate this compile-time",l_q[1]);
	}
	this[@14]=l_r;
	return false;
} else return false;

#define gml_std_haxe_enum_tools_set
/// gml_std_haxe_enum_tools_set(q:T, v:T)
var l_q=argument[0],l_v=argument[1];
if (live_enabled) {
	var l_qx=l_q;
	var l_vx=l_v;
	var l_i=0;
	for(var l__g=array_length_1d(l_vx);l_i<l__g;l_i+=1){
		l_qx[@l_i]=l_vx[l_i];
	}
}

#define gml_std_string_split
/// gml_std_string_split(this:string, del:string)->array<string>
var this=argument[0],l_del=argument[1];
if (live_enabled) {
	var l_str=this;
	var l_num=0;
	var l_arr=undefined;
	l_arr[1,0]=mt_gml_std_array;
	l_arr[@string_count(l_del,l_str)]=undefined;
	for(var l_pos=string_pos(l_del,l_str);l_pos>0;l_pos=string_pos(l_del,l_str)){
		l_arr[@l_num]=string_copy(l_str,1,l_pos-1);
		l_num+=1;
		l_str=string_delete(l_str,1,l_pos);
	}
	l_arr[@l_num]=l_str;
	return l_arr;
} else return undefined;

#define gml_std_string_startsWith
/// gml_std_string_startsWith(s:string, z:string)->bool
var l_s=argument[0],l_z=argument[1];
if (live_enabled) {
	var l_n=string_length(l_z);
	return string_length(l_s)>=l_n&&string_copy(l_s,1,l_n)==l_z;
} else return false;

#define gml_std_string_ltrim
/// gml_std_string_ltrim(s:string)->string
var l_s=argument[0];
if (live_enabled) {
	var l_l=string_length(l_s);
	var l_i=1;
	while(l_i<=l_l){
		var l_c=string_ord_at(l_s,l_i);
		if(l_c==32||l_c>8&&l_c<14)l_i+=1; else break;
	}
	if(l_i>1)return string_copy(l_s,l_i,l_l-l_i+1); else return l_s;
} else return undefined;

#define gml_std_string_rtrim
/// gml_std_string_rtrim(s:string)->string
var l_s=argument[0];
if (live_enabled) {
	var l_l=string_length(l_s);
	var l_i=l_l;
	while(l_i>0){
		var l_c=string_ord_at(l_s,l_i);
		if(l_c==32||l_c>8&&l_c<14)l_i-=1; else break;
	}
	if(l_i<l_l)return string_copy(l_s,1,l_i); else return l_s;
} else return undefined;

#define gml_std_string_trim
/// gml_std_string_trim(s:string)->string
var l_s=argument[0];
if (live_enabled) {
	return gml_std_string_ltrim(gml_std_string_rtrim(l_s));
} else return undefined;

#define gml_std_haxe_type_tools_enum_ctr
/// gml_std_haxe_type_tools_enum_ctr(e:EnumValue)->string
var l_e=argument[0];
if (live_enabled) {
	if(array_height_2d(l_e)>1){
		var l_et=l_e[1,0];
		var l_cs=l_et[2];
		var l_i=l_e[0];
		if(l_cs!=undefined&&l_i>=0&&l_i<array_length_1d(l_cs))return l_cs[l_i]; else return string(l_e);
	} else return string(l_e);
} else return undefined;

#define gml_enum_create
/// gml_enum_create(name:string, pos:pos)
var this=mq_gml_enum;
this[1,0]=mt_gml_enum;
var l_name=argument[0],l_pos=argument[1];
if (live_enabled) {
	this[@3]=ds_map_create();
	this[@2]=[];
	this[@0]=l_name;
	this[@1]=l_pos;
}
return this;

#define gml_enum_ctr_create
/// gml_enum_ctr_create(name:string, pos:pos, node:node)
var this=mq_gml_enum_ctr;
this[1,0]=mt_gml_enum_ctr;
var l_name=argument[0],l_pos=argument[1],l_node=argument[2];
if (live_enabled) {
	this[@0]=l_name;
	this[@1]=l_pos;
	this[@2]=l_node;
}
return this;

#define gml_node_undefined
/// gml_node_undefined(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=0;
return this;

#define gml_node_number
/// gml_node_number(d:GmlNodeData, value:real, src:string)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=1;
return this;

#define gml_node_cstring
/// gml_node_cstring(d:GmlNodeData, value:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=2;
return this;

#define gml_node_enum_ctr
/// gml_node_enum_ctr(d:GmlNodeData, e:enum, ctr:enum_ctr)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=3;
return this;

#define gml_node_array_decl
/// gml_node_array_decl(d:GmlNodeData, values:array<node>)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=4;
return this;

#define gml_node_object_decl
/// gml_node_object_decl(d:GmlNodeData, keys:array<string>, values:array<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=5;
return this;

#define gml_node_ensure_array
/// gml_node_ensure_array(d:GmlNodeData, expr:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=6;
return this;

#define gml_node_ident
/// gml_node_ident(d:GmlNodeData, id:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=7;
return this;

#define gml_node_self
/// gml_node_self(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=8;
return this;

#define gml_node_other
/// gml_node_other(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=9;
return this;

#define gml_node_script
/// gml_node_script(d:GmlNodeData, ref:script)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=10;
return this;

#define gml_node_native_script
/// gml_node_native_script(d:GmlNodeData, name:string, id:Script)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=11;
return this;

#define gml_node_const
/// gml_node_const(d:GmlNodeData, id:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=12;
return this;

#define gml_node_arg_const
/// gml_node_arg_const(d:GmlNodeData, id:int)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=13;
return this;

#define gml_node_arg_index
/// gml_node_arg_index(d:GmlNodeData, id:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=14;
return this;

#define gml_node_arg_count
/// gml_node_arg_count(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=15;
return this;

#define gml_node_call
/// gml_node_call(d:GmlNodeData, x:node, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=16;
return this;

#define gml_node_call_script
/// gml_node_call_script(d:GmlNodeData, name:string, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=17;
return this;

#define gml_node_call_script_at
/// gml_node_call_script_at(d:GmlNodeData, inst:node, script:string, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=18;
return this;

#define gml_node_call_script_id
/// gml_node_call_script_id(d:GmlNodeData, index:node, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=19;
return this;

#define gml_node_call_field
/// gml_node_call_field(d:GmlNodeData, inst:node, prop:string, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=20;
return this;

#define gml_node_call_func
/// gml_node_call_func(d:GmlNodeData, s:string, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=21;
return this;

#define gml_node_call_func_at
/// gml_node_call_func_at(d:GmlNodeData, x:node, s:string, args:array<node>)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=22;
return this;

#define gml_node_prefix
/// gml_node_prefix(d:GmlNodeData, x:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=23;
return this;

#define gml_node_postfix
/// gml_node_postfix(d:GmlNodeData, x:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=24;
return this;

#define gml_node_un_op
/// gml_node_un_op(d:GmlNodeData, x:node, o:GmlUnOp)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=25;
return this;

#define gml_node_bin_op
/// gml_node_bin_op(d:GmlNodeData, o:GmlOp, a:node, b:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=26;
return this;

#define gml_node_set_op
/// gml_node_set_op(d:GmlNodeData, o:GmlOp, a:node, b:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=27;
return this;

#define gml_node_to_bool
/// gml_node_to_bool(d:GmlNodeData, v:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=28;
return this;

#define gml_node_from_bool
/// gml_node_from_bool(d:GmlNodeData, v:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=29;
return this;

#define gml_node_in
/// gml_node_in(d:GmlNodeData, fd:node, val:node, not:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=30;
return this;

#define gml_node_local
/// gml_node_local(d:GmlNodeData, id:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=31;
return this;

#define gml_node_local_set
/// gml_node_local_set(d:GmlNodeData, id:string, val:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=32;
return this;

#define gml_node_local_aop
/// gml_node_local_aop(d:GmlNodeData, id:string, op:GmlOp, val:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=33;
return this;

#define gml_node_global
/// gml_node_global(d:GmlNodeData, id:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=34;
return this;

#define gml_node_global_set
/// gml_node_global_set(d:GmlNodeData, id:string, val:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=35;
return this;

#define gml_node_global_aop
/// gml_node_global_aop(d:GmlNodeData, id:string, op:GmlOp, val:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=36;
return this;

#define gml_node_field
/// gml_node_field(d:GmlNodeData, x:node, fd:string)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=37;
return this;

#define gml_node_field_set
/// gml_node_field_set(d:GmlNodeData, x:node, fd:string, val:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=38;
return this;

#define gml_node_field_aop
/// gml_node_field_aop(d:GmlNodeData, x:node, fd:string, op:GmlOp, val:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=39;
return this;

#define gml_node_env
/// gml_node_env(d:GmlNodeData, id:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=40;
return this;

#define gml_node_env_set
/// gml_node_env_set(d:GmlNodeData, id:string, val:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=41;
return this;

#define gml_node_env_aop
/// gml_node_env_aop(d:GmlNodeData, id:string, op:GmlOp, val:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=42;
return this;

#define gml_node_env_fd
/// gml_node_env_fd(d:GmlNodeData, x:node, fd:string)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=43;
return this;

#define gml_node_env_fd_set
/// gml_node_env_fd_set(d:GmlNodeData, x:node, fd:string, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=44;
return this;

#define gml_node_env_fd_aop
/// gml_node_env_fd_aop(d:GmlNodeData, x:node, fd:string, op:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=45;
return this;

#define gml_node_env1d
/// gml_node_env1d(d:GmlNodeData, id:string, k:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=46;
return this;

#define gml_node_env1d_set
/// gml_node_env1d_set(d:GmlNodeData, id:string, k:node, val:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=47;
return this;

#define gml_node_env1d_aop
/// gml_node_env1d_aop(d:GmlNodeData, id:string, k:node, op:GmlOp, val:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=48;
return this;

#define gml_node_alarm
/// gml_node_alarm(d:GmlNodeData, x:node, i:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=49;
return this;

#define gml_node_alarm_set
/// gml_node_alarm_set(d:GmlNodeData, x:node, i:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=50;
return this;

#define gml_node_alarm_aop
/// gml_node_alarm_aop(d:GmlNodeData, x:node, i:node, op:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=51;
return this;

#define gml_node_index
/// gml_node_index(d:GmlNodeData, x:node, id:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=52;
return this;

#define gml_node_index_set
/// gml_node_index_set(d:GmlNodeData, x:node, id:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=53;
return this;

#define gml_node_index_aop
/// gml_node_index_aop(d:GmlNodeData, x:node, id:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=54;
return this;

#define gml_node_index_prefix
/// gml_node_index_prefix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=55;
return this;

#define gml_node_index_postfix
/// gml_node_index_postfix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=56;
return this;

#define gml_node_index2d
/// gml_node_index2d(d:GmlNodeData, x:node, i1:node, i2:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=57;
return this;

#define gml_node_index2d_set
/// gml_node_index2d_set(d:GmlNodeData, x:node, i1:node, i2:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=58;
return this;

#define gml_node_index2d_aop
/// gml_node_index2d_aop(d:GmlNodeData, x:node, i1:node, i2:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[6]=argument[5];
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=59;
return this;

#define gml_node_index2d_prefix
/// gml_node_index2d_prefix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=60;
return this;

#define gml_node_index2d_postfix
/// gml_node_index2d_postfix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=61;
return this;

#define gml_node_raw_id
/// gml_node_raw_id(d:GmlNodeData, x:node, id:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=62;
return this;

#define gml_node_raw_id_set
/// gml_node_raw_id_set(d:GmlNodeData, x:node, id:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=63;
return this;

#define gml_node_raw_id_aop
/// gml_node_raw_id_aop(d:GmlNodeData, x:node, id:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=64;
return this;

#define gml_node_raw_id_prefix
/// gml_node_raw_id_prefix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=65;
return this;

#define gml_node_raw_id_postfix
/// gml_node_raw_id_postfix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=66;
return this;

#define gml_node_raw_id2d
/// gml_node_raw_id2d(d:GmlNodeData, x:node, i1:node, i2:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=67;
return this;

#define gml_node_raw_id2d_set
/// gml_node_raw_id2d_set(d:GmlNodeData, x:node, i1:node, i2:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=68;
return this;

#define gml_node_raw_id2d_aop
/// gml_node_raw_id2d_aop(d:GmlNodeData, x:node, i1:node, i2:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[6]=argument[5];
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=69;
return this;

#define gml_node_raw_id2d_prefix
/// gml_node_raw_id2d_prefix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=70;
return this;

#define gml_node_raw_id2d_postfix
/// gml_node_raw_id2d_postfix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=71;
return this;

#define gml_node_ds_list
/// gml_node_ds_list(d:GmlNodeData, lx:node, id:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=72;
return this;

#define gml_node_ds_list_set
/// gml_node_ds_list_set(d:GmlNodeData, lx:node, id:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=73;
return this;

#define gml_node_ds_list_aop
/// gml_node_ds_list_aop(d:GmlNodeData, lx:node, id:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=74;
return this;

#define gml_node_ds_list_prefix
/// gml_node_ds_list_prefix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=75;
return this;

#define gml_node_ds_list_postfix
/// gml_node_ds_list_postfix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=76;
return this;

#define gml_node_ds_map
/// gml_node_ds_map(d:GmlNodeData, lx:node, id:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=77;
return this;

#define gml_node_ds_map_set
/// gml_node_ds_map_set(d:GmlNodeData, lx:node, id:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=78;
return this;

#define gml_node_ds_map_aop
/// gml_node_ds_map_aop(d:GmlNodeData, lx:node, id:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=79;
return this;

#define gml_node_ds_map_prefix
/// gml_node_ds_map_prefix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=80;
return this;

#define gml_node_ds_map_postfix
/// gml_node_ds_map_postfix(d:GmlNodeData, x:node, i:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=81;
return this;

#define gml_node_ds_grid
/// gml_node_ds_grid(d:GmlNodeData, lx:node, i1:node, i2:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=82;
return this;

#define gml_node_ds_grid_set
/// gml_node_ds_grid_set(d:GmlNodeData, lx:node, i1:node, i2:node, v:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=83;
return this;

#define gml_node_ds_grid_aop
/// gml_node_ds_grid_aop(d:GmlNodeData, lx:node, i1:node, i2:node, o:GmlOp, v:node)
var this;
this[1,0]=mt_gml_node;
this[6]=argument[5];
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=84;
return this;

#define gml_node_ds_grid_prefix
/// gml_node_ds_grid_prefix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=85;
return this;

#define gml_node_ds_grid_postfix
/// gml_node_ds_grid_postfix(d:GmlNodeData, x:node, i:node, k:node, inc:bool)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=86;
return this;

#define gml_node_var_decl
/// gml_node_var_decl(d:GmlNodeData, name:string, value:null<node>)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=87;
return this;

#define gml_node_block
/// gml_node_block(d:GmlNodeData, nodes:array<node>)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=88;
return this;

#define gml_node_if_then
/// gml_node_if_then(d:GmlNodeData, cond:node, then:node, not:null<node>)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=89;
return this;

#define gml_node_ternary
/// gml_node_ternary(d:GmlNodeData, cond:node, then:node, not:node)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=90;
return this;

#define gml_node_switch
/// gml_node_switch(d:GmlNodeData, expr:node, list:array<GmlNodeCase>, def:null<node>)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=91;
return this;

#define gml_node_wait
/// gml_node_wait(d:GmlNodeData, time:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=92;
return this;

#define gml_node_fork
/// gml_node_fork(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=93;
return this;

#define gml_node_while
/// gml_node_while(d:GmlNodeData, cond:node, node:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=94;
return this;

#define gml_node_do_until
/// gml_node_do_until(d:GmlNodeData, node:node, cond:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=95;
return this;

#define gml_node_do_while
/// gml_node_do_while(d:GmlNodeData, node:node, cond:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=96;
return this;

#define gml_node_repeat
/// gml_node_repeat(d:GmlNodeData, times:node, node:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=97;
return this;

#define gml_node_for
/// gml_node_for(d:GmlNodeData, pre:node, cond:node, post:node, loop:node)
var this;
this[1,0]=mt_gml_node;
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=98;
return this;

#define gml_node_with
/// gml_node_with(d:GmlNodeData, ctx:node, node:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=99;
return this;

#define gml_node_once
/// gml_node_once(d:GmlNodeData, node:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=100;
return this;

#define gml_node_return
/// gml_node_return(d:GmlNodeData, v:node)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=101;
return this;

#define gml_node_exit
/// gml_node_exit(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=102;
return this;

#define gml_node_break
/// gml_node_break(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=103;
return this;

#define gml_node_continue
/// gml_node_continue(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=104;
return this;

#define gml_node_debugger
/// gml_node_debugger(d:GmlNodeData)
var this;
this[1,0]=mt_gml_node;
this[1]=argument[0];
this[0]=105;
return this;

#define gml_node_comment_line
/// gml_node_comment_line(d:GmlNodeData, s:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=106;
return this;

#define gml_node_comment_line_pre
/// gml_node_comment_line_pre(d:GmlNodeData, s:string, x:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=107;
return this;

#define gml_node_comment_line_post
/// gml_node_comment_line_post(d:GmlNodeData, x:node, s:string)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=108;
return this;

#define gml_node_comment_line_sep
/// gml_node_comment_line_sep(d:GmlNodeData, s:string, x:node)
var this;
this[1,0]=mt_gml_node;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=109;
return this;

#define gml_node_comment_block
/// gml_node_comment_block(d:GmlNodeData, s:string)
var this;
this[1,0]=mt_gml_node;
this[2]=argument[1];
this[1]=argument[0];
this[0]=110;
return this;

#define gml_node_comment_block_pre
/// gml_node_comment_block_pre(d:GmlNodeData, s:string, x:node, pl:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=111;
return this;

#define gml_node_comment_block_post
/// gml_node_comment_block_post(d:GmlNodeData, x:node, s:string, pl:bool)
var this;
this[1,0]=mt_gml_node;
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=112;
return this;

#define gml_node_unpack
/// gml_node_unpack(q:node)->node
var l_q=argument[0];
if (live_enabled) {
	while(l_q!=undefined){
		if(l_q[0]==88){
			if(array_length_1d(l_q[2])==1)l_q=gml_std_array_wget(l_q[2],0); else return l_q;
		} else return l_q;
	}
	return l_q;
} else return undefined;

#define gml_node_is_simple
/// gml_node_is_simple(q:node)->bool
var l_q=argument[0];
if (live_enabled) {
	var l_i,l_n,l_w;
	switch(l_q[0]){
		case 0:return true;
		case 1:return true;
		case 2:return true;
		case 4:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			l_i=0;
			while(l_i<l_n){
				if(gml_node_is_simple(l_w[l_i]))l_i+=1; else break;
			}
			return l_i>=l_n;
		case 5:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			l_i=0;
			while(l_i<l_n){
				if(gml_node_is_simple(l_w[l_i]))l_i+=1; else break;
			}
			return l_i>=l_n;
		case 8:return true;
		case 9:return true;
		case 31:return true;
		case 34:return true;
		case 37:return gml_node_is_simple(l_q[2]);
		case 52:return gml_node_is_simple(l_q[2])&&gml_node_is_simple(l_q[3]);
		default:return false;
	}
} else return false;

#define gml_node_is_statement
/// gml_node_is_statement(q:node)->bool
var l_q=argument[0];
if (live_enabled) {
	switch(l_q[0]){
		case 16:return true;
		case 23:return true;
		case 24:return true;
		case 27:return true;
		case 87:return true;
		default:return false;
	}
} else return false;

#define gml_node_is_in_block
/// gml_node_is_in_block(q:node, p:node)->bool
var l_q=argument[0],l_p=argument[1];
if (live_enabled) {
	if(l_p==undefined)return false;
	switch(l_p[0]){
		case 88:return true;
		case 89:return l_q!=l_p[2];
		case 91:return l_q!=l_p[2];
		case 94:return l_q!=l_p[2];
		case 95:return l_q!=l_p[3];
		case 96:return l_q!=l_p[3];
		case 97:return l_q!=l_p[2];
		case 98:return l_q!=l_p[3];
		default:return false;
	}
} else return false;

#define gml_node_equals_list
/// gml_node_equals_list(a:array<node>, b:array<node>)->bool
var l_a=argument[0],l_b=argument[1];
if (live_enabled) {
	var l_n=array_length_1d(l_a);
	if(array_length_1d(l_b)!=l_n)return false;
	var l_i=0;
	while(l_i<l_n){
		if(gml_node_equals(l_a[l_i],l_b[l_i]))l_i+=1; else return false;
	}
	return true;
} else return false;

#define gml_node_equals
/// gml_node_equals(a:node, b:node)->bool
var l_a=argument[0],l_b=argument[1];
if (live_enabled) {
	if(l_a[0]!=l_b[0])return false;
	var l_i,l_n;
	switch(l_a[0]){
		case 0:return true;
		case 1:
			if(l_b[0]==1){
				var l_b_src=l_b[3];
				return l_a[2]==l_b[2]&&l_a[3]==l_b_src;
			} else return false;
		case 2:return l_b[0]==2&&l_a[2]==l_b[2];
		case 3:
			if(l_b[0]==3){
				var l_b_ctr=l_b[3];
				return l_a[2]==l_b[2]&&l_a[3]==l_b_ctr;
			} else return false;
		case 4:return l_b[0]==4&&gml_node_equals_list(l_a[2],l_b[2]);
		case 5:
			var l_m1=l_a[3];
			if(l_b[0]==5){
				var l_m2=l_b[3];
				var l_k2=l_b[2];
				l_n=array_length_1d(l_m1);
				if(array_length_1d(l_m2)==l_n){
					l_i=0;
					while(l_i<l_n){
						if(gml_std_array_wget(l_a[2],l_i)==l_k2[l_i]&&gml_node_equals(l_m1[l_i],l_m2[l_i]))l_i+=1; else break;
					}
					return l_i>=l_n;
				} else return false;
			} else return false;
		case 6:return l_b[0]==6&&gml_node_equals(l_a[2],l_b[2]);
		case 7:return l_b[0]==7&&l_a[2]==l_b[2];
		case 8:return true;
		case 9:return true;
		case 10:return l_b[0]==10&&l_a[2]==l_b[2];
		case 11:return l_b[0]==11&&l_a[2]==l_b[2];
		case 12:return l_b[0]==12&&l_a[2]==l_b[2];
		case 13:return l_b[0]==13&&l_a[2]==l_b[2];
		case 14:return l_b[0]==14&&gml_node_equals(l_a[2],l_b[2]);
		case 15:return true;
		case 16:
			if(l_b[0]==16){
				var l_b_args=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals_list(l_a[3],l_b_args);
			} else return false;
		case 17:
			if(l_b[0]==17){
				var l_b_args1=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals_list(l_a[3],l_b_args1);
			} else return false;
		case 18:
			if(l_b[0]==18){
				var l_b_args2=l_b[4];
				var l_b_script=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_script&&gml_node_equals_list(l_a[4],l_b_args2);
			} else return false;
		case 19:
			if(l_b[0]==19){
				var l_b_args3=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals_list(l_a[3],l_b_args3);
			} else return false;
		case 20:
			if(l_b[0]==20){
				var l_b_args4=l_b[4];
				var l_b_prop=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_prop&&gml_node_equals_list(l_a[4],l_b_args4);
			} else return false;
		case 21:
			if(l_b[0]==21){
				var l_b_args5=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals_list(l_a[3],l_b_args5);
			} else return false;
		case 22:
			if(l_b[0]==22){
				var l_b_args6=l_b[4];
				var l_b_s1=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_s1&&gml_node_equals_list(l_a[4],l_b_args6);
			} else return false;
		case 23:
			if(l_b[0]==23){
				var l_b_inc=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_inc;
			} else return false;
		case 24:
			if(l_b[0]==24){
				var l_b_inc1=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_inc1;
			} else return false;
		case 25:
			if(l_b[0]==25){
				var l_b_o=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_o;
			} else return false;
		case 26:
			if(l_b[0]==26){
				var l_b_b=l_b[4];
				var l_b_a=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_a)&&gml_node_equals(l_a[4],l_b_b);
			} else return false;
		case 27:
			if(l_b[0]==27){
				var l_b_b1=l_b[4];
				var l_b_a1=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_a1)&&gml_node_equals(l_a[4],l_b_b1);
			} else return false;
		case 28:return l_b[0]==28&&gml_node_equals(l_a[2],l_b[2]);
		case 29:return l_b[0]==29&&gml_node_equals(l_a[2],l_b[2]);
		case 30:
			if(l_b[0]==30){
				var l_b_not=l_b[4];
				var l_b_val=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_val)&&l_a[4]==l_b_not;
			} else return false;
		case 31:return l_b[0]==31&&l_a[2]==l_b[2];
		case 32:
			if(l_b[0]==32){
				var l_b_val1=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_val1);
			} else return false;
		case 33:
			if(l_b[0]==33){
				var l_b_val2=l_b[4];
				var l_b_op=l_b[3];
				return l_a[2]==l_b[2]&&l_a[3]==l_b_op&&gml_node_equals(l_a[4],l_b_val2);
			} else return false;
		case 34:return l_b[0]==34&&l_a[2]==l_b[2];
		case 35:
			if(l_b[0]==35){
				var l_b_val3=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_val3);
			} else return false;
		case 36:
			if(l_b[0]==36){
				var l_b_val4=l_b[4];
				var l_b_op1=l_b[3];
				return l_a[2]==l_b[2]&&l_a[3]==l_b_op1&&gml_node_equals(l_a[4],l_b_val4);
			} else return false;
		case 37:
			if(l_b[0]==37){
				var l_b_fd1=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd1;
			} else return false;
		case 38:
			if(l_b[0]==38){
				var l_b_val5=l_b[4];
				var l_b_fd2=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd2&&gml_node_equals(l_a[4],l_b_val5);
			} else return false;
		case 39:
			if(l_b[0]==39){
				var l_b_val6=l_b[5];
				var l_b_op2=l_b[4];
				var l_b_fd3=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd3&&l_a[4]==l_b_op2&&gml_node_equals(l_a[5],l_b_val6);
			} else return false;
		case 40:return l_b[0]==40&&l_a[2]==l_b[2];
		case 41:
			if(l_b[0]==41){
				var l_b_val7=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_val7);
			} else return false;
		case 42:
			if(l_b[0]==42){
				var l_b_val8=l_b[4];
				var l_b_op3=l_b[3];
				return l_a[2]==l_b[2]&&l_a[3]==l_b_op3&&gml_node_equals(l_a[4],l_b_val8);
			} else return false;
		case 43:
			if(l_b[0]==43){
				var l_b_fd4=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd4;
			} else return false;
		case 44:
			if(l_b[0]==44){
				var l_b_v2=l_b[4];
				var l_b_fd5=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd5&&gml_node_equals(l_a[4],l_b_v2);
			} else return false;
		case 45:
			if(l_b[0]==45){
				var l_b_v3=l_b[5];
				var l_b_op4=l_b[4];
				var l_b_fd6=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_fd6&&l_a[4]==l_b_op4&&gml_node_equals(l_a[5],l_b_v3);
			} else return false;
		case 46:
			if(l_b[0]==46){
				var l_b_k=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_k);
			} else return false;
		case 47:
			if(l_b[0]==47){
				var l_b_val9=l_b[4];
				var l_b_k1=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_k1)&&gml_node_equals(l_a[4],l_b_val9);
			} else return false;
		case 48:
			if(l_b[0]==48){
				var l_b_val10=l_b[5];
				var l_b_op5=l_b[4];
				var l_b_k2=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_k2)&&l_a[4]==l_b_op5&&gml_node_equals(l_a[5],l_b_val10);
			} else return false;
		case 49:
			if(l_b[0]==49){
				var l_b_i=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i);
			} else return false;
		case 50:
			if(l_b[0]==50){
				var l_b_v4=l_b[4];
				var l_b_i1=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i1)&&gml_node_equals(l_a[4],l_b_v4);
			} else return false;
		case 51:
			if(l_b[0]==51){
				var l_b_v5=l_b[5];
				var l_b_op6=l_b[4];
				var l_b_i2=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i2)&&l_a[4]==l_b_op6&&gml_node_equals(l_a[5],l_b_v5);
			} else return false;
		case 52:
			if(l_b[0]==52){
				var l_b_id16=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id16);
			} else return false;
		case 53:
			if(l_b[0]==53){
				var l_b_v6=l_b[4];
				var l_b_id17=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id17)&&gml_node_equals(l_a[4],l_b_v6);
			} else return false;
		case 54:
			if(l_b[0]==54){
				var l_b_v7=l_b[5];
				var l_b_o3=l_b[4];
				var l_b_id18=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id18)&&l_a[4]==l_b_o3&&gml_node_equals(l_a[5],l_b_v7);
			} else return false;
		case 55:
			if(l_b[0]==55){
				var l_b_inc2=l_b[4];
				var l_b_i3=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i3)&&l_a[4]==l_b_inc2;
			} else return false;
		case 56:
			if(l_b[0]==56){
				var l_b_inc3=l_b[4];
				var l_b_i4=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i4)&&l_a[4]==l_b_inc3;
			} else return false;
		case 57:
			if(l_b[0]==57){
				var l_b_i21=l_b[4];
				var l_b_i11=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i11)&&gml_node_equals(l_a[4],l_b_i21);
			} else return false;
		case 58:
			if(l_b[0]==58){
				var l_b_v8=l_b[5];
				var l_b_i22=l_b[4];
				var l_b_i12=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i12)&&gml_node_equals(l_a[4],l_b_i22)&&gml_node_equals(l_a[5],l_b_v8);
			} else return false;
		case 59:
			if(l_b[0]==59){
				var l_b_v9=l_b[6];
				var l_b_o4=l_b[5];
				var l_b_i23=l_b[4];
				var l_b_i13=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i13)&&gml_node_equals(l_a[4],l_b_i23)&&l_a[5]==l_b_o4&&gml_node_equals(l_a[6],l_b_v9);
			} else return false;
		case 60:
			if(l_b[0]==60){
				var l_b_inc4=l_b[5];
				var l_b_k3=l_b[4];
				var l_b_i5=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i5)&&gml_node_equals(l_a[4],l_b_k3)&&l_a[5]==l_b_inc4;
			} else return false;
		case 61:
			if(l_b[0]==61){
				var l_b_inc5=l_b[5];
				var l_b_k4=l_b[4];
				var l_b_i6=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i6)&&gml_node_equals(l_a[4],l_b_k4)&&l_a[5]==l_b_inc5;
			} else return false;
		case 62:
			if(l_b[0]==62){
				var l_b_id19=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id19);
			} else return false;
		case 63:
			if(l_b[0]==63){
				var l_b_v10=l_b[4];
				var l_b_id20=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id20)&&gml_node_equals(l_a[4],l_b_v10);
			} else return false;
		case 64:
			if(l_b[0]==64){
				var l_b_v11=l_b[5];
				var l_b_o5=l_b[4];
				var l_b_id21=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id21)&&l_a[4]==l_b_o5&&gml_node_equals(l_a[5],l_b_v11);
			} else return false;
		case 65:
			if(l_b[0]==65){
				var l_b_inc6=l_b[4];
				var l_b_i7=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i7)&&l_a[4]==l_b_inc6;
			} else return false;
		case 66:
			if(l_b[0]==66){
				var l_b_inc7=l_b[4];
				var l_b_i8=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i8)&&l_a[4]==l_b_inc7;
			} else return false;
		case 67:
			if(l_b[0]==67){
				var l_b_i24=l_b[4];
				var l_b_i14=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i14)&&gml_node_equals(l_a[4],l_b_i24);
			} else return false;
		case 68:
			if(l_b[0]==68){
				var l_b_v12=l_b[5];
				var l_b_i25=l_b[4];
				var l_b_i15=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i15)&&gml_node_equals(l_a[4],l_b_i25)&&gml_node_equals(l_a[5],l_b_v12);
			} else return false;
		case 69:
			if(l_b[0]==69){
				var l_b_v13=l_b[6];
				var l_b_o6=l_b[5];
				var l_b_i26=l_b[4];
				var l_b_i16=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i16)&&gml_node_equals(l_a[4],l_b_i26)&&l_a[5]==l_b_o6&&gml_node_equals(l_a[6],l_b_v13);
			} else return false;
		case 70:
			if(l_b[0]==70){
				var l_b_inc8=l_b[5];
				var l_b_k5=l_b[4];
				var l_b_i9=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i9)&&gml_node_equals(l_a[4],l_b_k5)&&l_a[5]==l_b_inc8;
			} else return false;
		case 71:
			if(l_b[0]==71){
				var l_b_inc9=l_b[5];
				var l_b_k6=l_b[4];
				var l_b_i10=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i10)&&gml_node_equals(l_a[4],l_b_k6)&&l_a[5]==l_b_inc9;
			} else return false;
		case 72:
			if(l_b[0]==72){
				var l_b_id22=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id22);
			} else return false;
		case 73:
			if(l_b[0]==73){
				var l_b_v14=l_b[4];
				var l_b_id23=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id23)&&gml_node_equals(l_a[4],l_b_v14);
			} else return false;
		case 74:
			if(l_b[0]==74){
				var l_b_v15=l_b[5];
				var l_b_o7=l_b[4];
				var l_b_id24=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id24)&&l_a[4]==l_b_o7&&gml_node_equals(l_a[5],l_b_v15);
			} else return false;
		case 75:
			if(l_b[0]==75){
				var l_b_inc10=l_b[4];
				var l_b_i17=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i17)&&l_a[4]==l_b_inc10;
			} else return false;
		case 76:
			if(l_b[0]==76){
				var l_b_inc11=l_b[4];
				var l_b_i18=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i18)&&l_a[4]==l_b_inc11;
			} else return false;
		case 77:
			if(l_b[0]==77){
				var l_b_id25=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id25);
			} else return false;
		case 78:
			if(l_b[0]==78){
				var l_b_v16=l_b[4];
				var l_b_id26=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id26)&&gml_node_equals(l_a[4],l_b_v16);
			} else return false;
		case 79:
			if(l_b[0]==79){
				var l_b_v17=l_b[5];
				var l_b_o8=l_b[4];
				var l_b_id27=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_id27)&&l_a[4]==l_b_o8&&gml_node_equals(l_a[5],l_b_v17);
			} else return false;
		case 80:
			if(l_b[0]==80){
				var l_b_inc12=l_b[4];
				var l_b_i19=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i19)&&l_a[4]==l_b_inc12;
			} else return false;
		case 81:
			if(l_b[0]==81){
				var l_b_inc13=l_b[4];
				var l_b_i20=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i20)&&l_a[4]==l_b_inc13;
			} else return false;
		case 82:
			if(l_b[0]==82){
				var l_b_i27=l_b[4];
				var l_b_i110=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i110)&&gml_node_equals(l_a[4],l_b_i27);
			} else return false;
		case 83:
			if(l_b[0]==83){
				var l_b_v18=l_b[5];
				var l_b_i28=l_b[4];
				var l_b_i111=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i111)&&gml_node_equals(l_a[4],l_b_i28)&&gml_node_equals(l_a[5],l_b_v18);
			} else return false;
		case 84:
			if(l_b[0]==84){
				var l_b_v19=l_b[6];
				var l_b_o9=l_b[5];
				var l_b_i29=l_b[4];
				var l_b_i112=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i112)&&gml_node_equals(l_a[4],l_b_i29)&&l_a[5]==l_b_o9&&gml_node_equals(l_a[6],l_b_v19);
			} else return false;
		case 85:
			if(l_b[0]==85){
				var l_b_inc14=l_b[5];
				var l_b_k7=l_b[4];
				var l_b_i30=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i30)&&gml_node_equals(l_a[4],l_b_k7)&&l_a[5]==l_b_inc14;
			} else return false;
		case 86:
			if(l_b[0]==86){
				var l_b_inc15=l_b[5];
				var l_b_k8=l_b[4];
				var l_b_i31=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_i31)&&gml_node_equals(l_a[4],l_b_k8)&&l_a[5]==l_b_inc15;
			} else return false;
		case 87:
			var l_a_value2=l_a[3];
			if(l_b[0]==87){
				var l_b_value2=l_b[3];
				if(l_a[2]==l_b[2]){
					if(l_a_value2!=undefined)return l_b_value2!=undefined&&gml_node_equals(l_a_value2,l_b_value2); else return l_b_value2==undefined;
				} else return false;
			} else return false;
		case 88:return l_b[0]==88&&gml_node_equals_list(l_a[2],l_b[2]);
		case 89:
			var l_a_not1=l_a[4];
			if(l_b[0]==89){
				var l_b_not1=l_b[4];
				var l_b_then=l_b[3];
				if(gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_then)){
					if(l_a_not1!=undefined)return l_b_not1!=undefined&&gml_node_equals(l_a_not1,l_b_not1); else return l_b_not1==undefined;
				} else return false;
			} else return false;
		case 90:
			if(l_b[0]==90){
				var l_b_not2=l_b[4];
				var l_b_then1=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_then1)&&gml_node_equals(l_a[4],l_b_not2);
			} else return false;
		case 91:
			var l_o1=l_a[4];
			var l_m11=l_a[3];
			if(l_b[0]==91){
				var l_o2=l_b[4];
				var l_m21=l_b[3];
				if(gml_node_equals(l_a[2],l_b[2])&&(l_o1!=undefined&&l_o2!=undefined&&gml_node_equals(l_o1,l_o2)||l_o1==undefined&&l_o2==undefined)){
					l_n=array_length_1d(l_m11);
					if(array_length_1d(l_m21)!=l_n)return false;
					l_i=0;
					while(l_i<l_n){
						if(gml_node_equals(gml_std_array_wget(l_m11[l_i],1),gml_std_array_wget(l_m21[l_i],1))&&gml_node_equals_list(gml_std_array_wget(l_m11[l_i],0),gml_std_array_wget(l_m21[l_i],0)))l_i+=1; else break;
					}
					return l_i>=l_n;
				} else return false;
			} else return false;
		case 92:return l_b[0]==92&&gml_node_equals(l_a[2],l_b[2]);
		case 93:return true;
		case 94:
			if(l_b[0]==94){
				var l_b_node=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_node);
			} else return false;
		case 95:
			if(l_b[0]==95){
				var l_b_cond3=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_cond3);
			} else return false;
		case 96:
			if(l_b[0]==96){
				var l_b_cond4=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_cond4);
			} else return false;
		case 97:
			if(l_b[0]==97){
				var l_b_node3=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_node3);
			} else return false;
		case 98:
			if(l_b[0]==98){
				var l_b_loop=l_b[5];
				var l_b_post=l_b[4];
				var l_b_cond5=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_cond5)&&gml_node_equals(l_a[4],l_b_post)&&gml_node_equals(l_a[5],l_b_loop);
			} else return false;
		case 99:
			if(l_b[0]==99){
				var l_b_node4=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&gml_node_equals(l_a[3],l_b_node4);
			} else return false;
		case 100:return l_b[0]==100&&gml_node_equals(l_a[2],l_b[2]);
		case 101:return l_b[0]==101&&gml_node_equals(l_a[2],l_b[2]);
		case 102:return true;
		case 103:return true;
		case 104:return true;
		case 105:return true;
		case 106:return l_b[0]==106&&l_a[2]==l_b[2];
		case 107:
			if(l_b[0]==107){
				var l_b_x40=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_x40);
			} else return false;
		case 108:
			if(l_b[0]==108){
				var l_b_s4=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_s4;
			} else return false;
		case 109:
			if(l_b[0]==109){
				var l_b_x42=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_x42);
			} else return false;
		case 110:return l_b[0]==110&&l_a[2]==l_b[2];
		case 111:
			if(l_b[0]==111){
				var l_b_pl=l_b[4];
				var l_b_x43=l_b[3];
				return l_a[2]==l_b[2]&&gml_node_equals(l_a[3],l_b_x43)&&l_a[4]==l_b_pl;
			} else return false;
		case 112:
			if(l_b[0]==112){
				var l_b_pl1=l_b[4];
				var l_b_s8=l_b[3];
				return gml_node_equals(l_a[2],l_b[2])&&l_a[3]==l_b_s8&&l_a[4]==l_b_pl1;
			} else return false;
	}
} else return false;

#define gml_node_clone_opt
/// gml_node_clone_opt(q:node)->node
var l_q=argument[0];
if (live_enabled) {
	if(l_q!=undefined)return gml_node_clone(l_q); else return undefined;
} else return undefined;

#define gml_node_clone
/// gml_node_clone(q:node)->node
var l_q=argument[0];
if (live_enabled) {
	var l_xw,l_i,l_n;
	var l_d=l_q[1];
	switch(l_q[0]){
		case 0:return gml_node_undefined(l_d);
		case 1:return gml_node_number(l_d,l_q[2],l_q[3]);
		case 2:return gml_node_cstring(l_d,l_q[2]);
		case 3:return gml_node_enum_ctr(l_d,l_q[2],l_q[3]);
		case 4:
			l_xw=gml_std_array_clone(l_q[2]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_array_decl(l_d,l_xw);
		case 5:
			l_xw=gml_std_array_clone(l_q[3]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_object_decl(l_d,gml_std_array_slice(l_q[2],0),l_xw);
		case 6:return gml_node_ensure_array(l_d,gml_node_clone(l_q[2]));
		case 7:return gml_node_ident(l_d,l_q[2]);
		case 8:return gml_node_self(l_d);
		case 9:return gml_node_other(l_d);
		case 10:return gml_node_script(l_d,l_q[2]);
		case 11:return gml_node_native_script(l_q[1],l_q[2],l_q[3]);
		case 12:return gml_node_const(l_d,l_q[2]);
		case 13:return gml_node_arg_const(l_d,l_q[2]);
		case 14:return gml_node_arg_index(l_d,gml_node_clone(l_q[2]));
		case 15:return gml_node_arg_count(l_d);
		case 16:
			l_xw=gml_std_array_clone(l_q[3]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call(l_d,gml_node_clone(l_q[2]),l_xw);
		case 17:
			l_xw=gml_std_array_clone(l_q[3]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_script(l_d,l_q[2],l_xw);
		case 18:
			l_xw=gml_std_array_clone(l_q[4]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_script_at(l_d,gml_node_clone(l_q[2]),l_q[3],l_xw);
		case 19:
			l_xw=gml_std_array_clone(l_q[3]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_script_id(l_d,gml_node_clone(l_q[2]),l_xw);
		case 20:
			l_xw=gml_std_array_clone(l_q[4]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_field(l_d,gml_node_clone(l_q[2]),l_q[3],l_xw);
		case 21:
			l_xw=gml_std_array_clone(l_q[3]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_func(l_d,l_q[2],l_xw);
		case 22:
			l_xw=gml_std_array_clone(l_q[4]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_call_func_at(l_d,gml_node_clone(l_q[2]),l_q[3],l_xw);
		case 23:return gml_node_prefix(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 24:return gml_node_postfix(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 25:return gml_node_un_op(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 26:return gml_node_bin_op(l_d,l_q[2],gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 27:return gml_node_set_op(l_d,l_q[2],gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 28:return gml_node_to_bool(l_d,gml_node_clone(l_q[2]));
		case 29:return gml_node_from_bool(l_d,gml_node_clone(l_q[2]));
		case 30:return gml_node_in(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 31:return gml_node_local(l_d,l_q[2]);
		case 32:return gml_node_local_set(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 33:return gml_node_local_aop(l_d,l_q[2],l_q[3],gml_node_clone(l_q[4]));
		case 34:return gml_node_global(l_d,l_q[2]);
		case 35:return gml_node_global_set(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 36:return gml_node_global_aop(l_d,l_q[2],l_q[3],gml_node_clone(l_q[4]));
		case 37:return gml_node_field(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 38:return gml_node_field_set(l_d,gml_node_clone(l_q[2]),l_q[3],gml_node_clone(l_q[4]));
		case 39:return gml_node_field_aop(l_d,gml_node_clone(l_q[2]),l_q[3],l_q[4],gml_node_clone(l_q[5]));
		case 40:return gml_node_env(l_d,l_q[2]);
		case 41:return gml_node_env_set(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 42:return gml_node_env_aop(l_d,l_q[2],l_q[3],gml_node_clone(l_q[4]));
		case 43:return gml_node_env_fd(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 44:return gml_node_env_fd_set(l_d,gml_node_clone(l_q[2]),l_q[3],gml_node_clone(l_q[4]));
		case 45:return gml_node_env_fd_aop(l_d,gml_node_clone(l_q[2]),l_q[3],l_q[4],gml_node_clone(l_q[5]));
		case 46:return gml_node_env1d(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 47:return gml_node_env1d_set(l_d,l_q[2],gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 48:return gml_node_env1d_aop(l_d,l_q[2],gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 49:return gml_node_alarm(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 50:return gml_node_alarm_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 51:return gml_node_alarm_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 52:return gml_node_index(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 53:return gml_node_index_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 54:return gml_node_index_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 55:return gml_node_index_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 56:return gml_node_index_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 57:return gml_node_index2d(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 58:return gml_node_index2d_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),gml_node_clone(l_q[5]));
		case 59:return gml_node_index2d_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5],gml_node_clone(l_q[6]));
		case 60:return gml_node_index2d_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 61:return gml_node_index2d_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 62:return gml_node_raw_id(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 63:return gml_node_raw_id_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 64:return gml_node_raw_id_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 65:return gml_node_raw_id_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 66:return gml_node_raw_id_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 67:return gml_node_raw_id2d(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 68:return gml_node_raw_id2d_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),gml_node_clone(l_q[5]));
		case 69:return gml_node_raw_id2d_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5],gml_node_clone(l_q[6]));
		case 70:return gml_node_raw_id2d_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 71:return gml_node_raw_id2d_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 72:return gml_node_ds_list(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 73:return gml_node_ds_list_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 74:return gml_node_ds_list_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 75:return gml_node_ds_list_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 76:return gml_node_ds_list_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 77:return gml_node_ds_map(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 78:return gml_node_ds_map_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 79:return gml_node_ds_map_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4],gml_node_clone(l_q[5]));
		case 80:return gml_node_ds_map_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 81:return gml_node_ds_map_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),l_q[4]);
		case 82:return gml_node_ds_grid(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 83:return gml_node_ds_grid_set(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),gml_node_clone(l_q[5]));
		case 84:return gml_node_ds_grid_aop(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5],gml_node_clone(l_q[6]));
		case 85:return gml_node_ds_grid_prefix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 86:return gml_node_ds_grid_postfix(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),l_q[5]);
		case 87:return gml_node_var_decl(l_d,l_q[2],gml_node_clone_opt(l_q[3]));
		case 88:
			l_xw=gml_std_array_clone(l_q[2]);
			l_i=array_length_1d(l_xw);
			while(--l_i>=0){
				l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
			}
			return gml_node_block(l_d,l_xw);
		case 89:return gml_node_if_then(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone_opt(l_q[4]));
		case 90:return gml_node_ternary(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]));
		case 91:
			var l_m=l_q[3];
			l_m=gml_std_array_clone(l_m);
			l_n=array_length_1d(l_m);
			for(l_i=0;l_i<l_n;l_i+=1){
				l_xw=gml_std_array_clone(gml_std_array_wget(l_m[l_i],0));
				l_i=array_length_1d(l_xw);
				while(--l_i>=0){
					l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
				}
				l_m[@l_i]=gml_std_array_odecl("GmlNodeCase",3,0,l_xw,1,gml_node_clone(gml_std_array_wget(l_m[l_i],1)),2,gml_std_array_wget(l_m[l_i],2));
				l_xw=gml_std_array_clone(gml_std_array_wget(l_m[l_i],2));
				l_i=array_length_1d(l_xw);
				while(--l_i>=0){
					l_xw[@l_i]=gml_node_clone(l_xw[l_i]);
				}
				gml_std_array_wget(l_m[l_i],2);
			}
			return gml_node_switch(l_q[1],gml_node_clone(l_q[2]),l_m,gml_node_clone_opt(l_q[4]));
		case 92:return gml_node_wait(l_d,gml_node_clone(l_q[2]));
		case 93:return gml_node_fork(l_d);
		case 94:return gml_node_while(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 95:return gml_node_do_until(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 96:return gml_node_do_while(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 97:return gml_node_repeat(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 98:return gml_node_for(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]),gml_node_clone(l_q[4]),gml_node_clone(l_q[5]));
		case 99:return gml_node_with(l_d,gml_node_clone(l_q[2]),gml_node_clone(l_q[3]));
		case 100:return gml_node_once(l_d,gml_node_clone(l_q[2]));
		case 101:return gml_node_return(l_d,gml_node_clone(l_q[2]));
		case 102:return gml_node_exit(l_d);
		case 103:return gml_node_break(l_d);
		case 104:return gml_node_continue(l_d);
		case 105:return gml_node_debugger(l_d);
		case 106:return gml_node_comment_line(l_d,l_q[2]);
		case 107:return gml_node_comment_line_pre(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 108:return gml_node_comment_line_post(l_d,gml_node_clone(l_q[2]),l_q[3]);
		case 109:return gml_node_comment_line_sep(l_d,l_q[2],gml_node_clone(l_q[3]));
		case 110:return gml_node_comment_block(l_d,l_q[2]);
		case 111:return gml_node_comment_block_pre(l_d,l_q[2],gml_node_clone(l_q[3]),l_q[4]);
		case 112:return gml_node_comment_block_post(l_d,gml_node_clone(l_q[2]),l_q[3],l_q[4]);
	}
} else return undefined;

#define gml_node_seek_all_out
/// gml_node_seek_all_out(q:node, st:ArrayList<node>, c:GmlNodeIter, si:int)->bool
var l_q=argument[0],l_st=argument[1],l_c=argument[2],l_si=argument[3];
if (live_enabled) {
	var l_x,l_w,l_i,l_n;
	var l_par=l_st[|l_si];
	if(l_par==undefined)return false;
	switch(l_par[0]){
		case 88:
			l_w=l_par[2];
			l_i=array_length_1d(l_w);
			while(--l_i>=0){
				if(l_w[l_i]==l_q)break;
			}
			while(--l_i>=0){
				if(script_execute(l_c,l_w[l_i],undefined))return true;
			}
			break;
		case 89:
			var l_c1=l_par[2];
			if(l_c1!=l_q&&script_execute(l_c,l_c1,undefined))return true;
			break;
		case 91:
			var l_c2=l_par[2];
			if(l_c2!=l_q&&script_execute(l_c,l_c2,undefined))return true;
			break;
		case 94:
			var l_c3=l_par[2];
			if(l_c3!=l_q&&script_execute(l_c,l_c3,undefined))return true;
			break;
		case 95:
			var l_c4=l_par[2];
			if(l_c4!=l_q&&script_execute(l_c,l_c4,undefined))return true;
			break;
		case 96:
			var l_c5=l_par[2];
			if(l_c5!=l_q&&script_execute(l_c,l_c5,undefined))return true;
			break;
		case 97:
			var l_c6=l_par[2];
			if(l_c6!=l_q&&script_execute(l_c,l_c6,undefined))return true;
			break;
		case 98:
			var l_c7=l_par[2];
			if(l_c7!=l_q&&script_execute(l_c,l_c7,undefined))return true;
			break;
		case 99:
			var l_c8=l_par[2];
			if(l_c8!=l_q&&script_execute(l_c,l_c8,undefined))return true;
			break;
		case 107:break;
		case 108:break;
		case 109:break;
		case 111:break;
		case 112:break;
		default:show_error("Can't seekAllOut over "+gml_pos_to_string(l_par[1])+" "+gml_std_haxe_type_tools_enum_ctr(l_par),false);
	}
	return gml_node_seek_all_out(l_par,l_st,l_c,l_si+1);
} else return false;

#define gml_node_seek_all
/// gml_node_seek_all(q:node, st:ArrayList<node>, c:GmlNodeIter)->bool
var l_q=argument[0],l_st=argument[1],l_c=argument[2];
if (live_enabled) {
	if(l_st!=undefined)ds_list_insert(l_st,0,l_q);
	var l_r,l_x,l_w,l_i,l_n;
	switch(l_q[0]){
		case 0:l_r=false;break;
		case 1:l_r=false;break;
		case 2:l_r=false;break;
		case 3:l_r=false;break;
		case 4:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],undefined))break;
			}
			l_r=l_i<l_n;
			break;
		case 5:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],undefined))break;
			}
			l_r=l_i<l_n;
			break;
		case 6:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 7:l_r=false;break;
		case 8:l_r=false;break;
		case 9:l_r=false;break;
		case 10:l_r=false;break;
		case 11:l_r=false;break;
		case 12:l_r=false;break;
		case 13:l_r=false;break;
		case 14:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 15:l_r=false;break;
		case 16:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_w=l_q[3];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],undefined))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 17:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],undefined))break;
			}
			l_r=l_i<l_n;
			break;
		case 18:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],undefined))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 19:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_w=l_q[3];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],undefined))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 20:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],undefined))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 21:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],undefined))break;
			}
			l_r=l_i<l_n;
			break;
		case 22:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],undefined))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 23:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 24:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 25:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 26:
			switch(l_q[2]){
				case 80:
					var l_b=l_q[4];
					l_r=script_execute(l_c,l_q[3],undefined)&&script_execute(l_c,l_b,undefined);
					break;
				case 96:
					var l_b1=l_q[4];
					l_r=script_execute(l_c,l_q[3],undefined);
					break;
				default:
					var l_l_b=l_q[4];
					var l_l_a=l_q[3];
					var l_l_o=l_q[2];
					l_r=script_execute(l_c,l_l_a,undefined)||script_execute(l_c,l_l_b,undefined);
			}
			break;
		case 27:l_r=script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 28:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 29:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 30:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 31:l_r=false;break;
		case 32:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 33:l_r=script_execute(l_c,l_q[4],undefined);break;
		case 34:l_r=false;break;
		case 35:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 36:l_r=script_execute(l_c,l_q[4],undefined);break;
		case 37:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 38:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 39:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 40:l_r=false;break;
		case 41:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 42:l_r=script_execute(l_c,l_q[4],undefined);break;
		case 43:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 44:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 45:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 46:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 47:l_r=script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 48:l_r=script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 49:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 50:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 51:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 52:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 53:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 54:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 55:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 56:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 57:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 58:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 59:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[6],undefined);break;
		case 60:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 61:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 62:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 63:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 64:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 65:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 66:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 67:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 68:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 69:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[6],undefined);break;
		case 70:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 71:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 72:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 73:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 74:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 75:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 76:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 77:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 78:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 79:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 80:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 81:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 82:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 83:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[5],undefined);break;
		case 84:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined)||script_execute(l_c,l_q[6],undefined);break;
		case 85:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 86:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)||script_execute(l_c,l_q[4],undefined);break;
		case 87:
			var l_v=l_q[3];
			l_r=l_v!=undefined&&script_execute(l_c,l_v,undefined);
			break;
		case 88:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],undefined))break;
			}
			l_r=l_i<l_n;
			break;
		case 89:
			var l_b2=l_q[4];
			l_r=script_execute(l_c,l_q[2],undefined)||l_b2!=undefined&&script_execute(l_c,l_q[3],undefined)&&script_execute(l_c,l_b2,undefined);
			break;
		case 90:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined)&&script_execute(l_c,l_q[4],undefined);break;
		case 91:
			if(script_execute(l_c,l_q[2],undefined)){
				l_r=true;
			} else {
				l_x=l_q[4];
				if(l_x!=undefined&&script_execute(l_c,l_x,undefined)){
					l_n=array_length_1d(l_q[3]);
					l_i=0;
					while(l_i<l_n){
						if(script_execute(l_c,l_x,undefined))l_i+=1; else break;
					}
					l_r=l_i>=l_n;
				} else l_r=false;
			}
			break;
		case 92:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 93:l_r=false;break;
		case 94:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 95:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 96:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 97:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 98:l_r=script_execute(l_c,l_q[2],undefined)||script_execute(l_c,l_q[3],undefined);break;
		case 99:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 100:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 101:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 102:l_r=false;break;
		case 103:l_r=false;break;
		case 104:l_r=false;break;
		case 105:l_r=false;break;
		case 106:l_r=false;break;
		case 107:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 108:l_r=script_execute(l_c,l_q[2],undefined);break;
		case 109:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 110:l_r=false;break;
		case 111:l_r=script_execute(l_c,l_q[3],undefined);break;
		case 112:l_r=script_execute(l_c,l_q[2],undefined);break;
	}
	if(l_st!=undefined)ds_list_delete(l_st,0);
	return false;
} else return false;

#define gml_node_seek
/// gml_node_seek(q:node, st:ArrayList<node>, c:GmlNodeIter)->bool
var l_q=argument[0],l_st=argument[1],l_c=argument[2];
if (live_enabled) {
	if(l_st!=undefined)ds_list_insert(l_st,0,l_q);
	var l_r,l_x,l_w,l_i,l_n,l_k,l_l;
	switch(l_q[0]){
		case 0:l_r=false;break;
		case 1:l_r=false;break;
		case 2:l_r=false;break;
		case 3:l_r=false;break;
		case 4:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],l_st))break;
			}
			l_r=l_i<l_n;
			break;
		case 5:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],l_st))break;
			}
			l_r=l_i<l_n;
			break;
		case 6:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 7:l_r=false;break;
		case 8:l_r=false;break;
		case 9:l_r=false;break;
		case 10:l_r=false;break;
		case 11:l_r=false;break;
		case 12:l_r=false;break;
		case 13:l_r=false;break;
		case 14:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 15:l_r=false;break;
		case 16:
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_w=l_q[3];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],l_st))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 17:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],l_st))break;
			}
			l_r=l_i<l_n;
			break;
		case 18:
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],l_st))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 19:
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_w=l_q[3];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],l_st))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 20:
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],l_st))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 21:
			l_w=l_q[3];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],l_st))break;
			}
			l_r=l_i<l_n;
			break;
		case 22:
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_w=l_q[4];
				l_n=array_length_1d(l_w);
				for(l_i=0;l_i<l_n;l_i+=1){
					if(script_execute(l_c,l_w[l_i],l_st))break;
				}
				l_r=l_i<l_n;
			}
			break;
		case 23:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 24:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 25:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 26:l_r=script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 27:l_r=script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 28:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 29:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 30:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 31:l_r=false;break;
		case 32:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 33:l_r=script_execute(l_c,l_q[4],l_st);break;
		case 34:l_r=false;break;
		case 35:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 36:l_r=script_execute(l_c,l_q[4],l_st);break;
		case 37:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 38:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 39:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 40:l_r=false;break;
		case 41:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 42:l_r=script_execute(l_c,l_q[4],l_st);break;
		case 43:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 44:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 45:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 46:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 47:l_r=script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 48:l_r=script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 49:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 50:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 51:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 52:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 53:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 54:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 55:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 56:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 57:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 58:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 59:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[6],l_st);break;
		case 60:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 61:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 62:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 63:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 64:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 65:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 66:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 67:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 68:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 69:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[6],l_st);break;
		case 70:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 71:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 72:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 73:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 74:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 75:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 76:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 77:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 78:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 79:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 80:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 81:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 82:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 83:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 84:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[6],l_st);break;
		case 85:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 86:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 87:
			var l_l_value2=l_q[3];
			l_r=l_l_value2!=undefined&&script_execute(l_c,l_l_value2,l_st);
			break;
		case 88:
			l_w=l_q[2];
			l_n=array_length_1d(l_w);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(script_execute(l_c,l_w[l_i],l_st))break;
			}
			l_r=l_i<l_n;
			break;
		case 89:
			var l_l_not1=l_q[4];
			l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||l_l_not1!=undefined&&script_execute(l_c,l_l_not1,l_st);
			break;
		case 90:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st);break;
		case 91:
			var l_o=l_q[4];
			var l_m=l_q[3];
			if(script_execute(l_c,l_q[2],l_st)){
				l_r=true;
			} else {
				l_n=array_length_1d(l_m);
				for(l_i=0;l_i<l_n;l_i+=1){
					l_w=gml_std_array_wget(l_m[l_i],0);
					l_l=array_length_1d(l_w);
					for(l_k=0;l_k<l_l;l_k+=1){
						if(script_execute(l_c,l_w[l_k],l_st))break;
					}
					if(l_k<l_l||script_execute(l_c,gml_std_array_wget(l_m[l_i],1),l_st))break;
				}
				if(l_i<l_n)l_r=true; else l_r=l_o!=undefined&&script_execute(l_c,l_o,l_st);
			}
			break;
		case 92:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 93:l_r=false;break;
		case 94:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 95:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 96:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 97:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 98:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st)||script_execute(l_c,l_q[4],l_st)||script_execute(l_c,l_q[5],l_st);break;
		case 99:l_r=script_execute(l_c,l_q[2],l_st)||script_execute(l_c,l_q[3],l_st);break;
		case 100:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 101:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 102:l_r=false;break;
		case 103:l_r=false;break;
		case 104:l_r=false;break;
		case 105:l_r=false;break;
		case 106:l_r=false;break;
		case 107:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 108:l_r=script_execute(l_c,l_q[2],l_st);break;
		case 109:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 110:l_r=false;break;
		case 111:l_r=script_execute(l_c,l_q[3],l_st);break;
		case 112:l_r=script_execute(l_c,l_q[2],l_st);break;
	}
	if(l_st!=undefined)ds_list_delete(l_st,0);
	return l_r;
} else return false;

#define gml_op_get_priority
/// gml_op_get_priority(op:GmlOp)->int
var l_op=argument[0];
if (live_enabled) {
	return (l_op>>4);
} else return 0;

#define gml_op_to_string
/// gml_op_to_string(this1:int)->string
var l_this1=argument[0];
if (live_enabled) {
	switch(l_this1){
		case -1:return "";
		case 0:return "*";
		case 1:return "/";
		case 2:return "%";
		case 3:return "div";
		case 16:return "+";
		case 17:return "-";
		case 18:return "+";
		case 32:return "<<";
		case 33:return ">>";
		case 48:return "|";
		case 49:return "&";
		case 50:return "^";
		case 64:return "==";
		case 65:return "!=";
		case 66:return "<";
		case 67:return "<=";
		case 68:return ">";
		case 69:return ">=";
		case 80:return "&&";
		case 96:return "||";
		default:return gml_op_get_name(l_this1);
	}
} else return undefined;

#define gml_op_apply
/// gml_op_apply(this1:int, q:real, v:real)->real
var l_this1=argument[0],l_q=argument[1],l_v=argument[2];
if (live_enabled) {
	switch(l_this1){
		case 0:l_q*=l_v;break;
		case 1:l_q/=l_v;break;
		case 2:l_q%=l_v;break;
		case 3:l_q=(l_q div l_v);break;
		case 16:l_q+=l_v;break;
		case 17:l_q-=l_v;break;
		case 32:l_q=l_q<<l_v;break;
		case 33:l_q=l_q>>l_v;break;
		case 48:l_q|=l_v;break;
		case 49:l_q&=l_v;break;
		case 50:l_q^=l_v;break;
		case 64:l_q=l_q==l_v;break;
		case 65:l_q=l_q!=l_v;break;
		case 66:l_q=l_q<l_v;break;
		case 67:l_q=l_q<=l_v;break;
		case 68:l_q=l_q>l_v;break;
		case 69:l_q=l_q>=l_v;break;
		default:l_q=0;
	}
	return l_q;
} else return 0;

#define gml_op_get_name
/// gml_op_get_name(this1:int)->string
var l_this1=argument[0];
if (live_enabled) {
	switch(l_this1){
		case -1:return "Set";
		case 0:return "Mul";
		case 1:return "Div";
		case 2:return "Mod";
		case 3:return "IDiv";
		case 7:return "priorities";
		case 16:return "Add";
		case 17:return "Sub";
		case 18:return "Cct";
		case 32:return "Shl";
		case 33:return "Shr";
		case 48:return "Or";
		case 49:return "And";
		case 50:return "Xor";
		case 64:return "EQ";
		case 65:return "NE";
		case 66:return "LT";
		case 67:return "LE";
		case 68:return "GT";
		case 69:return "GE";
		case 80:return "BAnd";
		case 96:return "BOr";
		default:return undefined;
	}
} else return undefined;

#define gml_pos_create
/// gml_pos_create(src:source, row:int, col:int)
var this=mq_gml_pos;
this[1,0]=mt_gml_pos;
var l_src=argument[0],l_row=argument[1],l_col=argument[2];
if (live_enabled) {
	this[@0]=l_src;
	this[@1]=l_row;
	this[@2]=l_col;
}
return this;

#define gml_pos_to_string
/// gml_pos_to_string(this:pos)->string
var this=argument[0];
if (live_enabled) {
	return gml_std_array_wget(this[0],0)+("[L"+string(this[1])+",c"+string(this[2])+"]");
} else return undefined;

#define gml_script_create
/// gml_script_create(src:source, name:string, pos:pos)
var this=mq_gml_script;
this[1,0]=mt_gml_script;
var l_src=argument[0],l_name=argument[1],l_pos=argument[2];
if (live_enabled) {
	this[@9]=undefined;
	this[@8]=undefined;
	this[@7]=0;
	this[@6]=0;
	this[@5]=ds_map_create();
	this[@4]=l_src;
	this[@0]=l_name;
	this[@1]=l_pos;
}
return this;

#define gml_script_destroy
/// gml_script_destroy(this:script)
var this=argument[0];
if (live_enabled) {
	ds_map_destroy(this[5]);
	if(this[9]!=undefined){
		var l_this2=this[9];
		var l_i=0;
		for(var l__g=ds_list_size(l_this2);l_i<l__g;l_i+=1){
			var l_q=l_this2[|l_i];
			if(l_q[0]==57)ds_map_destroy(l_q[2]);
		}
		ds_list_destroy(l_this2);
	}
}

#define gml_script_seek
/// gml_script_seek(this:script, iter:GmlNodeIter, stack:GmlNodeList)
var this=argument[0],l_iter=argument[1],l_stack=argument[2];
if (live_enabled) {
	var l__scr=g_gml_program_seek_script;
	g_gml_program_seek_script=this;
	script_execute(l_iter,this[3],l_stack);
	g_gml_program_seek_script=l__scr;
}

#define gml_source_create
/// gml_source_create(name:string, code:string, ?main:string, opt:bool = false)
var this=mq_gml_source;
this[1,0]=mt_gml_source;
var l_name=argument[0],l_code=argument[1],l_main,l_opt;
if(argument_count>2)l_main=argument[2];else l_main=undefined;
if(argument_count>3)l_opt=argument[3];else l_opt=false;
if (live_enabled) {
	this[@5]=undefined;
	this[@0]=l_name;
	this[@1]=l_code;
	this[@4]=l_opt;
	if(l_main==undefined){
		l_main=l_name;
		var l_i;
		while(true){
			l_i=string_pos("/",l_main)+-1;
			if(l_i<0)l_i=string_pos("\\",l_main)+-1;
			if(l_i>=0)l_main=string_delete(l_main,1,l_i+1);
			if(l_i<0)break;
		}
		l_i=string_pos(".",l_main)+-1;
		if(l_i>=0)l_main=string_copy(l_main,1,l_i);
	}
	this[@2]=l_main;
	this[@3]=string_length(l_code);
	this[@6]=gml_pos_create(this,string_count("\n",l_code)+2,1);
}
return this;

#define gml_source_to_string
/// gml_source_to_string(this:source)->string
var this=argument[0];
if (live_enabled) {
	return "GmlSource(\""+this[0]+"\")";
} else return undefined;

#define gml_token_header
/// gml_token_header(d:pos, name:string, lb:bool)
var this;
this[1,0]=mt_gml_token;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=0;
return this;

#define gml_token_macro
/// gml_token_macro(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=1;
return this;

#define gml_token_hash
/// gml_token_hash(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=2;
return this;

#define gml_token_semico
/// gml_token_semico(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=3;
return this;

#define gml_token_comma
/// gml_token_comma(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=4;
return this;

#define gml_token_period
/// gml_token_period(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=5;
return this;

#define gml_token_colon
/// gml_token_colon(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=6;
return this;

#define gml_token_qmark
/// gml_token_qmark(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=7;
return this;

#define gml_token_at_sign
/// gml_token_at_sign(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=8;
return this;

#define gml_token_keyword
/// gml_token_keyword(d:pos, kw:GmlKeyword)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=9;
return this;

#define gml_token_ident
/// gml_token_ident(d:pos, id:string)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=10;
return this;

#define gml_token_env
/// gml_token_env(d:pos, id:string)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=11;
return this;

#define gml_token_undefined
/// gml_token_undefined(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=12;
return this;

#define gml_token_number
/// gml_token_number(d:pos, nu:real, src:string)
var this;
this[1,0]=mt_gml_token;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=13;
return this;

#define gml_token_cstring
/// gml_token_cstring(d:pos, st:string)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=14;
return this;

#define gml_token_un_op
/// gml_token_un_op(d:pos, op:GmlUnOp)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=15;
return this;

#define gml_token_in
/// gml_token_in(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=16;
return this;

#define gml_token_adjfix
/// gml_token_adjfix(d:pos, inc:bool)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=17;
return this;

#define gml_token_bin_op
/// gml_token_bin_op(d:pos, op:GmlOp)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=18;
return this;

#define gml_token_set_op
/// gml_token_set_op(d:pos, op:GmlOp)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=19;
return this;

#define gml_token_par_open
/// gml_token_par_open(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=20;
return this;

#define gml_token_par_close
/// gml_token_par_close(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=21;
return this;

#define gml_token_sqb_open
/// gml_token_sqb_open(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=22;
return this;

#define gml_token_sqb_close
/// gml_token_sqb_close(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=23;
return this;

#define gml_token_cub_open
/// gml_token_cub_open(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=24;
return this;

#define gml_token_cub_close
/// gml_token_cub_close(d:pos)
var this;
this[1,0]=mt_gml_token;
this[1]=argument[0];
this[0]=25;
return this;

#define gml_token_arg_const
/// gml_token_arg_const(d:pos, i:int)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=26;
return this;

#define gml_token_comment_post
/// gml_token_comment_post(d:pos, s:string)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=27;
return this;

#define gml_token_comment_line
/// gml_token_comment_line(d:pos, s:string)
var this;
this[1,0]=mt_gml_token;
this[2]=argument[1];
this[1]=argument[0];
this[0]=28;
return this;

#define gml_token_comment_block
/// gml_token_comment_block(d:pos, s:string, pl:bool)
var this;
this[1,0]=mt_gml_token;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=29;
return this;

#define gml_api_print
/// gml_api_print()->string
if (live_enabled) {
	var l_b=buffer_create(1024,1,1);
	var l_m=g_gml_sig_list;
	var l_i=0;
	for(var l__g=ds_list_size(l_m);l_i<l__g;l_i+=1){
		buffer_write(l_b,buffer_text,l_m[|l_i]);
		buffer_write(l_b,buffer_u8,13);
		buffer_write(l_b,buffer_u8,10);
	}
	buffer_write(l_b,buffer_u8,0);
	buffer_seek(l_b,0,0);
	var l_s=buffer_read(l_b,buffer_string);
	buffer_delete(l_b);
	return l_s;
} else return undefined;

#define gml_note_add
/// gml_note_add(text:string)
var l_text=argument[0];
if (live_enabled) {
	if(string_pos(chr(10),l_text)>0){
		var l__n=chr(10);
		var l__rn=chr(13)+l__n;
		l_text=string_replace_all(l_text,l__rn,l__n);
		l_text="/**"+l__rn+" * "+string_replace_all(l_text,l__n,l__rn+" * ")+l__rn+" */";
	} else switch(string_char_at(l_text,1)){
		case "/":break;
		case "{":case "}":l_text="//"+l_text;break;
		default:l_text="/// "+l_text;
	}
	ds_list_add(g_gml_sig_list,l_text);
}

#define gml_parse_name
/// gml_parse_name(s:string, i:int)->string
var l_s=argument[0],l_i=argument[1];
if (live_enabled) {
	var l_c=string_ord_at(l_s,l_i+1);
	if(l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c==95){
		var l_k=l_i;
		while(true){
			l_i+=1;
			l_c=string_ord_at(l_s,l_i+1);
			if(!(l_c==95||l_c>=97&&l_c<=122||l_c>=65&&l_c<=90||l_c>=48&&l_c<=57))break;
		}
		return string_delete(string_copy(l_s,1,l_i),1,l_k);
	} else show_error("API.parseName: wrong format in "+l_s,false);
} else return undefined;

#define gml_func_add
/// gml_func_add(s:string, func:dynamic)
var l_s=argument[0],l_func=argument[1];
if (live_enabled) {
	ds_list_add(g_gml_sig_list,l_s);
	var l_p0=string_pos("(",l_s)+-1+1;
	var l_p1=string_pos(")",l_s)+-1;
	var l_argv=gml_std_string_trim(string_delete(string_copy(l_s,1,l_p1),1,l_p0));
	var l_flags=string_delete(l_s,1,l_p1+1);
	var l_argc,l_argt;
	var l_rest=live_script_get_index("gml_type_check_any");
	if(l_argv==""){
		l_argc=0;
		l_argt=array_create(0);
	} else {
		var l_args1=gml_std_string_split(l_argv,",");
		l_argc=array_length_1d(l_args1);
		l_argt=array_create(l_argc);
		var l_tmap=g_gml_type_check_map;
		var l_i=0;
		for(var l__g=l_argc;l_i<l__g;l_i+=1){
			var l_arg=l_args1[l_i];
			var l_pos=string_pos(":",l_arg)+-1;
			var l_tfun;
			if(l_pos>=0){
				var l_type=gml_std_string_trim(string_delete(l_arg,1,l_pos+1));
				if(ds_map_exists(l_tmap,l_type)){
					var l_tfun1=l_tmap[?l_type];
					if(string_pos("...",l_arg)>=1)l_rest=l_tfun1;
					l_argt[@l_i]=l_tfun1;
				} else show_error("\""+l_type+"\" is not a known type.",false);
			} else l_argt[@l_i]=live_script_get_index("gml_type_check_any");
		}
		if(string_pos("...",l_argv)>=1||string_pos("?",l_argv)>=1||string_pos("=",l_argv)>=1)l_argc=-1;
	}
	var l_i1=0;
	var l_inst=false;
	if(string_ord_at(l_s,l_i1+1)==58){
		l_i1+=1;
		l_inst=true;
	}
	var l_name=gml_parse_name(l_s,l_i1);
	if(l_inst)g_gml_inst_data[?l_name]=1;
	g_gml_func_eval[?l_name]=string_pos("#",l_flags)>=1;
	g_gml_func_args[?l_name]=l_argt;
	g_gml_func_rest[?l_name]=l_rest;
	g_gml_func_argc[?l_name]=l_argc;
	g_gml_func_script[?l_name]=l_func;
}

#define gml_get_self
/// gml_get_self()->GmlExtInstance
if (live_enabled) {
	return self;
} else return undefined;

#define gml_scope_clear
/// gml_scope_clear()
if (live_enabled) {
	var l_cl=g_gml_scope_list;
	var l_i=0;
	for(var l__g=ds_list_size(l_cl);l_i<l__g;l_i+=1){
		var l_q=l_cl[|l_i];
		ds_map_delete(g_gml_scope_lookup,g_gml_scope_fields[?l_q]);
		ds_map_delete(g_gml_scope_fields,l_q);
		ds_map_destroy(l_q);
	}
	ds_list_clear(l_cl);
}

#define gml_scope_create
/// gml_scope_create()->array<Any>
if (live_enabled) {
	var l_r=undefined;
	l_r[2, 0] = g_gml_scope_default;
	return l_r;
} else return undefined;

#define gml_light_create
/// gml_light_create()->array<Any>
if (live_enabled) {
	var l_r=undefined;
	l_r[2, 0] = g_gml_scope_default;
	return l_r;
} else return undefined;

#define gml_light_create_ext
/// gml_light_create_ext(keys:array<string>, sig:string)->GmlValueList
var l_keys=argument[0],l_sig=argument[1];
if (live_enabled) {
	var l_w1=undefined;
	l_w1[2, 0] = undefined;
	var l_n=array_length_1d(l_keys);
	var l_i=l_n;
	while(--l_i>=0){
		l_w1[1, l_i] = l_keys[l_i];
	}
	var l_idq=g_gml_scope_lookup[?l_sig];
	if(l_idq==undefined){
		l_idq=ds_map_create();
		for(l_i=0;l_i<l_n;l_i+=1){
			l_idq[?l_keys[l_i]]=l_i;
		}
		g_gml_scope_lookup[?l_sig]=l_idq;
		g_gml_scope_fields[?l_idq]=l_sig;
	}
	l_w1[2, 0] = l_idq;
	return l_w1;
} else return undefined;

#define gml_cfunc
/// gml_cfunc(val:GmlValue)->GmlClassFunc
var l_val=argument[0];
if (live_enabled) {
	return l_val[1, 0];
} else return undefined;

#define gml_live_not_found
/// gml_live_not_found(inst:GmlValue)
var l_inst=argument[0];
if (live_enabled) {
	if(object_exists(floor(l_inst)))gml_thread_error("Couldn't find any instances of "+string(l_inst)+" ("+object_get_name(floor(l_inst))+")"); else gml_thread_error("Couldn't find instance `"+string(l_inst)+"`");
}

#define gml_field_func
/// gml_field_func(inst:GmlValue, field:string, set:bool, val:GmlValue)->GmlValue
var l_inst=argument[0],l_field=argument[1],l_set=argument[2],l_val=argument[3];
if (live_enabled) {
	with (l_inst) {
		if(l_set){
			variable_instance_set(self,l_field,l_val);
		} else if(variable_instance_exists(self,l_field)){
			l_val=variable_instance_get(self,l_field);
		} else gml_thread_error("`"+string(l_inst)+"` ("+object_get_name(self.object_index)+") does not have a variable `"+l_field+"`");
		return l_val;
	}
	if(object_exists(floor(l_inst)))gml_thread_error("Couldn't find any instances of "+string(l_inst)+" ("+object_get_name(floor(l_inst))+")"); else gml_thread_error("Couldn't find instance `"+string(l_inst)+"`");
	return undefined;
} else return undefined;

#define gml_field_check
/// gml_field_check(inst:GmlValue, field:string)->bool
var l_inst=argument[0],l_field=argument[1];
if (live_enabled) {
	return variable_instance_exists(l_inst,l_field);
} else return false;

#define gml_field_get
/// gml_field_get(inst:GmlValue, field:string, defValue:GmlValue)->GmlValue
var l_inst=argument[0],l_field=argument[1],l_defValue=argument[2];
if (live_enabled) {
	with (l_inst) if(variable_instance_exists(self,l_field))return variable_instance_get(self,l_field); else return l_defValue;
	return l_defValue;
} else return undefined;

#define gml_with_func
/// gml_with_func(seek:GmlValue)->GmlValueList
var l_seek=argument[0];
if (live_enabled) {
	var l_out;
	if(gml_value_is_number(l_seek)){
		var l_i=0;
		if(l_seek>=100000){
			l_out=array_create(0);
			with (l_seek) l_out[@l_i++]=self.id;
			return l_out;
		} else {
			var l_n=instance_number(l_seek);
			l_out=array_create(l_n);
			with (l_seek) l_out[@l_i++]=self.id;
			if(l_i<l_n){
				var l_cct=array_create(l_i);
				for(l_n=0;l_n<l_i;l_n+=1){
					l_cct[@l_n]=l_out[l_n];
				}
				return l_cct;
			} else return l_out;
		}
	} else if(is_array(l_seek)){
		if(array_length_2d(l_seek,2)==1||array_length_2d(l_seek,1)>=1){
			l_out=array_create(1);
			l_out[@0]=l_seek;
			return l_out;
		}
		return l_seek;
	} else {
		gml_thread_error("Cannot apply with() to "+gml_value_print_rec(l_seek,0));
		return undefined;
	}
} else return undefined;

#define gml_with_first
/// gml_with_first(seek:GmlValue)->GmlValue
var l_seek=argument[0];
if (live_enabled) {
	if(is_real(l_seek)){
		with (l_seek) return self.id;
		if(l_seek<100000)gml_thread_error("Could not find any instances of "+string(l_seek)+"("+object_get_name(round(l_seek))+")"); else gml_thread_error("Could not find instance "+string(l_seek));
		return undefined;
	} else return l_seek;
} else return undefined;

#define gml_var_add
/// gml_var_add(s:string, func:dynamic)
var l_s=argument[0],l_func=argument[1];
if (live_enabled) {
	ds_list_add(g_gml_sig_list,l_s);
	var l_flags=0;
	if(string_ord_at(l_s,1)==58){
		l_s=string_delete(l_s,1,1);
		l_flags|=4;
	}
	var l_type=live_script_get_index("gml_type_check_any");
	var l_pos=string_pos(":",l_s)+-1;
	if(l_pos>=0){
		var l_tstr=string_delete(l_s,1,l_pos+1);
		if(ds_map_exists(g_gml_type_check_map,l_tstr)){
			l_type=g_gml_type_check_map[?l_tstr];
			l_s=string_copy(l_s,1,l_pos);
		} else show_error("`"+l_tstr+"` is not a known type.",false);
	}
	var l_name=gml_parse_name(l_s,0);
	if(string_pos("[",l_s)>=1)l_flags|=2;
	if(string_pos("*",l_s)>=1)l_flags|=1;
	g_gml_var_flags[?l_name]=l_flags;
	g_gml_var_refs[?l_name]=l_func;
	g_gml_var_types[?l_name]=l_type;
}

#define gml_const_add
/// gml_const_add(name:string, value:GmlValue)
var l_name=argument[0],l_value=argument[1];
if (live_enabled) {
	ds_list_add(g_gml_sig_list,l_name+" = "+gml_value_print_rec(l_value,0));
	g_gml_const_map[?l_name]=true;
	g_gml_const_val[?l_name]=l_value;
}

#define gml_asset_add
/// gml_asset_add(name:string, index:int)
var l_name=argument[0],l_index=argument[1];
if (live_enabled) {
	g_gml_asset_index[?l_name]=l_index;
}

#define gml_std_haxe_class_create
/// gml_std_haxe_class_create(id:int, name:string)
var this=mq_gml_std_haxe_class;
this[1,0]=56;
var l_id=argument[0],l_name=argument[1];
if (live_enabled) {
	this[@2]=undefined;
	this[@0]=l_id;
	this[@1]=l_name;
}
return this;

#define gml_std_haxe_enum_create
/// gml_std_haxe_enum_create(id:int, name:string, ?ctrs:array<string>)
var this=mq_gml_std_haxe_enum;
this[1,0]=57;
var l_id=argument[0],l_name=argument[1],l_ctrs;
if(argument_count>2)l_ctrs=argument[2];else l_ctrs=undefined;
if (live_enabled) {
	this[@0]=l_id;
	this[@1]=l_name;
	this[@2]=l_ctrs;
}
return this;

#define gml_seek_adjfix_proc
/// gml_seek_adjfix_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	switch(l_q[0]){
		case 23:
			var l_x=l_q[2];
			var l_d=l_q[1];
			var l_pre=l_q[0]==23;
			var l_o;
			var l_inBlock=gml_node_is_in_block(l_x,l_st[|0]);
			if(l_pre||l_inBlock)switch(l_x[0]){
				case 72:
					l_o=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_list_aop(l_d,l_x[2],l_x[3],l_o,gml_node_number(l_d,1,undefined)));
					break;
				case 77:
					l_o=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_map_aop(l_d,l_x[2],l_x[3],l_o,gml_node_number(l_d,1,undefined)));
					break;
				case 82:
					l_o=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_grid_aop(l_d,l_x[2],l_x[3],l_x[4],l_o,gml_node_number(l_d,1,undefined)));
					break;
				default:
					if(l_inBlock){
						l_o=(l_q[3]) ? 16 : 17;
						gml_std_haxe_enum_tools_set(l_q,gml_node_set_op(l_d,l_o,l_x,gml_node_number(l_d,1,undefined)));
					}
			}
			break;
		case 24:
			var l_x1=l_q[2];
			var l_d1=l_q[1];
			var l_pre1=l_q[0]==23;
			var l_o1;
			var l_inBlock1=gml_node_is_in_block(l_x1,l_st[|0]);
			if(l_pre1||l_inBlock1)switch(l_x1[0]){
				case 72:
					l_o1=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_list_aop(l_d1,l_x1[2],l_x1[3],l_o1,gml_node_number(l_d1,1,undefined)));
					break;
				case 77:
					l_o1=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_map_aop(l_d1,l_x1[2],l_x1[3],l_o1,gml_node_number(l_d1,1,undefined)));
					break;
				case 82:
					l_o1=(l_q[3]) ? 16 : 17;
					gml_std_haxe_enum_tools_set(l_q,gml_node_ds_grid_aop(l_d1,l_x1[2],l_x1[3],l_x1[4],l_o1,gml_node_number(l_d1,1,undefined)));
					break;
				default:
					if(l_inBlock1){
						l_o1=(l_q[3]) ? 16 : 17;
						gml_std_haxe_enum_tools_set(l_q,gml_node_set_op(l_d1,l_o1,l_x1,gml_node_number(l_d1,1,undefined)));
					}
			}
			break;
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_alarms_check
/// gml_seek_alarms_check(x:node)->null<node>
var l_x=argument[0];
if (live_enabled) {
	if(l_x[0]==37){
		if(l_x[3]=="alarm")return l_x[2]; else return undefined;
	} else return undefined;
} else return undefined;

#define gml_seek_alarms_proc
/// gml_seek_alarms_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	var l_r;
	switch(l_q[0]){
		case 52:
			l_r=gml_seek_alarms_check(l_q[2]);
			if(l_r!=undefined)gml_std_haxe_enum_tools_set(l_q,gml_node_alarm(l_q[1],l_r,l_q[3]));
			break;
		case 62:
			l_r=gml_seek_alarms_check(l_q[2]);
			if(l_r!=undefined)gml_std_haxe_enum_tools_set(l_q,gml_node_alarm(l_q[1],l_r,l_q[3]));
			break;
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_arguments_proc
/// gml_seek_arguments_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	gml_node_seek(l_q,l_st,g_gml_program_seek_func);
	if(l_q[0]==13){
		var l_i=l_q[2];
		var l_d=l_q[1];
		if(g_gml_program_seek_script[7]<=l_i)g_gml_program_seek_script[@7]=l_i+1;
	}
	return false;
} else return false;

#define gml_seek_calls_proc
/// gml_seek_calls_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	var l_i,l_n,l_s;
	if(l_q[0]==16){
		var l_w=l_q[3];
		var l_x=l_q[2];
		var l_d=l_q[1];
		switch(l_x[0]){
			case 7:
				var l_s1=l_x[2];
				if(ds_map_exists(g_gml_func_argc,l_s1)){
					var l_n1=g_gml_func_argc[?l_s1];
					if(l_n1<0||array_length_1d(l_w)==l_n1)gml_std_haxe_enum_tools_set(l_q,gml_node_call_func(l_d,l_s1,l_w)); else return gml_program_error(g_gml_program_seek_inst,"Wrong number of arguments for `"+l_s1+"`",l_q[1]);
				} else return gml_program_error(g_gml_program_seek_inst,"`"+l_s1+"` is not a function or script",l_x[1]);
				break;
			case 10:
				var l_o=l_x[2];
				l_n=l_o[7];
				l_s=l_o[0];
				if(l_n<=0||array_length_1d(l_w)==l_n)gml_std_haxe_enum_tools_set(l_q,gml_node_call_script(l_d,l_s,l_w)); else return gml_program_error(g_gml_program_seek_inst,"Wrong number of arguments for `"+l_s+"`",l_d);
				break;
			case 11:
				var l_s2=l_x[2];
				if(ds_map_exists(g_gml_func_argc,l_s2)){
					var l_n2=g_gml_func_argc[?l_s2];
					if(l_n2<0||array_length_1d(l_w)==l_n2)gml_std_haxe_enum_tools_set(l_q,gml_node_call_func(l_d,l_s2,l_w)); else return gml_program_error(g_gml_program_seek_inst,"Wrong number of arguments for `"+l_s2+"`",l_q[1]);
				} else return gml_program_error(g_gml_program_seek_inst,"`"+l_s2+"` is not a function or script",l_x[1]);
				break;
			case 37:
				var l_s3=l_x[3];
				if(ds_map_exists(g_gml_func_argc,l_s3)){
					if(ds_map_exists(g_gml_inst_data,l_s3))gml_std_haxe_enum_tools_set(l_q,gml_node_call_func_at(l_d,l_x[2],l_s3,l_w)); else return gml_program_error(g_gml_program_seek_inst,"`"+l_s3+"` cannot be called on an instance",l_x[1]);
				} else if(ds_map_exists(g_gml_program_seek_inst[2],l_s3)){
					l_n=gml_std_array_wget(ds_map_find_value(g_gml_program_seek_inst[2],l_s3),7);
					if(l_n<=0||array_length_1d(l_w)==l_n)gml_std_haxe_enum_tools_set(l_q,gml_node_call_script_at(l_d,l_x[2],l_s3,l_w)); else return gml_program_error(g_gml_program_seek_inst,"Wrong number of arguments for `"+l_s3+"`",l_d);
				} else gml_std_haxe_enum_tools_set(l_q,gml_node_call_field(l_d,l_x[2],l_s3,l_w));
				break;
			default:return gml_program_error(g_gml_program_seek_inst,"Expression is not callable",l_x[1]);
		}
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_enum_fields_proc
/// gml_seek_enum_fields_proc(q:node, st:ArrayList<node>)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	if(gml_node_seek(l_q,l_st,g_gml_program_seek_func))return true;
	if(l_q[0]==37){
		var l_f=l_q[3];
		var l_x=l_q[2];
		var l_d=l_q[1];
		if(l_x[0]==7){
			var l_s=l_x[2];
			var l_e=ds_map_find_value(g_gml_program_seek_inst[4],l_s);
			if(l_e!=undefined){
				var l_c=ds_map_find_value(l_e[3],l_f);
				if(l_c!=undefined){
					gml_std_haxe_enum_tools_set(l_q,gml_node_number(l_d,l_c[3],undefined));
					return false;
				} else return gml_program_error(g_gml_program_seek_inst,"Enum `"+l_s+"` does not contain field `"+l_f+"`",l_d);
			}
		}
		if(ds_map_exists(g_gml_var_flags,l_f)){
			if((g_gml_var_flags[?l_f]&4)==0)return gml_program_error(g_gml_program_seek_inst,"`"+l_f+"` is not an instance-specific variable.",l_d);
		}
	}
	return false;
} else return false;

#define gml_seek_enum_values_proc
/// gml_seek_enum_values_proc()->bool
if (live_enabled) {
	var l__g=0;
	var l__g1=g_gml_program_seek_inst[3];
	while(l__g<array_length_1d(l__g1)){
		var l_e=l__g1[l__g];
		l__g+=1;
		var l_next=0;
		var l__g2=0;
		var l__g3=l_e[2];
		while(l__g2<array_length_1d(l__g3)){
			var l_c=l__g3[l__g2];
			l__g2+=1;
			if(l_c[2]!=undefined){
				var l_st=ds_list_create();
				var l__seekFunc=g_gml_program_seek_func;
				g_gml_program_seek_func=live_script_get_index("gml_seek_idents_proc");
				g_gml_program_seek_script=undefined;
				gml_seek_idents_proc(l_c[2],l_st);
				g_gml_program_seek_func=l__seekFunc;
				ds_list_destroy(l_st);
				gml_seek_eval_eval(l_c[2]);
				var l_v=gml_seek_eval_node_to_value(l_c[2]);
				if(gml_value_is_number(l_v)){
					l_c[@3]=floor(l_v);
					l_next=l_c[3]+1;
				} else if(l_v!=g_gml_seek_eval_invalid_value){
					return gml_program_error(g_gml_program_seek_inst,"Enum values should be integer",gml_std_array_wget(l_c[2],1));
				} else return gml_program_error(g_gml_program_seek_inst,"Enum values should be constant",gml_std_array_wget(l_c[2],1));
			} else l_c[@3]=l_next++;
		}
	}
	return false;
} else return false;

#define gml_seek_eval_node_to_value
/// gml_seek_eval_node_to_value(node:node)->GmlValue
var l_node=argument[0];
if (live_enabled) {
	switch(l_node[0]){
		case 0:return undefined;
		case 1:return l_node[2];
		case 2:return l_node[2];
		case 11:return l_node[3];
		case 12:return g_gml_const_val[?l_node[2]];
		default:return g_gml_seek_eval_invalid_value;
	}
} else return undefined;

#define gml_seek_eval_value_to_node
/// gml_seek_eval_value_to_node(val:GmlValue, d:GmlNodeData)->node
var l_val=argument[0],l_d=argument[1];
if (live_enabled) {
	if(gml_value_is_number(l_val)){
		return gml_node_number(l_d,l_val,undefined);
	} else if(is_string(l_val)){
		return gml_node_cstring(l_d,l_val);
	} else if(l_val==undefined){
		return gml_node_undefined(l_d);
	} else return undefined;
} else return undefined;

#define gml_seek_eval_proc
/// gml_seek_eval_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	var l_f1,l_f2;
	var l_z=true;
	var l_v1,l_v2,l_i,l_n;
	switch(l_q[0]){
		case 0:break;
		case 1:break;
		case 2:break;
		case 12:break;
		case 21:
			var l_args1=l_q[3];
			var l_name=l_q[2];
			l_n=array_length_1d(l_args1);
			for(l_i=0;l_i<l_n;l_i+=1){
				if(gml_seek_eval_proc(l_args1[l_i],l_st))l_z=false;
			}
			if(l_z&&g_gml_func_eval[?l_name]){
				var l_evalArgs=array_create(l_n);
				var l_val;
				l_i=0;
				while(l_i<l_n){
					l_val=gml_seek_eval_node_to_value(l_args1[l_i]);
					if(l_val!=g_gml_seek_eval_invalid_value){
						l_evalArgs[@l_i]=l_val;
						l_i+=1;
					} else break;
				}
				if(l_i>=l_n){
					var l_th=g_gml_seek_eval_eval_thread;
					if(l_th==undefined){
						l_th=gml_thread_create(g_gml_program_seek_inst,g_gml_seek_eval_eval_actions,array_create(0),array_create(0),undefined,undefined,0);
						g_gml_seek_eval_eval_thread=l_th;
					}
					var l_th0=g_gml_thread_current;
					g_gml_thread_current=l_th;
					l_th[@2]=gml_thread_status_running;
					l_val=vm_gml_thread_exec_call(g_gml_func_script[?l_name],l_evalArgs,l_n);
					g_gml_thread_current=l_th0;
					if(l_th[2]!=gml_thread_status_error){
						var l_next=gml_seek_eval_value_to_node(l_val,l_q[1]);
						if(l_next!=undefined){
							gml_std_haxe_enum_tools_set(l_q,l_next);
						} else {
							g_gml_seek_eval_error_text="Could not translate "+gml_value_print_rec(l_val,0)+" ("+gml_value_get_type(l_val)+") compile-time";
							g_gml_seek_eval_error_pos=l_q[1];
						}
					} else {
						g_gml_seek_eval_error_text="Could not evaluate compile-time: "+l_th[7];
						g_gml_seek_eval_error_pos=l_q[1];
					}
				}
			}
			break;
		case 26:
			if(l_q[2]==16){
				var l_b=l_q[4];
				var l_a=l_q[3];
				var l_d=l_q[1];
				if(gml_seek_eval_proc(l_a,l_st))l_z=false;
				if(gml_seek_eval_proc(l_b,l_st))l_z=false;
				if(l_z){
					l_v1=gml_seek_eval_node_to_value(l_a);
					l_v2=gml_seek_eval_node_to_value(l_b);
					if(is_string(l_v1)){
						if(is_string(l_v2)){
							gml_std_haxe_enum_tools_set(l_q,gml_node_cstring(l_d,l_v1+l_v2));
						} else if(l_b[0]==26){
							if(l_b[2]==16){
								if(gml_std_array_wget(l_b[3],0)==2){
									gml_std_haxe_enum_tools_set(l_q,gml_node_bin_op(l_d,16,gml_node_cstring(l_d,string(l_v1)+gml_std_array_wget(l_b[3],2)),l_b[4]));
								} else {
									g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
									g_gml_seek_eval_error_pos=l_q[1];
									l_z=false;
								}
							} else {
								g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
								g_gml_seek_eval_error_pos=l_q[1];
								l_z=false;
							}
						} else {
							g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
							g_gml_seek_eval_error_pos=l_q[1];
							l_z=false;
						}
					} else if(gml_value_is_number(l_v1)){
						if(gml_value_is_number(l_v2)){
							gml_std_haxe_enum_tools_set(l_q,gml_node_number(l_d,l_v1+l_v2,undefined));
						} else {
							g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
							g_gml_seek_eval_error_pos=l_q[1];
							l_z=false;
						}
					} else if(is_string(l_v2)){
						if(l_a[0]==26){
							if(l_a[2]==16){
								if(gml_std_array_wget(l_a[4],0)==2){
									gml_std_haxe_enum_tools_set(l_q,gml_node_bin_op(l_d,16,l_a[3],gml_node_cstring(l_d,gml_std_array_wget(l_a[4],2)+string(l_v2))));
								} else {
									g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
									g_gml_seek_eval_error_pos=l_q[1];
									l_z=false;
								}
							} else {
								g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
								g_gml_seek_eval_error_pos=l_q[1];
								l_z=false;
							}
						} else {
							g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
							g_gml_seek_eval_error_pos=l_q[1];
							l_z=false;
						}
					} else {
						g_gml_seek_eval_error_text="Can't add "+gml_std_haxe_type_tools_enum_ctr(l_a)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b)+" at compile time";
						g_gml_seek_eval_error_pos=l_q[1];
						l_z=false;
					}
				}
			} else {
				var l_b1=l_q[4];
				var l_a1=l_q[3];
				var l_d1=l_q[1];
				var l_o=l_q[2];
				if(gml_seek_eval_proc(l_a1,l_st))l_z=false;
				if(gml_seek_eval_proc(l_b1,l_st))l_z=false;
				if(l_z){
					l_v1=gml_seek_eval_node_to_value(l_a1);
					l_v2=gml_seek_eval_node_to_value(l_b1);
					if(gml_value_is_number(l_v1)&&gml_value_is_number(l_v2)){
						l_f1=l_v1;
						l_f2=l_v2;
						switch(l_o){
							case 0:l_f1*=l_f2;break;
							case 1:l_f1/=l_f2;break;
							case 2:l_f1%=l_f2;break;
							case 3:l_f1=(l_f1 div l_f2);break;
							case 16:l_f1+=l_f2;break;
							case 17:l_f1-=l_f2;break;
							case 32:l_f1=(l_f1<<l_f2);break;
							case 33:l_f1=(l_f1>>l_f2);break;
							case 48:l_f1=(l_f1|l_f2);break;
							case 49:l_f1=(l_f1&l_f2);break;
							case 50:l_f1=(l_f1^l_f2);break;
							case 64:l_f1=l_f1==l_f2;break;
							case 65:l_f1=l_f1!=l_f2;break;
							case 66:l_f1=l_f1<l_f2;break;
							case 67:l_f1=l_f1<=l_f2;break;
							case 68:l_f1=l_f1>l_f2;break;
							case 69:l_f1=l_f1>=l_f2;break;
							case 80:l_f1=l_f1&&l_f2;break;
							case 96:l_f1=l_f1||l_f2;break;
							default:
								g_gml_seek_eval_error_text="Can't apply "+gml_op_get_name(l_o);
								g_gml_seek_eval_error_pos=l_q[1];
								l_z=false;
						}
						if(l_z)gml_std_haxe_enum_tools_set(l_q,gml_node_number(l_d1,l_f1,undefined));
					} else {
						g_gml_seek_eval_error_text="Can't apply "+gml_op_get_name(l_o)+" to "+gml_std_haxe_type_tools_enum_ctr(l_a1)+" and "+gml_std_haxe_type_tools_enum_ctr(l_b1);
						g_gml_seek_eval_error_pos=l_q[1];
						l_z=false;
					}
				}
			}
			break;
		default:
			if(g_gml_seek_eval_eval_rec){
				if(gml_node_seek(l_q,l_st,live_script_get_index("gml_seek_eval_proc")))l_z=false;
			} else {
				g_gml_seek_eval_error_text=gml_std_haxe_type_tools_enum_ctr(l_q)+" doesn't seem to be a constant expression.";
				g_gml_seek_eval_error_pos=l_q[1];
				l_z=false;
			}
	}
	return !l_z;
} else return false;

#define gml_seek_eval_eval
/// gml_seek_eval_eval(q:node)->bool
var l_q=argument[0];
if (live_enabled) {
	g_gml_seek_eval_eval_rec=false;
	var l_r=gml_seek_eval_proc(l_q,undefined);
	g_gml_seek_eval_eval_thread=undefined;
	return l_r;
} else return false;

#define gml_seek_eval_opt
/// gml_seek_eval_opt()->bool
if (live_enabled) {
	g_gml_seek_eval_eval_rec=true;
	gml_program_seek(g_gml_program_seek_inst,live_script_get_index("gml_seek_eval_proc"));
	g_gml_seek_eval_eval_thread=undefined;
	return false;
} else return false;

#define gml_seek_idents_proc
/// gml_seek_idents_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	if(l_q[0]==7){
		var l_s=l_q[2];
		var l_d=l_q[1];
		var l_scr=g_gml_program_seek_script;
		if(l_scr!=undefined&&ds_map_exists(l_scr[8],l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_arg_const(l_d,ds_map_find_value(l_scr[8],l_s)));
		} else if(l_scr!=undefined&&ds_map_exists(l_scr[5],l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_local(l_d,l_s));
		} else if(ds_map_exists(g_gml_program_seek_inst[5],l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_clone(ds_map_find_value(g_gml_program_seek_inst[5],l_s)));
			gml_seek_idents_proc(l_q,l_st);
		} else if(ds_map_exists(g_gml_var_flags,l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_env(l_d,l_s));
			if(ds_list_size(l_st)>0){
				var l__g=l_st[|0];
				switch(l__g[0]){
					case 52:if((g_gml_var_flags[?l_s]&2)!=0)gml_std_haxe_enum_tools_set(l_st[|0],gml_node_env1d(l__g[1],l_s,l__g[3])); else return gml_program_error(g_gml_program_seek_inst,"`"+l_s+"` is not an array.",l__g[1]);break;
					case 57:return gml_program_error(g_gml_program_seek_inst,"`"+l_s+"` is not a 2d array.",l__g[1]);
					default:if((g_gml_var_flags[?l_s]&2)!=0)gml_std_haxe_enum_tools_set(l_q,gml_node_env1d(l_d,l_s,gml_node_number(l_d,0,undefined)));
				}
			}
		} else if(ds_map_exists(g_gml_const_map,l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_seek_eval_value_to_node(g_gml_const_val[?l_s],l_d));
		} else if(ds_map_exists(g_gml_program_seek_inst[2],l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_script(l_d,ds_map_find_value(g_gml_program_seek_inst[2],l_s)));
		} else if(ds_map_exists(g_gml_func_script_id,l_s)){
			gml_std_haxe_enum_tools_set(l_q,gml_node_native_script(l_d,l_s,g_gml_func_script_id[?l_s]));
		}
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_locals_proc
/// gml_seek_locals_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	if(l_q[0]==87){
		var l_s=l_q[2];
		var l_d=l_q[1];
		if(!ds_map_exists(g_gml_program_seek_script[5],l_s))ds_map_set(g_gml_program_seek_script[5],l_s,g_gml_program_seek_script[@6]++);
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_self_fields_proc
/// gml_seek_self_fields_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	if(l_q[0]==7){
		var l_s=l_q[2];
		var l_d=l_q[1];
		gml_std_haxe_enum_tools_set(l_q,gml_node_field(l_d,gml_node_self(l_d),l_s));
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define gml_seek_set_op_resolve_set_op_rfn
/// gml_seek_set_op_resolve_set_op_rfn(q:node, st:ArrayList<node>)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	switch(l_q[0]){
		case 27:
			if(gml_node_equals(g_gml_seek_set_op_resolve_set_op_xw,l_q[3])){
				g_gml_seek_set_op_resolve_set_op_safe=gml_std_array_wget(l_q[4],0)==4;
				return true;
			}
			break;
		case 53:
			if(gml_node_equals(g_gml_seek_set_op_resolve_set_op_xw,l_q[2])){
				g_gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case 54:
			if(gml_node_equals(g_gml_seek_set_op_resolve_set_op_xw,l_q[2])){
				g_gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case 58:
			if(gml_node_equals(g_gml_seek_set_op_resolve_set_op_xw,l_q[2])){
				g_gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
		case 59:
			if(gml_node_equals(g_gml_seek_set_op_resolve_set_op_xw,l_q[2])){
				g_gml_seek_set_op_resolve_set_op_safe=true;
				return true;
			}
			break;
	}
	return gml_node_seek_all(l_q,l_st,live_script_get_index("gml_seek_set_op_resolve_set_op_rfn"));
} else return false;

#define gml_seek_set_op_proc
/// gml_seek_set_op_proc(q:node, st:GmlNodeList)->bool
var l_q=argument[0],l_st=argument[1];
if (live_enabled) {
	if(l_q[0]==27){
		var l_v=l_q[4];
		var l_x=l_q[3];
		var l_o=l_q[2];
		var l_d=l_q[1];
		var l__g=gml_node_unpack(l_x);
		switch(l__g[0]){
			case 13:break;
			case 14:break;
			case 31:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_local_aop(l_d,l__g[2],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_local_set(l_d,l__g[2],l_v));break;
			case 34:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_global_aop(l_d,l__g[2],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_global_set(l_d,l__g[2],l_v));break;
			case 37:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_field_aop(l_d,l__g[2],l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_field_set(l_d,l__g[2],l__g[3],l_v));break;
			case 40:
				var l_s3=l__g[2];
				var l_f=g_gml_var_flags[?l_s3];
				if((l_f&1)==0){
					if((l_f&2)!=0){
						var l_k=gml_node_number(l_d,0,undefined);
						if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_env1d_aop(l_d,l_s3,l_k,l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_env1d_set(l_d,l_s3,l_k,l_v));
					} else if(l_o!=-1){
						gml_std_haxe_enum_tools_set(l_q,gml_node_env_aop(l_d,l_s3,l_o,l_v));
					} else gml_std_haxe_enum_tools_set(l_q,gml_node_env_set(l_d,l_s3,l_v));
				} else return gml_program_error(g_gml_program_seek_inst,"`"+l_s3+"` is read-only",l__g[1]);
				break;
			case 43:
				var l_s4=l__g[3];
				if((g_gml_var_flags[?l_s4]&1)==0){
					if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_env_fd_aop(l_d,l__g[2],l_s4,l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_env_fd_set(l_d,l__g[2],l_s4,l_v));
				} else return gml_program_error(g_gml_program_seek_inst,"`"+l_s4+"` is read-only",l__g[1]);
				break;
			case 46:
				var l_s5=l__g[2];
				if((g_gml_var_flags[?l_s5]&1)==0){
					if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_env1d_aop(l_d,l_s5,l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_env1d_set(l_d,l_s5,l__g[3],l_v));
				} else return gml_program_error(g_gml_program_seek_inst,"`"+l_s5+"` is read-only",l__g[1]);
				break;
			case 49:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_alarm_aop(l_d,l__g[2],l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_alarm_set(l_d,l__g[2],l__g[3],l_v));break;
			case 52:
				var l_xw=l__g[2];
				var l_xd3=l__g[1];
				switch(l_x[0]){
					case 52:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_index_aop(l_xd3,l_xw,l_x[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_index_set(l_xd3,l_xw,l_x[3],l_v));break;
					case 57:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_index2d_aop(l_xd3,l_xw,l_x[3],l_x[4],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_index2d_set(l_xd3,l_xw,l_x[3],l_x[4],l_v));break;
				}
				g_gml_seek_set_op_resolve_set_op_safe=false;
				g_gml_seek_set_op_resolve_set_op_xw=l_xw;
				gml_node_seek_all_out(l_q,l_st,live_script_get_index("gml_seek_set_op_resolve_set_op_rfn"),0);
				if(!g_gml_seek_set_op_resolve_set_op_safe)gml_std_haxe_enum_tools_set(l_q,gml_node_block(l_xd3,[gml_node_ensure_array(l_xd3,gml_node_clone(l_xw)),gml_node_clone(l_q)]));
				break;
			case 57:
				var l_xw1=l__g[2];
				var l_xd4=l__g[1];
				switch(l_x[0]){
					case 52:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_index_aop(l_xd4,l_xw1,l_x[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_index_set(l_xd4,l_xw1,l_x[3],l_v));break;
					case 57:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_index2d_aop(l_xd4,l_xw1,l_x[3],l_x[4],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_index2d_set(l_xd4,l_xw1,l_x[3],l_x[4],l_v));break;
				}
				g_gml_seek_set_op_resolve_set_op_safe=false;
				g_gml_seek_set_op_resolve_set_op_xw=l_xw1;
				gml_node_seek_all_out(l_q,l_st,live_script_get_index("gml_seek_set_op_resolve_set_op_rfn"),0);
				if(!g_gml_seek_set_op_resolve_set_op_safe)gml_std_haxe_enum_tools_set(l_q,gml_node_block(l_xd4,[gml_node_ensure_array(l_xd4,gml_node_clone(l_xw1)),gml_node_clone(l_q)]));
				break;
			case 62:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_raw_id_aop(l_d,l__g[2],l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_raw_id_set(l_d,l__g[2],l__g[3],l_v));break;
			case 67:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_raw_id2d_aop(l_d,l__g[2],l__g[3],l__g[4],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_raw_id2d_set(l_d,l__g[2],l__g[3],l__g[4],l_v));break;
			case 72:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_ds_list_aop(l_d,l__g[2],l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_ds_list_set(l_d,l__g[2],l__g[3],l_v));break;
			case 77:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_ds_map_aop(l_d,l__g[2],l__g[3],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_ds_map_set(l_d,l__g[2],l__g[3],l_v));break;
			case 82:if(l_o!=-1)gml_std_haxe_enum_tools_set(l_q,gml_node_ds_grid_aop(l_d,l__g[2],l__g[3],l__g[4],l_o,l_v)); else gml_std_haxe_enum_tools_set(l_q,gml_node_ds_grid_set(l_d,l__g[2],l__g[3],l__g[4],l_v));break;
			default:return gml_program_error(g_gml_program_seek_inst,"Expression is not settable",l_x[1]);
		}
	}
	return gml_node_seek(l_q,l_st,g_gml_program_seek_func);
} else return false;

#define live_bug24929_init
/// live_bug24929_init()->Dictionary<Script>
if (live_enabled) {
	var l_map=ds_map_create();
	for(var l_i=0;script_exists(l_i);l_i+=1){
		l_map[?script_get_name(l_i)]=l_i;
	}
	return l_map;
} else return undefined;

#define live_script_get_index
/// live_script_get_index(name:string)->Script
var l_name=argument[0];
if (live_enabled) {
	var l_q=g_live_bug24929_map[?l_name];
	if(l_q==undefined)return -1;
	return l_q;
} else return undefined;

#define live_log_impl
/// live_log_impl(v:string)
var l_v=argument[0];
if (live_enabled) {
	show_debug_message(l_v);
}

#define live_log
/// live_log(s:string)
var l_s=argument[0];
if (live_enabled) {
	script_execute(g_live_log_script,"[live]["+date_time_string(date_current_datetime())+"] "+l_s);
}

#define live_call_impl
/// live_call_impl(fn:function[]:GmlValueList, def:Any)->bool
var l_fn=argument[0],l_def=argument[1];
if (live_enabled) {
	if(g_live_request_guid==undefined)return false;
	var l_stack=debug_get_callstack();
	var l_origin=l_stack[1];
	var l_data=g_live_live_map[?l_origin];
	if(l_data==undefined){
		var l_co=string_pos(":",l_origin)+-1;
		if(l_co>=0){
			l_data=g_live_live_map[?string_copy(l_origin,1,l_co)];
			if(l_data!=undefined)g_live_live_map[?l_origin]=l_data;
		}
	}
	if(l_data==undefined)return false;
	var l_pg=l_data[0];
	if(l_pg==undefined)return false;
	var l_name=l_pg[13];
	var l_args1=script_execute(l_fn);
	var l_th;
	if(ds_map_exists(l_pg[2],l_name)){
		var l_scr=ds_map_find_value(l_pg[2],l_name);
		var l_th1=gml_thread_create(l_pg,l_scr[9],l_args1,array_create(l_scr[6]));
		l_th1[@3]=l_pg[8];
		l_th1[@6]=l_pg[9];
		gml_thread_exec(l_th1);
		l_th=l_th1;
	} else l_th=undefined;
	if(l_th[2]==gml_thread_status_done){
		g_live_result=l_th[1];
		return true;
	} else if(l_th[2]==gml_thread_status_error){
		g_live_result=l_def;
		live_log("Runtime error: "+gml_thread_get_error(l_th));
		return true;
	} else return false;
} else return false;

#define live_call
/// live_call(...args1:Any)->bool
if (live_enabled) {
	if(g_live_request_guid==undefined){
		return false;
	} else {
		var l_stack=debug_get_callstack();
		var l_origin=l_stack[1];
		var l_data=g_live_live_map[?l_origin];
		if(l_data==undefined){
			var l_co=string_pos(":",l_origin)+-1;
			if(l_co>=0){
				l_data=g_live_live_map[?string_copy(l_origin,1,l_co)];
				if(l_data!=undefined)g_live_live_map[?l_origin]=l_data;
			}
		}
		if(l_data==undefined){
			return false;
		} else {
			var l_pg=l_data[0];
			if(l_pg==undefined){
				return false;
			} else {
				var l_name=l_pg[13];
				var l_argc=argument_count;
				var l_vals=array_create(l_argc);
				while(--l_argc>=0){
					l_vals[@l_argc]=argument[l_argc];
				}
				var l_args2=l_vals;
				var l_th;
				if(ds_map_exists(l_pg[2],l_name)){
					var l_scr=ds_map_find_value(l_pg[2],l_name);
					var l_th1=gml_thread_create(l_pg,l_scr[9],l_args2,array_create(l_scr[6]));
					l_th1[@3]=l_pg[8];
					l_th1[@6]=l_pg[9];
					gml_thread_exec(l_th1);
					l_th=l_th1;
				} else l_th=undefined;
				if(l_th[2]==gml_thread_status_done){
					g_live_result=l_th[1];
					return true;
				} else if(l_th[2]==gml_thread_status_error){
					g_live_result=0;
					live_log("Runtime error: "+gml_thread_get_error(l_th));
					return true;
				} else return false;
			}
		}
	}
} else return false;

#define live_defcall
/// live_defcall(...args1:Any)->bool
if (live_enabled) {
	var l_argc=argument_count-1;
	var l_def=argument[l_argc];
	if(g_live_request_guid==undefined){
		return false;
	} else {
		var l_stack=debug_get_callstack();
		var l_origin=l_stack[1];
		var l_data=g_live_live_map[?l_origin];
		if(l_data==undefined){
			var l_co=string_pos(":",l_origin)+-1;
			if(l_co>=0){
				l_data=g_live_live_map[?string_copy(l_origin,1,l_co)];
				if(l_data!=undefined)g_live_live_map[?l_origin]=l_data;
			}
		}
		if(l_data==undefined){
			return false;
		} else {
			var l_pg=l_data[0];
			if(l_pg==undefined){
				return false;
			} else {
				var l_name=l_pg[13];
				var l_vals=array_create(l_argc);
				while(--l_argc>=0){
					l_vals[@l_argc]=argument[l_argc];
				}
				var l_args2=l_vals;
				var l_th;
				if(ds_map_exists(l_pg[2],l_name)){
					var l_scr=ds_map_find_value(l_pg[2],l_name);
					var l_th1=gml_thread_create(l_pg,l_scr[9],l_args2,array_create(l_scr[6]));
					l_th1[@3]=l_pg[8];
					l_th1[@6]=l_pg[9];
					gml_thread_exec(l_th1);
					l_th=l_th1;
				} else l_th=undefined;
				if(l_th[2]==gml_thread_status_done){
					g_live_result=l_th[1];
					return true;
				} else if(l_th[2]==gml_thread_status_error){
					g_live_result=l_def;
					live_log("Runtime error: "+gml_thread_get_error(l_th));
					return true;
				} else return false;
			}
		}
	}
} else return false;

#define live_call_ext
/// live_call_ext(args1:array<Any>)->bool
var l_args1=argument[0];
if (live_enabled) {
	if(g_live_request_guid==undefined){
		return false;
	} else {
		var l_stack=debug_get_callstack();
		var l_origin=l_stack[1];
		var l_data=g_live_live_map[?l_origin];
		if(l_data==undefined){
			var l_co=string_pos(":",l_origin)+-1;
			if(l_co>=0){
				l_data=g_live_live_map[?string_copy(l_origin,1,l_co)];
				if(l_data!=undefined)g_live_live_map[?l_origin]=l_data;
			}
		}
		if(l_data==undefined){
			return false;
		} else {
			var l_pg=l_data[0];
			if(l_pg==undefined){
				return false;
			} else {
				var l_name=l_pg[13];
				var l_args2=gml_value_list_copy(l_args1);
				var l_th;
				if(ds_map_exists(l_pg[2],l_name)){
					var l_scr=ds_map_find_value(l_pg[2],l_name);
					var l_th1=gml_thread_create(l_pg,l_scr[9],l_args2,array_create(l_scr[6]));
					l_th1[@3]=l_pg[8];
					l_th1[@6]=l_pg[9];
					gml_thread_exec(l_th1);
					l_th=l_th1;
				} else l_th=undefined;
				if(l_th[2]==gml_thread_status_done){
					g_live_result=l_th[1];
					return true;
				} else if(l_th[2]==gml_thread_status_error){
					g_live_result=0;
					live_log("Runtime error: "+gml_thread_get_error(l_th));
					return true;
				} else return false;
			}
		}
	}
} else return false;

#define live_defcall_ext
/// live_defcall_ext(args1:array<Any>, def:Any)->bool
var l_args1=argument[0],l_def=argument[1];
if (live_enabled) {
	if(g_live_request_guid==undefined){
		return false;
	} else {
		var l_stack=debug_get_callstack();
		var l_origin=l_stack[1];
		var l_data=g_live_live_map[?l_origin];
		if(l_data==undefined){
			var l_co=string_pos(":",l_origin)+-1;
			if(l_co>=0){
				l_data=g_live_live_map[?string_copy(l_origin,1,l_co)];
				if(l_data!=undefined)g_live_live_map[?l_origin]=l_data;
			}
		}
		if(l_data==undefined){
			return false;
		} else {
			var l_pg=l_data[0];
			if(l_pg==undefined){
				return false;
			} else {
				var l_name=l_pg[13];
				var l_args2=gml_value_list_copy(l_args1);
				var l_th;
				if(ds_map_exists(l_pg[2],l_name)){
					var l_scr=ds_map_find_value(l_pg[2],l_name);
					var l_th1=gml_thread_create(l_pg,l_scr[9],l_args2,array_create(l_scr[6]));
					l_th1[@3]=l_pg[8];
					l_th1[@6]=l_pg[9];
					gml_thread_exec(l_th1);
					l_th=l_th1;
				} else l_th=undefined;
				if(l_th[2]==gml_thread_status_done){
					g_live_result=l_th[1];
					return true;
				} else if(l_th[2]==gml_thread_status_error){
					g_live_result=l_def;
					live_log("Runtime error: "+gml_thread_get_error(l_th));
					return true;
				} else return false;
			}
		}
	}
} else return false;

#define live_execute_string
/// live_execute_string(gml_code:string)->bool
var l_gml_code=argument[0];
if (live_enabled) {
	var l_pg=gml_program_create([gml_source_create("execute_string",l_gml_code,"execute_string")]);
	var l_ok;
	if(l_pg[10]==undefined){
		var l_args1=array_create(0);
		var l_th;
		if(ds_map_exists(l_pg[2],"execute_string")){
			var l_scr=ds_map_find_value(l_pg[2],"execute_string");
			var l_locals=array_create(l_scr[6]);
			l_args1=gml_value_list_copy(l_args1);
			var l_th1=gml_thread_create(l_pg,l_scr[9],l_args1,l_locals);
			l_th1[@3]=l_pg[8];
			l_th1[@6]=l_pg[9];
			gml_thread_exec(l_th1);
			l_th=l_th1;
		} else l_th=undefined;
		if(l_th[2]==3){
			l_ok=true;
			g_live_result=l_th[1];
		} else {
			l_ok=false;
			g_live_result=l_th[7];
			if(g_live_result==undefined)g_live_result="(unknown error)";
		}
	} else {
		l_ok=false;
		g_live_result=l_pg[10];
	}
	gml_program_destroy(l_pg);
	return l_ok;
} else return false;

#define live_update
/// live_update()
if (live_enabled) {
	if(g_live_request_url==undefined)return 0;
	if(g_live_request_id==undefined){
		var l_now=current_time;
		if(l_now>g_live_request_time){
			g_live_request_time=l_now+g_live_request_rate*1000;
			if(g_live_request_guid==undefined)g_live_request_id=http_get(g_live_request_url+"/init?password="+g_live_request_password+"&config="+os_get_config()); else g_live_request_id=http_get(g_live_request_url+"/update?guid="+string(g_live_request_guid));
		}
	}
}

#define live_async_http_0
/// live_async_http_0(map:Dictionary<dynamic>)
var l_map=argument[0];
if (live_enabled) {
	var l_i,l_n,l_s,l_list,l_srcMap;
	g_live_is_ready=true;
	g_live_request_guid=l_map[?"guid"];
	l_list=l_map[?"shaders"];
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i+=1){
		l_s=l_list[|l_i];
		gml_asset_add(l_s,asset_get_index(l_s));
	}
	l_list=l_map[?"scripts"];
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i+=2){
		var l_scrName=l_list[|l_i];
		var l_scrFunc=live_script_get_index(l_scrName);
		gml_func_add(l_list[|l_i+1],l_scrFunc);
		g_gml_func_script_id[?l_scrName]=l_scrFunc;
	}
	var l_buf=buffer_create(1024,1,1);
	l_list=l_map[?"globals"];
	l_n=ds_list_size(l_list);
	if(l_n>0){
		buffer_seek(l_buf,0,0);
		buffer_write(l_buf,buffer_text,"globalvar ");
		buffer_write(l_buf,buffer_text,l_list[|0]);
		for(l_i=1;l_i<l_n;l_i+=1){
			buffer_write(l_buf,buffer_text,", ");
			buffer_write(l_buf,buffer_text,l_list[|l_i]);
		}
		buffer_write(l_buf,buffer_string,";");
		buffer_seek(l_buf,0,0);
		g_live_live_globals=gml_source_create("globalvar",buffer_read(l_buf,buffer_string),"globalvar",true);
	} else g_live_live_globals=undefined;
	buffer_delete(l_buf);
	l_srcMap=g_live_live_macros;
	ds_map_clear(l_srcMap);
	l_list=l_map[?"macros"];
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i+=2){
		l_s=l_list[|l_i];
		var l_s1="macro:"+l_s;
		l_srcMap[?l_s]=gml_source_create(l_s1,"#macro "+l_s+" "+string(l_list[|l_i+1]),l_s1,true);
	}
	l_srcMap=g_live_live_enums;
	ds_map_clear(l_srcMap);
	l_list=l_map[?"enums"];
	l_n=ds_list_size(l_list);
	for(l_i=0;l_i<l_n;l_i+=1){
		l_s=l_list[|l_i];
		l_s=gml_std_string_trim(string_delete(string_copy(l_s,1,string_pos("{",l_s)+-1),1,4));
		l_srcMap[?l_s]=gml_source_create("enum "+l_s,l_list[|l_i],"enum "+l_s,true);
	}
	live_log("Ready!");
}

#define live_async_http_1
/// live_async_http_1(map:Dictionary<dynamic>)
var l_map=argument[0];
if (live_enabled) {
	var l_list=l_map[?"files"];
	var l_found=g_live_async_http_1_found;
	var l_macros=g_live_live_macros;
	var l_enums=g_live_live_enums;
	var l_acc=g_live_async_http_1_acc;
	var l_n=ds_list_size(l_list);
	var l_i=-1;
	while(++l_i<l_n){
		var l_fmap=l_list[|l_i];
		var l_ident=l_fmap[?"ident"];
		var l_code=l_fmap[?"code"];
		var l_name=l_fmap[?"name"];
		var l_data=g_live_live_map[?l_ident];
		if(l_data==undefined){
			l_data=undefined;
			l_data[1,0] = "LiveData";
			l_data[1]=l_ident;
			l_data[0]=undefined;
			g_live_live_map[?l_ident]=l_data;
		}
		var l_source=gml_source_create(l_name,l_code,l_name);
		var l_tokens=gml_parser_run(l_source);
		if(l_tokens==undefined){
			live_log("Error in "+l_name+":");
			live_log(g_gml_parser_error_text);
			continue;
		}
		ds_map_clear(l_found);
		ds_list_clear(l_acc);
		if(g_live_live_globals!=undefined)ds_list_add(l_acc,g_live_live_globals);
		l_source[@5]=l_tokens;
		var l_tokensLen=array_length_1d(l_tokens);
		var l_tokensLen1=l_tokensLen-1;
		var l_tokensPos=-1;
		while(++l_tokensPos<l_tokensLen){
			var l_tk=l_tokens[l_tokensPos];
			var l_id;
			if(l_tk[0]==10)l_id=l_tk[2]; else continue;
			if(ds_map_exists(l_found,l_id))continue;
			var l_src=l_macros[?l_id];
			if(l_src!=undefined){
				ds_list_add(l_acc,l_src);
				l_found[?l_id]=true;
				continue;
			}
			l_src=l_enums[?l_id];
			if(l_src!=undefined){
				if(l_tokensPos>0){
					if(gml_std_array_wget(l_tokens[l_tokensPos-1],0)==5)continue;
				}
				if(l_tokensPos<l_tokensLen1){
					if(gml_std_array_wget(l_tokens[l_tokensPos+1],0)!=5)continue;
				}
				ds_list_add(l_acc,l_src);
				l_found[?l_id]=true;
				continue;
			}
			l_found[?l_id]=true;
		}
		ds_list_add(l_acc,l_source);
		var l_srci=ds_list_size(l_acc);
		var l_srcs=array_create(l_srci);
		while(--l_srci>=0){
			l_srcs[@l_srci]=l_acc[|l_srci];
		}
		var l_pg=gml_program_create(l_srcs);
		if(!l_pg[12]){
			live_log("Error in "+l_name+":");
			live_log(l_pg[10]);
			gml_program_destroy(l_pg);
			continue;
		}
		if(l_pg[10]!=undefined){
			live_log("Warning in "+l_name+":");
			live_log(l_pg[10]);
		}
		l_pg[@13]=l_name;
		live_log("Reloaded "+l_name+".");
		if(l_data[0]!=undefined)gml_program_destroy(l_data[0]);
		l_data[@0]=l_pg;
	}
}

#define live_async_http
/// live_async_http()
if (live_enabled) {
	var l_e=async_load;
	if(l_e[?"id"]!=g_live_request_id)return 0;
	if(l_e[?"status"]>0)return 0;
	g_live_request_id=undefined;
	if(l_e[?"status"]<0||l_e[?"result"]==undefined)return 0;
	var l_map=json_decode(l_e[?"result"]);
	if(l_map==-1||ds_map_exists(l_map,"default"))return 0;
	var l_list,l_i,l_n,l_s,l_srcs;
	if(g_live_request_guid==undefined)live_async_http_0(l_map);
	live_async_http_1(l_map);
	ds_map_destroy(l_map);
}

#define live_init
/// live_init(updateRate:real, url:string, password:string)
var l_updateRate=argument[0],l_url=argument[1],l_password=argument[2];
if (live_enabled) {
	var l_url_last=string_length(l_url)-1;
	if(string_ord_at(l_url,l_url_last+1)==47)l_url=string_copy(l_url,1,l_url_last);
	live_log("Initializing...");
	g_live_request_rate=l_updateRate;
	g_live_request_url=l_url;
	g_live_request_password=l_password;
	live_log("Indexing assets...");
	var l_s;
	for(var l_i=0;sprite_exists(l_i);l_i+=1){
		gml_asset_add(sprite_get_name(l_i),l_i);
	}
	for(l_i=0;font_exists(l_i);l_i+=1){
		gml_asset_add(font_get_name(l_i),l_i);
	}
	for(l_i=0;object_exists(l_i);l_i+=1){
		gml_asset_add(object_get_name(l_i),l_i);
	}
	for(l_i=0;audio_exists(l_i);l_i+=1){
		gml_asset_add(audio_get_name(l_i),l_i);
	}
	for(l_i=0;room_exists(l_i);l_i+=1){
		gml_asset_add(room_get_name(l_i),l_i);
	}
	for(l_i=0;path_exists(l_i);l_i+=1){
		gml_asset_add(path_get_name(l_i),l_i);
	}
	for(l_i=0;l_i<256;l_i+=1){
		l_s=audio_group_name(l_i);
		if(l_s=="<undefined>"||l_s==""||l_s==undefined)break;
		gml_asset_add(l_s,l_i);
	}
}

#define live_preinit_project_fake_call
/// live_preinit_project_fake_call()->bool
if (live_enabled) {
	return false;
} else return false;

#define live_preinit_project
/// live_preinit_project()
if (live_enabled) {
	gml_func_add("live_call(...):",live_script_get_index("live_preinit_project_fake_call"));
	gml_func_add("live_defcall(...):",live_script_get_index("live_preinit_project_fake_call"));
	gml_func_add("live_call_ext(...):",live_script_get_index("live_preinit_project_fake_call"));
	gml_func_add("live_defcall_ext(...):",live_script_get_index("live_preinit_project_fake_call"));
	gml_func_add("live_execute_string(:string):",live_script_get_index("live_execute_string"));
}

#define gml_link_copy
/// gml_link_copy(v:link<T>)->link<T>
var l_v=argument[0];
if (live_enabled) {
	if(l_v==undefined)return undefined;
	var l_r=gml_link_create(l_v[0],undefined);
	l_v=l_v[1];
	var l_q;
	for(var l_p=l_r;l_v!=undefined;l_p=l_q){
		l_q=gml_link_create(l_v[0],undefined);
		l_p[@1]=l_q;
		l_v=l_v[1];
	}
	return l_r;
} else return undefined;

#define gml_link_create
/// gml_link_create(value:T, next:link<T>)
var this;this[1]=0;
var l_value=argument[0],l_next=argument[1];
if (live_enabled) {
	this[@0]=l_value;
	this[@1]=l_next;
}
return this;

#define gml_action_discard
/// gml_action_discard(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=0;
return this;

#define gml_action_dup
/// gml_action_dup(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=1;
return this;

#define gml_action_dup2x
/// gml_action_dup2x(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=2;
return this;

#define gml_action_dup_in
/// gml_action_dup_in(d:pos, z:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=3;
return this;

#define gml_action_undefined
/// gml_action_undefined(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=4;
return this;

#define gml_action_number
/// gml_action_number(d:pos, f:real)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=5;
return this;

#define gml_action_cstring
/// gml_action_cstring(d:pos, s:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=6;
return this;

#define gml_action_array_decl
/// gml_action_array_decl(d:pos, size:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=7;
return this;

#define gml_action_object_decl
/// gml_action_object_decl(d:pos, keys:array<string>, sig:string)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=8;
return this;

#define gml_action_const
/// gml_action_const(d:pos, v:GmlValue)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=9;
return this;

#define gml_action_self
/// gml_action_self(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=10;
return this;

#define gml_action_other
/// gml_action_other(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=11;
return this;

#define gml_action_local
/// gml_action_local(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=12;
return this;

#define gml_action_local_set
/// gml_action_local_set(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=13;
return this;

#define gml_action_local_aop
/// gml_action_local_aop(d:pos, o:GmlOp, i:int)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=14;
return this;

#define gml_action_global
/// gml_action_global(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=15;
return this;

#define gml_action_global_set
/// gml_action_global_set(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=16;
return this;

#define gml_action_global_aop
/// gml_action_global_aop(d:pos, o:GmlOp, fd:string)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=17;
return this;

#define gml_action_field
/// gml_action_field(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=18;
return this;

#define gml_action_field_set
/// gml_action_field_set(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=19;
return this;

#define gml_action_field_aop
/// gml_action_field_aop(d:pos, o:GmlOp, fd:string)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=20;
return this;

#define gml_action_index
/// gml_action_index(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=21;
return this;

#define gml_action_index_set
/// gml_action_index_set(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=22;
return this;

#define gml_action_index_aop
/// gml_action_index_aop(d:pos, o:GmlOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=23;
return this;

#define gml_action_index2d
/// gml_action_index2d(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=24;
return this;

#define gml_action_index2d_set
/// gml_action_index2d_set(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=25;
return this;

#define gml_action_index2d_aop
/// gml_action_index2d_aop(d:pos, o:GmlOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=26;
return this;

#define gml_action_env
/// gml_action_env(d:pos, f:dynamic)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=27;
return this;

#define gml_action_env_set
/// gml_action_env_set(d:pos, f:dynamic, ch:GmlTypeCheck)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=28;
return this;

#define gml_action_env_aop
/// gml_action_env_aop(d:pos, o:GmlOp, f:dynamic)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=29;
return this;

#define gml_action_env1d
/// gml_action_env1d(d:pos, f:dynamic)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=30;
return this;

#define gml_action_env1d_set
/// gml_action_env1d_set(d:pos, f:dynamic, ch:GmlTypeCheck)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=31;
return this;

#define gml_action_env1d_aop
/// gml_action_env1d_aop(d:pos, o:GmlOp, f:dynamic)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=32;
return this;

#define gml_action_ds_aop
/// gml_action_ds_aop(d:pos, o:GmlOp, argc:int, get:dynamic, set:dynamic, out:bool)
var this;
this[1,0]=mt_gml_action;
this[6]=argument[5];
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=33;
return this;

#define gml_action_arg_const
/// gml_action_arg_const(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=34;
return this;

#define gml_action_arg_const_set
/// gml_action_arg_const_set(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=35;
return this;

#define gml_action_arg_const_aop
/// gml_action_arg_const_aop(d:pos, o:GmlOp, i:int)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=36;
return this;

#define gml_action_arg_index
/// gml_action_arg_index(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=37;
return this;

#define gml_action_arg_index_set
/// gml_action_arg_index_set(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=38;
return this;

#define gml_action_arg_index_aop
/// gml_action_arg_index_aop(d:pos, o:GmlOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=39;
return this;

#define gml_action_arg_count
/// gml_action_arg_count(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=40;
return this;

#define gml_action_add_int
/// gml_action_add_int(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=41;
return this;

#define gml_action_equ_op
/// gml_action_equ_op(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=42;
return this;

#define gml_action_neq_op
/// gml_action_neq_op(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=43;
return this;

#define gml_action_add_op
/// gml_action_add_op(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=44;
return this;

#define gml_action_concat
/// gml_action_concat(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=45;
return this;

#define gml_action_bin_op
/// gml_action_bin_op(d:pos, o:GmlOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=46;
return this;

#define gml_action_un_op
/// gml_action_un_op(d:pos, o:GmlUnOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=47;
return this;

#define gml_action_in
/// gml_action_in(d:pos, not:bool)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=48;
return this;

#define gml_action_call_script
/// gml_action_call_script(d:pos, script:script, argc:int)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=49;
return this;

#define gml_action_call_script_at
/// gml_action_call_script_at(d:pos, script:script, argc:int)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=50;
return this;

#define gml_action_call_func
/// gml_action_call_func(d:pos, func:dynamic, argc:int, args:array<GmlTypeCheck>, rest:GmlTypeCheck, inst:bool, out:bool)
var this;
this[1,0]=mt_gml_action;
this[7]=argument[6];
this[6]=argument[5];
this[5]=argument[4];
this[4]=argument[3];
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=51;
return this;

#define gml_action_jump
/// gml_action_jump(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=52;
return this;

#define gml_action_jump_if
/// gml_action_jump_if(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=53;
return this;

#define gml_action_jump_unless
/// gml_action_jump_unless(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=54;
return this;

#define gml_action_bool_and
/// gml_action_bool_and(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=55;
return this;

#define gml_action_bool_or
/// gml_action_bool_or(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=56;
return this;

#define gml_action_switch
/// gml_action_switch(d:pos, jumptable:GmlValueMap<int>, p:int)
var this;
this[1,0]=mt_gml_action;
this[3]=argument[2];
this[2]=argument[1];
this[1]=argument[0];
this[0]=57;
return this;

#define gml_action_repeat_jump
/// gml_action_repeat_jump(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=58;
return this;

#define gml_action_repeat_pre
/// gml_action_repeat_pre(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=59;
return this;

#define gml_action_with_pre
/// gml_action_with_pre(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=60;
return this;

#define gml_action_with_next
/// gml_action_with_next(d:pos, p:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=61;
return this;

#define gml_action_with_post
/// gml_action_with_post(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=62;
return this;

#define gml_action_break
/// gml_action_break(d:pos, lp:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=63;
return this;

#define gml_action_continue
/// gml_action_continue(d:pos, lp:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=64;
return this;

#define gml_action_return
/// gml_action_return(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=65;
return this;

#define gml_action_result
/// gml_action_result(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=66;
return this;

#define gml_action_wait
/// gml_action_wait(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=67;
return this;

#define gml_action_fork
/// gml_action_fork(d:pos, out:bool)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=68;
return this;

#define gml_action_ensure_array_local
/// gml_action_ensure_array_local(d:pos, i:int)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=69;
return this;

#define gml_action_ensure_array_global
/// gml_action_ensure_array_global(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=70;
return this;

#define gml_action_ensure_array_field
/// gml_action_ensure_array_field(d:pos, fd:string)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=71;
return this;

#define gml_action_alarm
/// gml_action_alarm(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=72;
return this;

#define gml_action_alarm_set
/// gml_action_alarm_set(d:pos)
var this;
this[1,0]=mt_gml_action;
this[1]=argument[0];
this[0]=73;
return this;

#define gml_action_alarm_aop
/// gml_action_alarm_aop(d:pos, op:GmlOp)
var this;
this[1,0]=mt_gml_action;
this[2]=argument[1];
this[1]=argument[0];
this[0]=74;
return this;

#define gml_action_list_print
/// gml_action_list_print(this1:ds_list<action>)->string
var l_this1=argument[0];
if (live_enabled) {
	var l_r="";
	var l_i=0;
	for(var l__g=ds_list_size(l_this1);l_i<l__g;l_i+=1){
		var l_act=l_this1[|l_i];
		if(l_i>0)l_r+="\n";
		l_r+=string(l_i)+"\t"+gml_std_haxe_type_tools_enum_ctr(l_act);
		var l_argc=array_length_1d(l_act)-1;
		if(l_argc>1){
			l_r+="(";
			var l_k=1;
			for(var l__g2=l_argc;l_k<l__g2;l_k+=1){
				if(l_k>1)l_r+=", ";
				var l_v=l_act[l_k+1];
				if(is_real(l_v)){
					l_r+=string(l_v);
				} else if(is_string(l_v)){
					l_r+="\""+l_v+"\"";
				} else if(l_v==undefined){
					l_r+="null";
				} else l_r+=gml_value_print_rec(l_v,0);
			}
			l_r+=")";
		}
	}
	return l_r;
} else return undefined;

#define gml_object_init
/// gml_object_init()->array<Map<string; function[ :bool :GmlValue]:GmlValue>>
if (live_enabled) {
	var l_n=0;
	var l_i;
	while(object_exists(l_n)){
		l_n+=1;
	}
	var l_fields=array_create(l_n);
	var l_children=array_create(l_n);
	var l_access=array_create(l_n);
	for(l_i=0;l_i<l_n;l_i+=1){
		l_children[@l_i]=array_create(0);
		l_access[@l_i]=-1;
		l_fields[@l_i]=ds_map_create();
	}
	for(l_i=0;l_i<l_n;l_i+=1){
		var l_obj=l_i;
		for(var l_par=object_get_parent(l_obj);object_exists(l_par);l_par=object_get_parent(l_par)){
			gml_std_array_push(l_children[l_par],l_obj);
		}
	}
	g_gml_object_children=l_children;
	g_gml_object_access=l_access;
	return l_fields;
} else return undefined;

#define gml_object_field
/// gml_object_field(object1:object, field:string, func:function[ :bool :GmlValue]:GmlValue)
var l_object1=argument[0],l_field=argument[1],l_func=argument[2];
if (live_enabled) {
	ds_map_set(g_gml_object_fields[l_object1],l_field,l_func);
	var l_children=g_gml_object_children[l_object1];
	var l_i=0;
	for(var l__g=array_length_1d(l_children);l_i<l__g;l_i+=1){
		ds_map_set(g_gml_object_fields[l_children[l_i]],l_field,l_func);
	}
}

#define gml_object_setup
/// gml_object_setup(object1:object, access:int)
var l_object1=argument[0],l_access=argument[1];
if (live_enabled) {
	var l_acc=g_gml_object_access;
	l_acc[@l_object1]=l_access;
	var l_children=g_gml_object_children[l_object1];
	var l_i=0;
	for(var l__g=array_length_1d(l_children);l_i<l__g;l_i+=1){
		l_acc[@l_children[l_i]]=l_access;
	}
}

#define gml_func_scope_create
/// gml_func_scope_create(actions:GmlActionList, offset:int, args1:GmlValueList, locals:GmlValueList, self1:GmlValue, other1:GmlValue, next:func_scope)
var this=mq_gml_func_scope;
this[1,0]=mt_gml_func_scope;
var l_actions=argument[0],l_offset=argument[1],l_args1=argument[2],l_locals=argument[3],l_self1=argument[4],l_other1=argument[5],l_next=argument[6];
if (live_enabled) {
	this[@7]=undefined;
	this[@6]=undefined;
	this[@5]=undefined;
	this[@4]=undefined;
	this[@0]=l_actions;
	this[@1]=l_offset;
	this[@2]=l_args1;
	this[@3]=l_locals;
	this[@5]=gml_link_create(l_self1,gml_link_create(l_other1,undefined));
	this[@8]=l_next;
}
return this;

#define gml_thread_error
/// gml_thread_error(text:string)
var l_text=argument[0];
if (live_enabled) {
	g_gml_thread_current[@7]=l_text;
	g_gml_thread_current[@2]=gml_thread_status_error;
}

#define gml_thread_create
/// gml_thread_create(program:program, actions:GmlActionList, args1:GmlValueList, locals:GmlValueList, ?self1:GmlValue, ?other1:GmlValue, offset:int = 0)
var this;this[8]=0;
this[3]=undefined;
var l_program=argument[0],l_actions=argument[1],l_args1=argument[2],l_locals=argument[3],l_self1,l_other1,l_offset;
if(argument_count>4)l_self1=argument[4];else l_self1=undefined;
if(argument_count>5)l_other1=argument[5];else l_other1=undefined;
if(argument_count>6)l_offset=argument[6];else l_offset=0;
if (live_enabled) {
	this[@8]=undefined;
	this[@7]=undefined;
	this[@6]=undefined;
	this[@3]=undefined;
	this[@2]=gml_thread_status_none;
	this[@1]=undefined;
	this[@0]=l_program;
	if(l_self1==undefined)l_self1=self.id;
	if(l_other1==undefined)l_other1=other.id;
	this[@4]=gml_func_scope_create(l_actions,l_offset,l_args1,l_locals,l_self1,l_other1,undefined);
}
return this;

#define gml_thread_get_error
/// gml_thread_get_error(this:thread)->string
var this=argument[0];
if (live_enabled) {
	return this[7];
} else return undefined;

#define gml_thread_get_error_ptr
/// gml_thread_get_error_ptr(this:thread)->string
var this=argument[0];
if (live_enabled) {
	if(this[8]!=undefined)return gml_pos_to_string(this[8]); else return "?";
} else return undefined;

#define gml_thread_proc_error
/// gml_thread_proc_error(this:thread, text:string, act:action)->bool
var this=argument[0],l_text=argument[1],l_act=argument[2];
if (live_enabled) {
	var l_pos=l_act[1];
	this[@7]=gml_pos_to_string(l_pos)+" "+l_text;
	this[@8]=l_pos;
	this[@2]=gml_thread_status_error;
	return false;
} else return false;

#define gml_thread_exec
/// gml_thread_exec(this:thread)
var this=argument[0];
if (live_enabled) {
	var l__gthis=this;
	var l_previous=g_gml_thread_current;
	g_gml_thread_current=this;
	var l_yycNext="http://bugs.yoyogames.com/view.php?id=24250";
	var l_stackPtr,l_stackVal;
	var l_scope=this[4];
	var l_args1,l_locals,l_inst,l_with1,l_actions,l_pos,l_len;
	l_args1=l_scope[2];
	l_locals=l_scope[3];
	l_inst=l_scope[5];
	l_with1=l_scope[6];
	l_pos=l_scope[1];
	l_actions=l_scope[0];
	l_len=ds_list_size(l_actions);
	l_stackPtr=l_scope[4];
	var l__callback;
	this[@2]=gml_thread_status_running;
	while(true){
		var l_v1,l_v2,l_v3,l_v4,l_w1,l_w2,l_i,l_k,l_n,l_d,l_f1,l_f2,l_o,l_s,l_z,l_op,l_link,l_scr;
		var l_proc=true;
		var l_act;
		while(l_proc&&l_pos<l_len){
			l_act=l_actions[|l_pos];
			l_pos+=1;
			switch(l_act[0]){
				case 0:
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					break;
				case 1:l_stackPtr=gml_link_create(l_stackPtr[0],l_stackPtr);break;
				case 2:
					l_v1=l_stackPtr[0];
					l_v2=gml_std_array_wget(l_stackPtr[1],0);
					l_stackPtr=gml_link_create(l_v2,l_stackPtr);
					l_stackPtr=gml_link_create(l_v1,l_stackPtr);
					break;
				case 3:
					l_link=l_stackPtr;
					for(l_i=l_act[2];--l_i>0;l_link=l_yycNext){
						l_yycNext=l_link[1];
					}
					l_link[@1]=gml_link_create(l_stackPtr[0],l_link[1]);
					l_link=undefined;
					break;
				case 4:l_stackPtr=gml_link_create(undefined,l_stackPtr);break;
				case 5:l_stackPtr=gml_link_create(l_act[2],l_stackPtr);break;
				case 6:l_stackPtr=gml_link_create(l_act[2],l_stackPtr);break;
				case 7:
					l_n=l_act[2];
					l_w1=array_create(l_n);
					l_i=l_n;
					while(--l_i>=0){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_w1[@l_i]=l_stackVal;
					}
					l_stackPtr=gml_link_create(l_w1,l_stackPtr);
					break;
				case 8:
					var l_keys=l_act[2];
					l_w1=gml_light_create_ext(l_keys,l_act[3]);
					l_i=array_length_1d(l_keys);
					while(--l_i>=0){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_w1[0, l_i] = l_stackVal;
					}
					l_stackPtr=gml_link_create(l_w1,l_stackPtr);
					break;
				case 9:l_stackPtr=gml_link_create(l_act[2],l_stackPtr);break;
				case 10:l_stackPtr=gml_link_create(l_inst[0],l_stackPtr);break;
				case 11:l_stackPtr=gml_link_create(gml_std_array_wget(l_inst[1],0),l_stackPtr);break;
				case 12:l_stackPtr=gml_link_create(l_locals[l_act[2]],l_stackPtr);break;
				case 13:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_locals[@l_act[2]]=l_stackVal;
					break;
				case 14:
					l_i=l_act[3];
					l_v1=l_locals[l_i];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_op=l_act[2];
					if(l_op==16){
						if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
						} else if(is_string(l_v1)){
							if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
					} else if(gml_value_is_number(l_v1)){
						if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
					l_locals[@l_i]=l_v1;
					break;
				case 15:
					l_s=l_act[2];
					if(variable_global_exists(l_s))l_stackPtr=gml_link_create(variable_global_get(l_s),l_stackPtr); else l_proc=gml_thread_proc_error(l__gthis,"Global variable `"+l_s+"` is not set.",l_act);
					break;
				case 16:
					l_s=l_act[2];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					variable_global_set(l_s,l_v1);
					break;
				case 17:
					l_op=l_act[2];
					l_s=l_act[3];
					if(variable_global_exists(l_s)){
						l_v1=variable_global_get(l_s);
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_v2=l_stackVal;
						if(l_op==16){
							if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
							} else if(is_string(l_v1)){
								if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						} else if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						variable_global_set(l_s,l_v1);
					} else l_proc=gml_thread_proc_error(l__gthis,"Global variable `"+l_s+"` is not set.",l_act);
					break;
				case 18:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_stackPtr=gml_link_create(gml_field_func(l_stackVal,l_act[2],false,undefined),l_stackPtr);
					if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 19:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					gml_field_func(l_stackVal,l_act[2],true,l_v1);
					if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 20:
					l_op=l_act[2];
					l_s=l_act[3];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_v1=gml_field_func(l_v3,l_s,false,undefined);
					if(this[2]!=gml_thread_status_error){
						if(l_op==16){
							if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
							} else if(is_string(l_v1)){
								if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						} else if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						gml_field_func(l_v3,l_s,true,l_v1);
						if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 21:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v2)){
							l_i=floor(l_v2);
							l_w1=l_v1;
							l_n=array_length_1d(l_w1);
							if(l_i>=0&&l_i<l_n)l_stackPtr=gml_link_create(l_w1[l_i],l_stackPtr); else l_proc=gml_thread_proc_error(l__gthis,"Index ("+string(l_i)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 22:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v2)){
							l_i=floor(l_v2);
							l_w1=l_v1;
							if(l_i<0){
								l_proc=gml_thread_proc_error(l__gthis,"Index ("+string(l_i)+") may not be negative",l_act);
							} else if(l_i>=32000){
								l_proc=gml_thread_proc_error(l__gthis,"Index ("+string(l_i)+") may not exceed 32000",l_act);
							} else l_w1[@l_i]=l_v3;
						} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 23:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v3)){
							l_i=floor(l_v3);
							l_w1=l_v1;
							l_n=array_length_1d(l_w1);
							if(l_i<0){
								l_proc=gml_thread_proc_error(l__gthis,"Index ("+string(l_i)+") may not be negative",l_act);
							} else if(l_i>=l_n){
								l_proc=gml_thread_proc_error(l__gthis,"Index ("+string(l_i)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act);
							} else {
								l_v1=l_w1[l_i];
								l_op=l_act[2];
								if(l_op==16){
									if(gml_value_is_number(l_v1)){
										if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
									} else if(is_string(l_v1)){
										if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
									} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
								} else if(gml_value_is_number(l_v1)){
									if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
								} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
								l_w1[@l_i]=l_v1;
							}
						} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 24:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v2)){
							l_i=floor(l_v2);
							l_n=array_height_2d(l_v1);
							if(l_i<0||l_i>=l_n){
								l_proc=gml_thread_proc_error(l__gthis,"Row index ("+string(l_i)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act);
							} else if(gml_value_is_number(l_v3)){
								l_k=floor(l_v3);
								l_n=array_length_2d(l_v1,l_i);
								if(l_k<0||l_k>=l_n)l_proc=gml_thread_proc_error(l__gthis,"Column index ("+string(l_k)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act); else l_stackPtr=gml_link_create(l_v1[l_i, l_k],l_stackPtr);
							} else l_proc=gml_thread_proc_error(l__gthis,"Column index is not a number",l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Row index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 25:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v4=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v2)){
							if(gml_value_is_number(l_v3)){
								l_i=floor(l_v2);
								l_k=floor(l_v3);
								if(l_i<0){
									l_proc=gml_thread_proc_error(l__gthis,"Row index ("+string(l_i)+") may not be negative",l_act);
								} else if(l_i>=32000){
									l_proc=gml_thread_proc_error(l__gthis,"Row index ("+string(l_i)+") may not exceed 32000",l_act);
								} else if(l_k<0){
									l_proc=gml_thread_proc_error(l__gthis,"Column index ("+string(l_k)+") may not be negative",l_act);
								} else if(l_k>=32000){
									l_proc=gml_thread_proc_error(l__gthis,"Column index ("+string(l_k)+") may not exceed 32000",l_act);
								} else l_v1[@l_i,l_k]=l_v4;
							} else l_proc=gml_thread_proc_error(l__gthis,"Column index is not a number",l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Row index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 26:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v4=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_array(l_v1)){
						if(gml_value_is_number(l_v2)){
							if(gml_value_is_number(l_v3)){
								l_w1=l_v1;
								l_i=floor(l_v2);
								l_k=floor(l_v3);
								if(l_i<0||l_i>=array_height_2d(l_w1)){
									l_n=array_height_2d(l_w1);
									l_proc=gml_thread_proc_error(l__gthis,"Row index ("+string(l_i)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act);
								} else if(l_k<0||l_k>=array_length_2d(l_w1,l_i)){
									l_n=array_length_2d(l_w1,l_i);
									l_proc=gml_thread_proc_error(l__gthis,"Column index ("+string(l_k)+") is out of bounds (0.."+string(l_n)+" excl.)",l_act);
								} else {
									l_v1=l_w1[l_i, l_k];
									l_v2=l_v4;
									l_op=l_act[2];
									if(l_op==16){
										if(gml_value_is_number(l_v1)){
											if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
										} else if(is_string(l_v1)){
											if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
										} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
									} else if(gml_value_is_number(l_v1)){
										if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
									} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
									l_w1[@l_i,l_k]=l_v1;
								}
							} else l_proc=gml_thread_proc_error(l__gthis,"Column index is not a number",l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Row index is not a number",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Variable is not an array",l_act);
					break;
				case 27:
					l_stackPtr=gml_link_create(script_execute(l_act[2],false,undefined),l_stackPtr);
					if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 28:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_s=script_execute(l_act[3],l_v1);
					if(l_s==""){
						script_execute(l_act[2],true,l_v1);
						if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Type check failure for value ("+gml_value_print_rec(l_v1,0)+"): "+l_s,l_act);
					break;
				case 29:
					l_o=l_act[3];
					l_v1=script_execute(l_o,false,undefined);
					if(this[2]!=gml_thread_status_error){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_v2=l_stackVal;
						l_op=l_act[2];
						if(l_op==16){
							if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
							} else if(is_string(l_v1)){
								if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						} else if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						if(this[2]!=gml_thread_status_error){
							script_execute(l_o,true,l_v1);
							if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
						}
					} else l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 30:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					if(gml_value_is_number(l_v3)){
						l_stackPtr=gml_link_create(script_execute(l_act[2],false,undefined,floor(l_v3)),l_stackPtr);
						if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Index "+gml_value_print_rec(l_v3,0)+" is not a number.",l_act);
					break;
				case 31:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_s=script_execute(l_act[3],l_v2);
					if(l_s==""){
						if(gml_value_is_number(l_v3)){
							script_execute(l_act[2],true,l_v2,floor(l_v3));
							if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Index "+gml_value_print_rec(l_v3,0)+" is not a number.",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Type check failure for value ("+gml_value_print_rec(l_v2,0)+"): "+l_s,l_act);
					break;
				case 32:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_o=l_act[3];
					if(gml_value_is_number(l_v3)){
						l_v1=script_execute(l_o,false,undefined,floor(l_v3));
						if(this[2]!=gml_thread_status_error){
							l_op=l_act[2];
							if(l_op==16){
								if(gml_value_is_number(l_v1)){
									if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
								} else if(is_string(l_v1)){
									if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
								} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
							} else if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
							if(this[2]!=gml_thread_status_error){
								script_execute(l_o,true,l_v1,l_v3);
								if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
							}
						} else l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Index "+gml_value_print_rec(l_v3,0)+" is not a number.",l_act);
					break;
				case 33:
					l_n=l_act[3];
					l_w1=array_create(l_n);
					l_i=l_n;
					while(--l_i>=0){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_w1[@l_i]=l_stackVal;
					}
					l_n-=1;
					l_v2=l_w1[l_n];
					l_o=l_act[4];
					l_v1=vm_gml_thread_exec_call(l_o,l_w1,l_n);
					if(this[2]!=gml_thread_status_error){
						l_op=l_act[2];
						if(l_op==16){
							if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
							} else if(is_string(l_v1)){
								if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						} else if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						l_w1[@l_n]=l_v1;
						l_n+=1;
						l_o=l_act[5];
						l_v1=vm_gml_thread_exec_call(l_o,l_w1,l_n);
						if(this[2]!=gml_thread_status_error){
							if(l_act[6])l_stackPtr=gml_link_create(l_v1,l_stackPtr);
						} else l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					break;
				case 34:
					l_i=l_act[2];
					l_n=array_length_1d(l_args1);
					if(l_i>=0&&l_i<l_n)l_stackPtr=gml_link_create(l_args1[l_i],l_stackPtr); else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					break;
				case 35:
					l_i=l_act[2];
					l_n=array_length_1d(l_args1);
					if(l_i>=0&&l_i<l_n){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_args1[@l_i]=l_stackVal;
					} else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					break;
				case 36:
					l_i=l_act[3];
					l_n=array_length_1d(l_args1);
					if(l_i>=0&&l_i<l_n){
						l_v1=l_args1[l_i];
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_v2=l_stackVal;
						l_op=l_act[2];
						if(l_op==16){
							if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
							} else if(is_string(l_v1)){
								if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						} else if(gml_value_is_number(l_v1)){
							if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
						} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
						l_args1[@l_i]=l_v1;
					} else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					break;
				case 37:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1)){
						l_i=floor(l_v1);
						l_n=array_length_1d(l_args1);
						if(l_i>=0&&l_i<l_n)l_stackPtr=gml_link_create(l_args1[l_i],l_stackPtr); else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					break;
				case 38:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1)){
						l_i=floor(l_v1);
						l_n=array_length_1d(l_args1);
						if(l_i>=0&&l_i<l_n)l_args1[@l_i]=l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					break;
				case 39:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1)){
						l_i=floor(l_v1);
						l_n=array_length_1d(l_args1);
						if(l_i>=0&&l_i<l_n){
							l_v1=l_args1[l_i];
							l_op=l_act[2];
							if(l_op==16){
								if(gml_value_is_number(l_v1)){
									if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
								} else if(is_string(l_v1)){
									if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
								} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
							} else if(gml_value_is_number(l_v1)){
								if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
							} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
							l_args1[@l_i]=l_v1;
						} else l_proc=gml_thread_proc_error(l__gthis,"Argument index "+string(l_i)+" is out of range (0.."+string(l_n)+" excl)",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Index is not a number",l_act);
					break;
				case 40:l_stackPtr=gml_link_create(array_length_1d(l_args1),l_stackPtr);break;
				case 41:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1))l_stackPtr=gml_link_create(l_v1+l_act[2],l_stackPtr); else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+string(l_act[2]),l_act);
					break;
				case 42:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_i=(l_v1==l_v2) ? 1 : 0;
					l_stackPtr=gml_link_create(l_i,l_stackPtr);
					break;
				case 43:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_i=(l_v1!=l_v2) ? 1 : 0;
					l_stackPtr=gml_link_create(l_i,l_stackPtr);
					break;
				case 44:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1)){
						if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
					} else if(is_string(l_v1)){
						if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
					l_stackPtr=gml_link_create(l_v1,l_stackPtr);
					break;
				case 45:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					if(!is_string(l_v2))l_v2=gml_value_print_rec(l_v2,0);
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(!is_string(l_v1))l_v1=gml_value_print_rec(l_v1,0);
					l_stackPtr=gml_link_create(l_v1+l_v2,l_stackPtr);
					break;
				case 46:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_op=l_act[2];
					if(gml_value_is_number(l_v1)){
						if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
					l_stackPtr=gml_link_create(l_v1,l_stackPtr);
					break;
				case 47:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v1)){
						l_f1=l_v1;
						switch(l_act[2]){
							case 0:l_f1=-l_f1;break;
							case 1:l_f1=(l_f1>0.5) ? 0 : 1;break;
							case 2:l_f1=~floor(l_f1);break;
						}
						l_stackPtr=gml_link_create(l_f1,l_stackPtr);
					} else l_proc=gml_thread_proc_error(l__gthis,"Value must be a number.",l_act);
					break;
				case 48:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(is_string(l_v1)){
						l_z=variable_instance_exists(l_v2,l_v1);
						l_i=(l_z!=l_act[2]) ? 1 : 0;
						l_stackPtr=gml_link_create(l_i,l_stackPtr);
					} else l_proc=gml_thread_proc_error(l__gthis,"Field name `"+gml_value_print_rec(l_v1,0)+"` should be a string",l_act);
					break;
				case 49:
					l_scr=l_act[2];
					l_n=l_act[3];
					l_w1=array_create(l_n);
					l_i=l_n;
					while(--l_i>=0){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_w1[@l_i]=l_stackVal;
					}
					l_scope[@1]=l_pos;
					l_scope[@4]=l_stackPtr;
					l_scope[@5]=l_inst;
					l_scope[@6]=l_with1;
					l_scope=gml_func_scope_create(l_scr[9],0,l_w1,array_create(l_scr[6]),l_inst[0],gml_std_array_wget(l_inst[1],0),l_scope);
					l_args1=l_scope[2];
					l_locals=l_scope[3];
					l_inst=l_scope[5];
					l_with1=l_scope[6];
					l_pos=l_scope[1];
					l_actions=l_scope[0];
					l_len=ds_list_size(l_actions);
					l_stackPtr=l_scope[4];
					break;
				case 50:
					l_scr=l_act[2];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					l_v1=gml_with_first(l_v1);
					if(this[2]!=gml_thread_status_error){
						l_n=l_act[3];
						l_w1=array_create(l_n);
						l_i=l_n;
						while(--l_i>=0){
							l_stackVal=l_stackPtr[0];
							l_yycNext=l_stackPtr[1];
							l_stackPtr=l_yycNext;
							l_w1[@l_i]=l_stackVal;
						}
						l_scope[@1]=l_pos;
						l_scope[@4]=l_stackPtr;
						l_scope[@5]=l_inst;
						l_scope[@6]=l_with1;
						l_scope=gml_func_scope_create(l_scr[9],0,l_w1,array_create(l_scr[6]),l_v1,l_inst[0],l_scope);
						l_args1=l_scope[2];
						l_locals=l_scope[3];
						l_inst=l_scope[5];
						l_with1=l_scope[6];
						l_pos=l_scope[1];
						l_actions=l_scope[0];
						l_len=ds_list_size(l_actions);
						l_stackPtr=l_scope[4];
					}
					break;
				case 51:
					var l_argt=l_act[4];
					l_o=l_act[2];
					l_n=l_act[3];
					l_w1=array_create(l_n);
					l_i=l_n;
					while(--l_i>=0){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
						l_w1[@l_i]=l_stackVal;
					}
					l_d=array_length_1d(l_argt);
					l_s="";
					for(l_i=0;l_i<l_n;l_i+=1){
						if(l_i<l_d)l_s=script_execute(l_argt[l_i],l_w1[l_i]); else l_s=script_execute(l_act[5],l_w1[l_i]);
						if(l_s!="")break;
					}
					if(l_i<l_n){
						l_proc=gml_thread_proc_error(l__gthis,"Type check failure for argument["+string(l_i)+"] ("+gml_value_print_rec(l_w1[l_i],0)+"): "+l_s,l_act);
					} else {
						this[@8]=l_act[1];
						if(l_act[6]&&(self.id!=l_inst[0]||other.id!=gml_std_array_wget(l_inst[1],0))){
							l_z=true;
							with (gml_std_array_wget(l_inst[1],0)) with (l_inst[0]) {
								l_v1=vm_gml_thread_exec_call(l_o,l_w1,l_n);
								l_z=false;
							}
							if(l_z){
								with (l_inst[0]) {
									l_v1=vm_gml_thread_exec_call(l_o,l_w1,l_n);
									l_z=false;
								}
								if(l_z)l_proc=gml_thread_proc_error(l__gthis,"Can't call instance-specific function - instance does not exist.",l_act);
							}
						} else l_v1=vm_gml_thread_exec_call(l_o,l_w1,l_n);
						if(this[2]==gml_thread_status_error){
							l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
						} else if(l_act[7]){
							l_stackPtr=gml_link_create(l_v1,l_stackPtr);
						}
					}
					break;
				case 52:l_pos=l_act[2];break;
				case 53:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					if(l_stackVal)l_pos=l_act[2];
					break;
				case 54:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					if(l_stackVal)l_pos+=0; else l_pos=l_act[2];
					break;
				case 55:
					if(l_stackPtr[0]){
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
					} else l_pos=l_act[2];
					break;
				case 56:
					if(l_stackPtr[0]){
						l_pos=l_act[2];
					} else {
						l_stackVal=l_stackPtr[0];
						l_yycNext=l_stackPtr[1];
						l_stackPtr=l_yycNext;
					}
					break;
				case 57:
					var l_jt=l_act[2];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(ds_map_exists(l_jt,l_v1))l_pos=l_jt[?l_v1]; else l_pos=l_act[3];
					break;
				case 58:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_f1=l_stackVal-1;
					l_stackPtr=gml_link_create(l_f1,l_stackPtr);
					if(l_f1>=1)l_pos=l_act[2];
					break;
				case 59:if(!gml_value_is_number(l_stackPtr[0]))l_proc=gml_thread_proc_error(l__gthis,"Repeat `times` must be a number.",l_act);break;
				case 60:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_w1=gml_with_func(l_stackVal);
					if(this[2]==gml_thread_status_error){
						l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else {
						l_with1=gml_with_scope_create(l_w1,l_with1);
						l_inst=gml_link_create(undefined,l_inst);
					}
					break;
				case 61:if(l_with1[0]<l_with1[1])l_inst[@0]=gml_std_array_wget(l_with1[2],l_with1[@0]++); else l_pos=l_act[2];break;
				case 62:
					l_yycNext=l_with1[3];
					l_with1=l_yycNext;
					l_yycNext=l_inst[1];
					l_inst=l_yycNext;
					break;
				case 63:break;
				case 64:break;
				case 65:l_pos=l_len;break;
				case 66:l_stackPtr=gml_link_create(this[1],l_stackPtr);break;
				case 67:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					this[@2]=gml_thread_status_waiting;
					this[@5]=(gml_value_is_number(l_v1)) ? l_v1 : 0;
					l_scope[@1]=l_pos;
					l_scope[@4]=l_stackPtr;
					l_scope[@5]=l_inst;
					l_scope[@6]=l_with1;
					ds_list_add(gml_std_array_wget(this[0],6),this);
					l_proc=false;
					break;
				case 68:
					l_z=l_act[2];
					if(l_z)l_stackPtr=gml_link_create(1,l_stackPtr);
					l_scope[@1]=l_pos;
					l_scope[@4]=l_stackPtr;
					l_scope[@5]=l_inst;
					l_scope[@6]=l_with1;
					this[@4]=l_scope;
					gml_thread_exec(gml_thread_fork(this));
					if(l_z)l_stackPtr[@0]=0;
					break;
				case 69:
					l_i=l_act[2];
					if(!is_array(l_locals[l_i]))l_locals[@l_i]=array_create(0);
					break;
				case 70:
					l_s=l_act[2];
					l_v1=variable_global_get(l_s);
					if(!is_array(l_v1))variable_global_set(l_s,[]);
					break;
				case 71:
					l_s=l_act[2];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					if(variable_instance_exists(l_v2,l_s))l_v1=gml_field_func(l_v2,l_s,false,undefined); else l_v1=undefined;
					if(this[2]==gml_thread_status_error){
						l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					} else if(!is_array(l_v1)){
						l_v1=array_create(0);
						gml_field_func(l_v2,l_s,true,l_v1);
						if(this[2]==gml_thread_status_error)l_proc=gml_thread_proc_error(l__gthis,this[7],l_act);
					}
					break;
				case 72:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v2)){
						l_i=round(l_v2);
						if(l_i>=0&&l_i<12){
							l_z=true;
							with (l_v1) {
								l_stackPtr=gml_link_create(self.alarm[l_i],l_stackPtr);
								l_z=false;
							}
							if(l_z){
								if(object_exists(floor(l_v1)))gml_thread_error("Couldn't find any instances of "+string(l_v1)+" ("+object_get_name(floor(l_v1))+")"); else gml_thread_error("Couldn't find instance `"+string(l_v1)+"`");
							}
						} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v2,0)+") shold be between 0 and 11",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v2,0)+") shold be a number",l_act);
					break;
				case 73:
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v3=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v2)){
						l_i=round(l_v2);
						if(l_i>=0&&l_i<12){
							l_z=true;
							with (l_v1) {
								if(gml_value_is_number(l_v3))self.alarm[l_i] = round(l_v3); else l_proc=gml_thread_proc_error(l__gthis,"Alarm value ("+gml_value_print_rec(l_v3,0)+") should be a number",l_act);
								l_z=false;
							}
							if(l_z){
								if(object_exists(floor(l_v1)))gml_thread_error("Couldn't find any instances of "+string(l_v1)+" ("+object_get_name(floor(l_v1))+")"); else gml_thread_error("Couldn't find instance `"+string(l_v1)+"`");
							}
						} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v2,0)+") shold be between 0 and 11",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v2,0)+") shold be a number",l_act);
					break;
				case 74:
					l_op=l_act[2];
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v2=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v4=l_stackVal;
					l_stackVal=l_stackPtr[0];
					l_yycNext=l_stackPtr[1];
					l_stackPtr=l_yycNext;
					l_v1=l_stackVal;
					if(gml_value_is_number(l_v4)){
						l_i=round(l_v4);
						if(l_i>=0&&l_i<12){
							l_z=true;
							with (l_v1) {
								if(gml_value_is_number(l_v2)){
									l_v1=self.alarm[l_i];
									if(l_op==16){
										if(gml_value_is_number(l_v1)){
											if(gml_value_is_number(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add number and "+gml_value_get_type(l_v2),l_act);
										} else if(is_string(l_v1)){
											if(is_string(l_v2))l_v1=l_v1+l_v2; else l_proc=gml_thread_proc_error(l__gthis,"Can't add string and "+gml_value_get_type(l_v2),l_act);
										} else l_proc=gml_thread_proc_error(l__gthis,"Can't add "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
									} else if(gml_value_is_number(l_v1)){
										if(gml_value_is_number(l_v2))l_v1=gml_op_apply(l_op,l_v1,l_v2); else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to number and "+gml_value_get_type(l_v2),l_act);
									} else l_proc=gml_thread_proc_error(l__gthis,"Can't apply "+gml_op_to_string(l_op)+" to "+gml_value_get_type(l_v1)+" and "+gml_value_get_type(l_v2),l_act);
									self.alarm[l_i] = round(l_v1);
								} else l_proc=gml_thread_proc_error(l__gthis,"Alarm value ("+gml_value_print_rec(l_v2,0)+") should be a number",l_act);
								l_z=false;
							}
							if(l_z){
								if(object_exists(floor(l_v1)))gml_thread_error("Couldn't find any instances of "+string(l_v1)+" ("+object_get_name(floor(l_v1))+")"); else gml_thread_error("Couldn't find instance `"+string(l_v1)+"`");
							}
						} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v4,0)+") shold be between 0 and 11",l_act);
					} else l_proc=gml_thread_proc_error(l__gthis,"Alarm index ("+gml_value_print_rec(l_v4,0)+") shold be a number",l_act);
					break;
			}
		}
		if(this[2]==gml_thread_status_error){
			l_proc=false;
			while(l_scope!=undefined){
				if(l_scope[7]!=undefined){
					l_pos=gml_std_array_wget(l_scope[7],0);
					this[@2]=gml_thread_status_running;
					break;
				} else {
					l_scope=l_scope[8];
					l_proc=true;
				}
			}
			if(l_scope==undefined){
				this[@1]=undefined;
				l__callback=l__gthis[3];
				if(l__callback!=undefined)script_execute(l__callback,l__gthis);
				break;
			} else if(l_proc){
				l_scope[@1]=l_pos;
				l_args1=l_scope[2];
				l_locals=l_scope[3];
				l_inst=l_scope[5];
				l_with1=l_scope[6];
				l_pos=l_scope[1];
				l_actions=l_scope[0];
				l_len=ds_list_size(l_actions);
				l_stackPtr=l_scope[4];
			}
		} else if(l_pos>=l_len&&this[2]==gml_thread_status_running){
			if(l_stackPtr!=undefined)this[@1]=l_stackPtr[0]; else this[@1]=0;
			l_yycNext=l_scope[8];
			l_scope=l_yycNext;
			if(l_scope!=undefined){
				l_args1=l_scope[2];
				l_locals=l_scope[3];
				l_inst=l_scope[5];
				l_with1=l_scope[6];
				l_pos=l_scope[1];
				l_actions=l_scope[0];
				l_len=ds_list_size(l_actions);
				l_stackPtr=l_scope[4];
			} else {
				this[@2]=gml_thread_status_done;
				l__callback=l__gthis[3];
				if(l__callback!=undefined)script_execute(l__callback,l__gthis);
				break;
			}
		} else break;
	}
	this[@4]=l_scope;
	g_gml_thread_current=l_previous;
}

#define gml_thread_fork
/// gml_thread_fork(this:thread)->thread
var this=argument[0];
if (live_enabled) {
	var l_q=this[4];
	var l_r=gml_thread_create(this[0],l_q[0],gml_value_list_copy(l_q[2]),gml_value_list_copy(l_q[3]),gml_std_array_wget(l_q[5],0),gml_std_array_wget(gml_std_array_wget(l_q[5],1),0),l_q[1]);
	l_r[@3]=this[3];
	var l_n=l_r[4];
	l_n[@5]=gml_link_copy(l_q[5]);
	l_n[@4]=gml_link_copy(l_q[4]);
	l_n[@6]=gml_with_scope_copy(l_q[6]);
	return l_r;
} else return undefined;

#define vm_gml_thread_exec_call_fn0
/// vm_gml_thread_exec_call_fn0(f:dynamic, w:array<dynamic>, n:int)->null<GmlValue>
var l_f=argument[0],l_w=argument[1],l_n=argument[2];
if (live_enabled) {
	switch(l_n){
		case 0:return script_execute(l_f);
		case 1:return script_execute(l_f,l_w[0]);
		case 2:return script_execute(l_f,l_w[0],l_w[1]);
		case 3:return script_execute(l_f,l_w[0],l_w[1],l_w[2]);
		case 4:return script_execute(l_f,l_w[0],l_w[1],l_w[2],l_w[3]);
		case 5:return script_execute(l_f,l_w[0],l_w[1],l_w[2],l_w[3],l_w[4]);
		case 6:return script_execute(l_f,l_w[0],l_w[1],l_w[2],l_w[3],l_w[4],l_w[5]);
		case 7:return script_execute(l_f,l_w[0],l_w[1],l_w[2],l_w[3],l_w[4],l_w[5],l_w[6]);
		default:return undefined;
	}
} else return undefined;

#define vm_gml_thread_exec_call_fn1
/// vm_gml_thread_exec_call_fn1(f1:dynamic, w1:array<dynamic>, n1:int)->null<GmlValue>
var l_f1=argument[0],l_w1=argument[1],l_n1=argument[2];
if (live_enabled) {
	switch(l_n1){
		case 8:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7]);
		case 9:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8]);
		case 10:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9]);
		case 11:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9],l_w1[10]);
		case 12:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9],l_w1[10],l_w1[11]);
		case 13:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9],l_w1[10],l_w1[11],l_w1[12]);
		case 14:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9],l_w1[10],l_w1[11],l_w1[12],l_w1[13]);
		case 15:return script_execute(l_f1,l_w1[0],l_w1[1],l_w1[2],l_w1[3],l_w1[4],l_w1[5],l_w1[6],l_w1[7],l_w1[8],l_w1[9],l_w1[10],l_w1[11],l_w1[12],l_w1[13],l_w1[14]);
		default:return undefined;
	}
} else return undefined;

#define vm_gml_thread_exec_call_fn2
/// vm_gml_thread_exec_call_fn2(f2:dynamic, w2:array<dynamic>, n2:int)->null<GmlValue>
var l_f2=argument[0],l_w2=argument[1],l_n2=argument[2];
if (live_enabled) {
	switch(l_n2){
		case 16:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15]);
		case 17:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16]);
		case 18:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17]);
		case 19:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17],l_w2[18]);
		case 20:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17],l_w2[18],l_w2[19]);
		case 21:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17],l_w2[18],l_w2[19],l_w2[20]);
		case 22:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17],l_w2[18],l_w2[19],l_w2[20],l_w2[21]);
		case 23:return script_execute(l_f2,l_w2[0],l_w2[1],l_w2[2],l_w2[3],l_w2[4],l_w2[5],l_w2[6],l_w2[7],l_w2[8],l_w2[9],l_w2[10],l_w2[11],l_w2[12],l_w2[13],l_w2[14],l_w2[15],l_w2[16],l_w2[17],l_w2[18],l_w2[19],l_w2[20],l_w2[21],l_w2[22]);
		default:return undefined;
	}
} else return undefined;

#define vm_gml_thread_exec_call_fn3
/// vm_gml_thread_exec_call_fn3(f3:dynamic, w3:array<dynamic>, n3:int)->null<GmlValue>
var l_f3=argument[0],l_w3=argument[1],l_n3=argument[2];
if (live_enabled) {
	switch(l_n3){
		case 24:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23]);
		case 25:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24]);
		case 26:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25]);
		case 27:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25],l_w3[26]);
		case 28:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25],l_w3[26],l_w3[27]);
		case 29:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25],l_w3[26],l_w3[27],l_w3[28]);
		case 30:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25],l_w3[26],l_w3[27],l_w3[28],l_w3[29]);
		case 31:return script_execute(l_f3,l_w3[0],l_w3[1],l_w3[2],l_w3[3],l_w3[4],l_w3[5],l_w3[6],l_w3[7],l_w3[8],l_w3[9],l_w3[10],l_w3[11],l_w3[12],l_w3[13],l_w3[14],l_w3[15],l_w3[16],l_w3[17],l_w3[18],l_w3[19],l_w3[20],l_w3[21],l_w3[22],l_w3[23],l_w3[24],l_w3[25],l_w3[26],l_w3[27],l_w3[28],l_w3[29],l_w3[30]);
		default:return undefined;
	}
} else return undefined;

#define vm_gml_thread_exec_call
/// vm_gml_thread_exec_call(fn:dynamic, args1:array<dynamic>, argc:int)->GmlValue
var l_fn=argument[0],l_args1=argument[1],l_argc=argument[2];
if (live_enabled) {
	switch(l_argc>>3){
		case 0:return vm_gml_thread_exec_call_fn0(l_fn,l_args1,l_argc);
		case 1:return vm_gml_thread_exec_call_fn1(l_fn,l_args1,l_argc);
		case 2:return vm_gml_thread_exec_call_fn2(l_fn,l_args1,l_argc);
		case 3:return vm_gml_thread_exec_call_fn3(l_fn,l_args1,l_argc);
		default:
			gml_thread_error("Calls only support up to 32 arguments for now.");
			return undefined;
	}
} else return undefined;

#define gml_value_is_number
/// gml_value_is_number(this1:Any)->bool
var l_this1=argument[0];
if (live_enabled) {
	return (is_real(l_this1)||is_int64(l_this1)||is_bool(l_this1))||is_int32(l_this1);
} else return false;

#define gml_value_get_type
/// gml_value_get_type(this1:Any)->string
var l_this1=argument[0];
if (live_enabled) {
	if(l_this1==undefined){
		return "undefined";
	} else if(gml_value_is_number(l_this1)){
		return "number";
	} else if(is_string(l_this1)){
		return "string";
	} else if(is_array(l_this1)){
		return "array";
	} else return "unknown:"+typeof(l_this1);
} else return undefined;

#define gml_value_print_rec
/// gml_value_print_rec(v:GmlValue, z:int)->string
var l_v=argument[0],l_z=argument[1];
if (live_enabled) {
	var l_r,l_i,l_n,l_w;
	if(l_v==undefined){
		return "undefined";
	} else if(gml_value_is_number(l_v)){
		l_r=string_format(l_v,0,15);
		l_n=string_pos(".",l_r);
		if(l_n>0){
			for(l_i=string_byte_length(l_r);l_i>l_n;l_i-=1){
				if(string_byte_at(l_r,l_i)!=48)return string_copy(l_r,1,l_i);
			}
			return string_copy(l_r,1,l_n-1);
		} else return l_r;
	} else if(is_string(l_v)){
		return "\""+string(l_v)+"\"";
	} else if(is_array(l_v)){
		if(array_length_2d(l_v,2)==1){
			l_w=l_v;
			l_n=array_length_2d(l_w,1);
			if(l_n>0){
				if(++l_z<=8){
					l_r="{ "+string(l_w[1, 0])+": "+gml_value_print_rec(l_w[0, 0],l_z);
					for(l_i=1;l_i<l_n;l_i+=1){
						l_r+=", "+string(l_w[1, l_i])+": "+gml_value_print_rec(l_w[0, l_i],l_z);
					}
					return l_r+" }";
				} else return "{...}";
			} else return "{ }";
		} else if(array_length_2d(l_v,1)>=1){
			return script_execute(l_v[1, 0],5,l_v);
		} else {
			l_n=array_length_1d(l_v);
			if(l_n>0){
				if(++l_z<=8){
					l_r="["+gml_value_print_rec(l_v[0],l_z);
					for(l_i=1;l_i<l_n;l_i+=1){
						l_r+=", "+gml_value_print_rec(l_v[l_i],l_z);
					}
					return l_r+"]";
				} else return "[...]";
			} else return "[]";
		}
	} else return string(l_v);
} else return undefined;

#define gml_value_print
/// gml_value_print(this1:Any)->string
var l_this1=argument[0];
if (live_enabled) {
	return gml_value_print_rec(l_this1,0);
} else return undefined;

#define gml_type_check_init
/// gml_type_check_init()->Dictionary<GmlTypeCheck>
if (live_enabled) {
	var l_r=ds_map_create();
	l_r[?"any"]=live_script_get_index("gml_type_check_any");
	l_r[?"bool"]=live_script_get_index("gml_type_check_number");
	l_r[?"number"]=live_script_get_index("gml_type_check_number");
	l_r[?"?number"]=live_script_get_index("gml_type_check_z_number");
	l_r[?"float"]=live_script_get_index("gml_type_check_number");
	l_r[?"?float"]=live_script_get_index("gml_type_check_z_number");
	l_r[?"real"]=live_script_get_index("gml_type_check_number");
	l_r[?"?real"]=live_script_get_index("gml_type_check_z_number");
	l_r[?"color"]=live_script_get_index("gml_type_check_number");
	l_r[?"date"]=live_script_get_index("gml_type_check_number");
	l_r[?"int"]=live_script_get_index("gml_type_check_int");
	l_r[?"index"]=live_script_get_index("gml_type_check_index");
	l_r[?"id"]=live_script_get_index("gml_type_check_index");
	l_r[?"sprite"]=live_script_get_index("gml_type_check_index");
	l_r[?"background"]=live_script_get_index("gml_type_check_index");
	l_r[?"sound"]=live_script_get_index("gml_type_check_index");
	l_r[?"font"]=live_script_get_index("gml_type_check_index");
	l_r[?"script"]=live_script_get_index("gml_type_check_index");
	l_r[?"shader"]=live_script_get_index("gml_type_check_index");
	l_r[?"timeline"]=live_script_get_index("gml_type_check_index");
	l_r[?"object"]=live_script_get_index("gml_type_check_index");
	l_r[?"room"]=live_script_get_index("gml_type_check_index");
	l_r[?"buffer"]=live_script_get_index("gml_type_check_index");
	l_r[?"list"]=live_script_get_index("gml_type_check_index");
	l_r[?"grid"]=live_script_get_index("gml_type_check_index");
	l_r[?"string"]=live_script_get_index("gml_type_check_string");
	l_r[?"?string"]=live_script_get_index("gml_type_check_z_string");
	l_r[?"array"]=live_script_get_index("gml_type_check_array");
	l_r[?"?array"]=live_script_get_index("gml_type_check_z_array");
	l_r[?"sprite"]=live_script_get_index("gml_type_check_int");
	l_r[?"background"]=live_script_get_index("gml_type_check_int");
	l_r[?"sound"]=live_script_get_index("gml_type_check_int");
	l_r[?"font"]=live_script_get_index("gml_type_check_int");
	l_r[?"path"]=live_script_get_index("gml_type_check_int");
	l_r[?"timeline"]=live_script_get_index("gml_type_check_int");
	l_r[?"script"]=live_script_get_index("gml_type_check_int");
	l_r[?"object"]=live_script_get_index("gml_type_check_int");
	l_r[?"room"]=live_script_get_index("gml_type_check_int");
	return l_r;
} else return undefined;

#define gml_type_check_any
/// gml_type_check_any(v:GmlValue)->string
if (live_enabled) {
	return "";
} else return undefined;

#define gml_type_check_number
/// gml_type_check_number(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(gml_value_is_number(l_v))return "";
	return "Expected a number";
} else return undefined;

#define gml_type_check_int
/// gml_type_check_int(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(gml_value_is_number(l_v)){
		if((l_v|0)==l_v)return "";
	}
	return "Expected an integer";
} else return undefined;

#define gml_type_check_index
/// gml_type_check_index(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(gml_value_is_number(l_v)){
		if((l_v|0)==l_v)return "";
	}
	return "Expected an index";
} else return undefined;

#define gml_type_check_string
/// gml_type_check_string(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(is_string(l_v))return "";
	return "Expected a string";
} else return undefined;

#define gml_type_check_array
/// gml_type_check_array(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(is_array(l_v))return "";
	return "Expected an array";
} else return undefined;

#define gml_type_check_z_number
/// gml_type_check_z_number(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(l_v==undefined||gml_value_is_number(l_v))return "";
	return "Expected a number or null";
} else return undefined;

#define gml_type_check_z_string
/// gml_type_check_z_string(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(l_v==undefined||is_string(l_v))return "";
	return "Expected a string or null";
} else return undefined;

#define gml_type_check_z_array
/// gml_type_check_z_array(v:GmlValue)->string
var l_v=argument[0];
if (live_enabled) {
	if(l_v==undefined||is_array(l_v))return "";
	return "Expected an array or null";
} else return undefined;

#define gml_value_list_copy
/// gml_value_list_copy(this1:array<GmlValue>)->GmlValueList
var l_this1=argument[0];
if (live_enabled) {
	var l_n=array_length_1d(l_this1);
	var l_r=array_create(l_n);
	array_copy(l_r,0,l_this1,0,l_n);
	return l_r;
} else return undefined;

#define gml_with_scope_copy
/// gml_with_scope_copy(q:with_scope)->with_scope
var l_q=argument[0];
if (live_enabled) {
	if(l_q==undefined)return undefined;
	var l_r=gml_with_scope_create(l_q[2],gml_with_scope_copy(l_q[3]));
	l_r[@0]=l_q[0];
	return l_r;
} else return undefined;

#define gml_with_scope_create
/// gml_with_scope_create(arr:GmlValueList, nxt:with_scope)
var this=mq_gml_with_scope;
this[1,0]=mt_gml_with_scope;
var l_arr=argument[0],l_nxt=argument[1];
if (live_enabled) {
	this[@0]=0;
	this[@1]=array_length_1d(l_arr);
	this[@2]=l_arr;
	this[@3]=l_nxt;
}
return this;
