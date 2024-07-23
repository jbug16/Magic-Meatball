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