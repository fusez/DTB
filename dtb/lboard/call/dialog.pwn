public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_LB_MAIN:
		{
			if(!response)
			    return 1;

			switch(listitem)
			{
				case 0:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_KILLS);
				case 1:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_DEATHS);
				case 2:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_MULTIKILL);
				case 3:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_KD);
				case 4:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_WONGAMES);
				case 5:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_LOSTGAMES);
				case 6:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_ALLGAMES);
				case 7:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_WL);
				case 8:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_PLANTED);
				case 9:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_DEFUSED);
				case 10:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_TIME);
				case 11:
					ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_LEVEL);
			}
			return 1;
		}
		case DIALOG_LB_KILLS .. DIALOG_LB_LEVEL:
			return ShowPlayerLeaderboardDialog(playerid, DIALOG_LB_MAIN), 1;
	}

	#if defined lboard_OnDialogResponse
		return lboard_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
	    return 0;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse lboard_OnDialogResponse
#if defined lboard_OnDialogResponse
	forward lboard_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
