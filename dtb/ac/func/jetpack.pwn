ac_CheckPlayerJetpack(playerid)
{
	if(
		IsPlayerSpawned(playerid) &&
		GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK &&
		!g_acJetpack{playerid}
	){
		if(g_acJetpackWarnings{playerid} >= MAX_AC_JETPACK_WARNINGS)
			Ban(playerid, "Jetpack Hacks");
		else
			g_acJetpackWarnings{playerid} ++;
	}
	else
		g_acJetpackWarnings{playerid} = 0;
}
