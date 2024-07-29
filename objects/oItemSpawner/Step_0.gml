// descrease timer
timer--;

// check if timer is up and spawns are not over max
if (timer <= 0 and spawns < spawnMax)
{
	// choose random x and y pos
	var _x = choose(irandom_range(350, 730), irandom_range(860, 1250));
	var _y = irandom_range(320, 650);
	
	// choose random item
	var _random_item = choose(oFoodItem, oPotionItem);
	
	// spawn new item
	instance_create_layer(_x, _y, "Items", _random_item);
	
	// reset timer
	timer = time;
	
	// increment spawns
	spawns++;
}