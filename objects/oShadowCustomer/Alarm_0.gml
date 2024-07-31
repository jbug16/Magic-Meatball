// make new order
if (ordering == true)
{
	type_of_order = randomPotionOrder();
	customer_order = new order(type_of_order, id);
	array_push(oOrderUI.list_of_orders, customer_order);
	show_debug_message("order: " + string(customer_order)); // debug purposes
}