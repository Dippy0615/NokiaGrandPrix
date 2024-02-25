/// @description Draw HUD
display_set_gui_size(WIDTH, HEIGHT);
draw_set_font(fnt_efforts);
draw_set_color(COLOR_DARK);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_shadow(2, 36, string(floor(obj_player.car_speed*5))+" MPH");

if(countdown)
{
	draw_set_halign(fa_center);
	draw_text_shadow(WIDTH/2, HEIGHT/2-10, string(ceil(obj_control.countdown_time/60)));
	draw_set_halign(fa_left);
}

if(show_lap)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(sin(current_time/64)>0) draw_text_shadow(WIDTH/2, HEIGHT/2, "LAP "+string(obj_control.lap));	
}

draw_rectangle(WIDTH-6, 46, WIDTH-3, 2, false);
draw_sprite(spr_icon, (current_time/256)%2, WIDTH-6, -floor(obj_track.distance/get_track_length(global.track)*40)+42);

if(finish>0)
{
	draw_set_halign(fa_center);
	if(finish==1){ 
		if(finish_time<60*3) draw_text_shadow(WIDTH/2, HEIGHT/2-10, "FINISH!");
		else draw_text_shadow(WIDTH/2, HEIGHT/2-10, get_time_string(race_time));
	}
	if(finish==2) draw_text_shadow(WIDTH/2, HEIGHT/2-10, "FALL OUT!");
}

if(freeze)
{
	var _left = 20;
	var _right = 62;
	draw_rectangle(_left, 4, _right, 42, false);
	draw_set_font(global.fnt_classic);
	draw_set_color(COLOR_LIGHT);
	draw_set_halign(fa_left);
	for(var i=0;i<array_length(options);i++)
	{
		var _opt = options[i];
		draw_text(_left, (i*12)+8, _opt);
		if(cursor==i) draw_text(_right-7, (i*12)+8, ">");
	}
}