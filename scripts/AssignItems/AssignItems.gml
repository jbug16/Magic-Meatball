function avialableFoodItems()
{
	coffee_bean = sCoffeeBean;
	dough = sDough;
	pasta_box = sPastaBox;
	lettuce = sLettuce;
}

function randomFoodItem()
{
	avialableFoodItems();
	
	// list of potential food items
	food_items = [
		coffee_bean,
		dough, 
		pasta_box,
		lettuce
	];
	
	// random index selected
	var _random_index = irandom_range(0, array_length(food_items) - 1);
	
	// find food of that index
	var _order = food_items[_random_index];
	
	return _order;
}

function avialablePotionItems()
{
	shell = sShell;
	moss = sMoss;
	dust = sDust;
	slime = sSlime;
}

function randomPotionItem()
{
	avialablePotionItems();
	
	// list of potential food items
	potion_items = [
		shell,
		moss, 
		dust,
		slime
	];
	
	// random index selected
	var _random_index = irandom_range(0, array_length(potion_items) - 1);
	
	// find food of that index
	var _order = potion_items[_random_index];
	
	return _order;
}