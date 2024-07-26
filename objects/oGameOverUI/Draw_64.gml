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
		
		draw_rectangle_color(_view_midw - _box_size, _view_midh - _box_size, _view_midw + _box_size, _view_midh + _box_size, _col, _col, _col, _col, false);
		
		draw_set_font(-1);
		draw_set_color(c_white);
		
		draw_text(_view_midw - 190, _view_midh - 190, "You completed all the orders!");
		draw_text(_view_midw - 190, _view_midh - 170, "Time to Complete: " + string(global.time_to_complete));
		draw_text(_view_midw - 190, _view_midh - 150, "BEST Time: " + string(global.best_time));
		
		instance_create_depth(_view_midw, _view_midh + 50, -9999, oNext);
    }
}