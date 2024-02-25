/// @description Update particles
for(var i=array_length(particles)-1;i>-1;i--)
{
	var _part, _type, _x, _y, _dX, _dY, _frame, _frames, _animspeed, _frame_counter;
	_part = particles[i];
	_type = struct_get(_part, "type");
	_x = struct_get(_part, "x");
	_y = struct_get(_part, "y");
	_dX = struct_get(_part, "dX");
	_dY = struct_get(_part, "dY");
	_frame = struct_get(_part, "frame");
	_frames = struct_get(_part, "frames");
	_animspeed = struct_get(_part, "animspeed");
	_frame_counter = struct_get(_part, "frame_counter");
	
	if(_x > WIDTH || _x < 0) array_delete(particles, i, 1);
	if(_y > HEIGHT || _y < 0) array_delete(particles, i, 1);
	
	switch(_type)
	{
		case PART_COIN: case PART_LEAF:
			struct_set(_part, "x", _x+_dX);
			struct_set(_part, "y", _y+_dY);
			struct_set(_part, "dY", _dY+.05);
			if(_type==PART_LEAF) animate_particle(_part, i, false);
			break;
		case PART_HIT:
			struct_set(_part, "x", _x+_dX);
			struct_set(_part, "y", _y+_dY);
			break;
		case PART_FALLOUT:
			animate_particle(_part, i, true);
			break;
	}
}