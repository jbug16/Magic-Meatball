switch (room)
{
	case rmMenu:
		if (!audio_is_playing(sndTitle)) audio_play_sound(sndTitle, 1, true);
	break;
	
	case rmMain:
		audio_stop_all();
		if (!audio_is_playing(sndCooking)) audio_play_sound(sndCooking, 1, true);
	break;
}