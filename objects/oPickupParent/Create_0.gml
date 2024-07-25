
z = 500;

dx = 0;
dy = 0;
dz = 0;

oncounter = false;


bounce = 0.55;
grav = 0.2;
fric = 0.97;
groundfric = 0.3;




// Tile collisions
c_x = 0;
c_y = 64; // y is up from the bottom of the sprite
c_w = sprite_width;
c_h = sprite_height;

KITCHEN_TILEMAP_LAYER = layer_get_id("KITCHEN_TILEMAP");
KITCHEN_TILEMAP = layer_tilemap_get_id(KITCHEN_TILEMAP_LAYER);
tilemap_w = tilemap_get_tile_width(KITCHEN_TILEMAP);
tilemap_h = 64
tilemap_depth = layer_get_depth(KITCHEN_TILEMAP_LAYER);

counter_height = 32;

function collision(_x, _y, _xspd, _yspd) {
	var _nextx = _x + _xspd;
	var _nexty = _y + _yspd;
	
	if (_yspd > 0) {
		_nexty += c_h;
	}
	
	var xleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx - c_w/2, _y - c_y) == 1;
	var yleft = tilemap_get_at_pixel(KITCHEN_TILEMAP, _x - c_w/2, _nexty - c_y) == 1;
	var xright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _nextx + c_w/2, _y - c_y) == 1;
	var yright = tilemap_get_at_pixel(KITCHEN_TILEMAP, _x + c_w/2 - 1, _nexty - c_y) == 1;
	
	var _returnx = _nextx;
	var _returny = _y + _yspd; // NOT _nexty in case that gets changed by the above if statement
	
	/*if (xleft) {
		_returnx = floor(_x / tilemap_w) * tilemap_w + c_w/2;
	} else if (xright) {
		_returnx = floor(_x / tilemap_w + 1) * tilemap_w - c_w/2;
	}
	if (yleft and yright) {
		if (_yspd < 0) {
			_returny = floor(_y / tilemap_h) * tilemap_h + c_y + 1;
		} else if (_yspd > 0) {
			_returny = floor(_y / tilemap_h) * tilemap_h + c_y - c_h;
		}
	}*/
	
	if (xleft) {
		_returnx = _x
	} else if (xright) {
		_returnx = _x
	}
	if (yleft and yright) {
		if (_yspd < 0) {
			_returny = _y
		} else if (_yspd > 0) {
			_returny = _y
		}
	}
	
	return xleft or xright or yleft or yright;
}

item = "coffee";

