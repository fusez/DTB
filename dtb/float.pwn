RandomizeFloat(&Float:input, limit)
{
	new Float:random_value = (random(limit) + (random(1001) * 0.001));
	switch(random(2))
	{
		case 0:
			input += random_value;
		case 1:
			input -= random_value;
	}
}

Float:GetDistanceBetweenPlayers(playerid1, playerid2)
{
	new	Float:x,
		Float:y,
		Float:z,
		Float:distance;

	GetPlayerPos(playerid2, x, y, z);
	distance = GetPlayerDistanceFromPoint(playerid1, x, y, z);
	return distance;
}
