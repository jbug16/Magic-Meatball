dz -= grav;

if z <= 0 {
	dz = -dz*bounce;
	if (dz < 1) { dz = 0; }
	z = 0;
	
	dx *= groundfric;
	dy *= groundfric;
	
} else {
	dx *= fric;
	dy *= fric;
}

// Collisions
if (place_meeting(x + dx, y, oWall)) 
{
	dx = -dx*bounce;
}

x += dx;
	
if (place_meeting(x, y + dy, oWall)) 
{
	dy = -dy*bounce;
}

y += dy;

z += dz;

// Sprites
sprite_index = item;