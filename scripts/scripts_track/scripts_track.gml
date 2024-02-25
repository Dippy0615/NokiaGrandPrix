// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function init_tracks(){
	global.tracks = array_create(4);
	
	//track 1 - ground
	global.tracks[0] = ds_list_create();
	ds_list_add(global.tracks[0], create_segment(0, 1000, 0, [create_object(OBJ_FINISHLINE, 2, 10), create_object(OBJ_ROADBLOCK, 24, 500)]));
	ds_list_add(global.tracks[0], create_segment(1000, 1000, -30));
	ds_list_add(global.tracks[0], create_segment(2000, 2000, 0, [create_object(OBJ_OIL, 14, 2400), create_object(OBJ_BOOSTER, 24, 2700), create_object(OBJ_COIN, 6, 2850), create_object(OBJ_ROADBLOCK, 2, 3100), create_object(OBJ_OIL, 20, 3350)], [create_foreground_object(FOBJ_TUNNEL, 0, 3650)]));
	ds_list_add(global.tracks[0], create_segment(4000, 1000, -30));
	ds_list_add(global.tracks[0], create_segment(5000, 1000, 0, [create_object(OBJ_MUD, 20, 5250, 600), create_object(OBJ_COIN, 24, 5950)]));
	ds_list_add(global.tracks[0], create_segment(6000, 1000, 30));
	ds_list_add(global.tracks[0], create_segment(7000, 1000, 0, [create_object(OBJ_BOOSTER, 8, 7150), create_object(OBJ_ROADBLOCK, 24, 7600)]));
	
	//track 2 - jungle
	global.tracks[1] = ds_list_create();
	ds_list_add(global.tracks[1], create_segment(0, 1000, 0, [create_object(OBJ_FINISHLINE, 2, 10), create_object(OBJ_LEAFPILE, 2, 700)], [create_foreground_object(FOBJ_LEAVES, 0, 400)]));
	ds_list_add(global.tracks[1], create_segment(1000, 1000, 0, [create_object(OBJ_MUD, 2, 1130, 500), create_object(OBJ_BOOSTER, 24, 1700)]));
	ds_list_add(global.tracks[1], create_segment(2000, 500, 30));
	ds_list_add(global.tracks[1], create_segment(2500, 500, 0, [create_object(OBJ_COIN, 20, 2640, 250), create_object(OBJ_MUD, 20, 2700, 250)])); 
	ds_list_add(global.tracks[1], create_segment(3000, 500, 30));
	ds_list_add(global.tracks[1], create_segment(3500, 500, 0, [create_object(OBJ_MUD, 2, 3700, 250)]));
	ds_list_add(global.tracks[1], create_segment(4000, 1000, 0, [create_object(OBJ_BOOSTER, 4, 4100), create_object(OBJ_LEAFPILE, 2, 4450), create_object(OBJ_ROADBLOCK, 24, 4750)])); 
	ds_list_add(global.tracks[1], create_segment(5000, 550, -30));
	ds_list_add(global.tracks[1], create_segment(5500, 500, 0, [create_object(OBJ_ROADBLOCK, 24, 5800), create_object(OBJ_COIN, 24, 5930)])); 
	
	//track 3 - sky
	global.tracks[2] = ds_list_create();
	ds_list_add(global.tracks[2], create_segment(0, 1000, 0, [create_object(OBJ_FINISHLINE, 2, 10), create_object(OBJ_ROADBLOCK, 24, 600)]));
	ds_list_add(global.tracks[2], create_segment(1000, 1000, 30));
	ds_list_add(global.tracks[2], create_segment(2000, 2000, 0, [create_object(OBJ_ROADBLOCK, 2, 2200), create_object(OBJ_COIN, 24, 2850), create_object(OBJ_MUD, 20, 2900, 1000), create_object(OBJ_BOOSTER, 8, 3300)], [create_foreground_object(FOBJ_CLOUD, 0, 2450)]));
	ds_list_add(global.tracks[2], create_segment(4000, 1000, -30));
	ds_list_add(global.tracks[2], create_segment(5000, 2000, 0, [create_object(OBJ_JUMPER, 24, 5300), create_object(OBJ_COIN, 24, 5450), create_object(OBJ_ROADBLOCK, 24, 5600), create_object(OBJ_ROADBLOCK, 2, 5850), create_object(OBJ_MUD, 2, 6100, 800)]));

	//track 4 - space
	global.tracks[3] = ds_list_create();
	ds_list_add(global.tracks[3], create_segment(0, 500, 0, [create_object(OBJ_FINISHLINE, 2, 10)], [create_foreground_object(FOBJ_MOON, 0, 300)]));
	ds_list_add(global.tracks[3], create_segment(500, 500, -30));
	ds_list_add(global.tracks[3], create_segment(1000, 1000, 0, [create_object(OBJ_ROADBLOCK, 2, 1200), create_object(OBJ_ROADBLOCK, 24, 1400), create_object(OBJ_MUD, 20, 1550, 300)]));
	ds_list_add(global.tracks[3], create_segment(2000, 500, -30));
	ds_list_add(global.tracks[3], create_segment(2500, 1000, 0, [create_object(OBJ_MUD, 20, 2700, 200), create_object(OBJ_COIN, 24, 3100), create_object(OBJ_ROADBLOCK, 2, 3050), create_object(OBJ_BOOSTER, 24, 3400)]));
	ds_list_add(global.tracks[3], create_segment(3500, 1000, 0, [create_object(OBJ_JUMPER, 4, 3550), create_object(OBJ_JUMPER, 24, 3550), create_object(OBJ_SPACEHOLE, 0, 3700), create_object(OBJ_SPACEHOLE, 0, 3796), create_object(OBJ_ROADBLOCK, 2, 4300)]));
	ds_list_add(global.tracks[3], create_segment(4500, 500, 30));
	ds_list_add(global.tracks[3], create_segment(5000, 1000, 0, [create_object(OBJ_ROADBLOCK, 2, 5275), create_object(OBJ_SPACEHOLE, -20, 5350), create_object(OBJ_OIL, 20, 5700)]));
	ds_list_add(global.tracks[3], create_segment(6000, 500, 30));
	ds_list_add(global.tracks[3], create_segment(6500, 1000, 0, [create_object(OBJ_COIN, 6, 6900)], [create_foreground_object(FOBJ_TUNNEL, 0, 6750), create_foreground_object(FOBJ_TUNNEL, 0, 7150)]));
	ds_list_add(global.tracks[3], create_segment(7500, 500, 0, [create_object(OBJ_ROADBLOCK, 24, 7650), create_object(OBJ_SPACEHOLE, 20, 7800)]));
}

function create_segment(_start, _length, _curve, _objects_array=[], _foreground_objects=[]){
	var _map = ds_map_create();
	ds_map_replace(_map, "start", _start);
	ds_map_replace(_map, "length", _length);
	ds_map_replace(_map, "curve", _curve);
	ds_map_replace(_map, "objects", _objects_array);
	ds_map_replace(_map, "foreground_objects", _foreground_objects);
	return _map;
}

function create_object(_type, _x, _distance, _mudlength=0){
	var _struct = {
		type : _type,	
		x : _x,
		distance : _distance,
		mudlength :  _mudlength,
	};
	return _struct;
}

function create_foreground_object(_type, _x, _distance){
	var _struct = {
		type : _type,	
		x : _x,
		distance : _distance,
	};
	return _struct;
}

function get_object_collision(_struct){
	var _type, _x, _colleft, _dist, _width, _collright, _height, _mudlength;
	_type = struct_get(_struct, "type");
	_x = struct_get(_struct, "x");
	_dist = struct_get(_struct, "distance");
	_mudlength = struct_get(_struct, "mudlength");
	
	var _spr = get_object_sprite(_type);
	if(_spr!=-1)
	{
		_colleft = sprite_get_bbox_left(_spr);
		_width = sprite_get_width(_spr);
		_collright = sprite_get_bbox_right(_spr);
		_height = sprite_get_height(_spr);
	}
	else if (_type==OBJ_MUD)
	{
		_colleft = 2;
		_collright = 20;
		_width = 20;
		_height = _mudlength;
	}
	
	var _collstruct = {
		type : _type,
		x : _x+obj_track.track_left,
		y : obj_track.distance-_dist,
		colleft : _x+_colleft+obj_track.track_left,
		collright : _x+_collright+obj_track.track_left,
		distance : _dist,
		width : _width,
		height : _height,
		mudlength : _mudlength,
	};
	return _collstruct;
}

function get_object_sprite(_type)
{
	switch(_type)
	{
		case OBJ_FINISHLINE:
			return spr_finishline;
		case OBJ_ROADBLOCK:
			return spr_roadblock;
		case OBJ_JUMPER:
			return spr_jumper;
		case OBJ_BOOSTER:
			return spr_booster;
		case OBJ_COIN:
			return spr_coin;
		case OBJ_SPACEHOLE:
			return spr_spacehole;
		case OBJ_OIL:
			return spr_oil;
		case OBJ_LEAFPILE:
			return spr_leafpile;
	}
	return -1;
}

function get_track_length(_track){
	var _map = ds_list_find_value(global.tracks[_track], ds_list_size(global.tracks[_track])-1);
	return _map[? "start"] + _map[? "length"];
}

function get_track_name(_track){
	switch(_track)
	{
		case 0: default: return "GROUND";
		case 1: return "JUNGLE";
		case 2: return "SKY";
		case 3: return "SPACE";
	}
}