function randomFoodOrder()
{
	// list of potential foods customer can order
	foods_to_order = [
		"coffee",
		"pizza",
		"pasta",
		"salad"
	];
	
	// random index selected
	var _random_index = irandom_range(0, array_length(foods_to_order) - 1);
	
	// find food of that index
	var _order = foods_to_order[_random_index];
	
	return _order;
}

function randomPotionOrder()
{
	// list of potential foods customer can order
	potions_to_order = [
		"shell potion",
		"slime potion",
		"moss potion",
		"dust potion"
	];
	
	// random index selected
	var _random_index = irandom_range(0, array_length(potions_to_order) - 1);
	
	// find food of that index
	var _order = potions_to_order[_random_index];
	
	return _order;
}

function order(item, id) constructor 
{
	self.item = item;
	self.id = id;
}

function addOrderToArray()
{
	array_push(list_of_orders, customer_order);
}

function isOrderCorrect(_customer)
{
	if (holdingObject == noone) return false;
	
    // get this customer's order
    var _order = _customer.customer_order.item;
	
	// get item in player's hand
	var _item_in_hand = self.holdingObject.item;
	
	// are these items the same?
	return (_order == _item_in_hand);
}

function completeOrder(_customer)
{
	// reset order
	with (_customer)
	{
		ordering = false;
		customer_order = noone;
		alarm[0] = 60;

		// find the id of the customer that ordered a certain item
		var _id = array_find_index(oOrderUI.list_of_orders, function(_val)
		{
			return _val.id == id;
		});
	
		// make sure there is an order from this customer
		if (_id != -1)
		{
			// delete their order
			array_delete(oOrderUI.list_of_orders, _id, 1);
		}
	}
	
	// add completed order to UI
	global.orders_completed++;
	
	// remove item from hand
	instance_destroy(self.holdingObject);
	self.holdingObject = noone;
}

function checkIfLastOrder()
{
	if (global.orders_completed == 2)
	{
		instance_create_depth(x, y, -999, oGameOverUI);
	}
}