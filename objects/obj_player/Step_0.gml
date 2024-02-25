/// @description Update player 

trackdist = (angle - obj_track.curve)/2;

if(obj_control.freeze || !obj_control.racing) exit;

if(abs(trackdist)>23&&z==1&&state!=2){
	play_sound(snd_fallout);
	state = 2;
	if(alarm[1]==-1) alarm[1] = 30;
}

if(obj_track.curve!=0&&car_speed>0){
	angle += (obj_track.curve*-1)*.0005*car_speed;	
}

if(state==0)
{
	//left & right
	if(obj_control.finish==0)
	{
		if(keyboard_check(vk_left)) angle += 2 * (1 - .4);
		if(keyboard_check(vk_right)) angle -= 2 * (1 - .4);
	}
	
	//accel & deacceleration
	if(keyboard_check(ord("Z"))){
		if(obj_control.finish==0) car_speed += car_accel;	
	}
	else
	{
		if(car_speed>0) car_speed += car_deccel;
		if(keyboard_check(ord("Z"))) car_speed -= .07;
	}
	car_max_speed = car_max_speed_normal;
}

//collision w/ track objects
if(state==0)
{
	if(obj_control.finish==0)
	{
		if(obj_track.current_segment!=-1)
		{
			var _objects = obj_track.current_segment[? "objects"];
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
		
					var test = track_place_meeting(_coll, get_player_collision(id));
					if(test>-1)
					{
						switch(test)
						{
							case OBJ_ROADBLOCK:
								if(z==1){
									if(state==0){
										state = 1;
										play_sound(snd_hit);
									}
									for(var _i=0; _i<16; _i++)
									{
										var _a = _i*22.5;
										create_particle(PART_HIT, _x+obj_track.track_left, obj_track.distance-_dist, sin(degtorad(_a)*2), cos(degtorad(_a)*2)); 
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
									play_sound(snd_jumper);
								}
								break;
							case OBJ_BOOSTER:
								if(z==1){
									car_speed += 20;
									play_sound(snd_booster);
								}
								break;
							case OBJ_COIN:
								if(z==1)
								{
									global.coins++;
									for(var _i=0;_i<8;_i++)
										create_particle(PART_COIN, _x+obj_track.track_left, obj_track.distance-_dist, random_range(-.5,.5), -.5); 
									array_delete(_objects, i, 1);
									play_sound(snd_coin);
								}
								break;
							case OBJ_SPACEHOLE:
								if (z==1){
									state = 2;
									play_sound(snd_fallout);
									if(alarm[1]==-1) alarm[1] = 30;
								}
								break;
							case OBJ_OIL: case OBJ_LEAFPILE:
								if(z==1)
								{
									if(state==0){
										state = 3;
										play_sound(snd_hit);
									}
									if(_type==OBJ_LEAFPILE){
										create_particle(PART_LEAF, _x+obj_track.track_left, obj_track.distance-_dist, -1, -1, 4, 2);	
										create_particle(PART_LEAF, _x+obj_track.track_left, obj_track.distance-_dist, -0, -1, 4, 2);	
										create_particle(PART_LEAF, _x+obj_track.track_left, obj_track.distance-_dist, 1, -1, 4, 2);	
									}
									
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
else if(state==2)
{
	car_speed = 0;
	dZ = 0;
}
else if(state==3)
{
	if(car_speed>0) car_speed += car_deccel;
	dZ = 0;	
	if(alarm[0]==-1) alarm[0] = 80;
}

//show_debug_message("z: "+string(z));
//show_debug_message("dZ: "+string(dZ));

if(z==1) dZ = 0;
else
{
	if(global.track==3) dZ-=.013;
		else dZ -= .020;
}

z += dZ;

if(obj_track.curve>-5&&obj_track.curve<5) image_index = 0;
else
{
	if(obj_track.curve<-10) image_index = 1;
	
	if(obj_track.curve>10) image_index = 2;
	
}
if(car_speed > car_max_speed) car_speed = lerp(car_speed, car_max_speed, 0.05);
if(car_speed < 0) car_speed = 0;
z = clamp(z, 1, 20);