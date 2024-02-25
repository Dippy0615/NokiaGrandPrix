/// @description 
if (instance_exists(obj_transition)) exit;

if(keyboard_check_pressed(ord("Z"))){
	play_sound(snd_select);
	room_goto_transition(rm_menu);
}