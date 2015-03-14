TimeToString(seconds)
{
	new minutes,
		hours,
		string[30];

	while(seconds >= 60)
	{
		minutes ++;
		seconds -= 60;
	}
	while(minutes >= 60)
	{
		hours ++;
		minutes -= 60;
	}

	if(hours > 0)
		format(string, sizeof(string), "%i H, %i M, %i S", hours, minutes, seconds);
	else if(minutes > 0)
		format(string, sizeof(string), "%i M, %i S", minutes, seconds);
	else
		format(string, sizeof(string), "%i S", seconds);
	return string;
}
