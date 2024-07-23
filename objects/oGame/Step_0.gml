// check if player's are in the game
if (instance_exists(oPlayer) and instance_exists(oShadowPlayer))
{
	// get normal player's distance from mouse
	var _player_dis = point_distance(mouse_x, mouse_y, oPlayer.x, oPlayer.y);
	// get shadow player's distance from mouse
	var _shadow_dis = point_distance(mouse_x, mouse_y, oShadowPlayer.x, oShadowPlayer.y);
	
	// set which player is closest
	if (_player_dis < _shadow_dis)
	{
		global.closest_player = oPlayer;
	}
	else
	{
		global.closest_player = oShadowPlayer;
	}
}