/// @description Draw some shop text
display_set_gui_size(WIDTH, HEIGHT);
draw_set_font(fnt_efforts);
draw_set_valign(fa_middle);

draw_set_halign(fa_left);
draw_text(2, 3, "X: EXIT");
if(!cars) draw_text(2, 9, "UP: CARS");
	else draw_text(2, 9, "DOWN: SHOP");

draw_set_halign(fa_center);
draw_text(floor(4+sin(current_time/64)), HEIGHT/2-5, "<");
draw_text(floor(WIDTH-4-sin(current_time/64)), HEIGHT/2-5, ">");