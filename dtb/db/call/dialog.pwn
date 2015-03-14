public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_LOGIN)
	{
		new accountid = g_PlayerAccountID[playerid];
		if(accountid == 0)
			return 1;

		if(!g_IsPlayerRegistered{playerid})
		    return 1;

		if(!response)
			return ShowPlayerLoginDialog(playerid), 1;

		if(strlen(inputtext) == 0)
		{
			SendClientMessage(playerid, COLOR_RED, "You did not enter any password!");
			ShowPlayerLoginDialog(playerid);
			return 1;
		}

		new saltpass	[MAX_PASSWORD + MAX_SALT + 1],
			hash		[MAX_PASSWORD_HASH + 1];

		SaltPassword(saltpass, sizeof saltpass, inputtext, g_PlayerSalt[playerid]);
		WP_Hash(hash, sizeof hash, saltpass);

		if(!strcmp(g_PlayerPassword[playerid], hash))
			LoginPlayer(playerid, accountid, false);
		else
		{
			if(g_PlayerLoginAttempts{playerid} >= MAX_LOGIN_ATTEMPTS)
				Kick(playerid, "Failed to login");
			else
			{
				g_PlayerLoginAttempts{playerid} ++;
				ShowPlayerLoginDialog(playerid);
			}
		}
		return 1;
	}

	#if defined db_OnDialogResponse
		return db_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
	    return 0;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse db_OnDialogResponse
#if defined db_OnDialogResponse
	forward db_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
