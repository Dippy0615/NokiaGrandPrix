/// @description Update menu

camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), (current_option%array_length(options))*84, .1), camera_get_view_y(view_camera[0]));

header_x-=.5;
if(header_x<-(header_length)) header_x = string_length(header)*6;

if (instance_exists(obj_transition)) exit;

if(keyboard_check_pressed(ord("Z")))
{
	switch(current_option)
	{
		case 0: default:
			room_goto_transition(rm_stage_select);
			break;
		case 1:
			room_goto_transition(rm_shop);
			break;
		case 2:
			room_goto_transition(rm_highscores);
			break;
		case 3:
			game_end();
			break;
	}
	play_sound(snd_select2);
}

if(keyboard_check_pressed(vk_left)){
	if(current_option>0)
	{
		play_sound(snd_menu_move);
		current_option--;
	}
}
if(keyboard_check_pressed(vk_right)){
	if(current_option<array_length(options)-1)
	{
		play_sound(snd_menu_move);
		current_option++;
	}
}