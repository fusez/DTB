forward OnBombDefused(playerid, bombsiteid);

forward UpdateBombDefuse();
public UpdateBombDefuse()
{
	new mapid = g_MapID,
		bombsiteid = g_BombPlantSite,
		playerid = g_BombDefuserID,
		Float:x,
		Float:y,
		Float:z;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);

	if(GetTickCount() - g_BombDefuseTick >= DEFUSE_TIME)
	{
		// Set Variables
		if(g_IsBombBeingDefused)
		{
			g_IsBombBeingDefused = false;
			KillTimer(g_BombDefuseTimer);
		}
		g_IsBombDefused = true;

		// Animation
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", BOMB_ANIM_SPEED, 0, 0, 0, 0, 0, 1);

		// Attachment
		UnattachBombFromPlayer(playerid);

		// Create Bomb
		CreateBombObject(bombsiteid);

		// Beep Sound
		PlaySoundForAll(21001, x, y, z);

		// End Game
		EndGame(REASON_DEFUSED);

		// Textdraw
		PlayerTextDrawHide(playerid, g_BombTextTD[playerid]);
		HidePlayerBombProgressTextdraw(playerid);

		CallLocalFunction("OnBombDefused", "ii", playerid, bombsiteid);
	}
	else
    {
		// Textdraw
		new timepassed = GetTickCount() - g_BombDefuseTick,
			Float:progress = float(timepassed) / float(DEFUSE_TIME);
        SetPlayerBombProgressTextdraw(playerid, progress);

		// Beep Sound
		PlaySoundForAll(21000, x, y, z);
	}
}

StartPlayerDefusingBomb(playerid)
{
	if(g_GameState != STATE_STARTED)
	    return 0;

	// Destroy Bomb
	DestroyBombObject();

	// Animation
	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", BOMB_ANIM_SPEED, 1, 0, 0, 0, 0, 1);

	// Attachment
	AttachBombToPlayerHands(playerid);

	// Textdraw
	PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "defusing bomb");
	ShowPlayerBombProgressTextdraw(playerid);

	// Set Variables
	if(g_IsBombBeingDefused)
		KillTimer(g_BombDefuseTimer);
	else
		g_IsBombBeingDefused = true;
	g_BombDefuserID = playerid;
	g_BombDefuseTick = GetTickCount();
	g_BombDefuseTimer = SetTimer("UpdateBombDefuse", 200, true);
	return 1;
}

CancelPlayerDefusingBomb(playerid)
{
	// Animation
	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", BOMB_ANIM_SPEED, 0, 0, 0, 0, 0, 1);

	// Attachment
	UnattachBombFromPlayer(playerid);

	// Create Bomb Object
	CreateBombObject(g_BombPlantSite);

	// Textdraws
	if(g_PlayerBombsite{playerid} == INVALID_BOMBSITE_ID)
		PlayerTextDrawHide(playerid, g_BombTextTD[playerid]);
	else
	{
		PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "~r~Press ~w~~k~~VEHICLE_ENTER_EXIT~ ~r~to defuse the bomb");
		PlayerTextDrawShow(playerid, g_BombTextTD[playerid]);
	}
	HidePlayerBombProgressTextdraw(playerid);

	// Set Variables
	if(g_IsBombBeingDefused)
	{
		KillTimer(g_BombDefuseTimer);
		g_IsBombBeingDefused = false;
	}
	g_BombDefuserID = INVALID_PLAYER_ID;
}
