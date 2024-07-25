var _ypos = 0
if (oncounter) { _ypos = -32; }

draw_sprite_ext(sItemShadow, 0, x, y + _ypos, 1, 1, 0, c_white, 0.5)
draw_sprite(sprite_index, image_index, x, y - z)