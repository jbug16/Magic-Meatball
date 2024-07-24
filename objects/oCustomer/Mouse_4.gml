// resets order
// for debug purposes. acts for order complete function
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