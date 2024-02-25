/// @description Draw foreground objects
display_set_gui_size(WIDTH, HEIGHT);
var _foreground_objects = current_segment[? "foreground_objects"];
if(array_length(_foreground_objects)>0)
{
	for(var i=0;i<array_length(_foreground_objects);i++)
	{
		var _obj, _type, _x, _dist;
		_obj = _foreground_objects[i];
		_type = struct_get(_obj, "type");
		_x = struct_get(_obj, "x");
		_dist = struct_get(_obj, "distance");
		
		switch(_type)
		{
			case FOBJ_TUNNEL:
				draw_sprite_ext(spr_tunnel, 0, floor(_x), (floor(distance-_dist)-48),
					1, 1, 0, image_blend, 1
				);
				break;
			case FOBJ_LEAVES:
				draw_sprite_ext(spr_leaves, 0, floor(_x), (floor(distance-_dist)-48),
					1, 1, 0, image_blend, 1
				);
				break;
			case FOBJ_CLOUD:
				draw_sprite_ext(spr_cloud, 0, floor(_x), (floor(distance-_dist)-48),
					1, 1, 0, image_blend, 1
				);
				break;
			case FOBJ_MOON:
				draw_sprite_ext(spr_moon, 0, floor(_x), (floor(distance-_dist)-48),
					1, 1, 0, image_blend, 1
				);
				break;
		}
		
	}
}