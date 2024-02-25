// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_highscores(){
	global.highscore = array_create(4);
	
	global.highscore[0] = ds_list_create();
	add_highscore(0, "JONES", 6680);
	add_highscore(0, "ALAN", 9420);
	add_highscore(0, "JAKE", 10800);
	
	global.highscore[1] = ds_list_create();
	add_highscore(1, "JONES", 4320);
	add_highscore(1, "ALAN", 5760);
	add_highscore(1, "JAKE", 8020);
	
	global.highscore[2] = ds_list_create();
	add_highscore(2, "JONES", 6080);
	add_highscore(2, "ALAN", 6860);
	add_highscore(2, "JAKE", 8640);
	
	global.highscore[3] = ds_list_create();
	add_highscore(3, "JONES", 7200);
	add_highscore(3, "ALAN", 8560);
	add_highscore(3, "JAKE", 9900);
}

function add_highscore(_track, _name, _time){
	//search for existing score from player
	var _pos = -1;
	
	for(var i=0;i<ds_list_size(global.highscore[_track]);i++){
		var _score, _scorename;
		_score = ds_list_find_value(global.highscore[_track], i);
		_scorename = struct_get(_score, "name");
		if(_scorename!=global.name) continue;
		else{
			_pos = i;
			break;
		}
	}
	
	//add highscore
	if(_pos>-1){
		ds_list_replace(global.highscore[_track], _pos, {time : _time, name : _name});
	}
	else ds_list_add(global.highscore[_track], {time : _time, name : _name});
}