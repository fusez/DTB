/******************************************************************************/

ClearPlayerChat(playerid)
{
	for(new i; i < 100; i ++)
	    SendClientMessage(playerid, COLOR_WHITE, "");
}

ClearChatForAll()
{
	for(new i; i < 100; i ++)
	    SendClientMessageToAll(COLOR_WHITE, "");
}

/******************************************************************************/

public OnPlayerConnect(playerid)
{
    ClearPlayerChat(playerid);

	#if defined cc_OnPlayerConnect
		cc_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cc_OnPlayerConnect
#if defined cc_OnPlayerConnect
	forward cc_OnPlayerConnect(playerid);
#endif

/******************************************************************************/
