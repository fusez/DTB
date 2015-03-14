stock ac_GivePlayerMoney(playerid, money)
{
	g_acMoney[playerid] += money;
	return GivePlayerMoney(playerid, money);
}
#if defined _ALS_GivePlayerMoney
	#undef GivePlayerMoney
#else
	#define _ALS_GivePlayerMoney
#endif
#define GivePlayerMoney ac_GivePlayerMoney
