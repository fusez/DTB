forward OnPlayerMultiKill(playerid, kills);

public OnPlayerDeath(playerid, killerid, reason)
{
	static
		last_kill_time	[MAX_PLAYERS],
		stacked_kills   [MAX_PLAYERS]
	;

	if(killerid != INVALID_PLAYER_ID)
	{
		if(gettime() - last_kill_time[killerid] > 10)
	        stacked_kills[killerid] = 1;
		else
		{
			new message[128];
			switch(++ stacked_kills[killerid])
			{
				case 2:
				{
					format(message, sizeof message,
						"%s (ID: %i) {FFFFFF}scored a double kill!", g_PlayerName[killerid], killerid
					);
				}
				case 3:
				{
					format(message, sizeof message,
						"%s (ID: %i) {FFFFFF}scored a triple kill!",g_PlayerName[killerid], killerid
					);
				}
				case 4:
				{
					format(message, sizeof message,
						"%s (ID: %i) {FFFFFF}scored a quad kill!",g_PlayerName[killerid], killerid
					);
				}
				default:
				{
					format(message, sizeof message,
						"%s (ID: %i) {FFFFFF}scored a multi kill!",g_PlayerName[killerid], killerid
					);
				}
			}
			SendClientMessageToAll(GetPlayerColor(killerid), message);

			CallLocalFunction("OnPlayerMultiKill", "ii", killerid, stacked_kills[killerid]);
		}
		last_kill_time[killerid] = gettime();
	}

	#if defined mk_OnPlayerDeath
		mk_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath mk_OnPlayerDeath
#if defined mk_OnPlayerDeath
	forward mk_OnPlayerDeath(playerid, killerid, reason);
#endif
