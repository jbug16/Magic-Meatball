// Movement
vspd = 5;
hspd = 5;

// Pickup items
item = noone;
pickup_radius = 100;

c_w = sprite_width;
c_h = sprite_height/2;

facing = 0;

KITCHEN_TILEMAP = layer_tilemap_get_id(layer_get_id("KITCHEN_TILEMAP"));
tilemap_w = tilemap_get_tile_width(KITCHEN_TILEMAP);
tilemap_h = 64;

function find_next_position_with_collision(_x, _y, _xspd, _yspd) {
	var _nextx = _x + _xspd
	var _nexty = _y + _yspd
	
	var bottomleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _nexty) == 1
	var topleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _y - c_h) == 1
	var bottomright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty) == 1
	var topright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty - c_h) == 1
	
	var _returnx = _nextx
	var _returny = _nexty
	
	if (bottomleft and topleft) {
		_returnx = floor(_x / tilemap_w) * tilemap_w + c_w/2;
	} else if (bottomright and topright) {
		_returnx = floor(_x / tilemap_w + 1) * tilemap_w - c_w/2;
	}
	if (topleft and topright) {
		_returny = floor(_y / tilemap_h) * tilemap_h + c_h - 1;
	} else if (bottomleft and bottomright) {
		_returny = floor(_y / tilemap_h + 1) * tilemap_h - 1;
	}
	
	return [_returnx, _returny]
}

