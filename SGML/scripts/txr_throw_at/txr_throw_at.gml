/// @param error_text
/// @param token

var tk = argument1;

if (tk[0] == txr_token.eof)
{
	return txr_throw(argument0, "<EOF>");	
}

return txr_throw(argument0, tk[1]);