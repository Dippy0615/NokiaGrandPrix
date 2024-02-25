/// @description Init track
time = 0;
track_left = 21;
track_right = 63;
curve = 0;
distance = 0;
background = layer_get_id("Background");
var bg = layer_background_get_id(background);
layer_background_htiled(bg, true);
layer_background_vtiled(bg, true);
layer_background_change(bg, global.background);
current_segment = 0;
segment_index = 0;
draw_sign = false;