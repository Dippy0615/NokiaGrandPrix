/// @description Draw particles
for(var i=0;i<array_length(particles);i++)
{
	var _part, _type, _x, _y, _dX, _dY, _frame;
	_part = particles[i];
	_type = struct_get(_part, "type");
	_x = struct_get(_part, "x");
	_y = struct_get(_part, "y");
	_frame = struct_get(_part, "frame");
	
	switch(_type)
	{
		case PART_COIN: case PART_HIT:
			draw_point_color(_x, _y, COLOR_DARK);
			break;
		case PART_FALLOUT:
			draw_sprite(spr_fallout, _frame, _x, _y);
			break;
		case PART_LEAF:
			draw_sprite(spr_leafparticle, _frame, _x, _y);
			break;
	}
}