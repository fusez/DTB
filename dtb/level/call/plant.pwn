public OnBombPlanted(playerid, bombsiteid)
{
	GivePlayerXP(playerid, 2, "Bomb Planted");

	#if defined level_OnBombPlanted
		level_OnBombPlanted(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombPlanted
	#undef OnBombPlanted
#else
	#define _ALS_OnBombPlanted
#endif
#define OnBombPlanted level_OnBombPlanted
#if defined level_OnBombPlanted
	forward level_OnBombPlanted(playerid, bombsiteid);
#endif
