/// @description Draw the entire track
var _x, _y;


var _center = sin(degtorad(curve))*12;

//track
draw_sprite_ext(
sprite_index, image_index, floor(x-(_center)), floor(y),
image_xscale, image_yscale, curve, image_blend, image_alpha
);

//objects
var _objects = current_segment[? "objects"];
if(array_length(_objects)>0)
{
	for(var i=0; i<array_length(_objects);i++)
	{
		var _obj, _type, _dist, _x, _mudlength;
		_obj = _objects[i];
		_type = struct_get(_obj, "type");
		_dist = struct_get(_obj, "distance");
		_x = struct_get(_obj, "x");
		_mudlength = struct_get(_obj, "mudlength");
		
		if(_type==OBJ_FINISHLINE)
		{
			draw_sprite_ext(spr_finishline, 0, floor(track_left+_x), floor(distance-_dist-_center),
				1, -1, curve, image_blend, 1
			);
		}
		
		if(_type==OBJ_SPACEHOLE)
		{
			draw_sprite_ext(spr_spacehole, 0, floor((track_left+_x)), floor(distance-_dist),
			1, 1, 0, image_blend, 1
			);
		}
		
		if(distance>=_dist)
		{
			switch(_type)
			{
				case OBJ_ROADBLOCK:
					draw_sprite_ext(spr_roadblock, 0, floor((track_left+_x)), floor(distance-_dist),
					1, 1, 0, image_blend, 1
					);
					break;
				case OBJ_MUD:
					draw_rectangle_color(floor(track_left+_x), floor(distance-_dist), floor(track_left+_x+20), floor(distance-_dist-_mudlength),
					COLOR_DARK, COLOR_DARK, COLOR_DARK, COLOR_DARK, false
					);
					break;
				case OBJ_JUMPER:
					draw_sprite_ext(spr_jumper, 0, floor(track_left+_x), floor(distance-_dist),
					1, 1, curve, image_blend, 1
					);
					break;
				case OBJ_BOOSTER:
					draw_sprite_ext(spr_booster, (floor(current_time/32)%12), floor(track_left+_x), floor(distance-_dist),
					1, 1, curve, image_blend, 1
					);
					break;
				case OBJ_COIN:
					draw_sprite_ext(spr_coin, (floor(current_time/48)%3), floor((track_left+_x)), floor(distance-_dist),
					1, 1, 0, image_blend, 1
					);
					break;
				case OBJ_OIL:
					draw_sprite_ext(spr_oil, 0, floor((track_left+_x)), floor(distance-_dist),
					1, 1, 0, image_blend, 1
					);
					break;
				case OBJ_LEAFPILE:
					draw_sprite_ext(spr_leafpile, 0, floor((track_left+_x)), floor(distance-_dist),
					1, 1, 0, image_blend, 1
					);
					break;
			}
		}
		else
		{
			//warning signs
			if(abs(distance-_dist)<100)
			{
				if(_type!=OBJ_JUMPER&&_type!=OBJ_BOOSTER&&_type!=OBJ_COIN&&_type!=OBJ_SPACEHOLE) 
				{
					if(_type!=OBJ_FINISHLINE)
					{
						if(draw_sign) 
							draw_sprite(spr_warningsign, 0, floor((track_left+_x)+4), 6);
					}
				}
				else 
				{
					if(_type!=OBJ_SPACEHOLE)
					{
						if(_type!=OBJ_COIN)
						{
							if(draw_sign) draw_sprite(spr_jumpersign, 0, floor((track_left+_x)+4), 6);
						}
						else
						{
							if(draw_sign) draw_sprite(spr_coin, 0, floor((track_left+_x)), 3);
						}
					}
				}
			}
		}
	}
}