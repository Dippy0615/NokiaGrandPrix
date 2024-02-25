/// @description Update track

time++;

//background
if(obj_player.visible)
{
	layer_x(background, layer_get_x(background)+(sin(degtorad(curve))*obj_player.car_speed/8));
	layer_y(background, layer_get_y(background)+(cos(degtorad(curve))*obj_player.car_speed/8));
}

if(!obj_control.racing) exit;

if(!obj_control.freeze){
	distance += obj_player.car_speed/15;
}
if(time mod 8 == 0) draw_sign = !draw_sign;

//handle track segments
current_segment = ds_list_find_value(global.tracks[global.track], segment_index);
if(current_segment==undefined){
	segment_index = 0;
	distance = 0;
	current_segment = ds_list_find_value(global.tracks[global.track], segment_index);
	obj_control.lap++;
	if(obj_control.lap<4)
	{
		obj_control.show_lap = true;
		obj_control.alarm[0] = 60*3;
		show_debug_message("---LAP "+string(obj_control.lap)+"---");
	}
	else
	{
		obj_control.finish = 1;	
	}
}

var _len = current_segment[? "start"]+current_segment[? "length"];
var _curve = current_segment[? "curve"];
var _objects = current_segment[? "objects"];

//next segment & track turns
if(distance>_len){
	segment_index++;
}
else
{
	if(obj_control.finish==0) curve = lerp(curve, _curve, .035);	
	if(curve>-.5&&curve<.5) curve = 0;
	//show_debug_message("curve: "+string(curve));
}

//show_debug_message("car speed: "+string(obj_player.car_speed));
//show_debug_message("dist: "+string(distance));

if(curve>45) curve = 45;
if(curve<-45) curve = -45;