/// @description Draw player
if((state==1||state==3) && current_time mod 4 == 0) exit; 

draw_sprite_ext(
sprite_index, image_index+(global.car*3), floor(x-trackdist), floor(y),
floor(max(1, z/4)), floor(max(1, z/4)), 0, image_blend, image_alpha
);