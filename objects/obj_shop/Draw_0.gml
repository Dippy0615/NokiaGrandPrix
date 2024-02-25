/// @description Draw shop
draw_set_color(COLOR_DARK);
draw_set_font(fnt_efforts);
draw_set_valign(fa_middle);

draw_set_halign(fa_left);
draw_text(66, 3, string(global.coins));
draw_sprite(spr_coin, (floor(current_time/96)%3), 74, 1);

//shop
draw_set_halign(fa_center);
if(array_length(global.shop_items)>0)
{
	var _name, _sprite, _frame, _price;
	_name = struct_get(global.shop_items[current_item], "name");
	_sprite = struct_get(global.shop_items[current_item], "sprite");
	_frame = struct_get(global.shop_items[current_item], "frame");
	_price = struct_get(global.shop_items[current_item], "price");

	draw_sprite(_sprite, _frame, WIDTH/2, HEIGHT/2-5);
	draw_text(WIDTH/2, HEIGHT/1.5, _name);
	draw_text(WIDTH/2, HEIGHT/1.2, string(_price)+" COINS");
}
else
{
	draw_text(WIDTH/2, HEIGHT/2-3, "NO MORE ITEMS!");	
}
//cars
draw_sprite(spr_car, 0+(car*3), WIDTH/2, HEIGHT/2-5-48);
if(!global.cars[car]){
	draw_rectangle(WIDTH/2-15, HEIGHT/2-10-48, WIDTH/2+15, HEIGHT/2+5-48, false);	
}
if(global.cars[car]) draw_text(WIDTH/2, HEIGHT/1.5-48, get_car_name(car));
else draw_text(WIDTH/2, HEIGHT/1.5-48, "-LOCKED-");
if(global.car==car) draw_text(WIDTH/2, HEIGHT/1.2-48, "SELECTED");