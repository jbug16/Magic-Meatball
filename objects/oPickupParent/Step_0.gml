
dz -= grav;

if z <= 0 {
	dz = -dz*bounce;
	if (dz < 1) { dz = 0; }
	z = 0;
	
	dx *= groundfric;
	dy *= groundfric;
	
} else if (z > counter_height and z+dz <= counter_height and collision(x, y, dx, dy)) {
	dz = -dz*bounce;
	//if (dz < 1) { dz = 0; }
	z = counter_height;
	
	dx *= groundfric;
	dy *= groundfric;
	
} else {
	dx *= fric;
	dy *= fric;
	
}

if (collision(x, y, dx, dy)) {
	oncounter = true;
} else { oncounter = false; }

if (x+dx < 0 or x+dx > 1344) {
	dx = -dx*bounce
}

if (y+dx < 0 or y+dx > 768) {
	dy = -dy*bounce
}

if (z+dz > counter_height or not collision(x, y, dx, dy)) {
	x += dx;
	y += dy;
}

z += dz;