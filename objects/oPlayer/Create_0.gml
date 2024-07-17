
sx = x
sy = y
dx = 0
dy = 0

acc = 10
fric = 0.8

function playerInput() {
	var _return = {
		up : false,
		down : false,
		left : false,
		right : false
	}
	
	if (keyboard_check(ord("W"))) {
		_return.up = true
	}

	if (keyboard_check(ord("S"))) {
		_return.down = true
	}

	if (keyboard_check(ord("A"))) {
		_return.left = true
	}

	if (keyboard_check(ord("D"))) {
		_return.right = true
	}
	
	return _return
	
}