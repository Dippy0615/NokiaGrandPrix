/// @description 
if(global.prev_room==rm_menu)
{
	if(keyboard_check_pressed(vk_right)){
		play_sound(snd_menu_move);
		if(track<array_length(global.highscore)-1) track++;	
	}
	if(keyboard_check_pressed(vk_left)){
		play_sound(snd_menu_move);
		if(track>0) track--;	
	}
	if(keyboard_check_pressed(ord("X"))){
		play_sound(snd_menu_return);
		room_goto_transition(rm_menu);	
	}
}
if(keyboard_check_pressed(ord("Z"))){
	if(global.prev_room==rm_game){
		play_sound(snd_select2);
		room_goto_transition(rm_stage_select);	
	}
		else room_goto_transition(rm_menu); 
}