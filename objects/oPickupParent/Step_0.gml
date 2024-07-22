if (interaction_object != noone) 
{
	if (collision_circle(x, y, popup_radius, oPlayer, false, true) != noone) 
	{
		interaction_object.visible = true;
	} 
	else 
	{
		interaction_object.visible = false;
	}
}
	
if (is_being_carried) 
{
	interaction_object.visible = false;
	interaction_object.x = x;
	interaction_object.y = y - 64;
}