/// @description Draw computer
if(state==1 && current_time mod 4 == 0) exit; 

draw_sprite_ext(
sprite_index, image_index+(global.car*3), floor(x-trackdist+sin(degtorad(curve)*12)), floor(y)-(distance-obj_track.distance),
floor(max(1, z/4)), floor(max(1, z/4)), 0, image_blend, image_alpha
);