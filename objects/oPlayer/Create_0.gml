// Movement
vspd = 5;
hspd = 5;

// Pickup items
item = noone;
pickup_radius = 100;

c_x = 0
c_y = sprite_height*0.3; // y is up from the bottom of the sprite
c_w = sprite_width;
//c_h = sprite_height/4; // height adds up from the y

facing = 0;

KITCHEN_TILEMAP_LAYER = layer_get_id("KITCHEN_TILEMAP")
KITCHEN_TILEMAP = layer_tilemap_get_id(KITCHEN_TILEMAP_LAYER);
tilemap_w = tilemap_get_tile_width(KITCHEN_TILEMAP);
tilemap_h = 64;
tilemap_depth = layer_get_depth(KITCHEN_TILEMAP_LAYER);

function find_next_position_with_collision(_x, _y, _xspd, _yspd) {
	var _nextx = _x + _xspd
	var _nexty = _y + _yspd
	
	var xleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _y - c_y) == 1
	var yleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _x - c_w/2, _nexty - c_y) == 1
	var xright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _y - c_y) == 1
	var yright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _x + c_w/2 - 1, _nexty - c_y) == 1
	
	var _returnx = _nextx
	var _returny = _nexty
	
	if (xleft) {
		_returnx = floor(_x / tilemap_w) * tilemap_w + c_w/2;
	} else if (xright) {
		_returnx = floor(_x / tilemap_w + 1) * tilemap_w - c_w/2;
	}
	if (yleft and yright) {
		if (_yspd < 0) {
			_returny = floor(_y / tilemap_h) * tilemap_h + 1 + c_y;
		} else if (_yspd > 0) {
			_returny = floor(_y / tilemap_h) * tilemap_h - 1 + c_y;
		}
	}
	
	if vspd > 1 {
	show_debug_message(string(bool(xleft))+", "+string(bool(yleft))+", "+string(bool(xright))+", "+string(bool(yright)))
	}
	return [_returnx, _returny]
}

