function randomOrder()
{
	// list of potential foods customer can order
	foods_to_order = [
		"glazed donut",
		"coffee",
		"carrot cake",
		"hot chocolate"
	];
	
	// random index selected and rounded down
	var _random_index = floor(random_range(0, array_length(foods_to_order)));
	
	// find food of that index
	var _order = foods_to_order[_random_index];
	
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

function completeOrder(_customer)
{
	with (_customer)
	{
		// resets order
		ordering = false;
		customer_order = noone;
		alarm[0] = 60;
	}

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