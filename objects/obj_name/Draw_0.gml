/// @description 
draw_set_color(COLOR_DARK);
draw_set_font(fnt_efforts);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

if(!confirm) draw_text(WIDTH/2, 2, "ENTER YOUR NAME:");
else draw_text(WIDTH/2, 2, "ARE YOU SURE?");
if(!confirm) draw_text(WIDTH/2, HEIGHT-12, "Z: SUBMIT");
else  draw_text(WIDTH/2, HEIGHT-12, "Z: SUBMIT X: BACK");


draw_set_halign(fa_left);

for(var i=0;i<name_max_length;i++){
	draw_text(WIDTH/2-14+(i*7), HEIGHT/2, "_");	
	draw_text(WIDTH/2-14+(i*7), HEIGHT/2-5, string_char_at(name, i+1));
}


draw_text_transformed(WIDTH/2-14+(pos*7), HEIGHT/2+3, "^", 1, -1, 0);
draw_text(WIDTH/2-14+(pos*7), HEIGHT/2+9, "^");