/// @description Init player
image_speed = 0;
angle = 0;

state = 0; // 0 = normal, 1 = hit, 2 = fall, 3 = oil/leafpile

hit_delay = 0;

car_speed = 0;
car_accel = .15;
car_deccel = -.35;
car_max_speed_normal = 40;
car_max_speed_mud = 13;
car_max_speed = car_max_speed_normal;

trackdist = 0; //distance from the center of the track

z = 1;
dZ = 0;