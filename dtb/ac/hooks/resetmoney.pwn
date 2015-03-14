stock ac_ResetPlayerMoney(playerid)
{
	g_acMoney[playerid] = 0;
	ResetPlayerMoney(playerid);
}
#if defined _ALS_ResetPlayerMoney
	#undef ResetPlayerMoney
#else
	#define _ALS_ResetPlayerMoney
#endif
#define ResetPlayerMoney ac_ResetPlayerMoney
