if (paused == true)
{
	if (!surface_exists(paused_surf))
    {
		if (paused_surf == -1)
        {
			instance_deactivate_all(true);
			instance_activate_object(oGame);
        }
		
	    paused_surf = surface_create(room_width, room_height);
	    surface_set_target(paused_surf);
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
	}
	else
	{
	    draw_surface(paused_surf, 0, 0);
	    draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
		
	    // draw high score UI 
		var _view_midw = surface_get_width(application_surface)/2;
		var _view_midh  = surface_get_height(application_surface)/2;
		var _box_size = 200;
		var _col = c_gray;
		
		//draw_rectangle_color(_view_midw - _box_size, _view_midh - _box_size, _view_midw + _box_size, _view_midh + _box_size, _col, _col, _col, _col, false
		draw_sprite(sNotepad, 0, _view_midw, _view_midh);
		
		draw_set_font(fntUI);
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		var _current_time_string = seconds_to_timestamp(global.current_timer);
		var _highscore_string = seconds_to_timestamp(global.room_highscores[$ room_get_name(room)].time);
		
		draw_text(_view_midw , _view_midh - 128, "Current Time: " + _current_time_string);
		draw_text(_view_midw, _view_midh, "BEST Time: " + _highscore_string);
		
		instance_create_depth(_view_midw, _view_midh + 256, -9999, oAgain);
    }
}