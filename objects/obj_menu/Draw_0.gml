/// @description Draw menu

//header
draw_set_color(COLOR_DARK);
draw_rectangle(floor(camera_get_view_x(view_camera[0])+0), 0, floor(camera_get_view_x(view_camera[0])+WIDTH), 8, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(COLOR_LIGHT);
draw_set_font(global.fnt_classic);
draw_text(floor(camera_get_view_x(view_camera[0])+header_x), 0, header);

draw_set_color(COLOR_DARK);
draw_set_halign(fa_center);
draw_set_font(fnt_efforts);
draw_text(floor(camera_get_view_x(view_camera[0])+4+sin(current_time/64)), HEIGHT/2-7, "<");
draw_text(floor(camera_get_view_x(view_camera[0])+WIDTH-4-sin(current_time/64)), HEIGHT/2-7, ">");

//menu
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(COLOR_DARK);
draw_set_font(fnt_efforts);

for(var i=0;i<array_length(options);i++)
{
	draw_text_shadow(WIDTH/2+(i*84), HEIGHT/2, options[i]);	
}