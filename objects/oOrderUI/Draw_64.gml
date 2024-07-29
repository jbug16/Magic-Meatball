/*
// draw order box
var _col = c_maroon;
draw_rectangle_color(1400, 30, 1550, 350, _col, _col, _col, _col, false);

// draw title
var _padding = 5;
draw_set_font(fntUI); // set to default font for now
draw_text(1400 + _padding, 30, "Orders: ");

// draw current orders
for (var i = 0; i < array_length(list_of_orders); i++)
{
	var _p = 20 * (i + 1);
	draw_text(1400 + _padding, 30 + _p, list_of_orders[i].item);
}
*/

// draw orders completed
draw_set_font(fntUI);
draw_text(936, -6, string(global.orders_completed) + "/15");