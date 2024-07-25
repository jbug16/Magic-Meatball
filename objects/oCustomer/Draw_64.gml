if (customer_order != noone)
{
	var _sprite = sPotionItem;
	if (customer_order.item == "coffee") _sprite = sFoodItem;
	draw_sprite(_sprite, 0, self.x - 16, self.y - 96);
}