stock ac_SetPlayerSpecialAction(playerid, actionid)
{
	if(actionid == SPECIAL_ACTION_USEJETPACK)
	{
		g_acJetpack{playerid} = true;
		g_acJetpackWarnings{playerid} = 0;
	}
	SetPlayerSpecialAction(playerid, actionid);
}
#if defined _ALS_SetPlayerSpecialAction
	#undef SetPlayerSpecialAction
#else
	#define _ALS_SetPlayerSpecialAction
#endif
#define SetPlayerSpecialAction ac_SetPlayerSpecialAction
