function randomNPCSprite() 
{
	static bag_source = [ sGirl, sGuy, sLizard, sDog ];
	static bag_copy = [];
	static last_choice = bag_source[3];
  
	if (array_length(bag_copy) == 0) 
	{
		array_copy(bag_copy, 0, bag_source, 0, array_length(bag_source));
		array_shuffle_ext(bag_copy);
		
		while (bag_copy[0] == last_choice) 
		{
			array_shuffle_ext(bag_copy);
		}
		
		last_choice = bag_copy[3];
	}

	return array_shift(bag_copy);
}