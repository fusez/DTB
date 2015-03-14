public OnGameModeInit()
{
	g_GameTimeTD =
	TextDrawCreate			(318.0, 419.0, "00:00");
	TextDrawAlignment		(g_GameTimeTD, 2);
	TextDrawBackgroundColor	(g_GameTimeTD, 255);
	TextDrawFont			(g_GameTimeTD, 2);
	TextDrawLetterSize		(g_GameTimeTD, 0.309999, 1.5);
	TextDrawColor			(g_GameTimeTD, COLOR_WHITE);
	TextDrawSetProportional	(g_GameTimeTD, 1);
	TextDrawSetShadow		(g_GameTimeTD, 1);

	#if defined ttd_OnGameModeInit
		ttd_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit ttd_OnGameModeInit
#if defined ttd_OnGameModeInit
	forward ttd_OnGameModeInit();
#endif
