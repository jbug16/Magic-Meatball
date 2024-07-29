if (customer_order != noone)
{
	var _sprite = sBluePotion;
	
	switch (customer_order.item)
	{
		// NORMAL
		case "coffee":
			_sprite = sCoffee;
		break;
		case "pizza":
			_sprite = sPizza;
		break;
		case "pasta":
			_sprite = sPasta;
		break;
		case "salad":
			_sprite = sSalad;
		break;
		
		// SHADOW
		case "shell potion":
			_sprite = sBluePotion;
		break;
		case "moss potion":
			_sprite = sGreenPotion;
		break;
		case "slime potion":
			_sprite = sRedPotion;
		break;
		case "dust potion":
			_sprite = sPinkPotion;
		break;
	}
	
	draw_sprite(sBubble, 0, self.x - 2, self.y - 96);
	draw_sprite(_sprite, 0, self.x - 2, self.y - 96);
}