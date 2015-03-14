EndGame(reason)
{
	if(g_GameState != STATE_STARTED)
		return 0;

    g_GameTime = INTERMISSION_TIME;
	g_GameState = STATE_FINISHED;
	switch(reason)
	{
		case REASON_DESTROYED, REASON_DEFEND_KILLED, REASON_DEFEND_DISCONNECT:
			g_GameWinner = TEAM_ATTACK;
		case REASON_DEFUSED, REASON_ATTACK_KILLED, REASON_ATTACK_DISCONNECT, REASON_NO_PLANT:
			g_GameWinner = TEAM_DEFEND;
		default:
		    g_GameWinner = TEAM_NONE;
	}

	CallLocalFunction("OnGameEnd", "i", reason);
	return 1;
}
