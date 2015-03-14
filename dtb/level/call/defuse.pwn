public OnBombDefused(playerid, bombsiteid)
{
	GivePlayerXP(playerid, 2, "Bomb Defused");

	#if defined level_OnBombDefused
		level_OnBombDefused(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombDefused
	#undef OnBombDefused
#else
	#define _ALS_OnBombDefused
#endif
#define OnBombDefused level_OnBombDefused
#if defined level_OnBombDefused
	forward level_OnBombDefused(playerid, bombsiteid);
#endif
