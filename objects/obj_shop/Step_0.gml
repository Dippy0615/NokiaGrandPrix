/// @description Update shop
if (instance_exists(obj_transition)) exit;

if(cars)
{
	camera_set_view_pos(view_camera[0], 0, lerp(camera_get_view_y(view_camera[0]), -48, .1));	
	if(keyboard_check_pressed(vk_down)){
		play_sound(snd_menu_move);
		cars = false;	
	}
}
else
{
	camera_set_view_pos(view_camera[0], 0, lerp(camera_get_view_y(view_camera[0]), 0, .1));		
}

if(keyboard_check_pressed(vk_left)){
	if(!cars)
	{
		if(array_length(global.shop_items)>0)
		{
			current_item--;
			if(current_item<0) current_item = array_length(global.shop_items)-1;
		}
	}
	else
	{
		car--;
		if(car<0) car = array_length(global.cars)-1;
	}
	play_sound(snd_menu_move);
}
if(keyboard_check_pressed(vk_right)){
	if(!cars)
	{
		if(array_length(global.shop_items)>0)
		{
			current_item++;
			if(current_item>array_length(global.shop_items)-1) current_item = 0;
		}
	}
	else
	{
		car++;
		if(car>array_length(global.cars)-1) car = 0;
	}
	play_sound(snd_menu_move);
}
if(keyboard_check_pressed(ord("Z"))){
	if(!cars)
	{
		if(array_length(global.shop_items)>0)
		{
			var _item, _type, _price, _name;
			_item = global.shop_items[current_item];	
			_price = struct_get(_item, "price");
			_name = struct_get(_item, "name");
			_type = struct_get(_item, "type");
	
			if(global.coins>=_price)
			{
				global.coins-=_price;
				if(_type==0)
				{
					if(_name=="CYBER-TRUCK") global.cars[1] = true;
					if(_name=="SUPER-KART") global.cars[2] = true;
				}
				array_delete(global.shop_items, current_item, 1);
				current_item = 0;
				play_sound(snd_select2);
			}
		}
	}
	else
	{
		if(global.cars[car]) global.car = car;
		play_sound(snd_select2);
	}
}
if(keyboard_check_pressed(vk_up)){
	if(!cars)
	{
		play_sound(snd_menu_move);
		cars = true;	
	}
}
if(keyboard_check_pressed(ord("X"))){
	if(global.prev_room==rm_game){
		play_sound(snd_menu_return);
		room_goto_transition(rm_stage_select);	
	}
	else room_goto_transition(rm_menu);
}