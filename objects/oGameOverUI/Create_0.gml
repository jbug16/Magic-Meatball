paused = true;
paused_surf = -1;

//if there is no high score for this room on the struct, make one and set it to zero:
var room_name = room_get_name(room);

if (struct_exists(global.room_highscores, room_name) == false) 
{
	global.room_highscores[$ room_name] = 
	{
		time : 10000
	};
}