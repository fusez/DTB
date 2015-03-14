public OnBombDefused(playerid, bombsiteid)
{
	g_PlayerBombsDefused[playerid] ++;

	#if defined db_OnBombDefused
		db_OnBombDefused(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombDefused
	#undef OnBombDefused
#else
	#define _ALS_OnBombDefused
#endif
#define OnBombDefused db_OnBombDefused
#if defined db_OnBombDefused
	forward db_OnBombDefused(playerid, bombsiteid);
#endif
