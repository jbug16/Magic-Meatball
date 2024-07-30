if (room == rmMain)
{
	var lay_id = layer_get_id("Recipes");
	if (layer_get_visible(lay_id))
	{
	    layer_set_visible(lay_id, false);
	}
	else
	{
	    layer_set_visible(lay_id, true);
	}
}
else if (room == rmCutsceneTut)
{
	room_goto(rmMain);
}

audio_play_sound(sndButton, 1, false, 0.5);