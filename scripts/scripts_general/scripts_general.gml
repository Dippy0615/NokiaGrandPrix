// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function window_scale(_scale){
	obj_system.scale = _scale;
	window_set_size(obj_system.scale*WIDTH, obj_system.scale*HEIGHT);
	obj_system.alarm[0] = 1;
}

function draw_text_shadow(_x, _y, _string, _inverted=false){
	if(!_inverted)
	{
		draw_text_color(_x+1, _y, _string, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, 1);
		draw_text_color(_x-1, _y, _string, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, 1);
		draw_text_color(_x, _y+1, _string, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, 1);
		draw_text_color(_x, _y-1, _string, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, 1);
		draw_text_color(_x, _y, _string, COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, 1);
	}
	else
	{
		draw_text_color(_x+1, _y, _string, COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, 1);
		draw_text_color(_x-1, _y, _string, COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, 1);
		draw_text_color(_x, _y+1, _string, COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, 1);
		draw_text_color(_x, _y-1, _string, COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, 1);
		draw_text_color(_x, _y, _string, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, COLOR_LIGHT, 1);
	}
}

function create_particle(_type, _x, _y, _dX=0, _dY=0, _frames=0, _animspeed=0){
	with(obj_particles)
	{
		array_push(particles, 
		{
			type : _type, x : _x, y: _y, dX : _dX, dY : _dY, 
			frame : 0, frames : _frames, animspeed : _animspeed, frame_counter : 0,
		});	
	}
}

function animate_particle(_particle, _index, _kill=false){
	var _frame, _frames, _animspeed, _frame_counter;
	_frame = struct_get(_particle, "frame");
	_frames = struct_get(_particle, "frames");
	_animspeed = struct_get(_particle, "animspeed");
	_frame_counter = struct_get(_particle, "frame_counter");
	
	struct_set(_particle, "frame_counter", _frame_counter+1);
	if(struct_get(_particle, "frame_counter")>_animspeed-1)
	{
		struct_set(_particle, "frame_counter", 0)
		struct_set(_particle, "frame", _frame+1);
		if(struct_get(_particle, "frame")>_frames-1){
			if(!_kill) struct_set(_particle, "frame", 0);	
			else
			{
				array_delete(particles, _index, 1); 
			}
		}
	}
}

function get_car_name(_car){
	switch(_car)
	{
		case 0: return "TECHNO-CAR";
		case 1: return "CYBER-TRUCK";
		case 2: return "SUPER-KART";
	}
	return -1;
}

function room_goto_transition(_room, _speed=3)
{
	if(!instance_exists(obj_transition))
	{
		var t = instance_create_depth(0, 0, -10, obj_transition);
		t.goto = _room;
		t.transition_speed = _speed;
	}
}

function get_time_string(_time){
	var _str, _mills, _sec, _min;
	_mills = floor((_time/.6)%100); //not actually milliseconds but whatever
	_sec = floor((_time/60)%60);
	_min = floor((_time/3600)%60);
	_mills = string_format(_mills, 2, 0);
	_sec = string_format(_sec, 2, 0);
	_min = string_format(_min, 2, 0);
	_str = _min+":"+_sec+"."+_mills;
	_str = string_replace_all(_str, " ", "0");
	return _str;
}

function play_sound(_soundid, _loop=false){
	if(audio_is_playing(global.sound)) audio_stop_sound(global.sound);
	global.sound = _soundid;
	return audio_play_sound(global.sound, 0, _loop, 1);
}