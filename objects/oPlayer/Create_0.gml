//~~ MOVEMENT ~~//


_x = x;
_y = y;
spd = 1.4;
xspd = 0;
yspd = 0;

w = 18;
h = 18;

facing = 0;

KITCHEN_TILEMAP = layer_tilemap_get_id("KITCHEN_TILEMAP");


function collisionCheck(_x, _y) {
	
	if (tilemap_get_at_pixel(KITCHEN_TILEMAP, _x - w/2, _y) == 1) // bottom left
	or (tilemap_get_at_pixel(KITCHEN_TILEMAP, _x + w/2, _y) == 1) // bottom right
	{
		return true;
	}
	return false;
}
