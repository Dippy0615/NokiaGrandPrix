/// @description Update transition
if(mode==0)
{
	rect_right+=transition_speed;
	if(rect_right>WIDTH+24){
		global.prev_room = room;
		room_goto(goto);
		mode = 1;
	}
}
else
{
	rect_right-=transition_speed;
	if(rect_right<0){
		instance_destroy();
	}
}