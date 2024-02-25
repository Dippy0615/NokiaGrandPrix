/// @description Draw highscores
draw_set_color(COLOR_DARK);

draw_rectangle(5, 2, WIDTH-5, HEIGHT-2, false);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_font(global.fnt_classic);
draw_set_color(COLOR_LIGHT);
draw_text(WIDTH/2, 3, "HIGHSCORES");

draw_set_font(fnt_efforts);
for(var i=0;i<ds_list_size(global.highscore[track]);i++){
	var _struct, _name, _time;
	_struct = ds_list_find_value(global.highscore[track], i);
	_name = struct_get(_struct, "name");
	_time = struct_get(_struct, "time");
	
	draw_set_halign(fa_left);
	draw_text_transformed(6, 6+(i*8), _name, 1, 1, 0);
	draw_set_halign(fa_right);
	draw_text_transformed(WIDTH-5, 6+(i*8), get_time_string(_time), 1, 1, 0);
}

if(global.prev_room==rm_menu){
	draw_set_halign(fa_center);
	draw_text_shadow(floor(8+sin(current_time/64)), HEIGHT/2-5, "<");
	draw_text_shadow(floor(WIDTH-6-sin(current_time/64)), HEIGHT/2-5, ">");	
	
	draw_text_shadow(WIDTH/2, HEIGHT-13, get_track_name(track));
}