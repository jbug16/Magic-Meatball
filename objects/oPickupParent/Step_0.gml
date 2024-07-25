
dz -= grav;



if z <= 0 {
	dz = -dz*bounce;
	if dz < 1 { dz = 0; }
	z = 0;
	
	dx *= groundfric;
	dy *= groundfric;
} else {
	dx *= fric;
	dy *= fric;
}


x += dx;
y += dy;

z += dz;