#region Movement

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var _x = (_right - _left);
var _y = (_down - _up);

// Diagonal movement calculations
if (_x != 0 and _y != 0) {
	xspd = _x * hspd * 0.707;
	yspd = _y * vspd * 0.707;
} else {
	xspd = _x * hspd;
	yspd = _y * vspd;
}

// Collisions
if (place_meeting(x + xspd, y, oWall)) {
	while (!place_meeting(x + sign(xspd), y, oWall)) {
		x += sign(xspd);
	}
	xspd = 0;
}

if (place_meeting(x, y + yspd, oWall)) {
	while (!place_meeting(x, y + sign(yspd), oWall)) {
		y += sign(yspd);
	}
	yspd = 0;
}

// Apply movement
x += xspd;
y += yspd;

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