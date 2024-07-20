//~~ MOVEMENT ~~//

spd = 5;

c_w = sprite_width;
c_h = sprite_height/3;

facing = 0;

KITCHEN_TILEMAP = layer_tilemap_get_id(layer_get_id("KITCHEN_TILEMAP"));
tilemap_w = tilemap_get_tile_width(KITCHEN_TILEMAP);
tilemap_h = tilemap_get_tile_height(KITCHEN_TILEMAP);

function find_next_position_with_collision(_x, _y, _xspd, _yspd) {
	var _nextx = _x + _xspd
	var _nexty = _y + _yspd
	
	if (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _nexty) == 1)
	or (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _y - c_h) == 1)
	or (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty) == 1)
	or (tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty - c_h) == 1) {
		var _returnx = _x
		var _returny = _y
		if (_xspd < 0) {
			_returnx = floor(_x / tilemap_w) * tilemap_w + c_w/2;
		} else if (_xspd > 0) {
			_returnx = floor(_x / tilemap_w + 1) * tilemap_w - c_w/2;
		}
		if (_yspd < 0) {
			_returny = floor(_y / tilemap_h) * tilemap_h + c_h;
		} else if (_yspd > 0) {
			_returny = floor(_y / tilemap_h + 1) * tilemap_h - c_h;
		}
		return [_returnx, _returny]
	}
	
	return [_nextx, _nexty]
}

