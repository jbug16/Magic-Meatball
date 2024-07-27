
time += delta_time;

if (time/1000000 > cutscene_speed) {
	time = 0;
	cutscene_frame += 1;
	if (cutscene_frame >= sprite_get_number(sprite_index)) {
		room_goto(finishedroom);
	}
}

