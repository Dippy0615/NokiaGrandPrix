/// @description 
if(!instance_exists(obj_transition)&&!countdown&&!racing)
{
	if(finish==0)  countdown = true;	
}

if(show_lap)
{
	if((current_time/256)%2>0){
		if(!audio_is_playing(snd_lap)) play_sound(snd_lap);
	}
	else
	{
		if(audio_is_playing(snd_lap)) audio_stop_sound(snd_lap);	
	}
}

if(countdown)
{
	if(countdown_time mod 60 == 0) play_sound(snd_countdown);
	countdown_time--;
	if(countdown_time<=0){
		racing = true;
		countdown = false;
		play_sound(snd_go);
	}
}

if(racing){
	if(finish==0) race_time++;
	show_debug_message(get_time_string(race_time));
}

if(finish>0){
	racing = false;
	finish_time++;
	if(alarm[1]==-1&&!freeze){
		if(finish==1) alarm[1] = 60*7;	
		else alarm[1] = 80;
	}
	if(freeze)
	{
		if(instance_exists(obj_transition)) exit;
		
		if(keyboard_check_pressed(vk_up)){
			cursor--;
			play_sound(snd_menu_move);
			if(cursor<0) cursor = array_length(options)-1;
		}
		if(keyboard_check_pressed(vk_down)){
			cursor++;
			play_sound(snd_menu_move);
			if(cursor>array_length(options)-1) cursor = 0;
		}
		if(keyboard_check_pressed(ord("Z"))){
			
			if(finish==1) add_highscore(global.track, global.name, race_time);
			switch(cursor)
			{
				case 0: default:
					room_goto_transition(rm_highscores);
					break;
				case 1:
					room_goto_transition(rm_shop);
					break;
				case 2:
					room_goto_transition(rm_menu);
					break;
			}
			play_sound(snd_select);
		}
	}
}