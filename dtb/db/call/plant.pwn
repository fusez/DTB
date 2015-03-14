public OnBombPlanted(playerid, bombsiteid)
{
	g_PlayerBombsPlanted[playerid] ++;

	#if defined db_OnBombPlanted
		db_OnBombPlanted(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombPlanted
	#undef OnBombPlanted
#else
	#define _ALS_OnBombPlanted
#endif
#define OnBombPlanted db_OnBombPlanted
#if defined db_OnBombPlanted
	forward db_OnBombPlanted(playerid, bombsiteid);
#endif
