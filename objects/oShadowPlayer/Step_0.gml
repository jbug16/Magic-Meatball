#region Movement

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
xspd = (_right - _left);
yspd = (_down - _up);

// Diagonal movement calculations
if (xspd != 0 and yspd != 0) {
	xspd *= vspd * 0.707;
	yspd *= hspd * 0.707;
} else {
	xspd *= vspd;
	yspd *= hspd;
}

// Collisions
if (place_meeting(x + xspd, y, oWall)) 
{
	while (!place_meeting(x + sign(xspd), y, oWall)) 
	{
		x += sign(xspd);
	}
	
	xspd = 0;
}

if (place_meeting(x + xspd, y, oMirror)) 
{
	while (!place_meeting(x + sign(xspd), y, oMirror)) 
	{
		x += sign(xspd);
	}
	
	xspd = 0;
}

x += xspd;
	
if (place_meeting(x, y + yspd, oWall)) 
{
	while (!place_meeting(x, y + sign(yspd), oWall)) 
	{
		y += sign(yspd);
	}
	
	yspd = 0;
}

if (place_meeting(x, y + yspd, oMirror)) 
{
	while (!place_meeting(x, y + sign(yspd), oMirror)) 
	{
		y += sign(yspd);
	}
	
	yspd = 0;
}

y += yspd;

#endregion

#region Animations

// Idle
if (xspd == 0 and yspd == 0)
{
	sprite_index = idle;
} 
// Running
else 
{
	// Check which way they're facing
	if (xspd < 0)
    {
        xscale = -1;
    }
    else if (xspd > 0)
    {
        xscale = 1;
    }
	
	sprite_index = run;
}

#endregion

#region Pickup Item

var _item_near = instance_position(mouse_x, mouse_y, oPickupParent);
var _max_range = 128;

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
				
				audio_play_sound(sndItemPickup, 0.2, false);
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
		
		audio_play_sound(sndThrow, 0.2, false);
	}
}

hoveredItem = _item_near;

// Set coords for held item
if (holdingObject != noone and instance_exists(holdingObject))
{
	// Change item positions for player
	var _x_padding = 0;
	var _y_padding = 0;
	
	switch (sprite_index)
	{
		case idle:
			_x_padding = 0;
			_y_padding = 0;
		break;
		
		case run:
		
			_y_padding = 48;
		
			if (xscale == 1) // right
			{
				_x_padding = 24;
			}
			else // left
			{
				_x_padding = -24;
			}
		break;
	}
	
	holdingObject.x = x + _x_padding;
	holdingObject.y = y + _y_padding;
	
	holdingObject.z = 96;
	holdingObject.dz = 0;
}

#endregion

#region Complete Order

var _customer_near = instance_position(mouse_x, mouse_y, oShadowCustomer);
var _completion_range = 230;

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
				checkIfLastOrder();
				
				audio_play_sound(sndCorrectOrder, 0.2, false);
			}
			else
			{
				audio_play_sound(sndWrongOrder, 0.2, false);
			}
		}
	}
}

#endregion

#region Make items

// Check if mouse is over any instance of oMachineParent or its children
clicked_machine = instance_position(mouse_x, mouse_y, oShadowMachineParent);
var _range = 100;

if (clicked_machine != noone)
{
	if (mouse_check_button_pressed(mb_right)) 
	{
		var _distance_to_machine = point_distance(x, y, clicked_machine.x, clicked_machine.y);
		
		// Check if player is within range
	    if (_distance_to_machine < _range)
	    {
			// if no item is available for pick up
	        if (clicked_machine.item_for_pickup == noone)
	        {
	            // if player is holding an item
	            if (holdingObject != noone)
	            {
	                // if player is holding correct item
	                if (holdingObject.sprite_index == clicked_machine.item_needed)
	                {
	                    // remove item from hand
	                    instance_destroy(holdingObject);
	                    holdingObject = noone;
            
	                    // after 5 seconds
	                    clicked_machine.alarm[0] = 100;
						
						audio_play_sound(sndCorrectMachine, 0.2, false);
	                }
					else
					{
						audio_play_sound(sndWrongMachine, 0.2, false);
					}
	            }
	        }
	        else
	        {
	            clicked_machine.item_for_pickup = noone;
	            clicked_machine.is_creating_recipe = false;
        
	            holdingObject = noone;
        
	            var inst = instance_create_layer(mouse_x, mouse_y, "Items", object_type);
	            inst.sprite_index = clicked_machine.recipe;
	            holdingObject = inst;
				
				audio_play_sound(sndItemPickup, 0.2, false);
	        }
	    }
	}
}

#endregion