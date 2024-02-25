/// @description Game control object
track = instance_create_depth(WIDTH/2, HEIGHT/2, 0, obj_track);
player = instance_create_depth(WIDTH/2, HEIGHT/1.45, -1, obj_player);
particles = instance_create_depth(0, 0, -2, obj_particles);
lap = 1;
show_lap = false;
finish = 0;
finish_time = 0;
freeze = false;
options = ["CONT.", "SHOP", "MENU"];
cursor = 0;
countdown = false;
countdown_time = 60*3;
racing = false;
race_time = 0;