/// @description 
draw_set_font(fnt_efforts);
draw_set_color(COLOR_DARK);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i=0;i<array_length(stages);i++)
{
	draw_text((i%2)*45+4, floor(i/2)*30, stages[i]);
	if(cursor==i) draw_text((i%2)*70+3, floor(i/2)*20+20, "^");
}

switch(cursor)
{
	case 0: default:
		draw_sprite(spr_groundlandscape, 0, WIDTH/2, HEIGHT/2);
		break;
	case 1:
		draw_sprite(spr_junglelandscape, 0, WIDTH/2, HEIGHT/2);
		break;
	case 2:
		draw_sprite(spr_skylandscape, 0, WIDTH/2, HEIGHT/2);
		break;
	case 3:
		draw_sprite(spr_spacelandscape, 0, WIDTH/2, HEIGHT/2);
		break;
}