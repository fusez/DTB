CreateBombPickup(Float:x, Float:y, Float:z)
{
	if(g_BombPickupID != INVALID_PICKUP_ID)
		DestroyPickup(g_BombPickupID);

	g_BombPickupID = CreatePickup(1252, 1, x, y, z);
	g_BombCarrierID = INVALID_PLAYER_ID;
	g_BombPickupPos[0] = x;
	g_BombPickupPos[1] = y;
	g_BombPickupPos[2] = z;

	if(g_GameState > STATE_COUNTDOWN)
		ShowTeamBombIcon(TEAM_ATTACK, true);
	return 1;
}

DestroyBombPickup()
{
	if(g_BombPickupID == INVALID_PICKUP_ID)
		return 0;

	DestroyPickup(g_BombPickupID);
    g_BombPickupID = INVALID_PICKUP_ID;
	for(new i; i < 3; i ++)
        g_BombPickupPos[i] = 0.0;

	ShowTeamBombIcon(TEAM_ATTACK, false);
	return 1;
}

GetBombPickupPos(&Float:x, &Float:y, &Float:z)
{
	if(g_BombPickupID == INVALID_PICKUP_ID)
		return 0;

	x = g_BombPickupPos[0];
	y = g_BombPickupPos[1];
	z = g_BombPickupPos[2];
	return 1;
}
