COMMAND:cancelgame(playerid)
{
	if(g_PlayerAdminLevel{playerid} < 1)
	    return 0;

	if(g_GameState == STATE_COUNTDOWN)
	    return SendClientMessage(playerid, COLOR_RED, "You cannot cancel the game during countdown!"), 1;

	if(g_GameState == STATE_FINISHED)
	    return SendClientMessage(playerid, COLOR_RED, "You cannot cancel the game right now!"), 1;

	EndGame(REASON_CANCELLED);
	return 1;
}
