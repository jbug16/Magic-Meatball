#region Movement

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var _xspd = (_right - _left);
var _yspd = (_down - _up);

// Diagonal movement calculations
if (_xspd != 0 and _yspd != 0) {
	_xspd *= vspd * 0.707;
	_yspd *= hspd * 0.707;
} else {
	_xspd *= vspd;
	_yspd *= hspd;
}

var _c = find_next_position_with_collision(x, y, _xspd, _yspd);
var _nextx = _c[0];
var _nexty = _c[1];

if (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx, _nexty) != 0) {
	depth = tilemap_depth + 10
}
if (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx, _nexty - sprite_height) != 0) {
	depth = tilemap_depth - 10
}

x = _nextx;
y = _nexty;

#endregion

#region Pickup Items

// Interaction key
var _pickup = keyboard_check_pressed(ord("E"));

if (_pickup)
{
	var _pickupList = ds_list_create();
	var _pickupCount = collision_circle_list(x, y, pickup_radius, oPickupParent, false, true, _pickupList, true);
	
	if (_pickupCount > 0)
	{
		// first we need to know if we are already holding an item
		if (item == noone) 
		{
			item = _pickupList[| 0];
			
			item.target = id;
			item.is_being_carried = true;
		}
		else
		{
			// we are holding an item
			for (var i = 0; i < _pickupCount; i++)
			{
				if (_pickupList[| i] != item)
				{
					// drop original item
					item.target = noone;
					item.is_being_carried = false;
					
					// pickup new item
					item = _pickupList[| i];
					item.target = id;
					item.is_being_carried = true;
					
					break;
				}
			}
		}
	}
	
	ds_list_destroy(_pickupList);
}

#endregion