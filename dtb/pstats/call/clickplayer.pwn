public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	ShowPlayerStatsDialog(playerid, clickedplayerid);

	#if defined stats_OnPlayerClickPlayer
		stats_OnPlayerClickPlayer(playerid, clickedplayerid, source);
	#endif
}
#if defined _ALS_OnPlayerClickPlayer
	#undef OnPlayerClickPlayer
#else
	#define _ALS_OnPlayerClickPlayer
#endif
#define OnPlayerClickPlayer stats_OnPlayerClickPlayer
#if defined stats_OnPlayerClickPlayer
	forward stats_OnPlayerClickPlayer(playerid, clickedplayerid, source);
#endif
