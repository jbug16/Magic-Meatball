// make new order
if (ordering == true)
{
	var customer_order = new order(randomOrder());
	array_push(list_of_orders, customer_order);
	show_debug_message("order: " + string(customer_order)); // debug purposes
}