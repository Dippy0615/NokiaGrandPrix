/// @description 
if(instance_exists(obj_transition)) exit;

if(!confirm)
{
	if(keyboard_check_pressed(vk_right)){
		play_sound(snd_menu_move);
		if(pos<name_max_length-1) pos++;
	}
	if(keyboard_check_pressed(vk_left)){
		play_sound(snd_menu_move);
		if(pos>0) pos--;
	}
	if(keyboard_check_pressed(vk_down)){
		var _char, _put, _split;
		_char = string_char_at(name, pos+1);
		_put = "";
		_split = "";
	
		if(_char==" "||_char=="A") _put = "Z";
		else _put = chr(string_ord_at(name, pos+1)-1);
	
		for(var i=0;i<name_max_length;i++){
			if(i!=pos) _split += string_char_at(name, i+1);	
			else _split += _put;
		}
		name = _split;
		play_sound(snd_menu_move);
	}
	if(keyboard_check_pressed(vk_up)){
		var _char, _put, _split;
		_char = string_char_at(name, pos+1);
		_put = "";
		_split = "";
	
		if(_char==" "||_char=="Z") _put = "A";
		else _put = chr(string_ord_at(name, pos+1)+1);
	
		for(var i=0;i<name_max_length;i++){
			if(i!=pos) _split += string_char_at(name, i+1);	
			else _split += _put;
		}
		name = _split;
		play_sound(snd_menu_move);
	}
}
if(keyboard_check_pressed(ord("Z"))){
	if(confirm){
		global.name = name;
		play_sound(snd_select);
		room_goto_transition(rm_title);
	}
	else{
		confirm = true;
		play_sound(snd_select2);
	}
}
if(keyboard_check_pressed(ord("X"))){
	play_sound(snd_menu_return);
	if(confirm) confirm = false;	
}