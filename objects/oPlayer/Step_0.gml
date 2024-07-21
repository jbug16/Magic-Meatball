#region Movement

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var _xspd = (_right - _left);
var _yspd = (_down - _up);

if (_xspd != 0) {
	facing_right = bool(sign(_xspd));
}

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

var _pickupList = ds_list_create();
var _pickupCount = collision_circle_list(x, y, pickup_radius, oPickupParent, false, true, _pickupList, true);

if (_pickupCount > 0)
{
	// find the first item that isnt the one we are holding
	for (var i = 0; i < _pickupCount; i++) 
	{
		if (_pickupList[| i] != item) 
		{	
			// set item as focus (meaning we draw the e above it and let the player pick it up)
			focusitem = _pickupList[| i];
			break;
		}
	}
} 
else 
{
	focusitem = noone
}

// Interaction key
var _pickup = keyboard_check_pressed(ord("E"));

if (_pickup) {
	
	var _previtem = item;
	
	// holding item?
	if (item != noone)
	{
		item.x = x - sprite_width/4;
		item.y = y;
		// drop item
		_previtem = item;
		item = noone;
	}
	
	if (_pickupCount > 0)
	{
		// find the first item that isnt the one we were just holding
		item = focusitem;
		focusitem = noone;
	}
}

ds_list_destroy(_pickupList);

if (item)
{
	item.x = x - sprite_width/4;
	item.y = y - sprite_height - item.sprite_height;
}

#endregion