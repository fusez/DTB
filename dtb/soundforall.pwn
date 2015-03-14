PlaySoundForAll(soundid, Float:x = 0.0, Float:y = 0.0, Float:z = 0.0)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(IsPlayerConnected(playerid))
			PlayerPlaySound(playerid, soundid, x, y, z);
	}
}
