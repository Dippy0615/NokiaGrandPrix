// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function get_player_collision(_playerobj){
	var _collstruct;
	var _px = _playerobj.x-_playerobj.trackdist-4;
	var _dist = obj_track.distance;
	if(object_index==obj_cpu) _dist = distance;
	
	_collstruct = {
		x : _px,
		y : _playerobj.y,
		colleft : _px+1,
		collright : _px+6,
		distance : _dist,
		width : _playerobj.bbox_right - _playerobj.bbox_left,
		height : _playerobj.bbox_bottom - _playerobj.bbox_top,
	};
	return _collstruct;
}

function track_place_meeting(_coll, _playercoll){
	var _type = struct_get(_coll, "type");
	var w1, h1, w2, h2;
	var x1_1, x1_2, x2_1, x2_2;
	var y1_1, y1_2, y2_1, y2_2;
	
	if(_type!=OBJ_MUD)
	{
		w1 = struct_get(_coll, "width");
		h1 = struct_get(_coll, "height");
		x1_1 = struct_get(_coll, "colleft"); //left side
		y1_1 = obj_track.distance-struct_get(_coll, "distance"); //top side
		x1_2 = struct_get(_coll, "collright"); //right side
		y1_2 = y1_1+h1; //bottom side
	}
	else
	{
		w1 = struct_get(_coll, "width");
		h1 = struct_get(_coll, "height");
		x1_1 = struct_get(_coll, "colleft"); //left side
		y1_1 = obj_track.distance-struct_get(_coll, "distance")-struct_get(_coll, "mudlength"); //top side
		x1_2 = struct_get(_coll, "collright"); //right side
		y1_2 = obj_track.distance-struct_get(_coll, "distance"); //bottom side
	}
	
	w2 = struct_get(_playercoll, "width");
	h2 = struct_get(_playercoll, "height");
	x2_1 = struct_get(_playercoll, "colleft"); //left side
	y2_1 = struct_get(_playercoll, "y"); //top side
	x2_2 = x2_1+w2; //right side
	y2_2 = y2_1+h2; //bottom side
	
	if(x1_1>x2_2) return -1; //left side > right side
	if(x1_2<x2_1) return -1; //right side < left side
	if(y1_1>y2_2) return -1; //top side > bottom side
	if(y1_2<y2_1) return -1; //bottom side < top side

	return _type;
}