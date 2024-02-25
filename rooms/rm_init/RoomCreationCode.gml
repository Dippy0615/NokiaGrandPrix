init_tracks();
global.track = 0;
global.background = bg_sky;
global.coins = 0;
global.car = 0;
var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 $€£¥¤+-*/=%\"'#@&_(),.;:?!\|{}<>[]'^~";
global.fnt_classic = font_add_sprite_ext(spr_classic_font, str, false, 0);
global.shop_items = [
	{type : 0, name : "CYBER-TRUCK", sprite : spr_car, frame : 3, price : 3},
	{type : 0, name : "SUPER-KART", sprite : spr_car, frame : 6, price : 4},
];
global.cars = [true, false, false];
global.prev_room = -1;
ini_open(INIFILE);
global.scale = ini_read_real("Video", "Scale", 12);
global.name = ini_read_string("Game", "Name", "");
ini_close();

if(global.name==""){
	room_goto(rm_name);
}
global.highscore = -1;
global.sound = -1;
instance_create_depth(0, 0, 0, obj_system);
window_scale(global.scale);
if(global.name!="") room_goto(rm_title);