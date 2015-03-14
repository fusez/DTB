forward OnBombPlanted(playerid, bombsiteid);

forward UpdateBombPlant();
public UpdateBombPlant()
{
	new mapid = g_MapID,
		bombsiteid = g_BombPlantSite,
		oppositesite = GetOppositeBombsite(bombsiteid),
		playerid = g_BombPlanterID,
		Float:x,
		Float:y,
		Float:z;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);

	if(GetTickCount() - g_BombPlantTick >= PLANT_TIME)
	{
		// Set Variables
		if(g_IsBombBeingPlanted)
		{
			g_IsBombBeingPlanted = false;
			KillTimer(g_BombPlantTimer);
		}
		g_GameTime = 60;
		g_IsBombPlanted = true;

		// Create Bomb
		CreateBombObject(bombsiteid);

		// Destroy Other Bombsite
        DestroyBombsiteIcon(oppositesite);

		// Animation
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", BOMB_ANIM_SPEED, 0, 0, 0, 0, 0, 1);

		// Attachment
		UnattachBombFromPlayer(playerid);

		// Beep Sound
    	PlaySoundForAll(21002, x, y, z);

		// Textdraw
		PlayerTextDrawHide(playerid, g_BombTextTD[playerid]);
		HidePlayerBombProgressTextdraw(playerid);

		CallLocalFunction("OnBombPlanted", "ii", playerid, bombsiteid);
	}
	else
    {
		new
			timepassed = GetTickCount() - g_BombPlantTick,
			Float:progress = Float:timepassed / Float:PLANT_TIME
		;

        SetPlayerBombProgressTextdraw(playerid, progress);

		// Beep Sound
		PlaySoundForAll(21000, x, y, z);
	}
}

StartPlayerPlantingBomb(playerid, bombsiteid)
{
	if(g_GameState != STATE_STARTED)
	    return 0;

	// Animation
	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", BOMB_ANIM_SPEED, 1, 0, 0, 0, 0, 1);

	// Attachment
	AttachBombToPlayerHands(playerid);

	// Textdraw
	PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "planting bomb");
	ShowPlayerBombProgressTextdraw(playerid);

	// Kill Timer
	if(g_IsBombBeingPlanted)
		KillTimer(g_BombPlantTimer);

	// Set Variables
	if(g_IsBombBeingPlanted)
		KillTimer(g_BombPlantTimer);
	else
		g_IsBombBeingPlanted = true;
	g_BombPlanterID = playerid;
	g_BombPlantTick = GetTickCount();
	g_BombPlantSite = bombsiteid;
	g_BombPlantTimer = SetTimer("UpdateBombPlant", 200, true);
	return 1;
}

CancelPlayerPlantingBomb(playerid)
{
	// Set Variables
	if(g_IsBombBeingPlanted)
	{
		g_IsBombBeingPlanted = false;
		KillTimer(g_BombPlantTimer);
	}
	g_BombPlanterID = INVALID_PLAYER_ID;

	// Animation
	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_2IDLE", BOMB_ANIM_SPEED, 0, 0, 0, 0, 0, 1);

	// Attachment
	AttachPlayerBombToBack(playerid);

	// Textdraw
	if(g_PlayerBombsite{playerid} == INVALID_BOMBSITE_ID)
		PlayerTextDrawHide(playerid, g_BombTextTD[playerid]);
	else
	{
		PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "~r~Press ~w~~k~~VEHICLE_ENTER_EXIT~ ~r~to plant the bomb");
		PlayerTextDrawShow(playerid, g_BombTextTD[playerid]);
	}
	HidePlayerBombProgressTextdraw(playerid);
}
