public OnPlayerText(playerid, text[])
{
	if(ac_CheckPlayerFlooding(playerid))
		return 0;

	if(ac_CheckPlayerRepeatingChat(playerid, text))
	    return 0;

	#if defined ac_OnPlayerText
		return ac_OnPlayerText(playerid, text);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerText
	#undef OnPlayerText
#else
	#define _ALS_OnPlayerText
#endif
#define OnPlayerText ac_OnPlayerText
#if defined ac_OnPlayerText
	forward ac_OnPlayerText(playerid, text[]);
#endif
