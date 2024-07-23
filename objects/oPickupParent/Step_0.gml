if (interaction_object != noone) 
{
	if (collision_circle(x, y, popup_radius, oPlayer, false, true) != noone) 
	{
		interaction_object_visible = true;
	} 
	else 
	{
		interaction_object_visible = false;
	}
}
	
if (is_being_carried) 
{
	interaction_object_visible = false;
	self.x = x;
	self.y = y + 128;
}
