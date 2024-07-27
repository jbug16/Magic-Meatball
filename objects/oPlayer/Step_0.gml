#region Movement

var _dt = delta_time / 100000;

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var _xspd = (_right - _left)*_dt;
var _yspd = (_down - _up)*_dt;

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

#region Pickup Item

var _item_near = instance_position(mouse_x, mouse_y, oPickupParent);

var _max_range = 256;


// Check if player clicked on an object
if (mouse_check_button_pressed(mb_left)) 
{
	// Check if the player is not holding an object
	if (holdingObject == noone) 
	{
		// Check if player is hovering over object
		if (_item_near != noone) 
		{
			// Calculate the distance between the player and the clicked object
			var _distance_to_item = point_distance(x, y, _item_near.x, _item_near.y);
		
			// Check if the distance is within the max range
			if (_distance_to_item < _max_range) 
			{
				holdingObject = _item_near.id;
			}
		}
	} 
	// if player is holding an object
	else 
	{
		holdingObject.y = y;
		holdingObject.z = 128;
		
		holdingObject.dx = (mouse_x - holdingObject.x)/25;
		holdingObject.dy = (mouse_y - holdingObject.y)/25;
		
		holdingObject = noone;
	}
}

hoveredItem = _item_near;

// Set coords for held item
if (holdingObject != noone and instance_exists(holdingObject))
{
	holdingObject.x = x + 18;
	holdingObject.y = y;
	holdingObject.z = 96;
	holdingObject.dz = 0;
}

#endregion

#region Complete Order

var _customer_near = instance_position(mouse_x, mouse_y, oCustomer);
var _completion_range = 200;

// Check if player is hovering over a customer
if (_customer_near != noone)
{	
	// Check if player clicked on a customer
	if (mouse_check_button_pressed(mb_right)) 
	{
		// Calculate the distance between the player and customer
		var _distance_to_item = point_distance(x, y, _customer_near.x, _customer_near.y);
		
		// Check if the distance is within the max range
		if (_distance_to_item < _completion_range) 
		{
			if (isOrderCorrect(_customer_near))
			{
				completeOrder(_customer_near);
			}
		}
	}
}

#endregion