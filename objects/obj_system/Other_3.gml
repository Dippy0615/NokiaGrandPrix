/// @description Save data & Cleanup
for(var i=0;i<array_length(global.tracks);i++)
{
	if(ds_exists(global.tracks[i], ds_type_list)) ds_list_destroy(global.tracks[i]);
}

for(var _i=0;_i<array_length(global.highscore);_i++){
	if(ds_exists(global.highscore[_i], ds_type_list)) ds_list_destroy(global.highscore[_i]);	
}

ini_open(INIFILE);
ini_write_real("Video", "Scale", global.scale);
ini_write_string("Game", "Name", global.name);
ini_close();