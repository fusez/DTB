forward PublicKick(playerid);
public PublicKick(playerid)
{
	if(g_IsPlayerKicked{playerid})
		Kick(playerid);
}
