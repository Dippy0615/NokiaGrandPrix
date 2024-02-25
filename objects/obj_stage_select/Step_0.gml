/// @description Menu controls
if (instance_exists(obj_transition)) exit;

if(keyboard_check_pressed(vk_right)){
	cursor++;
	play_sound(snd_menu_move);
	if(cursor>array_length(stages)-1) cursor = 0;
}
if(keyboard_check_pressed(vk_left)){
	cursor--;
	play_sound(snd_menu_move);
	if(cursor<0) cursor = array_length(stages)-1;
}
if(keyboard_check_pressed(ord("Z"))){
	switch(cursor)
	{
		case 0:
			global.track = 0;
			global.background = bg_ground;
			break;
		case 1:
			global.track = 1;
			global.background = bg_jungle;
			break;
		case 2:
			global.track = 2;
			global.background = bg_sky;
			break;
		case 3:
			global.track = 3;
			global.background = bg_space;
			break;
	}
	play_sound(snd_select);
	room_goto_transition(rm_game);
}
if(keyboard_check_pressed(ord("X"))){
	play_sound(snd_menu_return);
	room_goto_transition(rm_menu);
}