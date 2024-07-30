if (mouse_check_button_pressed(mb_left))
{
	if (room == rmBegin) 
	{
		room_goto(rmMenu);
		// Audio
		var _callback = function()
		{
		    jukebox_play_song(sndTitle, 0, 4000, true);
		}
		var _handle = call_later(0.1, time_source_units_seconds, _callback);
	}
}