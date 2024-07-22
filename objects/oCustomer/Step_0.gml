// checks if timer is up and if the customer is not currently ordering already
if (alarm[0] == 0 and ordering == false)
{
	// start new order
	ordering = true;
	
	// resets timer
	alarm[0] = 60;
}