/// @description Draw title
draw_set_color(COLOR_DARK);
draw_set_font(global.fnt_classic);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_transformed(WIDTH/2, 5, "NOKIA", 1.5, 1.5, 0);
draw_set_font(fnt_efforts);
draw_text_transformed(WIDTH/2, 16, "GRAND PRIX!!", 1, 1, 0);

if(sin(current_time/64)>0) draw_text(WIDTH/2, HEIGHT/2+10, "PRESS Z");