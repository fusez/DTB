public OnRconLoginAttempt(ip[], password[], success)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(!IsPlayerConnected(playerid))
			continue;

		if(strcmp(g_PlayerIP[playerid], ip) != 0)
			continue;

		// Kick Player
		Kick(playerid, "RCON Login Attempt");
	}

	#if defined rconkick_OnRconLoginAttempt
		rconkick_OnRconLoginAttempt(ip, password, success);
	#endif
}
#if defined _ALS_OnRconLoginAttempt
	#undef OnRconLoginAttempt
#else
	#define _ALS_OnRconLoginAttempt
#endif
#define OnRconLoginAttempt rconkick_OnRconLoginAttempt
#if defined rconkick_OnRconLoginAttempt
	forward rconkick_OnRconLoginAttempt(ip[], password[], success);
#endif
