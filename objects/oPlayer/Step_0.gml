//~~ MOVEMENT ~~//

// Controls
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// Determine direction
var xspd = (_right - _left);
var yspd = (_down - _up);

switch (sign(xspd)) {
	case 1:
		facing = 1;
	break;
	case -1:
		facing = 3;
	break;
	/*default:
		switch(sign(yspd)) {
			case 1:
				facing = 0
			break;
			case -1:
				facing = 2
			break;
		}*/
}

// Diagonal movement calculations
if (xspd != 0 and yspd != 0) {
	xspd = xspd * spd * 0.707;
	yspd = yspd * spd * 0.707;
} else {
	xspd = xspd * spd;
	yspd = yspd * spd;
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
_x += xspd;
_y += yspd;

x = floor(_x)
y = floor(_y)