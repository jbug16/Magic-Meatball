// Movement
vspd = 5;
hspd = 5;

// Pickup items
item = noone;
pickup_radius = 100;

c_x = 0
c_y = sprite_height*0.25; // y is up from the bottom of the sprite
c_w = sprite_width;
c_h = sprite_height/4; // height adds up from the y

facing = 0;

KITCHEN_TILEMAP_LAYER = layer_get_id("KITCHEN_TILEMAP")
KITCHEN_TILEMAP = layer_tilemap_get_id(KITCHEN_TILEMAP_LAYER);
tilemap_w = tilemap_get_tile_width(KITCHEN_TILEMAP);
tilemap_h = 64;
tilemap_depth = layer_get_depth(KITCHEN_TILEMAP_LAYER);

function find_next_position_with_collision(_x, _y, _xspd, _yspd) {
	var _nextx = _x + _xspd
	var _nexty = _y + _yspd
	
	var bottomleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _nexty - c_y) == 1
	var topleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _y - c_y - c_h) == 1
	var bottomright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty - c_y) == 1
	var topright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _nexty - c_y - c_h) == 1
	
	var _returnx = _nextx
	var _returny = _nexty
	
	if (bottomleft and topleft) {
		_returnx = floor(_x / tilemap_w) * tilemap_w + c_w/2;
	} else if (bottomright and topright) {
		_returnx = floor(_x / tilemap_w + 1) * tilemap_w - c_w/2;
	}
	if (topleft and topright) {
		_returny = floor(_y / tilemap_h) * tilemap_h + c_h - 1 + c_y;
	} else if (bottomleft and bottomright) {
		_returny = floor(_y / tilemap_h) * tilemap_h - 1 + c_y;
	}
	
	return [_returnx, _returny]
}

