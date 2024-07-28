if (paused == true)
{
	alarm[0]++;
	alarm[1]++;
}

//step event of the gui thing
var room_highscore = global.room_highscores[$ room_get_name(room)];

if (global.current_timer < room_highscore.time) 
{
	room_highscore.time = global.current_timer;
}