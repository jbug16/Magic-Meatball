//// Draw outline around the hovered item
//if (hoveredItem != noone) 
//{
//	var _outline_thickness = 3;
//    var _item_x = hoveredItem.x;
//    var _item_y = hoveredItem.y - hoveredItem.z;
//    var _item_width = sprite_get_width(hoveredItem.sprite_index);
//    var _item_height = sprite_get_height(hoveredItem.sprite_index);
	
//	var _pixels_to_origin = 24;

//    draw_set_color(c_white);
//    draw_set_alpha(1);
	
//    for (var i = 0; i < _outline_thickness; i++) 
//	{
//        draw_rectangle(
//            _item_x - _item_width/2 - i,
//            _item_y - _item_height - i + _pixels_to_origin,
//            _item_x + _item_width/2 + i - 1,
//            _item_y + i - 1 + _pixels_to_origin,
//            true
//        );
//	}
//}