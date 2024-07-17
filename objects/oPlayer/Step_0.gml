var _dt = delta_time / 1000000
show_debug_message(_dt)

var _input = playerInput()

if (_input.up) {
	dy -= acc*_dt
}
if (_input.down) {
	dy += acc*_dt
}
if (_input.left) {
	dx -= acc*_dt
}
if (_input.right) {
	dx += acc*_dt
}

dx *= fric
dy *= fric

sx += dx
sy += dy

x = floor(sx)
y = floor(sy)