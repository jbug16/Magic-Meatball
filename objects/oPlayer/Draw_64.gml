// Draw outline around the hovered item
if (hoveredItem != noone) 
{
	var _outline_thickness = 3;
    var _item_x = hoveredItem.x;
    var _item_y = hoveredItem.y;
    var _item_width = sprite_get_width(hoveredItem.sprite_index);
    var _item_height = sprite_get_height(hoveredItem.sprite_index);

    draw_set_color(c_white);
    draw_set_alpha(1);
	
	
    for (var i = 0; i < _outline_thickness; i++) 
	{
        draw_rectangle(
            _item_x - i,
            _item_y - i,
            _item_x + _item_width + i - 1,
            _item_y + _item_height + i - 1,
            true
        );
	}
}