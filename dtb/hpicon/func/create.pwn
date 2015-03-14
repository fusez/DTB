CreatePlayerDamageIcon(playerid, modelid)
{
	if(IsPlayerInAnyVehicle(playerid))
		return 0;

	g_pDamageIconTick[playerid] = GetTickCount();
	if(g_pDamageIconCreated{playerid})
	{
		if(modelid == g_pDamageIconModel[playerid])
		    return 0;
		else
			DestroyObject(g_pDamageIconObject[playerid]);
	}
	else
		g_pDamageIconCreated{playerid} = true;

	new Float:x,
		Float:y,
		Float:z,
		Float:angle;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	g_pDamageIconObject[playerid] = CreateObject(modelid, x, y, z + 1.5, 0.0, 0.0, angle);
	AttachObjectToPlayer(g_pDamageIconObject[playerid], playerid, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0);
	return 1;
}
