/// @description Update computer player

trackdist = (angle - curve)/2;

if(obj_control.finish==0&&obj_control.racing)
{
	//handle track segments
	current_segment = ds_list_find_value(global.tracks[global.track], segment_index);
	if(current_segment==undefined){
		segment_index = 0;
		distance = 0;
		current_segment = ds_list_find_value(global.tracks[global.track], segment_index);
	}
	
	var _len = current_segment[? "start"]+current_segment[? "length"];
	if(distance>_len){
		segment_index++;	
	}
	
	var _curve = current_segment[? "curve"];
	target_curve = _curve; 
	
	if(obj_control.finish==0) curve = lerp(curve, target_curve, .035);	
	if(curve>-.5&&curve<.5) curve = 0;
	
	if(curve!=0&&car_speed>0){
		angle += (curve*-1)*.0005*car_speed;
		if(curve>0){
			if(sin(current_time>256)>0) left = true;
				else left = false;
			right = false;
		}
		if(curve<0){
			if(sin(current_time>256)>0) right = true;
				else right = false;
			left = false;
		}
	}
	
	if(state==0)
	{
		//left & right
		if(left) angle += 1 * (1 - .4);
		if(right) angle -= 1 * (1 - .4);
	
		//accel
		car_speed += car_accel;
	
		//collision w/ track objects
	
		if(obj_control.finish==0)
		{
			if(current_segment!=-1)
			{
				var _objects = current_segment[? "objects"];
				if(array_length(_objects)>0)
				{
					for(var i=array_length(_objects)-1;i>-1;i--)
					{
						var _obj, _type, _x, _dist, _coll;
						_obj = _objects[i];
						_type = struct_get(_obj, "type");
						_dist = struct_get(_obj, "distance");
						_x = struct_get(_obj, "x");
						_coll = get_object_collision(_obj);
						
						var _myx = floor(x - trackdist);
						var _colleft = struct_get(_coll, "colleft");
						var _collright = struct_get(_coll, "collright");
						
						show_debug_message("target: "+string(obj_target));
						//show_debug_message("odist: "+string(_dist));
						//show_debug_message("cpudist: "+string(distance));
						
						
						if(obj_target==-1)
						{
							if(_dist>distance)
							{
								if(_type!=OBJ_FINISHLINE)
								{
									var _d = _dist-distance;
									if(_d<120)
									{
										obj_target = _obj;
									}
								}
							}
						}
						else
						{
							_myx -= obj_track.track_left;
							
							_x = struct_get(obj_target, "x");
							_dist = struct_get(obj_target, "distance");
							
							_coll = get_object_collision(obj_target);
							_collright = struct_get(_coll, "collright");
							_colleft = struct_get(_coll, "colleft");
							
							if(distance>_dist){
								obj_target = -1;
								left = false;
								right = false;
							}
							else
							{
								_x -= obj_track.track_left;
								_colleft -= obj_track.track_left;
								_collright -= obj_track.track_left;
								
								if(_x<0&&_myx<=_collright+6) right = true;
									else right = false;
								if(_x>0&&_myx>=_colleft-6) left = true;
									else left = false;		
								
								_x += obj_track.track_left;
							}
						}
						
						var test = track_place_meeting(_coll, get_player_collision(id));
						if(test>-1)
						{
							switch(test)
							{
								case OBJ_ROADBLOCK:
									if(z==1){
										state = 1;
										for(var _i=0; _i<16; _i++)
										{
											var _a = _i*22.5;
											create_particle(PART_HIT, _x+obj_track.track_left, distance-_dist, sin(degtorad(_a)*2), cos(degtorad(_a)*2)); 
										}
									}
									break;
								case OBJ_MUD:
									if(z==1) car_max_speed = car_max_speed_mud;
									break;
								case OBJ_JUMPER:
									if(z==1)
									{
										z=1.01;
										dZ = 1;
										car_speed += 15;
									}
									break;
								case OBJ_BOOSTER:
									if(z==1) car_speed += 20;
									break;
								case OBJ_COIN:
									if(z==1)
									{
										global.coins++;
										for(var _i=0;_i<8;_i++)
											create_particle(PART_COIN, _x+obj_track.track_left, distance-_dist, random_range(-.5,.5), -.5); 
										array_delete(_objects, i, 1);
									}
									break;
							}
						}
					}
				}
			}
		}
	}
	else if (state==1)
	{
		car_speed = 0;
		hit_delay++;
		if(hit_delay>30){
			angle = lerp(angle, 0, .1);
			if(angle>-.1&&angle<.1) angle = 0;
		}
	
		if(alarm[0]==-1) alarm[0] = 80;
	}
}

if(z==1) dZ = 0;
else
{
	if(global.track==3) dZ-=.013;
		else dZ -= .020;
}

z += dZ;

if(curve>-5&&curve<5) image_index = 0;
else
{
	if(curve<-10) image_index = 1;
	
	if(curve>10) image_index = 2;
	
}
trackdist = clamp(trackdist, -20, 20);
if(car_speed > car_max_speed) car_speed = lerp(car_speed, car_max_speed, 0.05);
if(car_speed < 0) car_speed = 0;
z = clamp(z, 1, 20);