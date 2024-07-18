//~~ MOVEMENT ~~//

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var _x = (_right - _left);
var _y = (_down - _up);

// Diagonal movement calculations
if (_x != 0 and _y != 0) {
	xspd = _x * spd * 0.707;
	yspd = _y * spd * 0.707;
} else {
	xspd = _x * spd;
	yspd = _y * spd;
}

// Collisions
if (collisionCheck(x + xspd, y + yspd)) {
	/*while (!place_meeting(x + sign(xspd), y, oWall)) {
		x += sign(xspd);
	}*/
	xspd = 0;
	yspd = 0
}
/*
if (place_meeting(x, y + yspd, oWall)) {
	while (!place_meeting(x, y + sign(yspd), oWall)) {
		y += sign(yspd);
	}
	yspd = 0;
}*/

// Apply movement
x += xspd;
y += yspd;