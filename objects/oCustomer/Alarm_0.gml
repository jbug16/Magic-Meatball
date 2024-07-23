// make new order
if (ordering == true)
{
	customer_order = new order(randomOrder(), id);
	array_push(oOrderUI.list_of_orders, customer_order);
	show_debug_message("order: " + string(customer_order)); // debug purposes
}