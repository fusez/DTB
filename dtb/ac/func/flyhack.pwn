ac_IsPlayerFlyhacking(playerid)
{
	if(IsPlayerSpawned(playerid) && GetPlayerWeapon(playerid) != WEAPON_PARACHUTE)
	{
		switch(GetPlayerAnimationIndex(playerid))
		{
			case 958, 959, 961, 962: // Skydive Anims
			{
				if(g_acFlyhackWarnings{playerid} >= MAX_AC_FLYHACK_WARNINGS)
					Ban(playerid, "Fly Hacks");
				else
					g_acFlyhackWarnings{playerid} ++;
			}
			default:
				g_acFlyhackWarnings{playerid} = 0;
		}
	}
	else
		g_acFlyhackWarnings{playerid} = 0;
}
